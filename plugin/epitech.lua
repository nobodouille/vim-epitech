if vim.g.loaded_vim_epitech then
	return
end
vim.g.loaded_vim_epitech = true

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.h",
	command = "set filetype=c",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.opt_local.comments = "s:/*,m:**,ex:*/"
	end,
})

local filetypeMap = {
	c = { b = "/*", m = "**", e = "*/" },
	cpp = { b = "/*", m = "**", e = "*/" },
	make = { b = "##", m = "##", e = "##" },
	haskell = { b = "{-", m = "--", e = "-}" },
}

local function epiyear()
	return os.date("%Y")
end

local function Epi_header()
	local ft = vim.bo.filetype
	local cmt = filetypeMap[ft]
	if cmt then
		local lines = {
			cmt.b,
			cmt.m .. " EPITECH PROJECT, µYEARµ",
			cmt.m .. " __",
			cmt.m .. " File description:",
			cmt.m .. " _",
			cmt.e,
		}
		for i, line in ipairs(lines) do
			lines[i] = line:gsub("µYEARµ", epiyear())
		end
		vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
		vim.api.nvim_win_set_cursor(0, { 8, 0 })
	end
end

vim.api.nvim_create_user_command("EpiHeader", Epi_header, {})
vim.keymap.set("n", "<C-y>", Epi_header, { noremap = true, silent = true })
