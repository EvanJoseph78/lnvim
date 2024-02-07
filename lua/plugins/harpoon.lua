return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      -- { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
      {
        "<leader>m",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add file",
      },
      -- { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
      {
        "<leader>d",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle quick menu",
      },
      {
        "<C-x>",
        function()
          vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
            local num = tonumber(input)
            if num then
              require("harpoon.ui").nav_file(num)
            end
          end)
        end,
        desc = "Goto index of mark",
      },
      {
        "<C-i>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Goto previous mark",
      },
      {
        "<C-u>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Goto next mark",
      },
      -- { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
      { "<space>a", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
    },
  },
}
