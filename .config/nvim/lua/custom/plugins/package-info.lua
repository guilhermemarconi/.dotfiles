return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },

  config = function()
    require('package-info').setup()

    vim.api.nvim_set_keymap('n', '<leader>pi', "<cmd>lua require('package-info').toggle({ force = true })<cr>", {
      silent = true,
      noremap = true,
      desc = '[P]ackage info [T]oggle',
    })

    vim.api.nvim_set_keymap('n', '<leader>pu', "<cmd>lua require('package-info').update()<cr>", {
      silent = true,
      noremap = true,
      desc = '[P]ackage [U]pdate',
    })

    vim.api.nvim_set_keymap('n', '<leader>pc', "<cmd>lua require('package-info').change_version()<cr>", {
      silent = true,
      noremap = true,
      desc = '[P]ackage [C]hange version',
    })

    vim.api.nvim_set_keymap('n', '<leader>pc', "<cmd>lua require('package-info').delete()<cr>", {
      silent = true,
      noremap = true,
      desc = '[P]ackage [D]elete',
    })
  end,
}
