-- galaxyline config
-- might be stolen from: https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/conf/statusline.lua
vim.cmd [[packadd nvim-web-devicons]]

local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gfi = require('galaxyline.provider_fileinfo')

local gls = gl.section

local colors = {
    bg = '#282c34',
    fg = '#aab2bf',
    section_bg = '#38393f',
    blue = '#61afef',
    green = '#98c379',
    purple = '#c678dd',
    orange = '#e5c07b',
    red1 = '#e06c75',
    red2 = '#be5046',
    yellow = '#e5c07b',
    gray1 = '#5c6370',
    gray2 = '#2c323d',
    gray3 = '#3e4452',
    darkgrey = '#5c6370',
    grey = '#848586',
    middlegrey = '#8791A5'
}

gls.left[1] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        separator = '| ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {gfi.get_file_icon_color, colors.section_bg},
    }
}

gls.left[2] = {
    FileName = {
        provider = 'FileName',
        separator = '',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {gfi.get_file_icon_color, colors.section_bg},
    }
}


gls.right[1] = {
    LineColumn = {
        provider = "LineColumn",
        separator = '| ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.yellow, colors.section_bg}
    }
}

gls.right[2] = {
    FileTypeName = {
        provider = "FileTypeName",
        separator = '| ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.red, colors.section_bg}
    }
}
gls.right[3] = {
    LinePercent = {
        provider = "LinePercent",
        separator = ' |',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.blue, colors.section_bg}
    }
}

gls.right[4] = {
    GitBranch = {
        provider = {function() return '  ' end, 'GitBranch', function() return ' ' end},
        condition = condition.check_git_workspace,
        separator = '|',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.green, colors.section_bg}
    }
}

gl.load_galaxyline()
