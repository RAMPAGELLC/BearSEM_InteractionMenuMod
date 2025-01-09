local departmentPerms = {
	-- [department] = {perms}
	["NONE"] = {
		-- Default/required to remove all perms when going off-duty.

		LEO = false,
		Fire = false,

		Unjail = false,
		Unhospital = false,
	},

	["SAFR"] = {
		LEO = false,
		Fire = true,

		Unjail = false,
		Unhospital = false,
	},

	["BCSO"] = {
		LEO = true,
		Fire = false,

		Unjail = true,
		Unhospital = false,
	},
}

AddEventHandler("bearduty_rich:DUTY_STATUS_CHANGE", function(source, isOnDuty, trackData)
	if isOnDuty and trackData.Department ~= "NONE" then
		for i, v in pairs(departmentPerms[trackData.Department] or departmentPerms["NONE"]) do
			TriggerClientEvent("SEM_InteractionMenu:" .. i .. "PermsResult", source, v)
		end
	else
		for i, v in pairs(departmentPerms["NONE"]) do
			TriggerClientEvent("SEM_InteractionMenu:" .. i .. "PermsResult", source, v)
		end
	end
end)
