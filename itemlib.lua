-- item lib

item = {}
item_meta = {
   __index = item,
   __call = function()
      local cnt = UO.ScanItems(false)
      local a = {}
      
      for i = 1,cnt do
	 local nID,nType,nKind,nContID,nX,nY,nZ,nStack,nRep,nCol = UO.GetItem(i-1)
	 table.insert(a,{
			 id = nID,
			 tp = nType,
			 kind = nKind,
			 cont = nContID,
			 x = nX,
			 y = nY,
			 z = nZ,
			 stack = nStack,
			 rep = nRep,
			 col = nCol,
			 name = false,
			 stats = false
			})
      end
      
      setmetatable(a,item_meta)
      return a
   end,
   __sub = function(a,b)
      local c = {}
      local dual = false
      
      for i = 1,#a do
	 dual = false
	 for i = 1,#b do
	    if a[i].id == b[j].id then
	       dual = true
	    end
	 end
	 if not dual then
	    table.insert(c,a[i])
	 end
      end
      
      setmetatable(c,item_meta)
      return c
   end
}


setmetatable(item,item_meta)

function item:id(ids)
   local a = {}
   
   if type(ids) ~= "table" then ids = {ids} end
   
   if not ids then
      for i = 1,#self do
	 table.insert(a,self[i].id)
      end
      return a
   end
   
   for i = 1,#ids do
      for j = 1,#self do
	 if ids[i] == self[j].id then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:tp(tps)
   local a = {}
   
   if type(tps) ~= "table" then tps = {tps} end
   
   if not tps then
      for i = 1,#self do
	 table.insert(a,self[i].tp)
      end
      return a
   end
   
   for i = 1,#tps do
      for j = 1,#self do
	 if tps[i] == self[j].tp then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:kind(kinds)
   local a = {}
   
   if type(kinds) ~= "table" then kinds = {kinds} end
   
   if not kinds then
      for i = 1,#self do
	 table.insert(a,self[i].kind)
      end
      return a
   end
   
   for i = 1,#kinds do
      for j = 1,#self do
	 if kinds[i] == self[j].kind then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:cont(conts)
   local a = {}
   
   if type(conts) ~= "table" then conts = {conts} end
   
   if not conts then
      for i = 1,#self do
	 table.insert(a,self[i].cont)
      end
      return a
   end
   
   for i = 1,#conts do
      for j = 1,#self do
	 if conts[i] == self[j].cont then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:rep(reps)
   local a = {}
   
   if type(reps) ~= "table" then reps = {reps} end
   
   if not reps then
      for i = 1,#self do
	 table.insert(a,self[i].rep)
      end
      return a
   end
   
   for i = 1,#reps do
      for j = 1,#self do
	 if reps[i] == self[j].rep then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end


function item:col(cols)
   local a = {}
   
   if type(cols) ~= "table" then cols = {cols} end
   
   if not cols then
      for i = 1,#self do
	 table.insert(a,self[i].col)
      end
      return a
   end
   
   for i = 1,#cols do
      for j = 1,#self do
	 if cols[i] == self[j].col then
	    table.insert(a,self[j])
	 end
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:name(names)
   local a = {}
   
   if type(names) ~= "table" then names = {names} end
   
   if not names then
      for i = 1,#self do
	 if not self[i].name then
	    local n,s = UO.Property(self[i].id)
	    self[i].name = n
	    self[i].stats = s
	 end
	 table.insert(a,self[i].name)
      end
      return a
   end
   
   for i = 1,#names do
      for j = 1,#self do
	 if not self[j].name then
	    local n,s = UO.Property(self[j].id)
	    self[j].name = n
	    self[j].stats = s
	 end
	 
	 if self[j].name:match(names[i]) then
	    table.insert(a,self[j])
	 end
	 
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:stats(statss)
   local a = {}
   
   if type(statss) ~= "table" then statss = {statss} end
   
   if not statss then
      for i = 1,#self do
	 if not self[i].stats then
	    local n,s = UO.Property(self[i].id)
	    self[i].name = n
	    self[i].stats = s
	 end
	 table.insert(a,self[i].stats)
      end
      return a
   end
   
   for i = 1,#stats do
      for j = 1,#self do
	 if not self[j].stats then
	    local n,s = UO.Property(self[j].id)
	    self[j].name = n
	    self[j].stats = s
	 end
	 
	 if self[j].stats:match(statss[i]) then
	    table.insert(a,self[j])
	 end
	 
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:backpack()
   local a = {}
   local bp = UO.BackpackID
   
   for j = 1,#self do
      if self[j].cont == bp then
	 table.insert(a,self[j])
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:ground(nrange)
   local a = {}
   local cx = UO.CharPosX
   local cy = UO.CharPosY
   
   for i = 1,#self do
      if (dist(self[i].x,self[i].y,cx,cy) <= nrange) and (self[i].cont == 0) then
	 table.insert(a,self[i])
      end
   end
   
   setmetatable(a,item_meta)
   return a
end

function item:nearest()
   local a = {}
   local ind = -1
   local d = 1000
   local cx = UO.CharPosX
   local cy = UO.CharPosY
   
   for i = 1,#self do
      if dist(self[i].x,self[i].y,cx,cy) < d then
	 d = dist(self[i].x,self[i].y,cx,cy)
	 ind = i
      end
   end
   
   table.insert(a,self[ind])
   
   setmetatable(a,item_meta)
   return a
end

function item:pop(n)
   if n > #self then n = 1 end
   local a = self[n]
   
   if #self == 0 then a = {} end
   
   setmetatable(a,item_meta)
   return a
end

function item:iter()
   local i = 0
   local l = #self
   
   return function()
      i = i + 1
      if i <= l then 
	 local a = {self[i]}
	 setmetatable(a,item_meta)
	 return a
      end
	  end
end
