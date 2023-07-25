local status,n = pcall(require,"kanagawa")

if not status then
  return
end

vim.cmd("colorscheme kanagawa")
