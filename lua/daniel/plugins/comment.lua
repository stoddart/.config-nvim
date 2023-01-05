-- Import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- Enable comment
comment.setup()
