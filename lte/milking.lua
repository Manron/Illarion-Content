--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- Long Time Effect Script: Milking cow and sheep
-- Effect ID: 401


require("base.common");
module("lte.milking", package.seeall)

function addEffect(milkingEffect, Animal)

end

function callEffect(milkingEffect, Animal)

	local foundAmount, gatherAmount = milkingEffect:findValue("gatherAmount");
	if (not foundAmount) then
		return false;
	end
	if (gatherAmount <= 0) then
		return false;
	end

	milkingEffect:addValue("gatherAmount", gatherAmount - 1);
	milkingEffect.nextCalled = 3000; -- call every 5min
	return true;
end
