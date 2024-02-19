function G_1_(L_5_arg0, L_6_arg1)
	local L_7_ = ""
	for L_8_forvar0 = 1, #L_5_arg0 do
		local L_9_ = L_5_arg0:sub(L_8_forvar0, L_8_forvar0)
		local L_10_ = string.byte(L_9_)
		local L_11_ = (L_10_ + L_6_arg1) % 256
		L_7_ = L_7_ .. string.char(L_11_)
		if L_8_forvar0 < #L_5_arg0 then
			L_7_ = L_7_ .. string.char(math.random(0, 255))
		end
	end
	return L_7_
end

function G_2_(L_12_arg0, L_13_arg1)
	local L_14_ = ""
	local L_15_ = 1
	while L_15_ <= #L_12_arg0 do
		local L_16_ = string.byte(L_12_arg0:sub(L_15_, L_15_))
		local L_17_ = (L_16_ - L_13_arg1) % 256
		L_14_ = L_14_ .. string.char(L_17_)
		L_15_ = L_15_ + 2 
		if L_15_ > #L_12_arg0 then
			break
		end
	end
	return L_14_
end


function G_3_(L_18_arg0)
	local L_19_ = ""
	for L_20_forvar0 = 1, #L_18_arg0 do
		local L_21_ = string.byte(L_18_arg0, L_20_forvar0)
		L_19_ = L_19_ .. string.format("%02X", L_21_)
	end
	return L_19_
end

local L_1_ = "test"
local L_2_ = 3

local L_3_ = G_1_(L_1_, L_2_)
local L_4_ = G_2_(L_3_, L_2_)

print("Original Message: " .. L_1_)
print("Encrypted Message: " .. G_3_(L_3_))
print("Decrypted Message: " .. L_4_)
