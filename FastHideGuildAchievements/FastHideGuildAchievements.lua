-- Sprachspezifische Nachrichten
local messages = {
    enUS = "Guild achievement blocked!",        -- Englisch (US)
    enGB = "Guild achievement blocked!",        -- Englisch (GB)
    deDE = "Gildenerfolg blockiert!",           -- Deutsch
    frFR = "Succès de guilde bloqué!",          -- Französisch
    esES = "Logro de hermandad bloqueado!",     -- Spanisch (EU)
    esMX = "Logro de hermandad bloqueado!",     -- Spanisch (LA)
    ruRU = "Гильдейское достижение заблокировано!", -- Russisch
    koKR = "길드 업적이 차단되었습니다!",        -- Koreanisch
    zhCN = "公会成就已屏蔽！",                  -- Chinesisch (vereinfacht)
    zhTW = "公會成就已封鎖！",                 -- Chinesisch (traditionell)
    itIT = "Impresa di gilda bloccata!",        -- Italienisch
    ptBR = "Conquista de guilda bloqueada!",    -- Portugiesisch (BR)
}

-- Funktion, die die Anzeige von Gildenerfolgen verhindert und eine Nachricht im Chat ausgibt
local function HideGuildAchievements(self, event, achievementID, alreadyEarned)
    local _, _, _, _, _, _, _, _, _, _, _, isGuildAchievement = GetAchievementInfo(achievementID)
    if isGuildAchievement then
        -- Sprachcode des Clients ermitteln
        local locale = GetLocale()
        
        -- Nachricht basierend auf der Sprache anzeigen
        if messages[locale] then
            print(messages[locale])
        else
            -- Fallback auf Englisch, falls die Sprache nicht unterstützt wird
            print(messages["enUS"])
        end

        -- Abbrechen der Anzeige des Erfolgs
        return true
    end
end

-- Registrieren der Funktion für das Achievement-Earned-Event
local f = CreateFrame("Frame")
f:RegisterEvent("ACHIEVEMENT_EARNED")
f:SetScript("OnEvent", HideGuildAchievements)
