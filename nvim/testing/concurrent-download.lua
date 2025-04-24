-- NOTE: this isn't working

local socket = require("socket")

local threads = {}    -- list of all live threads

local function myprint (...)
  local printResult = ""
  for _,v in ipairs({...}) do
    printResult = printResult .. tostring(v) .. "\t"
  end
  os.execute("bash -c 'echo " .. printResult .. " >> ./test.txt'")
end

local function receive (client)
  client:settimeout(0)   -- do not block
  local s, status = client:receive(1)
  if status == "timeout" then
    coroutine.yield(client)
  end
  return s, status
end

local function download (host, file)
  local c = assert(socket.connect(host, 80))
  local count = 0    -- counts number of bytes read
  local request = "GET " .. file .. " HTTP/1.0"
  myprint("Sending request: " .. request)
  c:send(request .. "\r\n\r\n")
  while true do
    myprint("Receiving result from request: " .. request)
    local s, status = receive(c)
    count = count + string.len(s)
    myprint("Count is now: " .. count)
    if status == "closed" then break end
  end
  c:close()
  myprint(file, count)
end

local function get (host, file)
  myprint("Setting up coroutine")
  -- create coroutine
  local co = coroutine.create(function ()
    download(host, file)
  end)
  -- insert it in the list
  table.insert(threads, co)
end

local function dispatcher ()
  myprint("starting dispatcher")
  while true do
    local n = #threads
    myprint("There are " .. n .. " threads")
    if n == 0 then break end   -- no more threads to run
    local connections = {}
    for i=1,n do
      local status, res = coroutine.resume(threads[i])
      if not res then    -- thread finished its task?
        table.remove(threads, i)
        break
      else    -- timeout
        table.insert(connections, res)
      end
    end
    myprint("Number of connections: " .. #connections)
    myprint("n: " .. n)
    if #connections == n then
      socket.select(connections, nil, 5)
    end
  end
end

local host = "cheat.sh"
get(host, "/ls")
get(host,"/du")
get(host,"/curl")
get(host, "/tar")
dispatcher()   -- main loop
