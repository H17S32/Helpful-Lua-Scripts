--[[
--Useage:
local Target = {
	["Bob"] = true,
	Jeff  = true,
	Number = 1,
	function()
	end,
	1,
	2,
	3,
	false,
	CanReadTables = {
		1,
		2,
		3,
	},
}
SerializeTable(Target) --//Returns Table as a string
]]

--// Roblox Lua:
function SerializeTable(Table)
	if Table then
		local String = "{\n"
		local function AddOn(a,b)
			String = String..a
		end
		local ReadTable
		ReadTable = function(GotTable,Level)
			local Shift = ("	"):rep(Level)
			for i,v in pairs(GotTable) do
				local Type = ""
				if type(i) == "string" then
					Type = "'"
				end
				if typeof(v):lower() == "string" then
					AddOn(Shift.."["..Type..i..Type.."]".." = '"..v.."'"..",\n")
				elseif typeof(v):lower() == "function" then
					AddOn(Shift.."["..Type..i..Type.."]".." = "..tostring(type(v).."_")..tostring(math.random(100,20000))..",\n")
				elseif typeof(v):lower() == "table" then
					AddOn(Shift.."["..Type..i..Type.."] = ")
					AddOn(" {\n	")
					ReadTable(v,Level+1)
					AddOn(Shift.."},\n")
				else
					local Extra = ""
					if typeof(v):lower() == "instance" then
						Extra=v:GetFullName()
					else
						Extra=v
					end
					AddOn(Shift.."["..Type..i..Type.."]".." = "..tostring(Extra)..",\n")
				end
			end
		end
		ReadTable(Table,2)
		AddOn("\n}")
		return String
	end
end
--// Normal Lua:
function Serialize_Table(Table, Level)
	Level = Level or 0
	local function serializeValue(value, level)
		level = level or 0
		if type(value) == "string" then
			return string.format("%q", value)
		elseif type(value) == "table" then
			return Serialize_Table(value, level + 1)
		else
			return tostring(value)
		end
	end
	local result = "{\n"
	for k, v in pairs(Table) do
		local keyIndent = string.rep(" ", Level + 2)
		local valueIndent = string.rep(" ", Level + 4)
		if type(k) == "string" then
			result = result..keyIndent.."["..string.format("%q", k).."] = "
		else
			result = result..keyIndent.."["..tostring(k).."] = "
		end
		result = result..serializeValue(v, Level + 2)..",\n"
	end
	result = result..string.rep(" ", Level).."}"
	return result
end
