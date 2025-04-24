local function file_watcher_demo()
  local w = vim.uv.new_fs_event()

  local function on_change(err, fname, status)
    -- Do work...
    vim.api.nvim_command('checktime')
    -- Debounce: stop/start.
    w:stop()
    Watch_File(fname)
  end

  function Watch_File(fname)
    local fullpath = vim.api.nvim_call_function('fnamemodify', {fname, ':p'})
    w:start(fullpath, {}, vim.schedule_wrap(
      function(...)
        on_change(...)
      end))
  end

  vim.api.nvim_command("command! -nargs=1 Watch call luaeval('Watch_File(_A)', expand('<args>'))")
end

file_watcher_demo()
