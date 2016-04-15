local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local A = E:GetModule('Auras', 'AceHook-3.0', 'AceEvent-3.0');
local LSM = LibStub("LibSharedMedia-3.0")

--Copy/paste of Elv's with modification of the texture coord - increases the 'zoom' into the aura textures

function A:UpdateAuras(header, button)
	if(not button.texture) then
		button.texture = button:CreateTexture(nil, "BORDER")
		button.texture:SetAllPoints()

		button.count = button:CreateFontString(nil, "ARTWORK")
		button.count:SetPoint("BOTTOMRIGHT", -1, 1)
		button.count:FontTemplate()--safty

		button.time = button:CreateFontString(nil, "ARTWORK")
		button.time:SetPoint("TOP", button, 'BOTTOM', 0, -2)
		button.time:FontTemplate()--safty
		
		button:CreateBackdrop('Default')

		button.highlight = button:CreateTexture(nil, "HIGHLIGHT")
		button.highlight:SetTexture(1,1,1,0.45)
		button.highlight:SetAllPoints(button.texture)			
		
		E:SetUpAnimGroup(button)
	end
	local font = LSM:Fetch("font", self.db.font)
	button.count:FontTemplate(font, self.db.fontSize, self.db.fontOutline)
	button.time:FontTemplate(font, self.db.fontSize, self.db.fontOutline)
	
	local name, _, texture, count, dtype, duration, expiration = UnitAura(header:GetAttribute("unit"), button:GetID(), header:GetAttribute("filter"))
	
	
	if(name) then
		local b = 0.12;
		button.texture:SetTexture(texture)
		button.texture:SetTexCoord(b, 1-b, b, 1-b)
		button.count:SetText(count > 1 and count or "")
		button.expiration = expiration - GetTime()
		button.nextupdate = 0
		button:SetScript("OnUpdate", A.UpdateTime)
		
		if(header:GetAttribute("filter") == "HARMFUL") then
			local color = DebuffTypeColor[dtype] or DebuffTypeColor.none
			button.backdrop:SetBackdropBorderColor(color.r * 3/5, color.g * 3/5, color.b * 3/5)
		end
	end
end

function A:Initialize()
	if self.db then return; end --IDK WHY BUT THIS IS GETTING CALLED TWICE FROM SOMEWHERE...

	self:Construct_ConsolidatedBuffs()

	if(E.private.auras.disableBlizzard) then
		BuffFrame:Kill()
		ConsolidatedBuffs:Kill()
		TemporaryEnchantFrame:Kill();
		InterfaceOptionsFrameCategoriesButton12:SetScale(0.0001)
	end
	
	if(not E.private.auras.disableBlizzard) then
		BuffFrame:Kill()
		ConsolidatedBuffs:Kill()
		TemporaryEnchantFrame:Kill();
		InterfaceOptionsFrameCategoriesButton12:SetScale(0.0001)
	end

	if(not E.private.auras.enable) then return end

	self.db = E.db.auras
	
	self.BuffFrame = self:CreateAuraHeader("HELPFUL")
	self.BuffFrame:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -8, 0)
	E:CreateMover(self.BuffFrame, "BuffsMover", L["Player Buffs"])

	self.DebuffFrame = self:CreateAuraHeader("HARMFUL")
	self.DebuffFrame:SetPoint("BOTTOMRIGHT", LeftMiniPanel, "BOTTOMLEFT", -(6 + E.Border), 0)
	E:CreateMover(self.DebuffFrame, "DebuffsMover", L["Player Debuffs"])
end
