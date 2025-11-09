local function comment_lines()
  local commentstring = vim.bo.commentstring
  if commentstring == "" then
    commentstring = "# %s"  -- default
  end
  local prefix = commentstring:gsub("%%s", "")

  local mode = vim.api.nvim_get_mode().mode
  if mode == 'n' then
    -- Toggle comment on current line
    local line = vim.api.nvim_get_current_line()
    if not line:match("^%s*$") then
      local commented
      if line:sub(1, #prefix) == prefix then
        commented = line:sub(#prefix + 1)
      else
        commented = prefix .. line
      end
      vim.api.nvim_set_current_line(commented)
    end
  elseif mode == 'v' or mode == 'V' or mode == '\22' then
    -- Toggle comment on selected lines
    local start_line = vim.fn.getpos("v")[2]
    local end_line = vim.fn.getpos(".")[2]
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    for i = start_line, end_line do
      local lines = vim.api.nvim_buf_get_lines(0, i-1, i, false)
      if #lines > 0 then
        local line = lines[1]
        if line:match("^%s*$") then
          -- Skip blank lines
        else
          local commented
          if line:sub(1, #prefix) == prefix then
            commented = line:sub(#prefix + 1)
          else
            commented = prefix .. line
          end
          vim.api.nvim_buf_set_lines(0, i-1, i, false, {commented})
        end
      end
    end
    -- Reselect the visual mode
    vim.cmd("normal! gv")
  end
end

vim.keymap.set({'n', 'v'}, '<leader>gc', comment_lines, { noremap = true, silent = true })