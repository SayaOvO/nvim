local default_theme = {
  fg = '#fc8ebc',
  bg = 'None'
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.opt.fillchars = {
      stl = '─',
      stlnc = '─'
    }
    require('lualine').setup {
      options = {
        component_separators = '',
        section_separators = '',
        theme = {
          normal = {
            b = default_theme,
            c = default_theme,
            x = default_theme
          },
          inactive = {
            b = default_theme,
            c = default_theme,
            x = default_theme
          }
        }
      },
      sections = {
        lualine_a = {},
        lualine_b = { 'branch' },
        lualine_c = {
          '%=',
          {'%n ·', padding = { right = 1, left = 0 }},
          {
            'filetype', colored = false, icon_only = true, padding = 0 
          },
          {
            'filename',
            padding = { left = 0.5, right = 1 },
          }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    }
  end
}
