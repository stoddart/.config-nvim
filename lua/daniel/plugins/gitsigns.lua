-- Import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- Configure/enable gitsigns
gitsigns.setup()
