vim.g.netrw_altv = 1         	-- Open vertical splits to the right
vim.g.netrw_liststyle = 3  		-- 0 = tree, 1 = long, 2 = short, 3 = detailed
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 3 	-- 4 for vertical split on the left

function ToggleNetrw()
  local netrw_bufnr = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
      netrw_bufnr = buf
      break
    end
  end

  if netrw_bufnr then
    vim.cmd('bd ' .. netrw_bufnr)
  else
    vim.cmd('Vex')  -- Open netrw in vertical split (right side if netrw_altv = 1)
  end
end

vim.keymap.set('n', '<Leader>e', ToggleNetrw, { noremap = true, silent = true })

