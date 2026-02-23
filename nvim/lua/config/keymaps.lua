-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Universal Run Keymap (<leader>r)
vim.keymap.set("n", "<leader>r", function()
  -- 1. Save the file first
  vim.cmd("w")

  -- 2. Check the file type
  local ft = vim.bo.filetype

  -- 3. Run the correct command
  if ft == "python" then
    vim.cmd("term python3 %") -- Run Python
  elseif ft == "javascript" then
    vim.cmd("term node %") -- Run Node.js
  elseif ft == "c" then
    vim.cmd("term gcc % -o a.out && ./a.out") -- Compile & Run C
  elseif ft == "cpp" then
    vim.cmd("term g++ % -o a.out && ./a.out") -- Compile & Run C++
  elseif ft == "html" then
    vim.cmd("!open %") -- Open HTML in Browser
  elseif ft == "sh" then
    vim.cmd("term bash %") -- Run Shell Scripts
  else
    print("I don't know how to run " .. ft .. " files yet!")
  end
end, { desc = "Run Current File" })
