-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print("telescope not found!")
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print("telescope.actions not found!")
  return
end

-- configure telescope
telescope.setup({
  defaults = {
    -- configure custom mappings
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
    -- preview default value is 120. Meaning if you use a large font the preview won't display
    -- set the preview_cutoff to 0 to ensure a preview will appear.
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})

telescope.load_extension("fzf")

