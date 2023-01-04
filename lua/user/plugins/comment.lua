-- import comment plugin safely
local comment_setup, comment = pcall(require, "Comment")
if not comment_setup then
  print("Comment not found!")
  return
end

-- enable comment
comment.setup()

