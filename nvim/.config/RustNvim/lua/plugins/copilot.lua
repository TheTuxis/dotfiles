return{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  --event = "InsertEnter",
  ft = { "go", "gomod", "lua", "python", "rust"},
  config = function()
    require('copilot').setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          accept_word = false,
          accept_line = false,
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-/>",
        },
      },
      -- panel = {
      --   enabled = false
      -- },
    })
  end,
}
