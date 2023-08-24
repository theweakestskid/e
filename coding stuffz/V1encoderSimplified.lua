--{         Encoding, Decoding, table And writefile Management         }--
--Varibles--
local emoji_goofy = '🥴'
local wf = function(n, dat) repeat wait() until writefile writefile(n, dat) end if not wf then wf = function(...) print("unsupported") return ... end end;
local nums_and_letters = {1, "-a", 2, "b&c", "B&E", "CB&", "ag.bc$&", 3, 4, 5, 6, 7, 8, 9, 0}
local ts = game:GetService("HttpService") if not ts then repeat wait() until ts end
local xc = xpcall
local pc = pcall
local l = {}
--End o'Varibles n Function(s)--

--/Main Functions\--
function l.tnum(num) if num then return tonumber(num) else return end end end
function l.tstr(str) if str then return tostring(str) else return end end end
function l.ccat(tbl, ...) if tbl and (...) then return table.concat(tbl, ...) else return end end end
function l.lstr(toexec) if toexec then return loadstring(tostring(toexec))() else return end end end
function l.random_numbers_and_letter(length) ret = "" for i = 0, length do ret = ret .. "" .. nums_and_letters[math.random(#nums_and_letters)] end return ret end
function l.encode(data) repeat wait() until ts return ts:JSONEncode(data) end;
function l.decode(data) repeat wait() until ts return ts:JSONDecode(data) end;
function l.wf_enc(n, dat) wf(n, encode(dat)) if isfile(n) then print("made and encoded " .. n) else warn("cannot make file") end end;
function l.dec_file(f) if isfile(f) then return decode(readfile(f)) end end;
function l.decsave_file(f) if isfile(f) then wf(f, dec_file(f)) end end;
function l.save_table(n, tbl) wf_enc(n, tbl) if isfile(n) then decsave_file(n) end end;
function l.concat_table(tbl) return "{'" .. n .. "', \"" .. table.concat(tbl, '", "') .. "\"}" end;
function l.call_in_file(n) if isfile(n) then return dofile(n) end end;
function l.rna(nm) if nm then random_numbers_and_letter(nm) else return end end end
return l
--/End Main Functions\--
--{         Nothing much of An Script          }--
