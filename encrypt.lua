--[[
Example:
local Encoded = encrypt("hi","key") -- > encrypted
local Decoded = decrypt(Encoded,"key") -- > Back to 'hi'
]]

function encrypt(str, key)
  local result = ""
  for i = 1, #str do
    local c = str:sub(i, i)
    local k = key:sub((i - 1) % #key + 1, (i - 1) % #key + 1)
    result = result .. string.char((string.byte(c) + string.byte(k)) % 256)
  end
  return result
end

--// Decrypt a string that has been encrypted using the same key
function decrypt(str, key)
  local result = ""
  for i = 1, #str do
    local c = str:sub(i, i)
    local k = key:sub((i - 1) % #key + 1, (i - 1) % #key + 1)
    result = result .. string.char((string.byte(c) - string.byte(k)) % 256)
  end
  return result
end
