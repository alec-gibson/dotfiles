return {

  {
    "folke/snacks.nvim",
    keys = {
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gm", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "<leader>d", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },

      { "<leader>e", function() Snacks.picker.files({
        cmd = "rg",
        hidden = true,
        ignored = true,
        exclude = { ".git", "deps" },
      }) end, desc = "Smart Find Files" },
      { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>H", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>f", function() Snacks.picker.grep({
        hidden = true,
        ignored = true,
        exclude = { ".git", "deps" },
      }) end, desc = "Grep" },
      { "<leader>m", function() Snacks.picker.man() end, desc = "Man Pages" },
    },
    config = function()
      require('snacks').setup({
        picker = {
          layout = {
            preset = "ivy",
            position = "bottom"
          },
        },
        explorer = {},
        win = {
          backdrop = false
        }
      })
      vim.api.nvim_set_hl(0, "SnacksPicker", { link = "CodeschoolFg1" })
      vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "SnacksPickerList" })
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "CodeschoolFg1" })
    end
  }
}
