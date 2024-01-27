
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- gmcphelper.lua
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--[[

Mods: Ruthgul, for Materia Magica (changes marked as '-- MM fix')

2014-11-09
* Fixed the fieldname regex in get_last_tag()

2014-10-23
* Fixed the fieldname regex (Aardwolf's can only contain letters,
                             in MM it can include numbers, - and _ )
* Replaced several assert()s with ifs, to fail silently when needed


Based on Aardwolf's gmcphelper.lua
Author: Lasher
2010-09-08 15:50:41

--]]


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Below here are the functions that could (probably should) be in a stand-alone gmcphelper.lua
-- module and included as necesssary. I duplicate them in plugin so that each GMCP plugins is
-- as standalone as possible.
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

------------------------------------------------------------------------------------------------
-- FUNCTION:: get_gmcp
--   Reverse of parse_gmcp - takes a value like "room.info.exits.n" and checks each level for
--   the next table and then for the actual value.
------------------------------------------------------------------------------------------------

function get_gmcp(fieldname, parent) 
-- MM fix: changed these to fail silently, or show debug msgs if applicable
--  assert (fieldname, "nil fieldname passed to get_gmcp")
--  assert (parent, "nil parent passed to get_gmcp")
--  assert (type (parent) == "table", "non-table parent value passed to get_gmcp")

  if (fieldname)
  and (parent)
  and (type(parent) == "table") then
    local lastval = get_last_tag(fieldname)
    
--    for item in string.gmatch(fieldname, "%a+") do
    for item in string.gmatch(fieldname, "[%a%d%-%_]+") do   -- MM fix: changed the regex
      if parent[item] ~= nil then

        if item == lastval then
          return parent[item]
        end

        if type(parent[item])  == "table" then
          parent = parent[item]
        else
          return parent[item]
        end
      
      else
        return "" -- if we asked for something valid, shouldn't get this.
      end
    end -- for item
  
  else
    if ((GMCPDebug or 0) > 0) then
      if (not fieldname) then
        Note("-- gmcphelper: nil fieldname passed to get_gmcp() --")
      end
      if (not parent) then
        Note("-- gmcphelper: nil parent passed to get_gmcp --")
      end
      if (type (parent) ~= "table") then
        Note("-- gmcphelper: non-table parent value passed to get_gmcp() --")
      end
    end
  end

  return "" -- shouldn't reach here either if we asked for something valid.
end -- function get_gmcp


------------------------------------------------------------------------------------------------
-- FUNCTION:: get_last_tag
--   Parses inbound string to pull the last of "char.vitals.str" or "room". First is "str", 
--   second is just "room". Used to check if we're at the last level when accessing gmcpdata
--   by a keyword.
------------------------------------------------------------------------------------------------

function get_last_tag(instr) 
  return string.match(instr, "^.*%.([%a%d%-%_]+)$") or instr
end -- get_last_tag


------------------------------------------------------------------------------------------------
-- FUNCTION:: gmcpval
--   Return an item from the table. Just a wrapper to serialize a table or return a uniqie
--   value that won't error if a value that doesn't exist is requested.
------------------------------------------------------------------------------------------------

function gmcpval(fieldname) 
  return gmcpsection(fieldname, true)
end


------------------------------------------------------------------------------------------------
-- FUNCTION:: gmcpitem
--   Version of gmcpval that should never return a table. Considered an error if it does.
------------------------------------------------------------------------------------------------

function gmcpitem(fieldname) 
  return gmcpsection(fieldname, false)
end


------------------------------------------------------------------------------------------------
-- FUNCTION:: gmcpsection
--   Return an item from the table, may be either a nested table serialized or a single
--   item - depends on the flag. Called by gmcpval (table ok) and gmcpitem (not ok).
------------------------------------------------------------------------------------------------

function gmcpsection(fieldname, nesting) 
  local outval = get_gmcp(fieldname, gmcpdata)
  
  if (type(outval) == "table") then 
-- MM fix: changed this to fail silently, or show a debug msg if applicable
--    assert(nesting, "nested table value requested from GMCP. Should be single element.")
    
    if (nesting) then
      return serialize.save_simple(outval) 
    
    else
      if ((GMCPDebug or 0) > 0) then
        if (not nesting) then
          Note("-- gmcphelper - gmcpsection(): nested table value requested from GMCP. Should be single element. --")
        end
      end
    end
  end

  if type (outval) == "string" then
    return outval 
  else
    return tostring (outval)
  end
end

function RequestData() 
  Send_GMCP_Packet("request char")
end


------------------------------------------------------------------------------------------------
-- Helper function to send GMCP data.
------------------------------------------------------------------------------------------------

local IAC, SB, SE, DO = 0xFF, 0xFA, 0xF0, 0xFD
local GMCP      = 201

function Send_GMCP_Packet (what)
-- MM fix: changed this to fail silently, or show a debug msg if applicable
--  assert (what, "Send_GMCP_Packet passed a nil message.")
  
  if (what) then
    SendPkt (string.char (IAC, SB, GMCP) .. 
            (string.gsub (what, "\255", "\255\255")) ..  -- IAC becomes IAC IAC
             string.char (IAC, SE))
  
  else
    if ((GMCPDebug or 0) > 0) then
      if (not what) then
        Note("-- gmcphelper: Send_GMCP_Packet() passed a nil message. --")
      end
    end
  end
end -- Send_GMCP_Packet
