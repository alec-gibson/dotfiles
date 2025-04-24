local socket = require("socket")

local myhost = "cheat.sh"
local myfile = "/ls"

local function receive (connection)
  return connection:receive()
end

local function printHex(data)
  local body = ""
  for i = 1, #data do
    local char = string.sub(data, i, i)
    body = body .. string.format("%02x", string.byte(char)) .. " "
  end
  print(body)
end

local function download (host, file)
  local c = assert(socket.connect(host, 80))
  local count = 0    -- counts number of bytes read
  local body = ""
  local req = ""
  req = req .. "GET " .. file .. " HTTP/1.1\r\n"
  req = req .. "Host: " .. host .. "\r\n"
  req = req .. "User-Agent: curl/8.7.1\r\n\r\n"
  print("sending:")
  printHex(req)
  c:send(req)
  while true do
    local s, status = receive(c)
    if status == "closed" then break end
    body = body .. s
    count = count + string.len(s)
  end
  c:close()
  print(body)
  print("Received " .. count .. " bytes")
end

download(myhost, myfile)
