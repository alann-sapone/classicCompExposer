
function getText()
    local toPrint = {}
    local currentHeaderIndex = 0;
    for skillIndex = 1, GetNumSkillLines() do
        local skills = { GetSkillLineInfo(skillIndex) };
        local name, isHeader, rank, maxRank = skills[1], skills[2], skills[4], skills[7];
        
        if isHeader then
            currentHeaderIndex = currentHeaderIndex + 1;
        end

        if currentHeaderIndex == 2 or currentHeaderIndex == 3 then
            if isHeader then
                table.insert(toPrint, name)
            else
                table.insert(toPrint, string.format("  - %s : %s/%s", name, rank, maxRank))
            end
        end
    end

    return toPrint
end

function printText(dest)

    local text = getText();

    if string.len(dest) == 0 then
        for _, value in pairs(text) do print(value) end

    elseif dest == "guild" then
        for _, value in pairs(text) do SendChatMessage(value, "GUILD"); end
    end
end

SLASH_CCE1 = "/cce";
SlashCmdList["CCE"] = printText;