return {
  -- Lua 工具函式庫，很多插件會用到（包含 Telescope）
  { "nvim-lua/plenary.nvim" },

  {
    -- 模糊搜尋：快速找檔案、全文搜尋專案內容
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
  },

  -- 目前改用 Neovim 內建 syntax（不使用 Treesitter，避免編譯需求）

  {
    -- 在左側顯示 Git 變更符號（+/-/~），並支援 hunk 操作
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    -- 按下 leader 後顯示可用快捷鍵提示
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
}
