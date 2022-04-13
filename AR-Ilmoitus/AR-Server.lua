ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CheckJob(Jobi)
    for k, v in pairs(AR.Settings.WhitelistedJobs) do
        if v.JobName == Jobi then
            return true, v.ChatPrefix
        end
    end
    return false
end

RegisterCommand("ilmoitus", function(src, args)
    local xPlayer = ESX.GetPlayerFromId(src)
    local Jobi = xPlayer.job.name
    local Bool, Msg2 = CheckJob(Jobi)
    if Bool then
        local msg = table.concat(args, " ")
        TriggerClientEvent('chat:addMessage', -1, { args = {"^4["..Msg2.."] ", msg}})
    end
end)
