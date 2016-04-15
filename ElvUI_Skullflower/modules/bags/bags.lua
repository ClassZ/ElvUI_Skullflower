local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local B = E:GetModule('Bags');

function B:PositionBagFrames()
	if self.BagFrame then
		self.BagFrame:ClearAllPoints()
		if E.db.datatexts.rightChatPanel then
			self.BagFrame:SetPoint('BOTTOMRIGHT', -30, 30);
		else
			self.BagFrame:SetPoint('BOTTOMRIGHT', -30, 30);
		end
	end
	
	if self.BankFrame then
		self.BankFrame:ClearAllPoints()
		if E.db.datatexts.leftChatPanel then
			self.BankFrame:SetPoint('CENTER');
		else
			self.BankFrame:SetPoint('CENTER');
		end		
	end
end