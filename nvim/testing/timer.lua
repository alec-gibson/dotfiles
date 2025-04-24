local function timer_demo()
  -- Create a timer handle (implementation detail: uv_timer_t).
  local timer = vim.uv.new_timer()
  local i = 0
  -- Waits 1000ms, then repeats every 750ms until timer:close().
  timer:start(1000, 750, function()
    print('timer invoked! i='..tostring(i))
    if i > 4 then
      timer:close()  -- Always close handles to avoid leaks.
    end
    i = i + 1
  end)
  print('sleeping');
end

timer_demo()
