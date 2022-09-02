-- most of this is from the cookbook
-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local sep = " | "

local right_arrow_sep = " ⟩ "
local left_arrow_sep = " ⟨ "

local colors = {
    red = utils.get_highlight("DiagnosticError").fg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("Ignore").fg,
    orange = utils.get_highlight("DiagnosticWarn").fg,
    purple = utils.get_highlight("Statement").fg,
    cyan = utils.get_highlight("Special").fg,
    diag = {
        warn = utils.get_highlight("DiagnosticWarn").fg,
        error = utils.get_highlight("DiagnosticError").fg,
        hint = utils.get_highlight("DiagnosticHint").fg,
        info = utils.get_highlight("DiagnosticInfo").fg,
    },
}

local Align = { provider = "%=" }
local Space = { provider = " " }
local LeftSideSeparator = { provider = right_arrow_sep, hl = { fg = colors.gray } }
local RightSideSeparator = { provider = left_arrow_sep, hl = { fg = colors.gray } }

local Mode = {
    -- get vim current mode, this information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute
    init = function(self)
        self.mode = vim.fn.mode(0) -- :h mode()
    end,
    static = {
        mode_names = { -- change the strings if yow like it vvvvverbose!
            n = "N",
            v = "v",
            V = "V",
            [""] = "^V",
            s = "s",
            S = "S",
            [""] = "^S",
            i = "I",
            R = "R",
            c = "C",
            r = "...",
            ["!"] = "!",
            t = "T",
        },
        mode_colors = {
            n = colors.green,
            i = colors.purple,
            v = colors.cyan,
            V =  colors.cyan,
            [""] =  colors.cyan,
            c =  colors.orange,
            s =  colors.red,
            S =  colors.red,
            [""] =  colors.red,
            R =  colors.orange,
            r =  colors.orange,
            ["!"] =  colors.red,
            t =  colors.red,
        }
    },

    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long. Plus a nice Icon.
    provider = function(self)
        return " %2("..self.mode_names[self.mode].."%)"
    end,

    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true, }
    end,
}

local FileNameBlock = {
    -- let's first set up some attributes needed by this component and it's children
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}
-- We can now define some children separately and add them later
--
local FileIcon = {
    init = function(self)
        local filename = self.filename
        -- :e means only extension
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
    {
        provider = function() if vim.bo.modified then return "[+]" end end,
        hl = { fg = colors.green }

    }, {
        provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return "" end end,
        hl = { fg = colors.orange }
    }
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component
local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = colors.cyan, bold = true, force=true }
        end
    end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
    FileIcon,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    unpack(FileFlags), -- A small optimisation, since their parent does nothing
    { provider = '%<'} -- this means that the statusline is cut here when there's not enough space
)

local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = utils.get_highlight("StatusLine").fg, bold = true, },
}
local FileEncoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc ~= 'utf-8' and enc:upper()
    end
}
local FileFormat = {
    condition = function()
        return vim.bo.fileformat ~= 'unix'
    end,
    provider = function()
        local fmt = vim.bo.fileformat
        return fmt:upper()
    end,
    LeftSideSeparator
}

-- We're getting minimalists here!
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%2l/%L:%2c %P",
}

-- I take no credits for this! :lion:
local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
        return string.rep(self.sbar[i], 2)
    end
}

local LSPActive = {
    condition = conditions.lsp_attached,

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in ipairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return " " .. table.concat(names, " ")
    end,
    hl = { fg = colors.green, bold = true, },
}

-- See lsp-status/README.md for configuration options.
local LSPMessages = {
    provider = function()
        local text = require("lsp-status/statusline").progress()
        if text ~= "" and text ~= nil then
            text = text .. sep
        end
        return text
    end,
    hl = { fg = colors.gray },
}

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = (vim.fn.sign_getdefined("DiagnosticSignError")[1] or {text = "E "}).text,
        warn_icon = (vim.fn.sign_getdefined("DiagnosticSignWarn")[1] or {text = "W "}).text,
        info_icon = (vim.fn.sign_getdefined("DiagnosticSignInfo")[1] or {text = "I "}).text,
        hint_icon = (vim.fn.sign_getdefined("DiagnosticSignHint")[1] or {text = "H "}).text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.diag.error },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.diag.warn },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.diag.info },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.diag.hint },
    },
    RightSideSeparator,
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    -- hl = { fg = colors.orange },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = {bold = true}
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "red" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = colors.gray },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local WorkDir = {
    provider = function()
        local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
        local cwd = vim.fn.getcwd(0)
        cwd = vim.fn.fnamemodify(cwd, ":~")
        if not conditions.width_percent_below(#cwd, 0.25) then
            cwd = vim.fn.pathshorten(cwd)
        end
        local trail = cwd:sub(-1) == '/' and '' or "/"
        return icon .. cwd  .. trail
    end,
    hl = { fg = colors.blue, bold = true, },
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = { fg = colors.blue },
}

local DefaultStatusline = {
    Mode, LeftSideSeparator, FileFormat, FileNameBlock, LeftSideSeparator, Git, LeftSideSeparator, Align,
    Align,
    RightSideSeparator, LSPActive, RightSideSeparator, LSPMessages, Diagnostics, FileType, RightSideSeparator, Ruler
}

local InactiveStatusline = {
    condition = function()
        return not conditions.is_active()
    end,

    FileType, LeftSideSeparator, FileNameBlock, Align,
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches({
            buftype = {"nofile", "help", "quickfix"},
            filetype = {"^git.*", "fugitive"}
        })
    end,

    FileType, Space, HelpFileName, Align, Ruler, Space
}

local StatusLines = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").fg,
                bg = utils.get_highlight("StatusLineNC").bg
            }
        end
    end,
    fallthrough = false,
    SpecialStatusline, InactiveStatusline, DefaultStatusline,
}

local statusline = {StatusLines}
require'heirline'.setup(statusline)

