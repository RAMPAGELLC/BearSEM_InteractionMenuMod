local departmentPerms = {
	-- [department] = {perms}
	["NONE"] = {
		-- Default/required to remove all perms when going off-duty.

		"sem_intmenu.fire",
		"sem_intmenu.unhospital",
		"sem_intmenu.leo",
		"sem_intmenu.unjail",
	},

	["SAFR"] = {
		"sem_intmenu.fire",
		"sem_intmenu.unhospital",
	},

	["BCSO"] = {
		"sem_intmenu.leo",
		"sem_intmenu.unjail",
	},
}

AddEventHandler("bearduty_rich:DUTY_STATUS_CHANGE", function(source, isOnDuty, trackData)
	local playerIdentifier = GetPlayerIdentifier(source, 0);

	if isOnDuty then
		for i, v in pairs(departmentPerms[trackData.Department] or departmentPerms["NONE"]) do
			ExecuteCommand(string.format("add_principal identifier.%s %s", playerIdentifier, v))
		end
	else
		for i, v in pairs(departmentPerms[trackData.Department] or departmentPerms["NONE"]) do
			ExecuteCommand(string.format("remove_principal identifier.%s %s", playerIdentifier, v))
		end
	end
end)
