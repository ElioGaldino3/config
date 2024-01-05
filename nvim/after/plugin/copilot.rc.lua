local status, copilot = pcall(require, "copilot")
if not status then
  return
end

copilot.setup {
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "right", -- | top | left | right
      ratio = 0.5
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<C-j>",
      accept_word = false,
      accept_line = false,
      next = "<M-j>",
      prev = "<M-k>",
      dismiss = "<C-y>",
    },
  },
  filetypes = {
    dart = true,
    go = true,
    sql = true,
    json = true,
    ["."] = true,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
}
