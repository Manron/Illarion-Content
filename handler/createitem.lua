require("base.class")

module("handler.createitem", package.seeall)

-- Last Updated: April 08 2012
-- By: Faladron
-- Added: wear, if wear ~= nil then the wear of the created item is altered!
-- If it's nil, default wear will be assigned

createItem = base.class.class(function(creitem, posi, ID, qual, amnt, wear)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
	creitem.wear=wear;
end);

function createItem:execute()
    itemCr = world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,0);
	if wear ~= nil then		
			itemCr.wear=wear;
			world:changeItem(itemCr)
	end
end
