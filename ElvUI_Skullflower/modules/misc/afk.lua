local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AFK = E:GetModule('AFK', 'AceEvent-3.0', 'AceTimer-3.0');
local AFKString = _G["AFK"]
local CH = E:GetModule("Chat")

function AFK:Initialize()
	local classColor = RAID_CLASS_COLORS[E.myclass]

	self.AFKMode = CreateFrame("Frame", "ElvUIAFKFrame")
	self.AFKMode:SetFrameLevel(1)
	self.AFKMode:SetScale(UIParent:GetScale())
	self.AFKMode:SetAllPoints(UIParent)
	self.AFKMode:Hide()
	self.AFKMode:EnableKeyboard(true)
	self.AFKMode:SetScript("OnKeyDown", OnKeyDown)

	self.AFKMode.chat = CreateFrame("ScrollingMessageFrame", nil, self.AFKMode)
	self.AFKMode.chat:SetSize(500, 200)
	self.AFKMode.chat:SetPoint("TOPLEFT", self.AFKMode, "TOPLEFT", 4, -4)
	self.AFKMode.chat:FontTemplate()
	self.AFKMode.chat:SetJustifyH("LEFT")
	self.AFKMode.chat:SetMaxLines(500)
	self.AFKMode.chat:EnableMouseWheel(true)
	self.AFKMode.chat:SetFading(false)
	self.AFKMode.chat:SetScript("OnMouseWheel", Chat_OnMouseWheel)
	self.AFKMode.chat:SetScript("OnEvent", Chat_OnEvent)

	self.AFKMode.bottom = CreateFrame("Frame", nil, self.AFKMode)
	self.AFKMode.bottom:SetPoint("BOTTOM", self.AFKMode, "CENTER", 0, 0)
	self.AFKMode.bottom:SetWidth(GetScreenWidth())
	self.AFKMode.bottom:SetHeight(GetScreenHeight() * (1 / 10))
	
	self.AFKMode.bottom.bg = CreateFrame("Frame", nil, self.AFKMode)
	self.AFKMode.bottom.bg:SetTemplate("Transparent")
	self.AFKMode.bottom.bg:SetSize(400, 100)
	self.AFKMode.bottom.bg:SetPoint("CENTER", 135, 30)

	self.AFKMode.bottom.name = self.AFKMode.bottom:CreateFontString(nil, 'OVERLAY')
	self.AFKMode.bottom.name:FontTemplate(nil, 20, "OUTLINE")
	self.AFKMode.bottom.name:SetText(E.myname)
	self.AFKMode.bottom.name:SetPoint("CENTER", 0, 0)
	self.AFKMode.bottom.name:SetTextColor(classColor.r, classColor.g, classColor.b)

	self.AFKMode.bottom.guild = self.AFKMode.bottom:CreateFontString(nil, 'OVERLAY')
	self.AFKMode.bottom.guild:FontTemplate(nil, 20, "OUTLINE")
	self.AFKMode.bottom.guild:SetText(L["No Guild"])
	self.AFKMode.bottom.guild:SetPoint("TOPLEFT", self.AFKMode.bottom.name, "BOTTOMLEFT", 0, -6)
	self.AFKMode.bottom.guild:SetTextColor(0.7, 0.7, 0.7)

	self.AFKMode.bottom.time = self.AFKMode.bottom:CreateFontString(nil, 'OVERLAY')
	self.AFKMode.bottom.time:FontTemplate(nil, 20, "OUTLINE")
	self.AFKMode.bottom.time:SetText("00:00")
	self.AFKMode.bottom.time:SetPoint("TOPLEFT", self.AFKMode.bottom.guild, "BOTTOMLEFT", 0, -6)
	self.AFKMode.bottom.time:SetTextColor(0.7, 0.7, 0.7)

	self.AFKMode.bottom.model = CreateFrame("PlayerModel", "ElvUIAFKPlayerModel", self.AFKMode.bottom)
	self.AFKMode.bottom.model:SetPoint("CENTER", -300, 0)
	self.AFKMode.bottom.model:SetSize(800, 800)
	self.AFKMode.bottom.model:SetCamDistanceScale(1.15)
	self.AFKMode.bottom.model:SetFacing(6)
	self.AFKMode.bottom.model:SetScript("OnUpdateModel", function(self) 
		local timePassed = GetTime() - self.startTime
		if(timePassed > self.duration) and self.isIdle ~= true then
			self:SetAnimation(0)
			self.isIdle = true
			AFK.animTimer = AFK:ScheduleTimer("LoopAnimations", self.idleDuration)
		end
	end)

	self:Toggle()
	self.isActive = false	
end


E:RegisterModule(AFK:GetName())