--[[
        last edited: 1 year ago(more or less)
        Current Ver: 1.1.5
        1.0.1: Fixed a syntax error.
        1.1.1:Major release. Added 12 functions
        1.1.2:minor release 1 function added
        1.1.3:minor release 5 functions added
        1.1.4:minor release fixed function errors
        1.1.5:minor release 1 function added
        Released 1.0.0 at: 10:36 pm 5/5/2023
        Only a config thingy
        Incoming(maybe) functions:
        lib.Destroy(Added!)
        lib.GetValue
]]
function isfile(file)
    local file = readfile(file)
    if file then
        return true
    else
        return false
    end
end
local you = game.Players.LocalPlayer
local w = "w"
local p = "p"
local e = "err"
local lib = {}
local saves = {}
local Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Config-Library/main/Main.lua"))()
if gui then
    gui:Destroy()
end
local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.Text = "Hello! " .. you.DisplayName .. "/" .. you.Name
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(1, -220, 0, 20)
label.AnchorPoint = Vector2.new(1, 0)
label.Parent = gui

local label1 = Instance.new("TextLabel")
label1.Text = "Place id:" .. game.PlaceId
label1.TextColor3 = Color3.new(1, 1, 1)
label1.BackgroundTransparency = 1
label1.Size = UDim2.new(0, 200, 0, 50)
label1.Position = UDim2.new(1, -220, 0, -20)
label1.AnchorPoint = Vector2.new(1, 0)
label1.Parent = gui

function m(msg, type)
    if type == "w" then
        warn(msg)
    elseif type == "p" then
        print(msg)
    elseif type == "err" then
        error(msg)
    end
end

lib.LoadUrl=function(url)
    loadstring(game:HttpGet(url))()
end

lib.Destroy=function()
 if lib then
  lib=nil
  m("successfully destroyed " .. lib, p)
 end
end

lib.Credits=function()
    if _G.msg then
        print("Your the owner dummy")
    else
        print("idkuser#0979 made the entire script!\nAll alone by himself\nHope you have a good day!")
    end
end

lib.Delete=function(r, todel)
 if r then
  if todel then
   r:FindFirstChild(todel):Destroy()
   m("successfully deleted " .. tostring(todel) .. " from " .. tostring(r), p)
  else
   m("no part idenified to del from " .. tostring(r), w)
  end
 else
  m("no parent to idenify part to del", w)
 end
end

lib.Find=function(parent, child)
    if parent then
        if child then
            m("successfully found " .. tostring(child) .. " in " .. tostring(parent), p)
            return parent:FindFirstChild(child)
        else
            m("parent is included but no child", w)
        end
    else
        m("no parent", w)
    end
end

lib.CheckKey=function(key, match)
    if key then
        if match then
            if key == match then
                return true
            else
                m("wrong key!", w)
                return false
            end
        else
            m("No matching for key", w)
        end
    else
        m("no key input", w)
    end
end

function AppendFile(filename, append)
    if isfile(filename) then
        if append then
            local r = readfile(filename)
            writefile(filename, r .. "\n" .. append)
            m("appended file" .. filename, p)
        else
            m("no code input.", w)
        end
    else
        if filename then
            m("invalid file name", w)
        else
            m("No file name input.", w)
        end
    end
end

lib.CheckFile=function(file)
    if file then
        if isfile(file) then
            return true
        else
            return false
        end
    else
        m("Please enter a file name", w)
    end
end

lib.Append=function(filename, append)
    if isfile(filename) then
        if append then
            AppendFile(filename, append)
            m("Successfully Appended File:" .. filename, p)
        else
            m("No code input.", w)
        end
    else
        m("No file name input", w)
    end
end

lib.Rewrite=function(filename, contents)
    if isfile(filename) then
        if contents then
            m("Successfully Rewrote" .. filename, p)
            writefile(filename, contents)
        else
            m("File name is presented. But no contents", w)
        end
    else
        m("No filename Input", "w")
    end
end

lib.Msg=function(msg, type)
    m(msg, type)
end

lib.Timer=function(delay, func)
  local t = timer.delayed(delay, func)
  return t
end

lib.Random=function(min, max)
  return math.random(min, max)
end

lib.Map=function(func, arr)
  local new_arr = {}
  for i,v in ipairs(arr) do
    new_arr[i] = func(v)
  end
  return new_arr
end

lib.Filter=function(func, arr)
  local new_arr = {}
  for i,v in ipairs(arr) do
    if func(v) then
      table.insert(new_arr, v)
    end
  end
  return new_arr
end

lib.Reduce=function(func, arr, initial)
  local result = initial or arr[1]
  local start = initial and 1 or 2
  for i=start,#arr do
    result = func(result, arr[i])
  end
  return result
end

lib.Clone=function(obj)
  local seen = {}
  local function clone(obj)
    if type(obj) ~= 'table' then
      return obj
    elseif seen[obj] then
      return seen[obj]
    else
      local t = {}
      seen[obj] = t
      for k,v in pairs(obj) do
        t[clone(k)] = clone(v)
      end
      return setmetatable(t, getmetatable(obj))
    end
  end
  return clone(obj)
end

function lib.decrypt(ciphertext, key)
  local shift = key % 26
  local result = ""
  for i = 1, #ciphertext do
    local c = ciphertext:sub(i, i)
    if c >= "A" and c <= "Z" then
      c = string.char((c:byte() - 65 - shift) % 26 + 65)
    elseif c >= "a" and c <= "z" then
      c = string.char((c:byte() - 97 - shift) % 26 + 97)
    end
    result = result .. c
  end
  return result
end

function lib.encrypt(text, key)
  local shift = key % 26
  local result = ""
  for i = 1, #text do
    local c = text:sub(i, i)
    if c >= "A" and c <= "Z" then
      c = string.char((c:byte() - 65 + shift) % 26 + 65)
    elseif c >= "a" and c <= "z" then
      c = string.char((c:byte() - 97 + shift) % 26 + 97)
    end
    result = result .. c
  end
  return result
end

lib.Merge=function(t1, t2)
  local t = {}
  for k,v in pairs(t1) do
    t[k] = v
  end
  for k,v in pairs(t2) do
    t[k] = v
  end
  return t
end

lib.Flatten=function(t)
  local flat = {}
  local function recurse(sub_t)
    for i,v in ipairs(sub_t) do
      if type(v) == 'table' then
        recurse(v)
      else
        table.insert(flat, v)
      end
    end
  end
  recurse(t)
  return flat
end

lib.Reverse=function(t)
  local new_t = {}
  for i=#t,1,-1 do
    table.insert(new_t, t[i])
  end
  return new_t
end

lib.Shuffle=function(t)
  local n = #t
  while n > 1 do
    local k = math.random(n)
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
  return t
end

lib.Clear = function(script)
    if script then
        return script:gsub("%-%-[^\n]*", "")
    else
        warn("No script input")
    end
end

lib.RemoveFile=function(filename)
    if isfile(filename) then
        writefile(filename, "--deleted")
    else
        warn("no file name or file name is not valid")
    end
end

lib.File=function(name, code)
    if name or code then
        if name then
            if code then
                print("File made in workspace")
                writefile(name, code)
            else
                warn("No code input")
            end
        else
            if not code then
                warn("Name inputted But no code input.")
            else
                warn("No name input.")
            end
        end
    end
end

lib.Call=function(name)
    if isfile(name) then
        local file=readfile(name)
        local c = loadstring(file)
        local ss=pcall(c)
        if not ss then
            warn("Cannot Execute")
        else
            print("Successfully executed")
        end
    else
        warn(name .. "Is not a valid file name.")
    end
end

lib.Load = function()
    saves = Config:LoadConfig("save/saves.lua")
end

lib.Obfuscate = function(script, ret)
    --this obfuscate function is bad so use moonsec or luraph
    local script = lib.Clear(script)
    local buff = ""
    for v = 1, string.len(script) do
        buff = buff .. "\\" .. string.byte(script, v)
    end
    if ret then
        return "loadstring(\"" .. buff .. "\")()"
    else
        if ret == nil then
            ret = false
        end
        return buff
    end
end

lib.Add = function(num1, num2)
    return num1 + num2
end

lib.Divide=function(num1, num2)
    return num1 / num2
end

lib.Multiply=function(num1, num2)
    return num1 * num2
end

lib.Minus=function(num1, num2)
    return num1 - num2
end

lib.Save = function(code, file_name, save_type, del_boolean, com_boolean, obf)
    if not del_boolean then
        del_boolean = false
    end
    if not com_boolean then
        com_boolean = false
    end
    if not obf then
        obf = false
    end
    if code then
        if save_type == "file" then
            if file_name then
                if del_boolean then
                    code = lib.Clear(code)
                end
                if com_boolean then
                    code = code:gsub("%s+", " "):gsub(";%s*\n", ";")
                end
                if obf then
                    code = lib.Obfuscate(code, true)
                end
                print("Successfully Saved as " .. file_name .. ", Obfuscated: " .. tostring(obf) .. ", Clear Comments: " .. tostring(del_boolean) .. ", Compiled: " .. tostring(com_boolean))
                writefile(file_name, code)
            else
                warn("File name is not included")
            end
        elseif save_type == "table" then
            if file_name then
                if del_boolean then
                    code = lib.Clear(code)
                end
                if com_boolean then
                    code = code:gsub("%s+", " "):gsub(";%s*\n", ";")
                end
                if obf then
                    code = lib.Obfuscate(code, true)
                end
                print("Saved the code into the saves table. You can find it in workspace.")
                saves[file_name] = code
                print("Successfully saved in save/folder/saves.lua, Obfuscated: " .. tostring(obf) .. ", Clear Comments: " .. tostring(del_boolean) .. ", Compiled: " .. tostring(com_boolean))
                Config:SaveConfig("save/saves.lua", saves)
                saves = Config:LoadConfig("save/saves.lua")
            else
                warn("No name included")
            end
        elseif save_type == nil or save_type == "" then
            warn("Save type cannot be empty.")
        end
    else
        if save_type == "file" then
            if not file_name then
                warn("No file name and code input.")
            else
                warn("File name is included, but no code input.")
            end
            if save_type == "table" then
                warn("No save name and code input.")
            else
                warn("Save name is included. But no Value/Code input,")
            end
        end
    end
end

return lib
