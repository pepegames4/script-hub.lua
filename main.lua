local gameId = game.PlaceId

local scripts = {
    [6097258548] = "https://raw.githubusercontent.com/pepegames4/Iron-man-2-script.lua/main/main.lua",
    [111163066268338] = "https://raw.githubusercontent.com/pepegames4/Kat-x-script.lua/main/main.lua",
    [108947879689560] = "https://raw.githubusercontent.com/pepegames4/Iron-man-2-script.lua/refs/heads/main/main.lua",
}

local scriptUrl = scripts[gameId]

if scriptUrl then
    local success, content = pcall(function()
        return game:HttpGet(scriptUrl, true)
    end)

    if success and content and string.len(content) > 0 then
        loadstring(content)()
        print("Script para el juego " .. gameId .. " cargado con éxito.")
    else
        warn("Error: No se pudo cargar el script desde la URL.")
        print("Revisa que el repositorio sea público y la URL sea correcta.")
    end
else
    print("No se encontró un script para este juego en la base de datos.")
end
