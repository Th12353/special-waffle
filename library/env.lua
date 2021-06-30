function add(method,func,path)
    if type(func) == "function" and type(method) == "string" then
        local mt = getrawmetatable(game)
    	local old = mt.__namecall
    	setreadonly(mt, false)
    	mt.__namecall = newcclosure(function(...)
	    	if tostring(getnamecallmethod()):lower() == tostring(method):lower() then
	    	    if path == nil or path == ({...})[1] then
	    		    return func(...)
	    		end
	    	end
		return old(...)
    	end)
	setreadonly(mt, true)
	else error("Expected string and function, got "..typeof(method).." and "..typeof(func)..".")
    end
end

add("IsLoaded", function()
	Loaded = false;
	if game.Players.LocalPlayer.Character == "nil" then
		Loaded = false
	elseif game.Players.LocalPlayer.Character ~= "nil" then
		Loaded = true
	end
	return Loaded
end, game.Players.LocalPlayer)

add("GetHWID", function()
    local http_request = http_request or http_request or (syn and syn.request) or http.request;

    local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
    local decoded = game:GetService('HttpService'):JSONDecode(body)
    local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint", "Fingerprint"};
    local hwid = "";
    
    for i, v in next, hwid_list do
    if decoded.headers[v] then
    hwid = decoded.headers[v];
    break
    end
    end

    return hwid;
end, game.CoreGui)

add("GetExecutor", function()
    local exploit =
        (syn and not is_sirhurt_closure and not pebc_execute and "SynapseX") or
        (secure_load and "Sentinel") or
        (is_sirhurt_closure and "Sirhurt") or
        (pebc_execute and "ProtoSmasher") or
        (KRNL_LOADED and "KRNL") or
        (WrapGlobal and "WRD Exploit") or
        (isvm and "Proxo") or
        (shadow_env and "Shadow") or
        (jit and "EasyExploits") or
        (getreg()['CalamariLuaEnv'] and "Calamari") or
        (unit and "‎UnitExploit") or
        (IS_VIVA_LOADED and "VIVA") or
        (identifyexecutor and "ScriptWare v2") or
        (IS_COCO_LOADED and "Coco") or
        ("Unknown.")
 
    return exploit
end, game.CoreGui)

add("Join", function(inv)
    local start = 7678
    for i = start-10, start+1 do
        spawn(function()
            pcall(function()
                request({Url = "http://127.0.0.1:"..tostring(i).."/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["Origin"] = "https://discord.com"},Body = game:GetService("HttpService"):JSONEncode({["cmd"] = "INVITE_BROWSER",["nonce"] = game:GetService("HttpService"):GenerateGUID(false),["args"] = {["invite"] = {["code"] = inv,},["code"] = inv}})})
            end)
        end)
    end
end, game.CoreGui)

add("ReturnPrimaryPart", function()
    repeat wait() until game.Players.LocalPlayer:IsLoaded()
    return game.Players.LocalPlayer.Character.PrimaryPart
end, game.Players.LocalPlayer)

add("ReturnHumanoid", function()
    repeat wait() until game.Players.LocalPlayer:IsLoaded()
    return game.Players.LocalPlayer.Character.PrimaryPart
end, game.Players.LocalPlayer)

add("Find", function(f)
    local e = nil
    for i,v in in pairs(game:GetDescendants()) do
        if v.Name:find(f) then
            e = v;
        end
    end
    return e 
end, game)

add("ToggleErrors", function(f)
    local ScriptContext = game:GetService("ScriptContext");

    for _, connection in ipairs(getconnections(ScriptContext.Error)) do
        if f then
            connection:Enable();
        else
            connection:Disable();
        end
    end
end, game.CoreGui)
