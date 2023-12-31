local M = {}

M.neotree = {
  {
    "<leader>xt",
    ":Neotree toggle<CR>",
    silent = true,
    desc = "e[x]plorer [t]oggle ",
  },
  {
    "<leader>xf",
    ":Neotree<CR>",
    silent = true,
    desc = "e[x]plorer [f]ocus",
  },
}

M.telescope = function()
  local builtin = require("telescope.builtin")
  return {
    -- files and strings
    {
      "<leader>sf",
      builtin.find_files,
      desc = "[s]earch [f]iles",
    },
    {
      "<leader>so",
      builtin.oldfiles,
      desc = "[s]earch [o]ld files",
    },
    {
      "<leader>sb",
      builtin.buffers,
      desc = "[s]earch [b]uffers",
    },
    {
      "<leader>sg",
      builtin.git_files,
      desc = "[s]earch [g]it files",
    },
    {
      "<leader>ss",
      builtin.live_grep,
      desc = "[s]earch [s]tring",
    },
    {
      "<leader>sS",
      function()
        return builtin.live_grep({
          prompt_title = "Live Grep(hidden/ignore)",
          additional_args = { '--hidden', '--no-ignore' }
        })
      end,
      desc = "[s]earch [S]tring hidden/ignore",
    },
    {
      "<leader>sw",
      builtin.grep_string,
      desc = "[s]earch [w]ord under cursor",
    },
    {
      "<leader>sW",
      function()
        return builtin.grep_string({ additional_args = { '--hidden', '--no-ignore' } })
      end,
      desc = "[s]earch [W]ord under cursor hidden/ignore",
    },
    {
      "<leader>/",
      builtin.current_buffer_fuzzy_find,
      silent = true,
      desc = "search fuzzy as [/]",
    },

    -- utils
    {
      "<leader>sh",
      builtin.help_tags,
      silent = true,
      desc = "[s]earch [h]elp",
    },
    {
      "<leader>sk",
      builtin.keymaps,
      silent = true,
      desc = "[s]earch [k]eymaps",
    },
  }
end

return M
