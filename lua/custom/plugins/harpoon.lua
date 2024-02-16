return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '\\`', function()
      harpoon:list():append()
    end, { desc = 'Add position to Harpoon list' })
    vim.keymap.set('n', '\\\\', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'View Harpoon list' })

    vim.keymap.set('n', '\\1', function()
      harpoon:list():select(1)
    end, { desc = 'Jump to position 1' })
    vim.keymap.set('n', '\\2', function()
      harpoon:list():select(2)
    end, { desc = 'Jump to position 2' })
    vim.keymap.set('n', '\\3', function()
      harpoon:list():select(3)
    end, { desc = 'Jump to position 3' })
    vim.keymap.set('n', '\\4', function()
      harpoon:list():select(4)
    end, { desc = 'Jump to position 4' })
  end,

  opts = {},
}
