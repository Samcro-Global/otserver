local config = {
    storage = 30061,
    checkDuplicateIps = true,
    maxMultiClients = 3,
    vipPlayer = false,
    vipCoins = 0,
    freePlayer = true,
    freeCoins = 0
}

local onlineCoinsEvent = GlobalEvent("GainCoinPerHour")

function onlineCoinsEvent.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

    local checkIp = {}
    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not config.checkDuplicateIps or not checkIp[ip]) then
            checkIp[ip] = true
            local seconds = math.max(0, player:getStorageValue(config.storage))
            if seconds >= 3600 then

                if config.vipPlayer and not player:isVip() then
                    player:sendTextMessage(MESSAGE_LOGIN, "[Tibia Coin] You don't have a VIP to receive your coins ")
                return true
                end 

                if config.freePlayer and not player:isVip()then      
                    -- player:say("no vip tibia coins", TALKTYPE_MONSTER_SAY) --- for debug
                    player:addTibiaCoins(config.freeCoins, true)
                    player:sendTextMessage(MESSAGE_LOGIN, string.format("[Tibia Coin] You have received %d %s for being online.", config.freeCoins, "tibia coins"))
                end

                if  player:isVip()then
                    --player:say("vip tibia coins", TALKTYPE_MONSTER_SAY) --- for debug
                     player:addTibiaCoins(config.vipCoins, true)
                    player:sendTextMessage(MESSAGE_LOGIN, string.format("[Tibia Coin] You have received %d %s for being online.", config.vipCoins, "tibia coins"))
                end 


            player:setStorageValue(config.storage, 0)
            return true
            end
        player:setStorageValue(config.storage, seconds +math.ceil(interval/1000))
        end
    end
    return true
end

onlineCoinsEvent:interval(10000)
onlineCoinsEvent:register()
