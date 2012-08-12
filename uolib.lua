-- uo lib

function use(t)
   local loid = UO.LObjectID
   
   UO.LObjectID = unpack(t:id())
   UO.Macro(17,0)
   
   UO.LObjectID = loid
   wait(750)
end

function drag(t,nstack)
   local nid = unpack(t:id())
   local nstack = nstack or unpack(t:stack())
   
   UO.Drag(nid,nstack)
end

function dropc(t,nx,ny)
   local nid = unpack(t:id())
   
   if nx and ny then
      UO.DropC(nid,nx,ny)
   else
      UO.DropC(nid)
   end
   wait(750)
end

function dropg(nx,ny)
   UO.DropG(nx,ny)
   wait(750)
end

function equip(t)
   if type(t) == "table" then
      UO.Equip(unpack(t))
   else
      UO.Equp(t)
   end
end

function target(t,timeout)
   local start = getticks()

   while not UO.TargCurs do
      if (getticks() - start) > timeout then return false end
   end
   
   local ltid = UO.LTargetID
   local ltkind = UO.LTargetKind

   UO.LTargetID = unpack(it:id())
   UO.LTargetKind = unpack(it:kind())

   UO.Macro(22,0)

   UO.LTargetID = ltid
   UO.LTargetKind = ltkind
   return true
end

function say(str)
   UO.Macro(1,0,str)
end

function exmsg(nid,str)
   UO.ExMsg(nid,3,0,str)
end

function sysmsg(str)
   UO.SysMessage(str,0)
end

function key(str)
   UO.Key(str)
end

function use(it)
   local loid = UO.LObjectID

   UO.LObjectID = unpack(it:id())

   UO.Macro(17,0)

   UO.LObjectID = loid
   return
end

function pathfind(x,y)
   UO.Pathfind(x,y)
end

function click(x,y)
   UO.Click(x,y,true,true,true,false)
end

function rclick(x,y)
   UO.Click(x,y,false,true,true,false)
end

function popup(nid)
   UO.Popup(nid)
end

function renamepet(nid,str)
   UO.RenamePet(nid,str)
end

function waitgumpid(n,timeout)
   local start = getticks()
   while not (UO.ContID == n) do
      if (getticks() - start) > timeout then return false end
   end
   wait(200)
   return true
end

function waitgumpsize(x,y,timeout)
   local start = getticks()
   while not (UO.ContSizeX == x and UO.ContSizeY == y) do
      if (getticks() - start) > timeout then return false end
   end
   wait(200)
   return true
end

function getpix(x,y)
   return UO.GetPix(x,y)
end