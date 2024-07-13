return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  enabled = false,
  keys = {
    { '<localleader>f', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
    { '<localleader>g', '<cmd>Telescope live_grep<CR>', desc = 'Grep' },
    { '<localleader>b', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Buffer Find' },
    { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Grep' },
  },
  dependencies = { 'nvim-lua/plenary.nvim' }
}
