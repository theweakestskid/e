if not _G.Commands then return end
local plrs=game.Players
local lp=plrs.LocalPlayer

lp.Chatted:Connect(function(c)
    local command, arg = c:match("^(%S+)%s*(.*)$")
    if _G.Commands[command] then
        _G.Commands[command](arg)
    end
end)

--super duper short script by lazed_1
