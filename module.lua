--[[
        Ownership: sumeth wisswasopa 
        Age: 11 years old
        Current Ver: 1.1.3
        1.0.1: Fixed a syntax error.
        1.1.1:Major release. Added 12 functions
        1.1.2:minor release 1 function added
        1.1.3:minor release 5 functions added
        Released 1.0.0 at: 10:36 pm 5/5/2023
        Only a config thingy
        Incoming(maybe) functions:
        lib.Destroy
        lib.GetValue
]]
if _G.msg then
    local msg = _G.msg
    print("You're the owner!")
else
    print("You're a User!")
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
label.Text = "Hello! " .. you.DisplayName .. "/" .. you.Name ..
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(1, -220, 0, 20)
label.AnchorPoint = Vector2.new(1, 0)
label.Parent = gui

local label1 = Instance.new("TextLabel")
label1.Text = "Place id:" .. game.PlaceId ..
label1.TextColor3 = Color3.new(1, 1, 1)
label1.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 50)
label1.Position = UDim2.new(1, -220, 0, -20)
label1.AnchorPoint = Vector2.new(1, 0)
label1.Parent = gui

lib.LoadUrl=function(url)
    loadstring(game:HttpGet(url))()
end

function m(msg, type)
    if type == "w" then
        warn(msg)
    elseif type == "p" then
        print(msg)
    elseif type == "err" then
        error(msg)
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

--[[
End script
]]
return lib

--[[
        GUIDE ON HOW TO USE!!
        1: Copy and paste this script into workspace of you'r executor
        2: or Define a varible Like this
        
        local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/module.lua"))()
        
        3: After ypu did that the next step is  f u n c t i o n s:
        The first function is
        lib.Clear(string)
        The string represents the script your clearing the comments out of.
        Heres an example
]]
--local script = [[
--script
--]]
--lib.Clear(script)
--[[
        Second function:
        lib.Load()
        Will only load in the saves table just to mention!!
        Heres an example
        saves = lib.Load()
        Third function
        goofy ahh obfuscate💀💀
        lib.Obfuscate(script, boolean)
        Again like the lib.Clear() but returns a value of ASCII of the script
        The boolean is there to tell IF you want the completed loadstring
        Or just the ASCII value
        Anndddd finally the function that this script is dedicated to!!
        lib.Save(script, name, save type, boolean 1, boolean 2, boolean 3)
        
        So this function is to why this exists
        So like the other 2 funcs this needs a script but it also needs a save name
        and also a save type
        theres 2 save types at the moment
        "file" and "table"
        again like the .Clear() and .Obfuscate itll need this
        local script = [[
        --ur script
        ]]
--[[
        the boolean 1 is default setted to false if setted to true will delete any comments in the script
        boolean 2 is setted to default like boolean 1 false if true will compile ur script to a single line
        boolean 3 again false on default if true will obfuscate ur script
--]]

--[[
        New functions in 1.1.1!!
        lib.Add(num1, num2)
        basically do math and return the value
        lib.Divide(num1, num2)
        like lib.Add but divides the numbers given
        lib.Minus(num1, num2)
        like lib.Add but minusses the given numbers
        lib.Multiply(mum1, num2)
        like lib.Add but multiplies the given nums
        lib.Call(filename)
        Will try to find the given file name then execute whats ever inside the file
        lib.Shuffle(table)
        will shuffle the contents in the tables randomly
        lib.Clone(table)
        will clone the table given
        lib.Reverse(table)
        will reverse the table given
        lib.File(filename, code)
        will create a file seperated from the lib.Save for those who only want to use files
        lib.Flatten(table)
        will flatten a table to a single line
        lib.Merge(table1, table2)
        will merge the given tables then return it
        lib.Reduce(table, func, init)
        this one is a bit complex so ill give more details than the others
        this function will reduce a array of numbers in a table by adding them to one
        the init is there to be an support number incase its nil
        func will define a function for u to write to how will it work
        Heres an example
        local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/module.lua"))()
        local array = {1, 2, 3, 4, 5}
        local reduc = lib.Reduce(array, function(arg, arg2)
            return arg + arg2
        end, 1)
        print(reduc) -- will print out 16 the results of the array reduce is 15 but the init will be the support num
        lib.Filter(func, array)
        again ill explain fully
        the func is there for you to define a function to filter the array heres an example
        oh and the array gotta be a table
        here:
        local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/module.lua"))()
        local array = {1, 2, 3, 4}
        local function isOdd(n)
          return n % 2 == 1
        end
        local filtered = lib.Filter(isOdd, array)
        print(filtered) the results will be 1, 3 bc they are odd numbers
        lib.Map(func, array)
        full detaillllssss
        func will bbe the one that will do them thingys
        array again is a array of numbers in a table
        local sex = loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/module.lua"))()
        local ass = {1, 2}
        function multiply(n)
        return n * 2
        end
        local cum = sex.Map(multiply, ass)
        print(cum):output 2, 4
        lib.Random(min, max)
        min is the minimal amount of how low the random num can get tomax is the max ammount
        lib.Timer(time, func)
        this will delay the func time to exec heres an example
        local sex = dofile("ass")
        sex.Timer(10, 'print("waites 10 SEXS")')
        it will set a timer of 10 seconds then it will do whatever the func says
        new func
        lib.RemoveFile(filename)
        this only delete the contents of the given filename
        lib.Msg(message, type)
        this will print a message to console
        with type having 3 types
        1st w = warn
        2nd p = print
        3rd err = error
        basically warn() print() error() combined into one
        lib.Rewrite(filename, contents)
        will rewrite the given file name with contents
        lib.Append(filename, contents)
        will try to find the filename then append it by adding the contents to the last line of the code
        end
]]
