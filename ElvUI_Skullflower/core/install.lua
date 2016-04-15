local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

local CURRENT_PAGE = 0
local MAX_PAGE = 2

L['LOGIN_MSG'] = "Welcome to |cfffb4f4fSkullflower's UI |cffffffffversion |cfffb4f4f2.24. |cffffffffType |cfffb4f4f/sf |cffffffffto access the in-game configuration menu. If you are in need of technical support you can request help on Curse, WoWInterface, or the TukUI boards."

SLASH_SKULL1, SLASH_SKULL2, SLASH_SKULL3 = '/sf', '/skull', '/skullflower';
function SlashCmdList.SKULL(msg, editbox)
	if msg == 'help' then
		 print('|cfffb4f4fSkullflower UI |cffffffffusage:');
		 print('/sf');
		 print('/sf reset');
	elseif msg == 'reset' then
		E:StaticPopup_Show('RESETUI_CHECK')
	else
		CURRENT_PAGE = 0
		E:Install()
	end
end

local function SetupChat()
	InstallStepComplete.message = L["Chat Settings installed"]
	InstallStepComplete:Show()			
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)	
	FCF_OpenNewWindow(Private)
	FCF_SetLocked(ChatFrame3, 1)
	ChatFrame3:Show()	
			
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)
		
		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
		
		-- set default Elvui font size
		FCF_SetChatWindowFontSize(nil, frame, 11, "OUTLINE")
		
		-- rename windows general because moved to chat #3
		if i == 1 then
			FCF_SetWindowName(frame, GENERAL)
		elseif i == 2 then
			FCF_SetWindowName(frame, GUILD_EVENT_LOG)
		elseif i == 3 then 
			FCF_SetWindowName(frame, "Private") 
		end
	end
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_INLINE_TOAST_ALERT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")	
	ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame1, "CHANNEL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame1, "CURRENCY ")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "CURRENCY")
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "DND")
	ChatFrame_AddMessageGroup(ChatFrame3, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_INLINE_TOAST_ALERT")
	ChatFrame_AddMessageGroup(ChatFrame3, "CHANNEL")
	
	ChatFrame_AddChannel(ChatFrame1, GENERAL)

	-- enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")	
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
	
	--Adjust Chat Colors
	--General
	ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
	--Trade
	ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
	--Local Defense
	ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
end

function E:GetColor(r, b, g, a)	
	return { r = r, b = b, g = g, a = a }
end

function E:SetupTheme(theme, noDisplayMsg)
	local classColor = RAID_CLASS_COLORS[E.myclass]
	InstallStepComplete.message = L["Interface Installed"]
	InstallStepComplete:Show()		
	E.private.theme = theme
	if not E.db.movers then E.db.movers = {}; end
		if theme == "SkullflowerUI" then
		
		--Frame Placement
		E.db.movers["ObjectiveFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-82-337"
		E.db.movers["MinimapMover"] = "TOPRIGHTElvUIParentTOPRIGHT-30-30"
		E.db.movers["BuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-182-31"
		E.db.movers["DebuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-182-151"
		E.db.movers["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-182281"
		E.db.movers["PlayerPowerBarMover"] = "BOTTOMElvUIParentBOTTOM-182266"
		E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM0147"
		E.db.movers["AltPowerBarMover"] = "TOPElvUIParentTOP0-180"
		E.db.movers["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-231205"
		E.db.movers["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM182281"
		E.db.movers["TargetPowerBarMover"] = "BOTTOMElvUIParentBOTTOM182266"
		E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM182265"
		E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM232205"
		E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-478281"
		E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-478281"
		E.db.movers["LossControlMover"] = "TOPElvUIParentTOP0-490"
		E.db.movers["AlertFrameMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-255530"
		E.db.movers["BNETMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT30155"
		E.db.movers["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT304"
		E.db.movers["RightChatMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-304"
		E.db.movers["GMMover"] = "TOPLEFTElvUIParentTOPLEFT30-30"
		E.db.movers["CM_MOVER"] = "BOTTOMElvUIParentBOTTOM0150"
		E.db.movers["LootFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-255-529"
		E.db.movers["ExperienceBarMover"] = "TOPElvUIParentTOP0-65"
		E.db.movers["ReputationBarMover"] = "TOPElvUIParentTOP0-65"
		E.db.movers["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-30323"
		E.db.movers["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT30220"
		E.db.movers["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT30736"
		E.db.movers["ElvUF_Raid40Mover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT30208"
		E.db.movers["ElvUF_PartyMover"] = "TOPRIGHTElvUIParentBOTTOMLEFT1075224"
		E.db.movers["ElvUF_AssistMover"] = "TOPLEFTElvUIParentTOPLEFT30-340"
		E.db.movers["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT30-240"
		E.db.movers["BossHeaderMover"] = "TOPLEFTElvUIParentTOPLEFT30-340"
		E.db.movers["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-30-300"
		E.db.movers["BossButton"] = "TOPRIGHTElvUIParentTOPRIGHT-75-234"
		E.db.movers["ArenaHeaderMover"] = "TOPLEFTElvUIParentTOPLEFT30-265"
		E.db.movers["VehicleSeatMover"] = "TOPLEFTElvUIParentTOPLEFT30-30"
		E.db.movers["ClassBarMover"] = "BOTTOMElvUIParentBOTTOM-182313"
		E.db.movers["ComboBarMover"] = "BOTTOMElvUIParentBOTTOM-182313"
		E.db.movers["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM030"
		E.db.movers["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM059"
		E.db.movers["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM088"
		E.db.movers["ElvAB_4"] = "BOTTOMElvUIParentBOTTOM0117"
		E.db.movers["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM01"
		E.db.movers["ShiftAB"] = "BOTTOMElvUIParentBOTTOM0170"
		E.db.movers["PetAB"] = "BOTTOMElvUIParentBOTTOM-184245"
		E.db.movers["MicrobarMover"] = "TOPLEFTElvUIParentTOPLEFT30-30"
		
		if E.myclass == "SHAMAN" then
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182308"
		else
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182325"
		end
		
		-- Texture and Font
		E.db.general.normTex = "Skullflower"
		E.db.general.font = "Expressway"
		E.db.general.fontSize = 11
		
		-- Minimap
		E.db.general.minimap.icons.lfgEye.position = "BOTTOMLEFT"
		E.db.general.minimap.icons.garrison.scale = 0.65
		E.db.general.minimap.icons.garrison.position = "BOTTOMRIGHT"
		E.db.general.minimap.icons.garrison.hideGarrison = false 
		E.db.general.bottomPanel = false
		E.db.general.minimap.size = 150
		
		-- Experience and Reputation Bars
		E.db.general.experience.width = 512
		E.db.general.experience.height = 26
		E.db.general.experience.orientation = "Horizontal"
		E.db.general.experience.textFormat ="CURPERC"
		E.db.general.reputation.width = 512
		E.db.general.reputation.height = 26
		E.db.general.reputation.mouseover = false
		E.db.general.reputation.orientation = "Horizontal"
		E.db.general.reputation.textFormat ="CURPERC"
		
		-- Misc
		E.db.general.threat.enable = false
		E.db.general.backdropcolor = { r = 18/255, g = 18/255, b = 18/255}
		E.db.general.backdropfadecolor = { r = 18/255, g = 18/255, b = 18/255, a = 0.9}
		E.db.general.valuecolor = E:GetColor(classColor.r, classColor.b, classColor.g)
		E.db.general.totems.enable = true
		E.db.general.totems.growthDirection = "HORIZONTAL"
		E.db.general.totems.size = 43
		E.db.auras.disableBlizzard = true
		
		-- Unitframe Settings
		E.db.unitframe.statusbar = "Skullflower"
		E.db.unitframe.font = "Expressway"
		E.db.unitframe.fontSize = 11
		E.db.unitframe.fontOutline = "OUTLINE"
		E.db.unitframe.debuffHighlighting = false
		E.db.unitframe.colors.healthclass = true
		E.db.unitframe.colors.colorhealthbyvalue = false
		E.db.unitframe.colors.castColor = E:GetColor(17/255, 17/255, 17/255)
		E.db.unitframe.colors.health = { r = 107/255, g = 255/255, b = 103/255 }
		E.db.unitframe.colors.health_backdrop = { r = 18/255, g = 18/255, b = 18/255 }
		E.db.unitframe.colors.tapped = { r = 195/255, g = 202/255, b = 217/255 }
		E.db.unitframe.colors.disconnected = { r = 195/255, g = 202/255, b = 217/255 }
		E.db.unitframe.colors.power.MANA = { r = 0/255, g = 190/255, b = 230/255 }
		E.db.unitframe.colors.power.RAGE = { r = 70/255, g = 70/255, b = 70/255 }
		E.db.unitframe.colors.power.FOCUS = { r = 230/255, g = 140/255, b = 60/255 }
		E.db.unitframe.colors.power.ENERGY = { r = 70/255, g = 70/255, b = 70/255 }
		E.db.unitframe.colors.power.RUNIC_POWER = { r = 70/255, g = 70/255, b = 70/255 }
		E.db.unitframe.colors.reaction.BAD = { r = 239/225, g = 31/225, b = 44/225 }
		E.db.unitframe.colors.reaction.NEUTRAL = { r = 255/255, g = 249/255, b = 94/255 }
		E.db.unitframe.colors.reaction.GOOD = { r = 107/255, g = 255/255, b = 103/255 }
		E.db.unitframe.colors.castColor = { r = 204/255, g = 204/255, b = 204/255 }
		E.db.unitframe.colors.castNoInterrupt = { r = 239/225, g = 31/225, b = 44/225 }
		E.db.unitframe.colors.classResources.bgColor = { r = 18/255, g = 18/255, b = 18/255}
		
		--Resource Colours
		E.db.unitframe.colors.classResources.MONK[1] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[2] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[3] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[4] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[5] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[6] = { r = 0/255, g = 255/255, b = 150/255 }
		
		E.db.unitframe.colors.classResources.DEATHKNIGHT[1] = { r = 251/255, g = 79/255, b = 79/255 }
		E.db.unitframe.colors.classResources.DEATHKNIGHT[2] = { r = 107/255, g = 255/255, b = 103/255 }
		E.db.unitframe.colors.classResources.DEATHKNIGHT[3] = { r = 108/255, g = 192/255, b = 229/255 }
		E.db.unitframe.colors.classResources.DEATHKNIGHT[4] = { r = 251/255, g = 78/255, b = 229/255 }
		
		E.db.unitframe.colors.classResources.ROGUE[1] = { r = 255/255, g = 245/255, b = 105/255 }
		E.db.unitframe.colors.classResources.ROGUE[1] = { r = 255/255, g = 245/255, b = 105/255 }
		E.db.unitframe.colors.classResources.ROGUE[1] = { r = 255/255, g = 245/255, b = 105/255 }
		E.db.unitframe.colors.classResources.ROGUE[1] = { r = 255/255, g = 245/255, b = 105/255 }
		E.db.unitframe.colors.classResources.ROGUE[1] = { r = 255/255, g = 245/255, b = 105/255 }
		
		E.db.unitframe.colors.castClassColor = false
		E.db.unitframe.colors.customhealthbackdrop = true
		E.db.unitframe.smartRaidFilter = false
		
		-- Player
		E.db.unitframe.units.player.customTexts = {}
		E.db.unitframe.units.player.customTexts.HealthText = {}
		E.db.unitframe.units.player.restIcon = false
		E.db.unitframe.units.player.width = 184
		E.db.unitframe.units.player.height = 30
		E.db.unitframe.units.player.healPrediction = false
		E.db.unitframe.units.player.threatStyle = "NONE"
		E.db.unitframe.units.player.health.text_format = ""
		E.db.unitframe.units.player.power.text_format = ""
		E.db.unitframe.units.player.power.height = 15
		E.db.unitframe.units.player.power.yOffset = -22
		E.db.unitframe.units.player.power.detachFromFrame = true
		E.db.unitframe.units.player.power.detachedWidth = 182
		E.db.unitframe.units.player.power.druidMana = false
		E.db.unitframe.units.player.pvp.text_format = ""
		E.db.unitframe.units.player.buffs.enable = false
		E.db.unitframe.units.player.buffs.yOffset = 0
		E.db.unitframe.units.player.buffs.attachTo = "Frame"
		E.db.unitframe.units.player.buffs.anchorPoint = "CENTER"
		E.db.unitframe.units.player.debuffs.enable = false
		E.db.unitframe.units.player.debuffs.sizeOverride = 46
		E.db.unitframe.units.player.debuffs.xOffset = -1
		E.db.unitframe.units.player.debuffs.yOffset = -8
		E.db.unitframe.units.player.debuffs.fontSize = 16
		E.db.unitframe.units.player.debuffs.attachTo = "Frame"
		E.db.unitframe.units.player.debuffs.anchorPoint = "LEFT"
		E.db.unitframe.units.player.castbar.enable = true
		E.db.unitframe.units.player.castbar.width = 231
		E.db.unitframe.units.player.castbar.height = 20
		E.db.unitframe.units.player.castbar.icon = false
		E.db.unitframe.units.player.castbar.latency = false
		E.db.unitframe.units.player.castbar.format = "Remaining"
		E.db.unitframe.units.player.castbar.ticks = true
		E.db.unitframe.units.player.castbar.spark = false
		if E.myclass == "DEATHKNIGHT" and IsAddOnLoaded("CompactRunes") or IsAddOnLoaded("mRunes") then
			E.db.unitframe.units.player.classbar.enable = false
		else
			E.db.unitframe.units.player.classbar.enable = true
		end
		E.db.unitframe.units.player.classbar.detachFromFrame = true
		E.db.unitframe.units.player.classbar.detachedWidth = 184
		E.db.unitframe.units.player.classbar.height = 15
		E.db.unitframe.units.player.stagger.enable = false
		E.db.unitframe.units.player.customTexts.HealthText.justifyH = "Left"
		E.db.unitframe.units.player.customTexts.HealthText.xOffset = 11
		E.db.unitframe.units.player.customTexts.HealthText.yOffset = -11
		E.db.unitframe.units.player.customTexts.HealthText.size = 32
		E.db.unitframe.units.player.aurabar.enable = false
		E.db.unitframe.units.player.aurabar.attachTo = 'BUFFS'
		E.db.unitframe.units.player.aurabar.height = 18
		
		-- Target
		E.db.unitframe.units.target.customTexts = {}
		E.db.unitframe.units.target.customTexts.HealthText = {}
		E.db.unitframe.units.target.rangeCheck = false
		E.db.unitframe.units.target.width = 184
		E.db.unitframe.units.target.height = 30
		E.db.unitframe.units.target.healPrediction = false
		E.db.unitframe.units.target.threatStyle = "NONE"
		E.db.unitframe.units.target.health.text_format = ""
		E.db.unitframe.units.target.power.text_format = ""
		E.db.unitframe.units.target.power.position = "LEFT"
		E.db.unitframe.units.target.power.height = 15
		E.db.unitframe.units.target.power.xOffset = 0
		E.db.unitframe.units.target.power.yOffset = -22
		E.db.unitframe.units.target.power.detachFromFrame = true
		E.db.unitframe.units.target.power.detachedWidth = 182
		E.db.unitframe.units.target.power.hideonnpc = false
		E.db.unitframe.units.target.name.position = "LEFT"
		E.db.unitframe.units.target.name.text_format = "[name:medium]"
		E.db.unitframe.units.target.name.xOffset = 0
		E.db.unitframe.units.target.name.yOffset = 0
		E.db.unitframe.units.target.buffs.enable = true
		E.db.unitframe.units.target.buffs.anchorPoint = "TOPLEFT"
		E.db.unitframe.units.target.buffs.fontSize = 11
		E.db.unitframe.units.target.buffs.yOffset = 2
		E.db.unitframe.units.target.debuffs.enable = true
		E.db.unitframe.units.target.debuffs.attachTo = "FRAME"
		E.db.unitframe.units.target.debuffs.anchorPoint = "BOTTOMLEFT"
		E.db.unitframe.units.target.debuffs.fontSize = 11
		E.db.unitframe.units.target.debuffs.yOffset = -17
		E.db.unitframe.units.target.combobar.enable = true
		E.db.unitframe.units.target.combobar.height = 15
		E.db.unitframe.units.target.combobar.detachFromFrame = true
		E.db.unitframe.units.target.combobar.detachedWidth = 184
		E.db.unitframe.units.target.combobar.autoHide = true
		E.db.unitframe.units.target.castbar.enable = true
		E.db.unitframe.units.target.castbar.width = 184
		E.db.unitframe.units.target.castbar.height = 15
		E.db.unitframe.units.target.castbar.icon = false
		E.db.unitframe.units.target.castbar.format = "Remaining"
		E.db.unitframe.units.target.castbar.spark = false
		E.db.unitframe.units.target.aurabar.enable = false
		E.db.unitframe.units.target.aurabar.attachTo = 'Debuffs'
		E.db.unitframe.units.target.aurabar.anchorPoint = 'Below'
		E.db.unitframe.units.target.customTexts.HealthText.justifyH = "Right"
		E.db.unitframe.units.target.customTexts.HealthText.xOffset = -11
		E.db.unitframe.units.target.customTexts.HealthText.yOffset = -11
		E.db.unitframe.units.target.customTexts.HealthText.size = 32
		
		-- Target of Target
		E.db.unitframe.units.targettarget.enable = true
		E.db.unitframe.units.targettarget.rangeCheck = false
		E.db.unitframe.units.targettarget.debuffs.enable = false
		E.db.unitframe.units.targettarget.width = 85
		E.db.unitframe.units.targettarget.height = 25
		E.db.unitframe.units.targettarget.power.enable = false
		E.db.unitframe.units.targettarget.name.position = "CENTER"
		E.db.unitframe.units.targettarget.name.text_format = "[name:veryshort]"
		
		-- Focus
		E.db.unitframe.units.focus.rangeCheck = false
		E.db.unitframe.units.focus.width = 179
		E.db.unitframe.units.focus.height = 30
		E.db.unitframe.units.focus.power.enable = false
		E.db.unitframe.units.focus.power.height = 3
		E.db.unitframe.units.focus.threatStyle = "NONE"
		E.db.unitframe.units.focus.name.position = "CENTER"
		E.db.unitframe.units.focus.name.text_format = "[name]"
		E.db.unitframe.units.focus.debuffs.enable = false
		E.db.unitframe.units.focus.castbar.width = 179
		E.db.unitframe.units.focus.castbar.height = 28
		E.db.unitframe.units.focus.castbar.icon = false
		E.db.unitframe.units.focus.castbar.format = "Remaining"
		E.db.unitframe.units.focus.castbar.spark = false
		
		-- Pet
		E.db.unitframe.units.pet.rangeCheck = false
		E.db.unitframe.units.pet.width = 85
		E.db.unitframe.units.pet.height = 25
		E.db.unitframe.units.pet.threatStyle = "NONE"
		E.db.unitframe.units.pet.healPrediction = false
		E.db.unitframe.units.pet.power.enable = false
		E.db.unitframe.units.pet.name.text_format = "[name:short]"
		E.db.unitframe.units.pet.name.position = "CENTER"
		E.db.unitframe.units.pet.buffIndicator.enable = false
		
		-- Boss 
		E.db.unitframe.units.boss.enable = false
		E.db.unitframe.units.boss.width = 175
		E.db.unitframe.units.boss.height = 35
		E.db.unitframe.units.boss.health.text_format = "[health:percent]"
		E.db.unitframe.units.boss.health.position = "RIGHT"
		E.db.unitframe.units.boss.power.enable = false
		E.db.unitframe.units.boss.name.text_format = "[name:medium]"
		E.db.unitframe.units.boss.castbar.enable = true
		E.db.unitframe.units.boss.castbar.width = 175
		E.db.unitframe.units.boss.buffs.enable = false
		E.db.unitframe.units.boss.buffs.perrow = 3
		E.db.unitframe.units.boss.buffs.numrows = 1
		E.db.unitframe.units.boss.buffs.anchorPoint = "LEFT"
		E.db.unitframe.units.boss.buffs.fontSize = 22
		E.db.unitframe.units.boss.buffs.xOffset = -3
		E.db.unitframe.units.boss.buffs.yOffset = 0
		E.db.unitframe.units.boss.buffs.sizeOverride = 35
		E.db.unitframe.units.boss.debuffs.enable = true
		E.db.unitframe.units.boss.debuffs.perrow = 3
		E.db.unitframe.units.boss.debuffs.numrows = 1
		E.db.unitframe.units.boss.debuffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.boss.debuffs.fontSize = 22
		E.db.unitframe.units.boss.debuffs.xOffset = 3
		E.db.unitframe.units.boss.debuffs.yOffset = 0
		E.db.unitframe.units.boss.debuffs.sizeOverride = 35
		
		-- Arena
		E.db.unitframe.units.arena.width = 225
		E.db.unitframe.units.arena.height = 40
		E.db.unitframe.units.arena.health.text_format = "[health:current]"
		E.db.unitframe.units.arena.power.text_format = ""
		E.db.unitframe.units.arena.name.text_format = "[name:veryshort]"
		E.db.unitframe.units.arena.buffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.arena.buffs.fontSize = 11
		E.db.unitframe.units.arena.buffs.sizeOverride = 18
		E.db.unitframe.units.arena.buffs.xOffset = 2
		E.db.unitframe.units.arena.buffs.yOffset = 10
		E.db.unitframe.units.arena.debuffs.fontSize = 11
		E.db.unitframe.units.arena.debuffs.sizeOverride = 18
		E.db.unitframe.units.arena.debuffs.xOffset = 2
		E.db.unitframe.units.arena.debuffs.yOffset = -10
		E.db.unitframe.units.arena.castbar.width = 225
		E.db.unitframe.units.arena.castbar.height = 10
		E.db.unitframe.units.arena.castbar.icon = false
		E.db.unitframe.units.arena.castbar.format = ""
		E.db.unitframe.units.arena.castbar.spark = false
		
		-- Party
		E.db.unitframe.units.party.width = 45
		E.db.unitframe.units.party.height = 30
		E.db.unitframe.units.party.threatStyle = "NONE"
		E.db.unitframe.units.party.growthDirection = "LEFT_DOWN"
		E.db.unitframe.units.party.horizontalSpacing = 1
		E.db.unitframe.units.party.verticalSpacing = 1
		E.db.unitframe.units.party.health.text_format = ""
		E.db.unitframe.units.party.power.enable = false
		E.db.unitframe.units.party.name.position = "CENTER"
		E.db.unitframe.units.party.name.text_format = "[name:veryshort]"
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.GPSArrow.enable = false
		E.db.unitframe.units.party.buffIndicator.enable = false
		E.db.unitframe.units.party.roleIcon.enable = false
		E.db.unitframe.units.party.debuffs.perrow = 1
		E.db.unitframe.units.party.debuffs.numrows = 3
		E.db.unitframe.units.party.debuffs.sizeOverride = 30
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.debuffs.anchorPoint = "BOTTOM"
		E.db.unitframe.units.party.debuffs.onlyDispellable = true
		E.db.unitframe.units.party.buffs.perrow = 2
		E.db.unitframe.units.party.buffs.numrows = 1
		E.db.unitframe.units.party.buffs.sizeOverride = 20
		E.db.unitframe.units.party.buffs.xOffset = -47
		E.db.unitframe.units.party.buffs.yOffset = 0
		E.db.unitframe.units.party.buffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.party.visibility = "[@raid6,exists][nogroup] hide;show"
		
		-- Raid
		E.db.unitframe.units.raid.width = 55
		E.db.unitframe.units.raid.height = 30
		E.db.unitframe.units.raid.threatStyle = "NONE"
		E.db.unitframe.units.raid.growthDirection = "RIGHT_UP"
		E.db.unitframe.units.raid.visibility = "[@raid6,noexists] hide;show"
		E.db.unitframe.units.raid.horizontalSpacing = 1
		E.db.unitframe.units.raid.verticalSpacing = 1
		E.db.unitframe.units.raid.health.text_format = ""
		E.db.unitframe.units.raid.power.enable = false
		E.db.unitframe.units.raid.name.position = "CENTER"
		E.db.unitframe.units.raid.name.text_format = "[name:veryshort]"
		E.db.unitframe.units.raid.GPSArrow.enable = false
		E.db.unitframe.units.raid.roleIcon.enable = false
		E.db.unitframe.units.raid.numGroups = 8
		E.db.unitframe.units.raid40.enable = false
		E.db.unitframe.units.raid40.width = 55
		E.db.unitframe.units.raid40.height = 30
		E.db.unitframe.units.tank.enable = false
		E.db.unitframe.units.assist.enable = false
		
		-- Bags
		E.db.bags.bagSize = 31
		E.db.bags.bankSize = 31
		
		-- Nameplates
		E.db.nameplate.font = "Expressway"
		E.db.nameplate.fontSize = 8
		E.db.nameplate.fontOutline = "OUTLINE"
		E.db.nameplate.targetIndicator = false
		E.db.nameplate.healthBar.width = 100
		E.db.nameplate.healthBar.height = 8
		E.db.nameplate.healthBar.text.enable = false
		E.db.nameplate.buffs.font = "Expressway"
		E.db.nameplate.buffs.fontOutline = "OUTLINE"
		E.db.nameplate.debuffs.font = "Expressway"
		E.db.nameplate.debuffs.fontOutline = "OUTLINE"
		E.db.nameplate.threat.goodColor = {r = 88/255, g = 255/255, b = 105/255}
		E.db.nameplate.threat.badColor = {r = 251/255, g = 9/255, b = 27/255}
		E.db.nameplate.threat.goodTransitionColor = {r = 88/255, g = 255/255, b = 105/255}
		E.db.nameplate.threat.badTransitionColor = {r = 251/255, g = 9/255, b = 27/255}
		E.db.nameplate.reactions.tapped = {r = 195/255, g = 202/255, b = 217/255}
		E.db.nameplate.reactions.friendlyNPC = { r = 80/255, g = 250/255, b = 71/255 }
		E.db.nameplate.reactions.friendlyPlayer = { r = 80/255, g = 250/255, b = 71/255 }
		E.db.nameplate.reactions.neutral = { r = 255/255, g = 229/255, b = 58/255 }
		E.db.nameplate.reactions.enemy = { r = 211/225, g = 27/225, b = 40/225 }
		
		-- Auras
		E.db.auras.font = "Expressway"
		E.db.auras.fontSize = 11
		E.db.auras.fontOutline = "OUTLINE"
		E.db.auras.consolidatedBuffs.enable = false
		E.db.auras.consolidatedBuffs.font = "Expressway"
		E.db.auras.consolidatedBuffs.fontSize = 10
		E.db.auras.consolidatedBuffs.fontOutline = "OUTLINE"
		E.db.auras.buffs.wrapAfter = 15
		E.db.auras.buffs.maxWraps = 2
		E.db.auras.buffs.horizontalSpacing = 1
		E.db.auras.buffs.verticalSpacing = 16
		E.db.auras.buffs.size = 32
		E.db.auras.debuffs.horizontalSpacing = 1
		E.db.auras.debuffs.wrapAfter = 15
		E.db.auras.debuffs.maxWraps = 2
		E.db.auras.debuffs.size = 32
		
		-- Chat
		E.db.chat.font = "Expressway"
		E.db.chat.fontOutline = "OUTLINE"
		E.db.chat.editBoxPosition = 'BELOW_CHAT'
		E.db.chat.emotionIcons = false
		E.db.chat.panelWidth = 350
		E.db.chat.panelHeight = 150
		E.db.chat.panelBackdrop = "HIDEBOTH"
		E.db.chat.panelTabBackdrop = false
		E.db.chat.tabFont = "Expressway"
		E.db.chat.tabFontSize = 11
		E.db.chat.tabFontOutline = "OUTLINE"
		E.db.chat.panelTabTransparency = false
		E.db.chat.lfgIcons = false
		
		-- Datatexts
		E.db.datatexts.font = "Expressway"
		E.db.datatexts.fontSize = 11
		E.db.datatexts.fontOutline = "OUTLINE"
		E.db.datatexts.rightChatPanel = false
		E.db.datatexts.battleground = false
		E.db.datatexts.panels.LeftChatDataPanel.left = ""
		E.db.datatexts.panels.LeftChatDataPanel.middle = ""
		E.db.datatexts.panels.LeftChatDataPanel.right = ""
		E.db.datatexts.panels.RightChatDataPanel.left = ""
		E.db.datatexts.panels.RightChatDataPanel.middle = ""
		E.db.datatexts.panels.RightChatDataPanel.right = ""
		E.db.datatexts.panels.LeftMiniPanel = ""
		E.db.datatexts.panels.RightMiniPanel = "Time"
		
		-- Tooltip
		E.db.tooltip.cursorAnchor = false
		E.db.tooltip.targetInfo = false
		E.db.tooltip.playerTitles = false
		E.db.tooltip.inspectInfo = false
		E.db.tooltip.guildRanks = false
		E.db.tooltip.talentInfo = false
		E.db.tooltip.itemCount = false
		E.db.tooltip.spellID = false
		E.db.tooltip.healthBar.height = 0
		E.db.tooltip.healthBar.font = "Expressway"
		E.db.tooltip.healthBar.text = false
		
		-- Actionbars
		E.db.cooldown.threshold = -1
		E.db.cooldown.expiringcolor = { r = 251/255, g = 9/255, b = 27/255 }
		E.db.cooldown.secondscolor = { r = 253/255, g = 255/255, b = 96/255 }
		E.db.cooldown.minutescolor = { r = 1, g = 1, b = 1 }
		E.db.cooldown.hourscolor = { r = 108/225, g = 192/225, b = 229/225 }
		E.db.cooldown.dayscolor = { r = 108/225, g = 192/225, b = 229/225 }
		E.db.actionbar.font = "Expressway"
		E.db.actionbar.fontSize = 11
		E.db.actionbar.fontOutline = "OUTLINE"
		E.db.actionbar.hotkeytext = false
		E.db.actionbar.noRangeColor = {r = 251/255, g = 9/255, b = 27/255}
		E.db.actionbar.noPowerColor = {r = 63/255, g = 88/255, b = 255/255}
		E.db.actionbar.microbar.enabled = true
		E.db.actionbar.microbar.mouseover = true
		E.db.actionbar.bar1.buttons = 8
		E.db.actionbar.bar1.buttonsPerRow = 8
		E.db.actionbar.bar1.buttonsize = 28
		E.db.actionbar.bar1.buttonspacing = 1
		E.db.actionbar.bar2.enabled = true
		E.db.actionbar.bar2.buttons = 8
		E.db.actionbar.bar2.buttonsPerRow = 8
		E.db.actionbar.bar2.buttonsize = 28
		E.db.actionbar.bar2.buttonspacing = 1
		E.db.actionbar.bar3.mouseover = false
		E.db.actionbar.bar3.buttons = 8
		E.db.actionbar.bar3.buttonsPerRow = 12
		E.db.actionbar.bar3.buttonsize = 28
		E.db.actionbar.bar3.buttonspacing = 1
		E.db.actionbar.bar3.alpha = 0.4
		E.db.actionbar.bar4.mouseover = true
		E.db.actionbar.bar4.buttons = 8
		E.db.actionbar.bar4.point = "BOTTOMLEFT"
		E.db.actionbar.bar4.buttonsPerRow = 12
		E.db.actionbar.bar4.backdrop = false
		E.db.actionbar.bar4.buttonsize = 28
		E.db.actionbar.bar4.buttonspacing = 1
		E.db.actionbar.bar4.alpha = 0.4
		E.db.actionbar.bar5.mouseover = true
		E.db.actionbar.bar5.buttons = 12
		E.db.actionbar.bar5.buttonsPerRow = 12
		E.db.actionbar.bar5.buttonsize = 28
		E.db.actionbar.bar5.buttonspacing = 1
		E.db.actionbar.bar5.alpha = 0.4
		E.db.actionbar.bar6.enabled = false
		E.db.actionbar.bar6.buttons = 8
		E.db.actionbar.bar6.buttonsize = 28
		E.db.actionbar.bar6.buttonspacing = 1
		E.db.actionbar.barPet.mouseover = true
		E.db.actionbar.barPet.buttonsize = 17
		E.db.actionbar.barPet.buttonsPerRow = 10
		E.db.actionbar.barPet.buttonspacing = 1
		E.db.actionbar.stanceBar.mouseover = true
		E.db.actionbar.stanceBar.buttonsize = 28
		E.db.actionbar.stanceBar.buttonspacing = 1
	elseif theme == "dataT" then
		E.db.datatexts.panels.LeftChatDataPanel.left = "System"
		E.db.datatexts.panels.LeftChatDataPanel.middle = "Gold"
		E.db.datatexts.panels.LeftChatDataPanel.right = "Garrison"
	elseif theme == "healF" then
		E.db.movers["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT272520"
		E.db.movers["ElvUF_PartyMover"] = "TOPLEFTElvUIParentTOPLEFT322-520"
		E.db.unitframe.units.raid.width = 60
		E.db.unitframe.units.raid.height = 35
		E.db.unitframe.units.party.width = 55
		E.db.unitframe.units.party.height = 40
		E.db.unitframe.units.party.buffIndicator.enable = true
		E.db.unitframe.units.party.debuffs.enable = true
	elseif theme == "cBuffs" then
		E.db.auras.consolidatedBuffs.enable = true
		E.db.movers["DebuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-209-151"
		E.db.movers["BuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-209-31"
	elseif theme == "unhideB" then
		E.db.actionbar.bar3.mouseover = false
		E.db.actionbar.bar4.mouseover = false
	elseif theme == "sqAB" then
		E.db.movers["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM088"
		E.db.movers["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM-11630"
		E.db.movers["ElvAB_4"] = "BOTTOMElvUIParentBOTTOM11630"
		E.db.unitframe.units.player.castbar.width = 173
		E.db.actionbar.bar1.buttons = 12
		E.db.actionbar.bar1.buttonsPerRow = 6
		E.db.actionbar.bar2.buttons = 12
		E.db.actionbar.bar2.buttonsPerRow = 6
		E.db.actionbar.bar3.mouseover = true
		E.db.actionbar.bar3.buttons = 8
		E.db.actionbar.bar3.buttonsPerRow = 2
		E.db.actionbar.bar4.buttons = 8
		E.db.actionbar.bar4.buttonsPerRow = 2
	elseif theme == "unitT" then
		E.db.unitframe.units.player.customTexts.HealthText.text_format = "[health:current]"
		E.db.unitframe.units.target.customTexts.HealthText.text_format = "[health:current]"
		E.db.unitframe.units.player.power.text_format = "[power:current]"
		E.db.unitframe.units.target.power.text_format = "[health:percent]"
	elseif theme == "eAB" then
		E.db.unitframe.units.player.aurabar.enable = true
		E.db.unitframe.units.target.aurabar.enable = true
		E.db.unitframe.units.player.buffs.yOffset = 20
	elseif theme == "chatB" then
		E.db.chat.panelBackdrop = "LEFT"
	elseif theme == "bossF" then
		E.db.unitframe.units.boss.enable = true
	elseif theme == "Default" then
		E.db.unitframe.statusbar = "Skullflower"
	elseif theme == "Light" then
		E.db.unitframe.statusbar = "SkullflowerLight"
	elseif theme == "cInd" then	
		E.db.chat.panelTabTransparency = true
		if E.db.chat.panelTabTransparency == true then
			ElvUF_Player.Combat:SetAlpha(1)
		elseif E.db.chat.panelTabTransparency == false then
			ElvUF_Player.Combat:SetAlpha(0)
		end
	elseif theme == "gDT" then
		E.db.datatexts.panels.LeftMiniPanel = "Garrison"
	elseif theme == "altUF" then
		--Frame Placement
		E.db.movers["PlayerPowerBarMover"] = "BOTTOMElvUIParentBOTTOM-182257"
		E.db.movers["TargetPowerBarMover"] = "BOTTOMElvUIParentBOTTOM182257"
		E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM182256"
		E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM231205"
		E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-484281"
		E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-484281"
		E.db.movers["ClassBarMover"] = "BOTTOMElvUIParentBOTTOM-182307"
		E.db.movers["ComboBarMover"] = "BOTTOMElvUIParentBOTTOM-182307"
		E.db.movers["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-230205"
		E.db.movers["PetAB"] = "BOTTOMElvUIParentBOTTOM-182236"
		E.db.unitframe.statusbar = "Skullflower"
		
		if E.myclass == "SHAMAN" then
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182302"
		else
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182319"
		end
		
		--Player
		E.db.general.totems.size = 43
		E.db.unitframe.units.player.height = 24
		E.db.unitframe.units.player.power.height = 22
		E.db.unitframe.units.player.power.yOffset = -24
		E.db.unitframe.units.player.debuffs.sizeOverride = 54
		E.db.unitframe.units.player.debuffs.yOffset = -14
		
		--Target
		E.db.unitframe.units.target.height = 24
		E.db.unitframe.units.target.power.height = 22
		E.db.unitframe.units.target.debuffs.yOffset = -26
		E.db.unitframe.units.target.power.yOffset = -24
		E.db.unitframe.units.target.castbar.height = 22
		
		--Focus
		E.db.unitframe.units.focus.height = 24
		E.db.unitframe.units.focus.castbar.height = 22
	elseif theme == "defUF" then
		E.db.movers["PlayerPowerBarMover"] = "BOTTOMElvUIParentBOTTOM-182266"
		E.db.movers["TargetPowerBarMover"] = "BOTTOMElvUIParentBOTTOM182266"
		E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM182265"
		E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM232205"
		E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-478281"
		E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-478281"
		E.db.movers["ClassBarMover"] = "BOTTOMElvUIParentBOTTOM-182313"
		E.db.movers["ComboBarMover"] = "BOTTOMElvUIParentBOTTOM-182313"
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182329"
		E.db.movers["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-231205"
		E.db.movers["PetAB"] = "BOTTOMElvUIParentBOTTOM-184245"
		
		if E.myclass == "SHAMAN" then
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182308"
		else
		E.db.movers["TotemBarMover"] = "BOTTOMElvUIParentBOTTOM-182325"
		end
		
		E.db.unitframe.units.player.height = 30
		E.db.unitframe.units.player.power.height = 15
		E.db.unitframe.units.player.power.yOffset = -22
		E.db.unitframe.units.player.debuffs.sizeOverride = 46
		E.db.unitframe.units.player.debuffs.yOffset = -8
		E.db.unitframe.units.target.width = 184
		E.db.unitframe.units.target.height = 30
		E.db.unitframe.units.target.power.height = 15
		E.db.unitframe.units.target.debuffs.yOffset = -17
		E.db.unitframe.units.target.power.yOffset = -22
		E.db.unitframe.units.target.castbar.height = 15
		E.db.unitframe.units.focus.width = 179
		E.db.unitframe.units.focus.height = 30
		E.db.unitframe.units.focus.castbar.height = 28
	elseif theme == "resetTheme" then
		-- dataT
		E.db.datatexts.panels.LeftChatDataPanel.left = ""
		E.db.datatexts.panels.LeftChatDataPanel.middle = ""
		E.db.datatexts.panels.LeftChatDataPanel.right = ""
		
		--healF
		E.db.movers["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT30220"
		E.db.movers["ElvUF_Raid40Mover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT30208"
		E.db.movers["ElvUF_PartyMover"] = "TOPRIGHTElvUIParentBOTTOMLEFT1075224"
		E.db.unitframe.units.raid.width = 55
		E.db.unitframe.units.raid.height = 30
		E.db.unitframe.units.party.width = 45
		E.db.unitframe.units.party.height = 30
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.buffIndicator.enable = false
		
		--cBuffs
		E.db.auras.consolidatedBuffs.enable = false
		E.db.movers["BuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-182-31"
		E.db.movers["DebuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-182-151"
		
		--unhideB
		E.db.actionbar.bar3.mouseover = false
		E.db.actionbar.bar4.mouseover = true
		
		--cInd
		E.db.chat.panelTabTransparency = false
		if E.db.chat.panelTabTransparency == true then
			ElvUF_Player.Combat:SetAlpha(1)
		elseif E.db.chat.panelTabTransparency == false then
			ElvUF_Player.Combat:SetAlpha(0)
		end
		
		--gDT
		E.db.datatexts.panels.LeftMiniPanel = ""
		
		--sqAB
		E.db.unitframe.units.player.castbar.width = 231
		E.db.movers["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM059"
		E.db.movers["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM088"
		E.db.movers["ElvAB_4"] = "BOTTOMElvUIParentBOTTOM0117"
		E.db.actionbar.bar1.buttons = 8
		E.db.actionbar.bar1.buttonsPerRow = 8
		E.db.actionbar.bar2.buttons = 8
		E.db.actionbar.bar2.buttonsPerRow = 8
		E.db.actionbar.bar3.buttons = 8
		E.db.actionbar.bar3.buttonsPerRow = 12
		E.db.actionbar.bar4.buttons = 8
		E.db.actionbar.bar4.buttonsPerRow = 12
		
		--unitT
		E.db.unitframe.units.player.customTexts.HealthText.text_format = ""
		E.db.unitframe.units.target.customTexts.HealthText.text_format = ""
		E.db.unitframe.units.player.power.text_format = ""
		E.db.unitframe.units.target.power.text_format = ""
		
		--eAB
		E.db.unitframe.units.player.aurabar.enable = false
		E.db.unitframe.units.target.aurabar.enable = false
		
		--chatB
		E.db.chat.panelBackdrop = "HIDEBOTH"
		
		--bossF
		E.db.unitframe.units.boss.enable = false
	end
	
	if not noDisplayMsg then
		E:UpdateAll(true)
	end
end

function E:SetupAddon(addon)
	if addon == 'Skada' then
		if IsAddOnLoaded('Skada') then
			E:Print(L["A profile for Skada has been created. Type '/skada config' to change the profile."])
			InstallStepComplete.message = L["AddOn Profiles installed"]
			InstallStepComplete:Show()
			SkadaDB['profiles']['Skullflower'] = {
			["windows"] = {
				{
					["classicons"] = false,
					["barslocked"] = true,
					["background"] = {
						["height"] = 208.999984741211,
						["color"] = {
							["a"] = 0.200000047683716,
							["b"] = 0.0862745098039216,
							["g"] = 0.0862745098039216,
							["r"] = 0.0862745098039216,
						},
						["bordertexture"] = "Pixel",
					},
					["y"] = 30,
					["barfont"] = "Expressway",
					["title"] = {
						["color"] = {
							["a"] = 1,
							["b"] = 0.0862745098039216,
							["g"] = 0.0862745098039216,
							["r"] = 0.0862745098039216,
						},
						["bordertexture"] = "Pixel",
						["font"] = "Expressway",
						["borderthickness"] = 0,
						["fontflags"] = "OUTLINE",
						["height"] = 20,
						["texture"] = "Skullflower",
					},
					["barfontflags"] = "OUTLINE",
					["barcolor"] = {
						["b"] = 0.305882352941177,
						["g"] = 0.305882352941177,
						["r"] = 0.305882352941177,
					},
					["mode"] = "Damage",
					["x"] = -30,
					["buttons"] = {
						["menu"] = false,
						["mode"] = false,
					},
					["barwidth"] = 252.000045776367,
					["point"] = "BOTTOMRIGHT",
					["barbgcolor"] = {
						["a"] = 1,
						["r"] = 0.301960784313726,
						["g"] = 0.301960784313726,
						["b"] = 0.301960784313726,
					},
					["barfontsize"] = 10,
					["enabletitle"] = false,
					["bartexture"] = "Skullflower",
				}, -- [1]
			},
			["icon"] = {
				["hide"] = true,
			},
			["tooltiprows"] = 5,
			["showranks"] = false,
			["hidedisables"] = false,
			["tooltippos"] = "topleft",
				}
		end
		
		if IsAddOnLoaded('CompactRunes') then
			E:Print(L["A profile for CompactRunes has been created. Press ESC and go to Interface -> AddOn settings to change the profile."])
			CompactRunesDB['profiles']['Skullflower'] = {
			["ooc_alpha"] = 0,
			["enabled"] = {
				["Unholy"] = {
					["Summon Gargoyle"] = true,
					["Plague Leech"] = true,
					["Death and Decay"] = true,
					["Raise Dead"] = false,
					["Sudden Doom"] = false,
					["Dark Succor"] = false,
				},
				["Frost"] = {
					["Pillar of Frost"] = true,
					["Plague Leech"] = true,
					["Freezing Fog"] = false,
					["Killing Machine"] = false,
					["Dark Succor"] = false,
				},
				["Blood"] = {
					["Crimson Scourge"] = false,
					["Plague Leech"] = true,
					["Dark Succor"] = false,
				},
			},
			["profileVersion"] = 2,
			["font_size"] = 11,
			["runeBackgroundAlpha"] = 0.35,
			["dimensions"] = {
				["HORIZONTAL"] = {
					["width"] = 28,
				},
			},
			["runeOrder"] = "UFB",
			["borderInd"] = "Pixel",
			["rangeInd"] = false,
			["border"] = "Pixel",
			["procIcon"] = {
				["scale"] = 1.15,
				["x"] = 4,
				["y"] = -164,
				["userPlaced"] = true,
			},
			["cdbars"] = {
				["Unholy"] = {
					["ordering"] = {
						"Summon Gargoyle", -- [1]
						"Anti-Magic Shell", -- [2]
						"Outbreak", -- [3]
						"Empower Rune Weapon", -- [4]
						"Army of the Dead", -- [5]
						"Death and Decay", -- [6]
						"Gorefiend's Grasp", -- [7]
						"Remorseless Winter", -- [8]
						"Desecrated Ground", -- [9]
						"Defile", -- [10]
						"Breath of Sindragosa", -- [11]
						"Plague Leech", -- [12]
						"Unholy Blight", -- [13]
						"Lichborne", -- [14]
						"Anti-Magic Zone", -- [15]
						"Death's Advance", -- [16]
						"Strangulate", -- [17]
						"Asphyxiate", -- [18]
						"Mind Freeze", -- [19]
						"Icebound Fortitude", -- [20]
						"Death Pact", -- [21]
						"Scabbard of Kyanos", -- [22]
					},
				},
				["Frost"] = {
					["ordering"] = {
						"Pillar of Frost", -- [1]
						"Outbreak", -- [2]
						"Anti-Magic Shell", -- [3]
						"Empower Rune Weapon", -- [4]
						"Army of the Dead", -- [5]
						"Death and Decay", -- [6]
						"Gorefiend's Grasp", -- [7]
						"Remorseless Winter", -- [8]
						"Desecrated Ground", -- [9]
						"Defile", -- [10]
						"Breath of Sindragosa", -- [11]
						"Plague Leech", -- [12]
						"Unholy Blight", -- [13]
						"Lichborne", -- [14]
						"Anti-Magic Zone", -- [15]
						"Death's Advance", -- [16]
						"Strangulate", -- [17]
						"Asphyxiate", -- [18]
						"Mind Freeze", -- [19]
						"Icebound Fortitude", -- [20]
						"Death Pact", -- [21]
						"Scabbard of Kyanos", -- [22]
					},
				},
				["Blood"] = {
					["ordering"] = {
						"Rune Tap", -- [1]
						"Vampiric Blood", -- [2]
						"Anti-Magic Shell", -- [3]
						"Outbreak", -- [4]
						"Dancing Rune Weapon", -- [5]
						"Death Pact", -- [6]
						"Icebound Fortitude", -- [7]
						"Empower Rune Weapon", -- [8]
						"Army of the Dead", -- [9]
						"Death and Decay", -- [10]
						"Gorefiend's Grasp", -- [11]
						"Remorseless Winter", -- [12]
						"Desecrated Ground", -- [13]
						"Defile", -- [14]
						"Breath of Sindragosa", -- [15]
						"Plague Leech", -- [16]
						"Unholy Blight", -- [17]
						"Lichborne", -- [18]
						"Anti-Magic Zone", -- [19]
						"Death's Advance", -- [20]
						"Strangulate", -- [21]
						"Asphyxiate", -- [22]
						"Mind Freeze", -- [23]
						"Pol's Blinded Eye", -- [24]
					},
				},
			},
			["trackDiseases"] = false,
			["texture"] = "Skullflower",
			["frame"] = {
				["y"] = -253,
				["x"] = 4,
			},
			["font_face"] = "Expressway",
			["bars"] = {
				["BloodPlagueBar"] = {
				},
				["NecroticPlagueBar"] = {
				},
				["FrostFeverBar"] = {
				},
				["RunicPowerBar"] = {
					["enabled"] = false,
				},
				["BloodShieldBar"] = {
				},
			},
			["RuneCooldownColors"] = {
				["BLOOD"] = {
					["a"] = 0.35,
					["r"] = 0.764705882352941,
					["g"] = 0.12156862745098,
					["b"] = 0.231372549019608,
				},
				["UNHOLY"] = {
					["a"] = 0.35,
					["r"] = 0.301960784313726,
					["g"] = 0.8,
					["b"] = 0.101960784313725,
				},
				["FROST"] = {
					["a"] = 0.35,
					["g"] = 0.4,
					["b"] = 0.701960784313726,
				},
				["DEATH"] = {
					["a"] = 0.35,
					["r"] = 0.509803921568627,
					["g"] = 0.231372549019608,
					["b"] = 0.650980392156863,
				},
			},
			["RuneColors"] = {
				["UNHOLY"] = {
					["r"] = 0.301960784313726,
					["b"] = 0.101960784313725,
				},
				["BLOOD"] = {
					["r"] = 0.768627450980392,
					["g"] = 0.12156862745098,
					["b"] = 0.231372549019608,
				},
				["FROST"] = {
					["b"] = 0.701960784313726,
				},
				["DEATH"] = {
					["r"] = 0.509803921568627,
					["g"] = 0.231372549019608,
					["b"] = 0.650980392156863,
				},
			},
			["priorityList"] = {
				["Unholy"] = {
					"Raise Dead", -- [1]
					"Summon Gargoyle", -- [2]
					"Soul Reaper", -- [3]
					"Death and Decay", -- [4]
					"Plague Leech", -- [5]
					"Sudden Doom", -- [6]
					"Blood Charge", -- [7]
					"Dark Succor", -- [8]
					"Dark Transformation", -- [9]
					"Blood Charge (10+)", -- [10]
					"Blood Charge (5-9)", -- [11]
					"Breath of Sindragosa", -- [12]
				},
				["Frost"] = {
					"Pillar of Frost", -- [1]
					"Soul Reaper", -- [2]
					"Plague Leech", -- [3]
					"Blood Charge", -- [4]
					"Killing Machine", -- [5]
					"Freezing Fog", -- [6]
					"Dark Succor", -- [7]
					"Blood Charge (10+)", -- [8]
					"Blood Charge (5-9)", -- [9]
					"Breath of Sindragosa", -- [10]
					"Death and Decay", -- [11]
				},
				["Blood"] = {
					"Soul Reaper", -- [1]
					"Plague Leech", -- [2]
					"Crimson Scourge", -- [3]
					"Blood Charge", -- [4]
					"Dark Succor", -- [5]
					"Blood Charge (10+)", -- [6]
					"Blood Charge (5-9)", -- [7]
					"Breath of Sindragosa", -- [8]
					"Death and Decay", -- [9]
				},
			},
		}
		end
		
		if IsAddOnLoaded('xCT+') then
			E:Print(L["A profile for xCT has been created. Type /xct to change the profile."])
			xCTSavedDB['profiles']['Skullflower'] = {
			["frames"] = {
				["general"] = {
					["enabledFrame"] = false,
					["font"] = "Expressway",
					["colors"] = {
						["auras"] = {
							["colors"] = {
								["debuffsGained"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
								["buffsGained"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["buffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["debuffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
						["killingBlow"] = {
							["color"] = {
								0.2, -- [1]
								1, -- [2]
								0.2, -- [3]
							},
						},
						["combat"] = {
							["colors"] = {
								["combatLeaving"] = {
									["color"] = {
										0.1, -- [1]
										1, -- [2]
										0.1, -- [3]
									},
								},
								["combatEntering"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["interrupts"] = {
							["color"] = {
								1, -- [1]
								0.5, -- [2]
								0, -- [3]
							},
						},
						["reputation"] = {
							["colors"] = {
								["reputationGain"] = {
									["color"] = {
										0.1, -- [1]
										0.1, -- [2]
										1, -- [3]
									},
								},
								["reputationLoss"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["lowResources"] = {
							["colors"] = {
								["lowResourcesMana"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
								["lowResourcesHealth"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["honorGains"] = {
							["color"] = {
								0.1, -- [1]
								0.1, -- [2]
								1, -- [3]
							},
						},
						["dispells"] = {
							["colors"] = {
								["dispellBuffs"] = {
									["color"] = {
										0, -- [1]
										1, -- [2]
										0.5, -- [3]
									},
								},
								["dispellStolen"] = {
									["color"] = {
										0.31, -- [1]
										0.71, -- [2]
										1, -- [3]
									},
								},
								["dispellDebuffs"] = {
									["color"] = {
										1, -- [1]
										0, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
					},
					["fontOutline"] = "2OUTLINE",
				},
				["power"] = {
					["fontOutline"] = "2OUTLINE",
					["enabledFrame"] = false,
					["font"] = "Expressway",
				},
				["healing"] = {
					["enableRealmNames"] = false,
					["fontSize"] = 12,
					["showFriendlyHealers"] = false,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 68,
					["Y"] = -18,
					["font"] = "Expressway",
					["colors"] = {
						["healingTakenCritical"] = {
							["color"] = {
								0.1, -- [1]
								1, -- [2]
								0.1, -- [3]
							},
						},
						["healingTaken"] = {
							["color"] = {
								0.1, -- [1]
								0.75, -- [2]
								0.1, -- [3]
							},
						},
						["healingTakenPeriodic"] = {
							["color"] = {
								0.1, -- [1]
								0.5, -- [2]
								0.1, -- [3]
							},
						},
						["shieldTaken"] = {
							["color"] = {
								0.6, -- [1]
								0.65, -- [2]
								1, -- [3]
							},
						},
						["healingTakenPeriodicCritical"] = {
							["color"] = {
								0.1, -- [1]
								0.5, -- [2]
								0.1, -- [3]
							},
						},
					},
					["Height"] = 218,
					["X"] = -109,
				},
				["outgoing"] = {
					["fontSize"] = 12,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 122,
					["Y"] = 29,
					["font"] = "Expressway",
					["colors"] = {
						["genericDamage"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOut"] = {
									["color"] = {
										0.1, -- [1]
										0.75, -- [2]
										0.1, -- [3]
									},
								},
								["shieldOut"] = {
									["color"] = {
										0.6, -- [1]
										0.65, -- [2]
										1, -- [3]
									},
								},
								["healingOutPeriodic"] = {
									["color"] = {
										0.1, -- [1]
										0.5, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["spellSchools"] = {
							["colors"] = {
								["SpellSchool_Nature"] = {
									["color"] = {
										0.3, -- [1]
										1, -- [2]
										0.3, -- [3]
									},
								},
								["SpellSchool_Arcane"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Frost"] = {
									["color"] = {
										0.5, -- [1]
										1, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Physical"] = {
									["color"] = {
										1, -- [1]
										1, -- [2]
										0, -- [3]
									},
								},
								["SpellSchool_Shadow"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Holy"] = {
									["color"] = {
										1, -- [1]
										0.9, -- [2]
										0.5, -- [3]
									},
								},
								["SpellSchool_Fire"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										0, -- [3]
									},
								},
							},
						},
						["misstypesOut"] = {
							["color"] = {
								0.5, -- [1]
								0.5, -- [2]
								0.5, -- [3]
							},
						},
					},
					["Height"] = 317,
					["X"] = 231,
				},
				["critical"] = {
					["fontSize"] = 12,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 96,
					["Y"] = 29,
					["font"] = "Expressway",
					["colors"] = {
						["genericDamageCritical"] = {
							["color"] = {
								1, -- [1]
								1, -- [2]
								0, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOutCritical"] = {
									["color"] = {
										0.1, -- [1]
										1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
					},
					["Height"] = 317,
					["X"] = 150,
				},
				["procs"] = {
					["fontOutline"] = "2OUTLINE",
					["font"] = "Expressway",
					["colors"] = {
						["spellReactive"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["spellProc"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
					},
					["enabledFrame"] = false,
				},
				["loot"] = {
					["enabledFrame"] = false,
					["fontOutline"] = "2OUTLINE",
					["font"] = "Expressway",
				},
				["class"] = {
					["font"] = "Expressway",
					["colors"] = {
						["comboPoints"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["comboPointsMax"] = {
							["color"] = {
								0, -- [1]
								0.82, -- [2]
								1, -- [3]
							},
						},
					},
					["enabledFrame"] = false,
					["fontOutline"] = "2OUTLINE",
				},
				["damage"] = {
					["fontSize"] = 12,
					["insertText"] = "bottom",
					["X"] = -210,
					["Width"] = 131,
					["Y"] = -18,
					["font"] = "Expressway",
					["colors"] = {
						["missTypesTaken"] = {
							["colors"] = {
								["missTypeBlock"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeMiss"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeImmune"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeDodge"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeParry"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeResist"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeEvade"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeAbsorb"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeDeflect"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeReflect"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
						["damageTakenCritical"] = {
							["color"] = {
								1, -- [1]
								0.1, -- [2]
								0.1, -- [3]
							},
						},
						["spellDamageTaken"] = {
							["color"] = {
								0.75, -- [1]
								0.3, -- [2]
								0.85, -- [3]
							},
						},
						["damageTaken"] = {
							["color"] = {
								0.75, -- [1]
								0.1, -- [2]
								0.1, -- [3]
							},
						},
						["spellDamageTakenCritical"] = {
							["color"] = {
								0.75, -- [1]
								0.3, -- [2]
								0.85, -- [3]
							},
						},
					},
					["Height"] = 218,
					["fontOutline"] = "2OUTLINE",
				},
			},
			
			}
		end
		
		if IsAddOnLoaded('DBM-Profiles') then
		E:Print(L["A profile for DBM has been created. Type /dbm and go to options to change the profile."])
			DeadlyBossModsDB['namespaces']['DeadlyBarTimers']['profiles']['Skullflower'] = {
				["DBM"] = {
						["EndColorG"] = 0,
						["HugeTimerY"] = 6.86094474792481,
						["HugeBarXOffset"] = 0,
						["Scale"] = 0.899999976158142,
						["EnlargeBarsPercent"] = 0.125,
						["HugeBarYOffset"] = 0,
						["HugeWidth"] = 200,
						["BarYOffset"] = 0,
						["TimerY"] = 9.27805233001709,
						["StartColorR"] = 1,
						["ExpandUpwards"] = true,
						["TimerPoint"] = "BOTTOM",
						["StartColorG"] = 0.701960784313726,
						["TimerX"] = -228.361145019531,
						["HugeTimerX"] = 270.277557373047,
						["EndColorR"] = 1,
						["Width"] = 183,
						["HugeTimerPoint"] = "BOTTOM",
						["HugeScale"] = 1,
						["FontSize"] = 10,
						["EnlargeBarsTime"] = 8,
						["StartColorB"] = 0,
						["Height"] = 23,
						["BarXOffset"] = 0,
						["EndColorB"] = 0,
					},
			}
			DeadlyBossModsDB['profiles']['Skullflower'] = {
				["SpecialWarningY"] = -33.8888549804688,
			["SpecialWarningFontCol"] = {
				nil, -- [1]
				0.956862745098039, -- [2]
				0.913725490196078, -- [3]
			},
			["WarningColors"] = {
				{
					["r"] = 0.411764705882353,
					["b"] = 0.941176470588235,
				}, -- [1]
				{
					["g"] = 0.949019607843137,
					["r"] = 0.949019607843137,
				}, -- [2]
				{
					["g"] = 0.501960784313726,
				}, -- [3]
				{
					["g"] = 0.101960784313725,
					["b"] = 0.101960784313725,
				}, -- [4]
			},
			["HPFrameY"] = -148.333389282227,
			["HPFrameX"] = 112.500061035156,
			["SpecialWarningFont"] = "InterfaceAddOnsElvUI_SkullflowermediaontsExpressway.ttf",
			["HPFramePoint"] = "LEFT",
			["LastRevision"] = 11873,
			["SpecialWarningX"] = 2.9166247844696,
			["SettingsMessageShown"] = true,
			["BugMessageShown"] = 1,
			["ForumsMessageShown"] = 11873,
		}
		end
			
		if IsAddOnLoaded('MikScrollingBattleText') then
			E:Print(L["A profile for MSBT has been created. Type /mbst to change the profile."])
			InstallStepComplete.message = L["AddOn profiles installed"]
			InstallStepComplete:Show()
			MSBTProfiles_SavedVars['profiles']['Skullflower'] = {
			["animationSpeed"] = 105,
			["abbreviateAbilities"] = true,
			["events"] = {
				["NOTIFICATION_MONEY"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_ITEM_COOLDOWN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_LOOT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_PET_COOLDOWN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_COOLDOWN"] = {
					["disabled"] = true,
				},
			},
			["hideNames"] = true,
			["scrollAreas"] = {
				["Static"] = {
					["direction"] = "Up",
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["critOutlineIndex"] = 2,
					["stickyDirection"] = "Up",
					["disabled"] = true,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Incoming"] = {
					["direction"] = "Up",
					["normalOutlineIndex"] = 2,
					["stickyBehavior"] = "MSBT_NORMAL",
					["offsetX"] = -200,
					["textAlignIndex"] = 1,
					["critFontName"] = "Expressway",
					["critOutlineIndex"] = 2,
					["animationSpeed"] = 110,
					["behavior"] = "MSBT_NORMAL",
					["critFontSize"] = 14,
					["stickyDirection"] = "Up",
					["normalFontSize"] = 12,
					["offsetY"] = -175,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Outgoing"] = {
					["critOutlineIndex"] = 2,
					["direction"] = "Up",
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["stickyBehavior"] = "MSBT_NORMAL",
					["normalFontSize"] = 12,
					["behavior"] = "MSBT_NORMAL",
					["critFontSize"] = 14,
					["stickyDirection"] = "Up",
					["offsetX"] = 200,
					["offsetY"] = -175,
					["textAlignIndex"] = 3,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Notification"] = {
					["stickyDirection"] = "Up",
					["critOutlineIndex"] = 2,
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["disabled"] = true,
					["normalFontName"] = "Expressway",
					["stickyAnimationStyle"] = "Static",
				},
			},
			["hideMergeTrailer"] = true,
			["creationVersion"] = "5.7.138",
		}
		end
	end
end

function E:UpdateTheme1()
	InstallStepComplete.message = L["UI Updated"]
	InstallStepComplete:Show()	
	
	if E.db.unitframe.units.party.debuffs.enable == true then
		E:UpdateTheme2()
		E:Print("|cfffb4f4fSkullflower's UI Update: |cffffffffBuff indicators enabled.")
	end
	
	if E.db.auras.buffs.wrapAfter == 20 then
		E:Print("|cfffb4f4fSkullflower's UI Update: |cffffffffAdjusted width of aura frames, unitframes, totem bar, and cast bar location.")
		E:SetupTheme('SkullflowerUI')
	end
	
	if 	E.db.unitframe.units.player.power.druidMana == true then
		E:Print("|cfffb4f4fSkullflower's UI Update: |cffffffffDisabled druid mana bar while in cat form.")
		E.db.unitframe.units.player.power.druidMana = false
	end
	
	if E.db.auras.buffs.wrapAfter == 15 then
	E:Print("|cfffb4f4fSkullflower's UI Update: |cffffffffNo further updates found.")
	end
	
	if E.db.unitframe.units.boss.enable == false or E.db.unitframe.units.boss.enable == true then
	E:Print("|cfffb4f4fSkullflower's UI Update: |cffffffffBoss frames updated.")
	E:UpdateBossFrames()
	end
	
end

function E:UpdateTheme2()
	E.db.unitframe.units.party.buffIndicator.enable = true
end

function E:UpdateBossFrames()
		E.db.unitframe.units.boss.width = 175
		E.db.unitframe.units.boss.height = 35
		E.db.unitframe.units.boss.health.text_format = "[health:percent]"
		E.db.unitframe.units.boss.health.position = "RIGHT"
		E.db.unitframe.units.boss.power.enable = false
		E.db.unitframe.units.boss.name.text_format = "[name:medium]"
		E.db.unitframe.units.boss.castbar.enable = true
		E.db.unitframe.units.boss.castbar.width = 175
		E.db.unitframe.units.boss.buffs.enable = false
		E.db.unitframe.units.boss.buffs.perrow = 3
		E.db.unitframe.units.boss.buffs.numrows = 1
		E.db.unitframe.units.boss.buffs.anchorPoint = "LEFT"
		E.db.unitframe.units.boss.buffs.fontSize = 22
		E.db.unitframe.units.boss.buffs.xOffset = -3
		E.db.unitframe.units.boss.buffs.yOffset = 0
		E.db.unitframe.units.boss.buffs.sizeOverride = 35
		E.db.unitframe.units.boss.debuffs.enable = true
		E.db.unitframe.units.boss.debuffs.perrow = 3
		E.db.unitframe.units.boss.debuffs.numrows = 1
		E.db.unitframe.units.boss.debuffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.boss.debuffs.fontSize = 22
		E.db.unitframe.units.boss.debuffs.xOffset = 3
		E.db.unitframe.units.boss.debuffs.yOffset = 0
		E.db.unitframe.units.boss.debuffs.sizeOverride = 35
end

local function InstallComplete()
	E.private.install_complete = E.version
	
	ReloadUI()
end
		
local function ResetAll()
	InstallNextButton:Disable()
	InstallPrevButton:Disable()
	InstallOption1Button:Hide()
	InstallOption1Button:SetScript("OnClick", nil)
	InstallOption1Button:SetText("")
	InstallOption2Button:Hide()
	InstallOption2Button:SetScript('OnClick', nil)
	InstallOption2Button:SetText('')
	InstallOption3Button:Hide()
	InstallOption3Button:SetScript('OnClick', nil)
	InstallOption3Button:SetText('')	
	InstallOption4Button:Hide()
	InstallOption4Button:SetScript('OnClick', nil)
	InstallOption4Button:SetText('')
	InstallOption5Button:Hide()
	InstallOption5Button:SetScript('OnClick', nil)
	InstallOption5Button:SetText('')
	InstallOption6Button:Hide()
	InstallOption6Button:SetScript('OnClick', nil)
	InstallOption6Button:SetText('')
	InstallOption7Button:Hide()
	InstallOption7Button:SetScript('OnClick', nil)
	InstallOption7Button:SetText('')
	InstallOption8Button:Hide()
	InstallOption8Button:SetScript('OnClick', nil)
	InstallOption8Button:SetText('')
	InstallOption9Button:Hide()
	InstallOption9Button:SetScript('OnClick', nil)
	InstallOption9Button:SetText('')
	InstallOption10Button:Hide()
	InstallOption10Button:SetScript('OnClick', nil)
	InstallOption10Button:SetText('')
	InstallOption11Button:Hide()
	InstallOption11Button:SetScript('OnClick', nil)
	InstallOption11Button:SetText('')
	InstallOption12Button:Hide()
	InstallOption12Button:SetScript('OnClick', nil)
	InstallOption12Button:SetText('')
	InstallOption13Button:Hide()
	InstallOption13Button:SetScript('OnClick', nil)
	InstallOption13Button:SetText('')
	InstallOption14Button:Hide()
	InstallOption14Button:SetScript('OnClick', nil)
	InstallOption14Button:SetText('')
	InstallOption15Button:Hide()
	InstallOption15Button:SetScript('OnClick', nil)
	InstallOption15Button:SetText('')
	InstallOption16Button:Hide()
	InstallOption16Button:SetScript('OnClick', nil)
	InstallOption16Button:SetText('')

	InstallBtn:Hide()
	InstallBtn:SetScript('OnClick', nil)
	InstallBtn:SetText('')
	FinishBtn:Hide()
	FinishBtn:SetScript('OnClick', nil)
	FinishBtn:SetText('')
	UpdateBtn:Hide()
	UpdateBtn:SetScript('OnClick', nil)
	UpdateBtn:SetText('')
	AddonsBtn:Hide()
	AddonsBtn:SetScript('OnClick', nil)
	AddonsBtn:SetText('')
	ChatBtn:Hide()
	ChatBtn:SetScript('OnClick', nil)
	ChatBtn:SetText('')
	MoveBtn:Hide()
	MoveBtn:SetScript('OnClick', nil)
	MoveBtn:SetText('')
	ElvUIInstallFrame:Size(512, 64)
end

local function SetPage(PageNum)
	CURRENT_PAGE = PageNum
	ResetAll()
	
	local f = ElvUIInstallFrame
	
	if PageNum == 1 then
		InstallPrevButton:Hide()
		InstallPrevButton:Disable()
		InstallNextButton:Enable()
		InstallNextButton:Show()
	elseif PageNum == 2 then
		InstallPrevButton:Show()
		InstallPrevButton:Enable()
		InstallNextButton:Disable()
		InstallNextButton:Hide()
	end

	if PageNum == 1 then
		InstallBtn:Show()
		InstallBtn:SetScript('OnClick', function() E:SetupTheme('SkullflowerUI') end)
		InstallBtn:SetText(L[''])	
		
		UpdateBtn:Show()
		UpdateBtn:SetScript('OnClick', function()  E:UpdateTheme1() end)
		UpdateBtn:SetText(L[''])
		
		AddonsBtn:Show()
		AddonsBtn:SetScript("OnClick", function() E:SetupAddon('Skada') end)
		AddonsBtn:SetText(L[''])
		
		ChatBtn:Show()
		ChatBtn:SetScript("OnClick", SetupChat)
		ChatBtn:SetText(L[''])
		
		MoveBtn:Show()
		MoveBtn:SetScript("OnClick", function() E:ToggleConfigMode() end)
		MoveBtn:SetText(L[''])
		
		FinishBtn:Show()
		FinishBtn:SetText(L[''])
		FinishBtn:SetScript("OnClick", InstallComplete)	
	elseif PageNum == 2 then
		InstallBtn:Show()
		InstallBtn:SetScript('OnClick', function() E:SetupTheme('SkullflowerUI') end)
		InstallBtn:SetText(L[''])	
		
		UpdateBtn:Show()
		UpdateBtn:SetScript('OnClick', function()  E:UpdateTheme1() end)
		UpdateBtn:SetText(L[''])
		
		AddonsBtn:Show()
		AddonsBtn:SetScript("OnClick", function() E:SetupAddon('Skada') end)
		AddonsBtn:SetText(L[''])
		
		ChatBtn:Show()
		ChatBtn:SetScript("OnClick", SetupChat)
		ChatBtn:SetText(L[''])
		
		MoveBtn:Show()
		MoveBtn:SetScript("OnClick", function() E:ToggleConfigMode() end)
		MoveBtn:SetText(L[''])
		
		FinishBtn:Show()
		FinishBtn:SetText(L[''])
		FinishBtn:SetScript("OnClick", InstallComplete)	
		
		InstallOption1Button:Show()
		InstallOption1Button:SetScript('OnClick', function() E:SetupTheme('resetTheme') end)
		InstallOption1Button:SetText(L['|cfffb4f4f>RESET<'])
		
		InstallOption2Button:Show()
		InstallOption2Button:SetScript('OnClick', function() E:SetupTheme('Light') end)
		InstallOption2Button:SetText(L['|cfffb4f4fAlternate Texture'])		
		
		InstallOption3Button:Show()
		InstallOption3Button:SetScript('OnClick', function() E:SetupTheme('altUF') end)
		InstallOption3Button:SetText(L['|cfffb4f4fAlternate Frames'])
		
		InstallOption4Button:Show()
		InstallOption4Button:SetScript('OnClick', function() E:SetupTheme('Default') end)
		InstallOption4Button:SetText(L['|cffffffffDefault Texture'])
		
		InstallOption5Button:Show()
		InstallOption5Button:SetScript('OnClick', function() E:SetupTheme('defUF') end)
		InstallOption5Button:SetText(L['|cffffffffDefault Frames'])
		
		InstallOption6Button:Show()
		InstallOption6Button:SetScript('OnClick', function() E:SetupTheme('healF') end)
		InstallOption6Button:SetText(L['|cff4ffb7cHealer Frames'])
		
		InstallOption7Button:Show()
		InstallOption7Button:SetScript('OnClick', function() E:SetupTheme('bossF') end)
		InstallOption7Button:SetText(L['|cff4ffb7cBoss Frames'])
		
		InstallOption8Button:Show()
		InstallOption8Button:SetScript('OnClick', function() E:SetupTheme('unitT') end)
		InstallOption8Button:SetText(L['|cff6cc0e5Unitframe Texts'])
		
		InstallOption9Button:Show()
		InstallOption9Button:SetScript('OnClick', function() E:SetupTheme('dataT') end)
		InstallOption9Button:SetText(L['|cff6cc0e5Data Texts'])
		
		InstallOption10Button:Show()
		InstallOption10Button:SetScript('OnClick', function() E:SetupTheme('gDT') end)
		InstallOption10Button:SetText(L['|cff6cc0e5Garrison Datatext'])
		
		InstallOption11Button:Show()
		InstallOption11Button:SetScript('OnClick', function() E:SetupTheme('chatB') end)
		InstallOption11Button:SetText(L['|cff6cc0e5Chat Background'])
		
		InstallOption12Button:Show()
		InstallOption12Button:SetScript('OnClick', function() E:SetupTheme('cBuffs') end)
		InstallOption12Button:SetText(L['|cfffbc93dConsolidated Buffs'])
		
		InstallOption13Button:Show()
		InstallOption13Button:SetScript('OnClick', function() E:SetupTheme('sqAB') end)
		InstallOption13Button:SetText(L['|cfffbc93dSquare ActionBar'])
		 
		InstallOption14Button:Show()
		InstallOption14Button:SetScript('OnClick', function() E:SetupTheme('unhideB') end)
		InstallOption14Button:SetText(L['|cfffbc93dUnhide Actionbars'])
		
		InstallOption15Button:Show()
		InstallOption15Button:SetScript('OnClick', function() E:SetupTheme('eAB') end)
		InstallOption15Button:SetText(L['|cfffbc93dAura bars'])
		
		InstallOption16Button:Show()
		InstallOption16Button:SetScript('OnClick', function() E:SetupTheme('cInd') end)
		InstallOption16Button:SetText(L['|cfffbc93dCombat Indicator'])
		

	end
end

local function NextPage()	
	if CURRENT_PAGE ~= MAX_PAGE then
		CURRENT_PAGE = CURRENT_PAGE + 1
		SetPage(CURRENT_PAGE)
	end
end

local function PreviousPage()
	if CURRENT_PAGE ~= 1 then
		CURRENT_PAGE = CURRENT_PAGE - 1
		SetPage(CURRENT_PAGE)
	end
end

--Install UI
function E:Install()	
	if not InstallStepComplete then
		local imsg = CreateFrame("Frame", "InstallStepComplete", E.UIParent)
		imsg:Size(206, 150)
		imsg:Point("TOP", 0, -190)
		imsg:Hide()
		imsg:SetScript('OnShow', function(self)
			if self.message then 
				self.text:SetText(self.message)
				UIFrameFadeOut(self, 3.5, 1, 0)
				E:Delay(4, function() self:Hide() end)	
				self.message = nil

				if imsg.firstShow == false then			
					imsg.firstShow = true
				end
			else
				self:Hide()
			end
		end)

		imsg.firstShow = false

		imsg.bg = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.bg:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.bg:SetPoint('BOTTOM')
		imsg.bg:Size(206, 150)
		imsg.bg:SetTexCoord(0.00195313, 0.63867188, 0.03710938, 0.23828125)
		imsg.bg:SetVertexColor(1, 1, 1, 0.6)


		imsg.lineBottom = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.lineBottom:SetDrawLayer('BACKGROUND', 2)
		imsg.lineBottom:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.lineBottom:SetPoint("BOTTOM")
		imsg.lineBottom:Size(206, 150)
		imsg.lineBottom:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

		imsg.text = imsg:CreateFontString(nil, 'ARTWORK', 'GameFont_Gigantic')
		imsg.text:Point("BOTTOM", 0, 12)
		imsg.text:SetTextColor(1, 0.82, 0)
		imsg.text:SetJustifyH("CENTER")
		
	end

	--Create Frame
	if not ElvUIInstallFrame then
		local f = CreateFrame("Button", "ElvUIInstallFrame", E.UIParent)
		f.SetPage = SetPage
		f:Size(206, 150)
		f:SetTemplate("Transparent")
		f:SetPoint("TOP")
		
		f.InstallBtn = CreateFrame("Button", "InstallBtn", f, "UIPanelButtonTemplate")
		f.InstallBtn:StripTextures()
		f.InstallBtn:SetFrameStrata('MEDIUM')
		f.InstallBtn:Size(64, 64)
		f.InstallBtn:Point("LEFT", 0, 0)
		f.InstallBtn:SetText("")
		f.InstallBtn:SetAlpha(0.1)
		E.Skins:HandleButton(f.InstallBtn, true)
		
		f.UpdateBtn = CreateFrame("Button", "UpdateBtn", f, "UIPanelButtonTemplate")
		f.UpdateBtn:StripTextures()
		f.UpdateBtn:SetFrameStrata('MEDIUM')
		f.UpdateBtn:Size(64, 64)
		f.UpdateBtn:Point('RIGHT', f.InstallBtn, 64, 0)
		f.UpdateBtn:SetText("")
		f.UpdateBtn:SetAlpha(.1)
		E.Skins:HandleButton(f.UpdateBtn, true)
		
		f.Next = CreateFrame("Button", "InstallNextButton", f, "UIPanelButtonTemplate")
		f.Next:StripTextures()
		f.Next:SetTemplate("Default", true)
		f.Next:SetAlpha(.1)
		f.Next:Size(64, 64)
		f.Next:Point('RIGHT', f.UpdateBtn, 64, 0)
		f.Next:Disable()
		f.Next:SetScript("OnClick", NextPage)
		E.Skins:HandleButton(f.Next, true)
		
		f.Prev = CreateFrame("Button", "InstallPrevButton", f, "UIPanelButtonTemplate")
		f.Prev:StripTextures()
		f.Prev:SetTemplate("Default", true)
		f.Prev:SetAlpha(.1)
		f.Prev:Size(64, 64)
		f.Prev:Point('RIGHT', f.UpdateBtn, 64, 0)
		f.Prev:Disable()
		f.Prev:SetScript("OnClick", PreviousPage)
		E.Skins:HandleButton(f.Prev, true)
		
		f.MoveBtn = CreateFrame("Button", "MoveBtn", f, "UIPanelButtonTemplate")
		f.MoveBtn:StripTextures()
		f.MoveBtn:SetFrameStrata('MEDIUM')
		f.MoveBtn:Size(64, 64)
		f.MoveBtn:Point('RIGHT', f.Next, 64, 0)
		f.MoveBtn:SetText("")
		f.MoveBtn:SetAlpha(.1)
		E.Skins:HandleButton(f.MoveBtn, true)
		
		f.AddonsBtn = CreateFrame("Button", "AddonsBtn", f, "UIPanelButtonTemplate")
		f.AddonsBtn:StripTextures()
		f.AddonsBtn:SetFrameStrata('MEDIUM')
		f.AddonsBtn:Size(64, 64)
		f.AddonsBtn:Point('RIGHT', f.MoveBtn, 64, 0)
		f.AddonsBtn:SetText("")
		f.AddonsBtn:SetAlpha(.1)
		E.Skins:HandleButton(f.AddonsBtn, true)
		
		f.ChatBtn = CreateFrame("Button", "ChatBtn", f, "UIPanelButtonTemplate")
		f.ChatBtn:StripTextures()
		f.ChatBtn:SetFrameStrata('MEDIUM')
		f.ChatBtn:Size(64, 64)
		f.ChatBtn:Point('RIGHT', f.AddonsBtn, 64, 0)
		f.ChatBtn:SetText("")
		f.ChatBtn:SetAlpha(.1)
		E.Skins:HandleButton(f.ChatBtn, true)
		
		f.FinishBtn = CreateFrame("Button", "FinishBtn", f, "UIPanelButtonTemplate")
		f.FinishBtn:StripTextures()
		f.FinishBtn:SetFrameStrata('MEDIUM')
		f.FinishBtn:Size(64, 64)
		f.FinishBtn:Point('RIGHT', f.ChatBtn, 64, 0)
		f.FinishBtn:SetText("")
		f.FinishBtn:SetAlpha(.1)
		E.Skins:HandleButton(f.FinishBtn, true)
		
		local close = CreateFrame("Button", "InstallCloseButton", f, "UIPanelButtonTemplate")
		close:StripTextures()
		close:Point('RIGHT', f.FinishBtn, 64, 0)
		close:Size(64, 64)
		close:SetAlpha(0.1)
		close:SetScript("OnClick", function()
			f:Hide()
		end)
		E.Skins:HandleButton(close)
		
		
		f.Option1 = CreateFrame("Button", "InstallOption1Button", f, "UIPanelButtonTemplate")
		f.Option1:StripTextures()
		f.Option1:Size(100, 25)
		f.Option1:SetAlpha(0.9)
		f.Option1:Point('TOP', f.Prev, 'BOTTOM', 3, -3)
		f.Option1:SetText("")
		f.Option1:Hide()
		E.Skins:HandleButton(f.Option1, true)
		
		f.Option2 = CreateFrame("Button", "InstallOption2Button", f, "UIPanelButtonTemplate")
		f.Option2:StripTextures()
		f.Option2:Size(100, 25)
		f.Option2:SetAlpha(0.9)
		f.Option2:Point('TOP', f.Option1, 'BOTTOM', 0, -1)
		f.Option2:SetText("")
		f.Option2:Hide()
		E.Skins:HandleButton(f.Option2, true)		
		
		f.Option3 = CreateFrame("Button", "InstallOption3Button", f, "UIPanelButtonTemplate")
		f.Option3:StripTextures()
		f.Option3:Size(100, 25)
		f.Option3:SetAlpha(0.9)
		f.Option3:Point('TOP', f.Option2, 'BOTTOM', 0, -1)
		f.Option3:SetText("")
		f.Option3:Hide()
		E.Skins:HandleButton(f.Option3, true)	
		
		f.Option4 = CreateFrame("Button", "InstallOption4Button", f, "UIPanelButtonTemplate")
		f.Option4:StripTextures()
		f.Option4:Size(100, 25)
		f.Option4:SetAlpha(0.9)
		f.Option4:Point('TOP', f.Option3, 'BOTTOM', 0, -1)
		f.Option4:SetText("")
		E.Skins:HandleButton(f.Option4, true)
		
		f.Option5 = CreateFrame("Button", "InstallOption5Button", f, "UIPanelButtonTemplate")
		f.Option5:StripTextures()
		f.Option5:Size(100, 25)
		f.Option5:SetAlpha(0.9)
		f.Option5:Point('TOP', f.Option4, 'BOTTOM', 0, -1)
		f.Option5:SetText("")
		E.Skins:HandleButton(f.Option5, true)
		
		f.Option6 = CreateFrame("Button", "InstallOption6Button", f, "UIPanelButtonTemplate")
		f.Option6:StripTextures()
		f.Option6:Size(100, 25)
		f.Option6:SetAlpha(0.9)
		f.Option6:Point('TOP', f.Option5, 'BOTTOM', 0, -1)
		f.Option6:SetText("")
		E.Skins:HandleButton(f.Option6, true)
		
		f.Option7 = CreateFrame("Button", "InstallOption7Button", f, "UIPanelButtonTemplate")
		f.Option7:StripTextures()
		f.Option7:Size(100, 25)
		f.Option7:SetAlpha(0.9)
		f.Option7:Point('TOP', f.Option6, 'BOTTOM', 0, -1)
		f.Option7:SetText("")
		E.Skins:HandleButton(f.Option7, true)
		
		f.Option8 = CreateFrame("Button", "InstallOption8Button", f, "UIPanelButtonTemplate")
		f.Option8:StripTextures()
		f.Option8:Size(100, 25)
		f.Option8:SetAlpha(0.9)
		f.Option8:Point('TOP', f.Option7, 'BOTTOM', 0, -1)
		f.Option8:SetText("")
		E.Skins:HandleButton(f.Option8, true)
		
		f.Option9 = CreateFrame("Button", "InstallOption9Button", f, "UIPanelButtonTemplate")
		f.Option9:StripTextures()
		f.Option9:Size(100, 25)
		f.Option9:SetAlpha(0.9)
		f.Option9:Point('TOP', f.Option8, 'BOTTOM', 0, -1)
		f.Option9:SetText("")
		E.Skins:HandleButton(f.Option9, true)
		
		f.Option10 = CreateFrame("Button", "InstallOption10Button", f, "UIPanelButtonTemplate")
		f.Option10:StripTextures()
		f.Option10:Size(100, 25)
		f.Option10:SetAlpha(0.9)
		f.Option10:Point('TOP', f.Option9, 'BOTTOM', 0, -1)
		f.Option10:SetText("")
		E.Skins:HandleButton(f.Option10, true)
		
		f.Option11 = CreateFrame("Button", "InstallOption11Button", f, "UIPanelButtonTemplate")
		f.Option11:StripTextures()
		f.Option11:Size(100, 25)
		f.Option11:SetAlpha(0.9)
		f.Option11:Point('TOP', f.Option10, 'BOTTOM', 0, -1)
		f.Option11:SetText("")
		E.Skins:HandleButton(f.Option11, true)

		f.Option12 = CreateFrame("Button", "InstallOption12Button", f, "UIPanelButtonTemplate")
		f.Option12:StripTextures()
		f.Option12:Size(100, 25)
		f.Option12:SetAlpha(0.9)
		f.Option12:Point('TOP', f.Option11, 'BOTTOM', 0, -1)
		f.Option12:SetText("")
		E.Skins:HandleButton(f.Option12, true)
		
		f.Option13 = CreateFrame("Button", "InstallOption13Button", f, "UIPanelButtonTemplate")
		f.Option13:StripTextures()
		f.Option13:Size(100, 25)
		f.Option13:SetAlpha(0.9)
		f.Option13:Point('TOP', f.Option12, 'BOTTOM', 0, -1)
		f.Option13:SetText("")
		E.Skins:HandleButton(f.Option13, true)
		
		f.Option14 = CreateFrame("Button", "InstallOption14Button", f, "UIPanelButtonTemplate")
		f.Option14:StripTextures()
		f.Option14:Size(100, 25)
		f.Option14:SetAlpha(0.9)
		f.Option14:Point('TOP', f.Option13, 'BOTTOM', 0, -1)
		f.Option14:SetText("")
		E.Skins:HandleButton(f.Option14, true)
		
		f.Option15 = CreateFrame("Button", "InstallOption15Button", f, "UIPanelButtonTemplate")
		f.Option15:StripTextures()
		f.Option15:Size(100, 25)
		f.Option15:SetAlpha(0.9)
		f.Option15:Point('TOP', f.Option14, 'BOTTOM', 0, -1)
		f.Option15:SetText("")
		E.Skins:HandleButton(f.Option15, true)
		
		f.Option16 = CreateFrame("Button", "InstallOption16Button", f, "UIPanelButtonTemplate")
		f.Option16:StripTextures()
		f.Option16:Size(100, 25)
		f.Option16:SetAlpha(0.9)
		f.Option16:Point('TOP', f.Option15, 'BOTTOM', 0, -1)
		f.Option16:SetText("")
		E.Skins:HandleButton(f.Option16, true)

		
		f.Logo = f:CreateTexture('Logo', 'BOTTOM')
		f.Logo:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\SkullflowerUI.tga')
		f.Logo:Point('BOTTOM', "ElvUIInstallFrame", 0, -125)
		
		f.InstallBtn = f:CreateTexture('InstallButton')
		f.InstallBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\install.tga')
		f.InstallBtn:Point('LEFT', "ElvUIInstallFrame", 0, 0)
		
		f.UpdateBtn = f:CreateTexture('UpdateButton')
		f.UpdateBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\update.tga')
		f.UpdateBtn:Point('RIGHT', f.InstallBtn, 64, 0)
		
		f.CustomBtn = f:CreateTexture('CustomButton')
		f.CustomBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\customize.tga')
		f.CustomBtn:Point('RIGHT', f.UpdateBtn, 64, 0)
		
		f.MoveBtn = f:CreateTexture('MoveButton')
		f.MoveBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\move.tga')
		f.MoveBtn:Point('RIGHT', f.CustomBtn, 64, 0)
		
		f.AddonsBtn = f:CreateTexture('AddonsButton')
		f.AddonsBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\addons.tga')
		f.AddonsBtn:Point('RIGHT', f.MoveBtn, 64, 0)
		
		f.ChatBtn = f:CreateTexture('ChatButton')
		f.ChatBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\chat.tga')
		f.ChatBtn:Point('RIGHT', f.AddonsBtn, 64, 0)
		
		f.FinishBtn = f:CreateTexture('FinishButton')
		f.FinishBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\finish.tga')
		f.FinishBtn:Point('RIGHT', f.ChatBtn, 64, 0)
		
		f.CloseBtn = f:CreateTexture('CloseButton')
		f.CloseBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\close.tga')
		f.CloseBtn:Point('RIGHT', f.FinishBtn, 64, 0)

	end
	
	ElvUIInstallFrame:Show()
	NextPage()
end