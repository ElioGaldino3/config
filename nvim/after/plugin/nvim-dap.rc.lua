local status, dap = pcall(require, 'dap')
if (not status) then return end

dap.adapters.dart = {
  type = "execultable",
  command = 'flutter',
  args = {'debug_adapter'}
}

dap.configurations.dart = {
  {
      type = "dart",
      request = "launch",
      name = "Launch Flutter Program",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "${file}",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      -- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
      toolArgs = {"-d", "chrome"}
    }
}
