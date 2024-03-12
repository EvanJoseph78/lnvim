-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")
local map = vim.keymap.set

-- floating terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
map("n", "<F4>", lazyterm, { desc = "Terminal 1 (root dir) " })
map("n", "<F5>", function()
  Util.terminal()
end, { desc = "Terminal 2 (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
--
-- Expolorer

-- hop

-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
vim.keymap.set("", "s", function()
  hop.hint_char1()
end, { remap = true })

-- formatting
--
map({ "n", "v" }, "<C-_>", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- lazygit
map("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "Q", "<cmd>q!<cr>", { desc = "Quit" })
map("n", "<C-d>", "<cmd>q!<cr>", { desc = "Quit" })
map("v", "<C-d>", "<cmd>q!<cr>", { desc = "Quit" })
map("i", "<C-d>", "<cmd>q!<cr>", { desc = "Quit" })

-- delete
map("n", "<C-x>", "dd")
map("v", "<C-x>", "d")
map("i", "<C-x>", "<Esc>ddi")

-- paste
map("n", "<C-v>", "p")
map("v", "<C-v>", "p")
map("i", "<C-v>", "<Esc>pa")

-- copy
map("n", "<C-c>", "yy")
map("v", "<C-c>", "y")
map("i", "<C-c>", "<Esc>yya")

-- Selecionar tudo

map("n", "<C-a>", "ggVG")
map("v", "<C-a>", "<Esc>ggVG")
map("i", "<C-a>", "<Esc>ggVG")

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<F4>", "<cmd>close<cr>", { desc = "Hide Terminal 1" })
map("t", "<F5>", "<cmd>close<cr>", { desc = "Hide Terminal 2" })
map("t", "<C-h>", "<C-w>", { desc = "which_key_ignore" })

-- buffers
map("n", "<C-pageUp>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<C-pageDown>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<C-t>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close all others buffers" })
map("n", "<C-w>", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

map("i", "<C-pageUp>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("i", "<C-pageDown>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("i", "<C-t>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close all others buffers" })
map("i", "<C-w>", "<cmd>bdelete<cr>", { desc = "Close current buffer" })

map("v", "<C-pageUp>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("v", "<C-pageDown>", "<cmd>bnext<cr>", { desc = "Close all others buffers" })
map("v", "<C-t>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close all others buffers" })
map("v", "<C-w>", "<cmd>bdelete<cr>", { desc = "Next buffer" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines

map("n", "<F8>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<F6>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<F8>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<F6>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<F8>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<F6>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- better indenting

map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")

map("i", "<S-Tab>", "<Esc><<I")
map("i", "<S-Up>", "<Esc>")

-- Shift behaviour

map("n", "<S-Right>", "<Esc>vl")
map("n", "<C-s-right>", "<esc>ve")
map("n", "<C-S-Left>", "<Esc>vb")
map("n", "<S-Left>", "<Esc>vh")
map("n", "<S-Up>", "<Esc>vk")
map("n", "<S-Down>", "<Esc>vj")
map("n", "<S-End>", "<Esc>v$")
map("n", "<S-Home>", "<Esc>v_")

-- Insert --
map("i", "<C-z>", "<Esc>ui")
map("i", "<C-y>", "<Esc><C-r>i")

--
map("i", "<A-j>", "<Esc>:m .+1<CR>==", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==", opts)

map("i", "<S-Right>", "<Esc>vl")
map("i", "<S-Left>", "<Esc>vh")
map("i", "<S-Up>", "<Esc>vk")
map("i", "<S-Down>", "<Esc>vj")
map("i", "<C-S-Right>", "<Esc>ve")
map("i", "<C-S-Left>", "<Esc>vb")
map("i", "<S-End>", "<Esc>v$")
map("i", "<S-Home>", "<Esc>v_")
--
--
-- My Remaps
--

-- Insert --

-- Visual Block-

map("v", "<C-z>", "<Esc>u")
map("v", "<C-y>", "<Esc><C-r>")
map("n", "<C-y>", "<C-r>")

map("v", "<S-Right>", "l")
map("v", "<S-Left>", "h")
map("v", "<S-Up>", "k")
map("v", "<S-Down>", "j")
map("v", "<C-S-Right>", "e")
map("v", "<C-S-Left>", "b")
map("v", "<C-Right>", "e")
map("v", "<C-Left>", "b")

map("v", "<S-End>", "$")
map("v", "<S-Home>", "_")

-- Visual Block

map("v", "p", '"_dP"')

-- Utilits Remap

--
map("n", "b", "@")

map("n", "<F12>", "<cmd>:Neotree filesystem reveal left toggle<cr>")
map("i", "<F12>", "<cmd>:Neotree filesystem reveal left toggle<cr>")
map("v", "<F12>", "<cmd>:Neotree filesystem reveal left toggle<cr>")
map("n", "<F2>", "<cmd>:Telescope live_grep<cr>")
map("i", "<F2>", "<cmd>:Telescope live_grep<cr>")
map("v", "<F2>", "<cmd>:Telescope live_grep<cr>")

map("n", "m", '"')
map("v", "m", '"')

map("n", "|", "<cmd>:vsplit<cr>")
map("v", "|", "<cmd>:vsplit<cr>")

map("n", "<C-left>", "b")
map("n", "<C-right>", "w")

map("", "<pageDown>", "<C-d>")
map("", "<pageUp>", "<C-u>")
map("i", "<C-s>", "<cmd>w!<cr><Esc>zzi")
map("", "<C-z>", "<Esc>u")
map("i", "<C-h>", "<C-w>")
map("n", "<C-S-pageUp>", "<C-W><")
map("n", "<C-S-pageDown>", "<C-W>>")
map("n", "<A-up>", "<C-W>+")
map("n", "<A-down>", "<C-W>-")

map("i", "<C-r>", "<Esc><C-r>i")
map("n", "<C-f>", "/")
map("i", "<C-f>", "<Esc>/")

map("n", "<enter>", "o<esc>")
map("n", "<BS>", "x")
map("n", "<C-p>", ":")
map("i", "<C-p>", "<Esc>:")
map("v", "<C-p>", "<Esc>:")

-- formatting
-- map("n", "<Esc>", function()
--   Util.format({ force = true })
--   vim.cmd("normal! zz")
-- end, { desc = "Format" })
--
-- map("n", "<Esc>", "zz")
-- map("n", "<Esc>", "==zz")

-- delete
map("n", "dx", "di'")
map("n", "dq", 'di"')
map("n", "dj", "di(")
map("n", "do", "di{")
map("n", "dk", "di[")
map("n", "dn", "dit")
map("n", "dA", "Gdgg")
map("n", "dW", "diwx")

map("n", "dp", "diw") -- deleta palavra
-- delete
--
-- change
map("n", "cx", "ci'")
map("n", "cq", 'ci"')
map("n", "cj", "ci(")
map("n", "co", "ci{")
map("n", "ck", "ci[")
map("n", "cn", "cit")
map("n", "cA", "ggcG")
map("n", "cW", "ciw")

map("n", "cp", "ciw") -- muda palavra

-- change

-- copy
map("", "e", "y")
map("n", "E", "_y$")
map("n", "ex", "yi'")
map("n", "eq", 'yi"')
map("n", "ej", "yi(")
map("n", "eo", "yi{")
map("n", "ek", "yi[")
map("n", "en", "yit")
map("n", "eA", "ggyG")
map("n", "eW", "yiw")
map("n", "ee", "yy")

map("n", "ep", "yiw") -- copia palavra
map("n", "el", "_y$") -- copia linha sem quebra de linha

-- copy

-- past
map("v", "w", "p")
map("n", "W", "P")
map("n", "ww", "p")
map("n", "wx", "vi'p")
map("n", "wq", 'vi"p')
map("n", "wj", "vi(p")
map("n", "wo", "vi{p")
map("n", "wk", "vi[p")
map("n", "wn", "vitp")
map("n", "wA", "ggvGp")
map("n", "wW", "viwp")

-- Visual

map("n", "vp", "viw") -- seleciona palavra
map("n", "vl", "_v$h") -- seleciona linha
map("n", "vv", "_v$h") -- seleciona linha
map("n", "vA", "ggVG")
map("n", "vj", "vi(")
map("n", "vi", "va(")
map("v", "(", "c()<Esc>hp")
map("n", "vo", "vi{")
map("v", "{", "c{}<Esc>hp")
map("n", "vk", "vi[")
map("v", "[", "c[]<Esc>hp")
-- map("n", "vq", 'vi"')
map("v", '"', 'c""<Esc>hp')
map("n", "vx", "vi'")
map("v", "'", "c''<Esc>hp")

-- Visual --

-- reload

map("n", "<F9>", ":so<cr>", opts)
map("i", "<F9>", "<Esc>:so<cr>", opts)

-- Functions

map("n", "vq", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! vi"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! vi']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "vQ", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! va"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! va']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "cq", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! ci"]])
        vim.cmd([[normal! l]])
        vim.cmd([[startinsert]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! ci']])
        vim.cmd([[normal! l]])
        vim.cmd([[startinsert]])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "cQ", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! ca"]])
        vim.cmd([[normal! l]])
        vim.cmd([[startinsert]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! ca']])
        vim.cmd([[normal! l]])
        vim.cmd([[startinsert]])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "eq", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! yi"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! yi']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "eQ", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! ya"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! ya']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "dq", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! di"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! di']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

map("n", "dQ", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  -- Obtém o caractere sob o cursor
  local char_under_cursor = line:sub(cursor_position[2] - 1, cursor_position[2] - 1)

  -- Itera até encontrar as aspas ou o final da linha
  local index = cursor_position[2]
  while index <= #line do
    if char_under_cursor == '"' or char_under_cursor == "'" then
      -- Se estiver dentro de aspas duplas, seleciona o texto dentro delas
      if char_under_cursor == '"' then
        vim.cmd([[normal! da"]])
        -- Se estiver dentro de aspas simples, seleciona o texto dentro delas
        break -- Sai do loop quando encontrar as aspas
      elseif char_under_cursor == "'" then
        vim.cmd([[normal! da']])
        break -- Sai do loop quando encontrar as aspas
      end
      break -- Sai do loop quando encontrar as aspas
    end

    index = index + 1
    char_under_cursor = line:sub(index, index)
  end
end, { desc = "" })

-- map("n", "<Esc>", "==zz")
map("i", "<f7>", "<Esc>")

map("n", "<Esc>", function()
  -- Salva a posição atual do cursor
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor_position[1]
  local current_col = cursor_position[2]

  -- Formata todo o arquivo com "=" em cada linha
  vim.cmd([[silent! normal! ggVG=]])

  -- Retorna o cursor para a posição salva
  vim.api.nvim_win_set_cursor(0, { current_line, current_col })

  -- Centraliza a linha
  vim.cmd("normal! zz")
end, { desc = "Format any file" })
