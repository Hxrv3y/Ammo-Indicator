local function drawTxt(x, y, scale, text, r,g,b, font, centered, alpha)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    
    if centered then
        SetTextCentre(true)
    end

    SetTextColour(r, g, b, alpha)
    SetTextDropShadow(0, 0, 0, 0, 150)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

CreateThread(function()
    while true do
        Wait(0)
        local player = GetPlayerPed(-1)
        local weapon = GetSelectedPedWeapon(player)
        local ammoTotal = GetAmmoInPedWeapon(player, weapon)
        local success, ammoClip = GetAmmoInClip(player, weapon)
        if not success then
            ammoClip = 0
        end
        local ammoRemaining = ammoTotal - ammoClip
        local isAiming = IsPlayerFreeAiming(PlayerId())

        if isAiming then
            drawTxt(0.50, 0.51, 0.35, ammoClip, 255, 255, 255, 4, 1, 255)
        end
    end
end)