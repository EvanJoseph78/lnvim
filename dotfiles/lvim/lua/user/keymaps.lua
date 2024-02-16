local kind = require("user.kind")

lvim.leader = "space"
local map = vim.keymap.set
-- MyRemaps

-- Remaps

vim.keymap.set("n", "w", ":HopChar1<cr>")

-- Copia para o clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "v", "v" }, "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])
-- Copia para o clipboard

vim.keymap.set("n", "<C-left>", "b")
vim.keymap.set("n", "<C-right>", "w")
vim.keymap.set("n", "<S-tab>", "<<")
vim.keymap.set("n", "<tab>", ">>")

vim.keymap.set("n", "s", "p")
vim.keymap.set("n", "<C-f>", "/")

vim.keymap.set("n", "<F1>", ":Telescope<cr>")
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<F1>", ":NvimTreeToggle<cr>")
vim.keymap.set("i", "<F1>", "<Esc>:NvimTreeToggle<cr>")
vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition)
vim.keymap.set("n", "<C-o>", "<C-o>")
-- vim.keymap.set("n", "<C-j>", "<cmd>lua vim.lsp.buf.code_action()<cr>")  -- mostra o code actions
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)") -- comenta a linha

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Possibilita copiar para o clipboard
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({ "n", "v" }, "<leader>e", [["+y]])
vim.keymap.set("n", "<leader>E", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])         -- cola e não copia
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- deleta uma linha sem copiar

-- Cortar

vim.keymap.set("n", "dq", "di'")
vim.keymap.set("n", "dw", 'di"')
vim.keymap.set("n", "dj", "di(")
vim.keymap.set("n", "do", "di{")
vim.keymap.set("n", "dk", "di[")
vim.keymap.set("n", "dt", "dit")
vim.keymap.set("n", "da", "Gdgg")
vim.keymap.set("n", "de", "diwx")

-- Cortar

-- Copiar

vim.keymap.set("n", "e", "y")
vim.keymap.set("n", "E", "_y$")
vim.keymap.set("n", "ed", "yiw")
vim.keymap.set("n", "ee", "yy")
vim.keymap.set("n", "eq", "yi'")
vim.keymap.set("n", "ew", 'yi"')
vim.keymap.set("n", "ej", "yi(")
vim.keymap.set("n", "eo", "yi{")
vim.keymap.set("n", "ek", "yi[")
vim.keymap.set("n", "et", "yit")
vim.keymap.set("n", "ea", "Gygg")

-- Copiar
-- Change

vim.keymap.set("n", "cq", "ci'")
vim.keymap.set("n", "cd", "ciw")
vim.keymap.set("n", "cw", 'ci"')
vim.keymap.set("n", "cj", "ci(")
vim.keymap.set("n", "co", "ci{")
vim.keymap.set("n", "ck", "ci[")
vim.keymap.set("n", "ct", "cit")

-- Change

-- Visual Mode

vim.keymap.set("n", "vq", "vi'")
vim.keymap.set("n", "vd", "viw")
vim.keymap.set("n", "vw", 'vi"')
vim.keymap.set("n", "vj", "vi(")
vim.keymap.set("n", "vo", "vi{")
vim.keymap.set("n", "vk", "vi[")
vim.keymap.set("n", "vt", "vit")

-- Visual Mode

-- Normal Mode ---

vim.keymap.set("n", "gn", ":tabe %<CR>")

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. " Find references",
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua vim.lsp.buf.definition()<cr>",
  -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. " Definitions",
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  kind.cmp_kind.Reference .. " Type Definition",
}

lvim.lsp.buffer_mappings.normal_mode["gf"] = {
  ":Telescope frecency<cr>",
  kind.cmp_kind.Reference .. " Telescope Frecency",
}

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
--
map("n", "<S-Right>", "<Esc>vl")
map("n", "<C-S-right>", "<esc>ve")
map("n", "<C-S-Left>", "<Esc>vb")
map("n", "<S-Left>", "<Esc>vh")
map("n", "<S-Up>", "<Esc>vk")
map("n", "<S-Down>", "<Esc>vj")
map("n", "<S-End>", "<Esc>v$")
map("n", "<S-Home>", "<Esc>v_")

-- Insert --
map("i", "<C-z>", "<Esc>ui")
map("i", "<C-y>", "<Esc><C-r>i")
map("i", "<C-v>", "<Esc>pa")

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
map("n", "<S-End>", "$")
map("n", "<S-Home>", "_")

-- Visual Block

map("v", "p", '"_dP"')

-- Utilits Remap
map("n", "Q", "<cmd>:q<cr>")
map("n", "<C-p>", ":")
map("i", "<C-p>", "<cmd>:<cr>")
map("n", "<C-left>", "b")
map("n", "<C-right>", "w")
map("", "<pageDown>", "<C-d>")
map("", "<pageUp>", "<C-u>")
map("i", "<C-s>", "<cmd>w!<cr><Esc>zzi")
map("n", "<C-s>", "<cmd>w!<cr><Esc>zz")
map("", "<C-z>", "<Esc>u")
map("i", "<C-h>", "<C-w>")
map("n", "<C-S-pageUp>", "<C-W><")
map("n", "<C-S-pageDown>", "<C-W>>")
map("n", "<A-up>", "<C-W>+")
map("n", "<A-down>", "<C-W>-")
map("n", "<C-a>", "ggVGy")
-- map("i", "<C-z>", "<Esc>ui")
map("i", "<C-r>", "<Esc><C-r>i")
map("n", "<C-f>", "/")
map("i", "<C-f>", "<Esc>/")
map("n", "<tab>", ">>")
map("n", "<tab>", ">>")
map("n", "<S-tab>", "<<")
map("n", "<enter>", "o<esc>")
map("n", "<BS>", "a<C-h><esc>")
map("n", "<C-p>", ":")
map("i", "<C-p>", "<Esc>:")
map("v", "<C-p>", "<Esc>:")
map("n", "<Esc>", "zz")

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

map("n", "vp", "viw")  -- seleciona palavra
map("n", "vl", "_v$h") -- seleciona linha
map("n", "vA", "ggVG")
map("n", "vj", "vi(")
map("v", "(", "c()<Esc>hp")
map("n", "vo", "vi{")
map("v", "{", "c{}<Esc>hp")
map("n", "vk", "vi[")
map("v", "[", "c[]<Esc>hp")
map("n", "vq", 'vi"')
map("v", '"', 'c""<Esc>hp')
map("n", "vx", "vi'")
map("v", "'", "c''<Esc>hp")

-- Utilities
--
map("n", "<leader><space>", "<cmd>Telescope find_files")
map("n", "<f4>", "<cmd>ToggleTerm<cr>")
map("i", "<f4>", "<cmd>ToggleTerm<cr>")
map("v", "<f4>", "<cmd>ToggleTerm<cr>")
map("t", "<f4>", "<cmd>ToggleTerm<cr>")
