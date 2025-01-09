local departmentPerms = {
	["DEFAULT"] = {
		["LEO"] = false,
		["Fire"] = false,

		["Unjail"] = false,
		["Unhospital"] = false
	},

	["SAFR"] = {
		["LEO"] = false,
		["Fire"] = true,

		["Unjail"] = false,
		["Unhospital"] = true
	},

	["BCSO"] = {
		["LEO"] = true,
		["Fire"] = false,

		["Unjail"] = true,
		["Unhospital"] = false
	}
}

AddEventHandler("bearduty_rich:BearSEMInteractionMod", function(source, isOnDuty, trackData)
	if isOnDuty and trackData.Department ~= "NONE" then
		for i, v in pairs(departmentPerms[trackData.Department] or departmentPerms["DEFAULT"]) do
			TriggerClientEvent("SEM_InteractionMenu:" .. i .. "PermsResult", source, v)
		end
	else
		for i, v in pairs(departmentPerms["DEFAULT"]) do
			TriggerClientEvent("SEM_InteractionMenu:" .. i .. "PermsResult", source, v)
		end
	end
end)
