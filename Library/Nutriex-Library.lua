--[[
  _  _      _       _           _  _      _     
 | \| |_  _| |_ _ _(_)_____ __ | || |_  _| |__  
 | .` | || |  _| '_| / -_) \ / | __ | || | '_ \ 
 |_|\_|\_,_|\__|_| |_\___/_\_\ |_||_|\_,_|_.__/  
  -------------------------------------------
 • Nutriex UI library - By CyberX      
 • Version: 1.0 
 • Nutriex Security Version: 1.5                 
]]

local Services = setmetatable({}, {
    __index = function(self, serviceName)
        local service = game:GetService(serviceName)
        rawset(self, serviceName, service)
        return service
    end
})

local MarketplaceService = Services.MarketplaceService
local UserInputService = Services.UserInputService
local TweenService = Services.TweenService
local HttpService = Services.HttpService
local RunService = Services.RunService
local Players = Services.Players

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local CoreGui = if typeof(gethui) == "function" then gethui() else Services.CoreGui

local NutriexLibrary = {
	Themes = {
		Darker = {
    ["Color Hub 1"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 15)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 15, 15))
    }),
    ["Color Hub 2"] = Color3.fromRGB(18, 18, 18),
    ["Color Stroke"] = Color3.fromRGB(45, 45, 45), 
    ["Color Theme"] = Color3.fromRGB(255, 255, 255),
    ["Color Text"] = Color3.fromRGB(245, 245, 245),
    ["Color Dark Text"] = Color3.fromRGB(120, 120, 120)
},
	},
	Info = {
		Version = "1.0"
	},
	Save = {
		UISize = {487, 242},
		TabSize = 160,
		Theme = "Darker"
	},
Settings = {},
Connection = {},
Instances = {},
Elements = {},
Options = {},
Flags = {},
Tabs = {},
Icons = (function()
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Cyber-X9/Nutriex-Hub/refs/heads/main/Library/icons.json"))
    end)
    
    if success and type(result) == "table" then
        return result
    else
        return {
            ["x"] = "rbxassetid://10747384394",
            ["search"] = "rbxassetid://10734943674",
            ["settings"] = "rbxassetid://10734950309"
        }
    end
  end)()
}
local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local Base64 = {}

function Base64.Encode(data)
    return ((data:gsub('.', function(x) 
        local r, b = '', x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2^i - b % 2^(i-1) > 0 and '1' or '0') end
        return r;
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i,i) == '1' and 2^(6-i) or 0) end
        return b:sub(c+1, c+1)
    end) .. ({ '', '==', '=' })[#data%3 + 1])
end

function Base64.Random(length)
    length = length or 16
    local bytes = {}
    for i = 1, length do
        bytes[i] = string.char(math.random(0, 255))
    end
    local rawString = table.concat(bytes)
    return Base64.Encode(rawString):sub(1, length) 
end

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450

local Settings = NutriexLibrary.Settings
local Flags = NutriexLibrary.Flags

local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(NutriexLibrary.Instances, {
			Instance = Instance,
			Type = Type
		})
		return Instance
	end
	
	SetChildren = function(Instance, Children)
		if Children then
			table.foreach(Children, function(_,Child)
				Child.Parent = Instance
			end)
		end
		return Instance
	end
	
	SetProps = function(Instance, Props)
		if Props then
			table.foreach(Props, function(prop, value)
				Instance[prop] = value
			end)
		end
		return Instance
	end
	
	Create = function(...)
		local args = {...}
		if type(args) ~= "table" then return end
		local new = Instance.new(args[1])
		local Children = {}
		
		if type(args[2]) == "table" then
			SetProps(new, args[2])
			SetChildren(new, args[3])
			Children = args[3] or {}
		elseif typeof(args[2]) == "Instance" then
			new.Parent = args[2]
			SetProps(new, args[3])
			SetChildren(new, args[4])
			Children = args[4] or {}
		end
		return new
	end
	
	local function Save(file)
		if readfile and isfile and isfile(file) then
			local decode = HttpService:JSONDecode(readfile(file))
			
			if type(decode) == "table" then
				if rawget(decode, "UISize") then NutriexLibrary.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then NutriexLibrary.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then NutriexLibrary.Save["Theme"] = decode["Theme"] end
			end
		end
	end
	
	pcall(Save, "Nutriex_Config.json")
end

local Funcs = {} do
	function Funcs:InsertCallback(tab, func)
		if type(func) == "function" then
			table.insert(tab, func)
		end
		return func
	end
	
	function Funcs:FireCallback(tab, ...)
		for _,v in ipairs(tab) do
			if type(v) == "function" then
				task.spawn(v, ...)
			end
		end
	end
	
	function Funcs:ToggleVisible(Obj, Bool)
		Obj.Visible = Bool ~= nil and Bool or Obj.Visible
	end
	
	function Funcs:ToggleParent(Obj, Parent)
		if Bool ~= nil then
			Obj.Parent = Bool
		else
			Obj.Parent = not Obj.Parent and Parent
		end
	end
	
	function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
		local Connected = { Function = func, Connected = true }
		
		function Connected:Disconnect()
			if self.Connected then
				table.remove(ConnectedFuncs, table.find(ConnectedFuncs, self.Function))
				self.Connected = false
			end
		end
		
		function Connected:Fire(...)
			if self.Connected then
				task.spawn(self.Function, ...)
			end
		end
		
		return Connected
	end
	
	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function()end
		
		if type(func) == "table" then
			return ({function(Value) func[1][func[2]] = Value end})
		end
		return {func}
	end
end

local Connections, Connection = {}, NutriexLibrary.Connection do
	local function NewConnectionList(List)
		if type(List) ~= "table" then return end
		
		for _,CoName in ipairs(List) do
			local ConnectedFuncs, Connect = {}, {}
			Connection[CoName] = Connect
			Connections[CoName] = ConnectedFuncs
			Connect.Name = CoName
			
			function Connect:Connect(func)
				if type(func) == "function" then
					table.insert(ConnectedFuncs, func)
					return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
				end
			end
			
			function Connect:Once(func)
				if type(func) == "function" then
					local Connected;
					
					local _NFunc;_NFunc = function(...)
						task.spawn(func, ...)
						Connected:Disconnect()
					end
					
					Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
					return Connected
				end
			end
		end
	end
	
	function Connection:FireConnection(CoName, ...)
		local Connection = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
		for _,Func in pairs(Connection) do
			task.spawn(Func, ...)
		end
	end
	
	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end

local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name)
		return type(Name) == "string" and Flags[Name] ~= nil
	end
	
	GetFlag = function(Name)
		return type(Name) == "string" and Flags[Name]
	end
	
	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end
	
	local db
	Connection.FlagsChanged:Connect(function(Flag, Value)
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db=true;task.wait(0.1);db=false
			
			local Success, Encoded = pcall(function()
				-- local _Flags = {}
				-- for _,Flag in pairs(Flags) do _Flags[_] = Flag.Value end
				return HttpService:JSONEncode(Flags)
			end)
			
			if Success then
				local Success = pcall(writefile, ScriptFile, Encoded)
				if Success then
					Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
				end
			end
		end
	end)
end
local randomGuiName = "" .. Base64.Random(12)

local ScreenGui = Create("ScreenGui", CoreGui, {
	Name = randomGuiName,
}, {
	Create("UIScale", {
		Scale = UIScale,
		Name = "Scale"
	})
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
	ScreenFind:Destroy()
end

local function GetStr(val)
	if type(val) == "function" then
		return val()
	end
	return val
end

local function ConnectSave(Instance, func)
	Instance.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait()
			end
		end
		func()
	end)
end

local function CreateTween(Configs)
	local Instance = Configs[1] or Configs.Instance
	local Prop = Configs[2] or Configs.Prop
	local NewVal = Configs[3] or Configs.NewVal
	local Time = Configs[4] or Configs.Time or 0.5
	local TweenWait = Configs[5] or Configs.wait or false
	local TweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Quint)
	
	local Tween = TweenService:Create(Instance, TweenInfo, {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then
		Tween.Completed:Wait()
	end
	return Tween
end

local function MakeDrag(Instance)
	task.spawn(function()
		SetProps(Instance, {
			Active = true,
			AutoButtonColor = false
		})
		
		local DragStart, StartPos, InputOn
		
		local function Update(Input)
			local delta = Input.Position - DragStart
			local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale)
			-- Instance.Position = Position
			CreateTween({Instance, "Position", Position, 0.35})
		end
		
		Instance.MouseButton1Down:Connect(function()
			InputOn = true
		end)
		
		Instance.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				StartPos = Instance.Position
				DragStart = Input.Position
				
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do RunService.Heartbeat:Wait()
					if InputOn then
						Update(Input)
					end
				end
				InputOn = false
			end
		end)
	end)
	return Instance
end

local function VerifyTheme(Theme)
	for name,_ in pairs(NutriexLibrary.Themes) do
		if name == Theme then
			return true
		end
	end
end

local function SaveJson(FileName, save)
	if writefile then
		local json = HttpService:JSONEncode(save)
		writefile(FileName, json)
	end
end

local Theme = NutriexLibrary.Themes[NutriexLibrary.Save.Theme]

local function AddEle(Name, Func)
	NutriexLibrary.Elements[Name] = Func
end

local function Make(Ele, Instance, props, ...)
	local Element = NutriexLibrary.Elements[Ele](Instance, props, ...)
	return Element
end

AddEle("Corner", function(parent, CornerRadius)
	local New = SetProps(Create("UICorner", parent, {
		CornerRadius = CornerRadius or UDim.new(0, 7)
	}), props)
	return New
end)

AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1,
		ApplyStrokeMode = "Border"
	}), props), "Stroke")
	return New
end)

AddEle("Button", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		AutoButtonColor = false
	}), props), "Frame")
	
	New.MouseEnter:Connect(function()
		New.BackgroundTransparency = 0.4
	end)
	New.MouseLeave:Connect(function()
		New.BackgroundTransparency = 0
	end)
	if args[1] then
		New.Activated:Connect(args[1])
	end
	return New
end)

AddEle("Gradient", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIGradient", parent, {
		Color = Theme["Color Hub 1"]
	}), props), "Gradient")
	return New
end)

local function ButtonFrame(Instance, Title, Description, HolderSize)
	local TitleL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.Ubuntu,
		TextColor3 = Theme["Color Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		TextTruncate = "AtEnd",
		TextSize = 10,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "Text")
	
	local DescL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.Ubuntu,
		TextColor3 = Theme["Color Dark Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 12, 0, 15),
		BackgroundTransparency = 1,
		TextWrapped = true,
		TextSize = 8,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "DarkText")

	local Frame = Make("Button", Instance, {
		Size = UDim2.new(1, 0, 0, 25),
		AutomaticSize = "Y",
		Name = "Option"
	})Make("Corner", Frame, UDim.new(0, 6))
	
	LabelHolder = Create("Frame", Frame, {
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Size = HolderSize,
		Position = UDim2.new(0, 10, 0),
		AnchorPoint = Vector2.new(0, 0)
	}, {
		Create("UIListLayout", {
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Center",
			Padding = UDim.new(0, 2)
		}),
		Create("UIPadding", {
			PaddingBottom = UDim.new(0, 5),
			PaddingTop = UDim.new(0, 5)
		}),
		TitleL,
		DescL,
	})
	
	local Label = {}
	function Label:SetTitle(NewTitle)
		if type(NewTitle) == "string" and NewTitle:gsub(" ", ""):len() > 0 then
			TitleL.Text = NewTitle
		end
	end
	function Label:SetDesc(NewDesc)
		if type(NewDesc) == "string" and NewDesc:gsub(" ", ""):len() > 0 then
			DescL.Visible = true
			DescL.Text = NewDesc
			LabelHolder.Position = UDim2.new(0, 10, 0)
			LabelHolder.AnchorPoint = Vector2.new(0, 0)
		else
			DescL.Visible = false
			DescL.Text = ""
			LabelHolder.Position = UDim2.new(0, 10, 0.5)
			LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
		end
	end
	
	Label:SetTitle(Title)
	Label:SetDesc(Description)
	return Frame, Label
end

local function GetColor(Instance)
	if Instance:IsA("Frame") then
		return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then
		return "ImageColor3"
	elseif Instance:IsA("TextLabel") then
		return "TextColor3"
	elseif Instance:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	elseif Instance:IsA("UIStroke") then
		return "Color"
	end
	return ""
end

function NutriexLibrary:GetIcon(index)
    if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
        return index
    end
    
    local cleanIndex = string.lower(index):gsub("lucide", ""):gsub("-", "")
    
    if self.Icons[cleanIndex] then
        return self.Icons[cleanIndex]
    end
    
    local firstMatch = nil
    for Name, Icon in pairs(self.Icons) do
        if Name == cleanIndex then
            return Icon
        elseif not firstMatch and Name:find(cleanIndex, 1, true) then
            firstMatch = Icon
        end
    end
    
    return firstMatch or index
end

function NutriexLibrary:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end
	
	NutriexLibrary.Save.Theme = NewTheme
	SaveJson("Nutriex_Config.json", NutriexLibrary.Save)
	Theme = NutriexLibrary.Themes[NewTheme]
	
	Connection:FireConnection("ThemeChanged", NewTheme) 
	
	for _, Val in ipairs(NutriexLibrary.Instances) do
		if Val.Type == "Gradient" then
			Val.Instance.Color = Theme["Color Hub 1"]
		elseif Val.Type == "Frame" then
			Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
		elseif Val.Type == "Stroke" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
		elseif Val.Type == "Theme" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		elseif Val.Type == "Text" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
		elseif Val.Type == "DarkText" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
		elseif Val.Type == "ScrollBar" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		end
	end
end

function NutriexLibrary:SetScale(NewScale)
	NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
	UIScale, ScreenGui.Scale.Scale = NewScale, NewScale
end
--// Code Logic \\--
function NutriexLibrary:MakeWindow(Configs)
    Configs = Configs or {}
    local WTitle = Configs[1] or Configs.Name or Configs.Title or "Nutriex Hub"
    local WMiniText = Configs[2] or Configs.SubTitle or ""
    
    Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false
    
    local function LoadFile()
        local File = Settings.ScriptFile
        if type(File) ~= "string" or not readfile or not isfile then return end
        
        local success, exists = pcall(isfile, File)
        if success and exists then
            local readSuccess, content = pcall(readfile, File)
            if readSuccess and type(content) == "string" then
                local jsonSuccess, decoded = pcall(function() return HttpService:JSONDecode(content) end)
                if jsonSuccess and type(decoded) == "table" then
                    Flags = decoded
                end
            end
        end
    end
    LoadFile()
    
    local SaveData = NutriexLibrary.Save or {}
    local UISizeX = math.clamp((SaveData.UISize and SaveData.UISize[1]) or 500, 430, 1000)
    local UISizeY = math.clamp((SaveData.UISize and SaveData.UISize[2]) or 320, 200, 500)
    local TabSizeX = math.clamp(SaveData.TabSize or 150, 135, 250)

    local MainBgColor = Color3.fromRGB(255, 255, 255)
    if typeof(Theme["Color Hub 1"]) == "Color3" then
        MainBgColor = Theme["Color Hub 1"]
    end

    local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
        Size = UDim2.fromOffset(UISizeX, UISizeY),
        Position = UDim2.new(0.5, -UISizeX / 2, 0.5, -UISizeY / 2),
        BackgroundTransparency = 0.05,
        BackgroundColor3 = MainBgColor,
        Name = "Hub",
        AutoButtonColor = false
    }), "Main")
    
    if typeof(Theme["Color Hub 1"]) == "ColorSequence" then
        Create("UIGradient", MainFrame, {
            Color = Theme["Color Hub 1"],
            Rotation = 45
        })
    else
        Make("Gradient", MainFrame, { Rotation = 45 })
    end

    local MainCorner = Make("Corner", MainFrame)
    if MainCorner:IsA("UICorner") then
        MainCorner.CornerRadius = UDim.new(0, 10)
    end

    Make("Stroke", MainFrame, {
        Color = Theme["Color Stroke"] or Color3.fromRGB(35, 35, 35),
        Transparency = 0.4
    })

    MakeDrag(MainFrame)
    
    local Components = Create("Folder", MainFrame, { Name = "Components" })
    local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })
    
    local TopBar = Create("Frame", Components, {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Name = "Top Bar"
    })
    
    local Title = InsertTheme(Create("TextLabel", TopBar, {
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        Text = WTitle,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = 13,
        TextColor3 = Theme["Color Text"] or Color3.fromRGB(245, 245, 245),
        BackgroundTransparency = 1,
        Font = Enum.Font.Ubuntu,
        Name = "Title"
    }), "Text")
    
    local SubTitle = InsertTheme(Create("TextLabel", Title, {
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(1, 6, 0.85, 0),
        Text = WMiniText,
        TextColor3 = Theme["Color Dark Text"] or Color3.fromRGB(130, 130, 130),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        TextSize = 9,
        Font = Enum.Font.Ubuntu,
        Name = "SubTitle"
    }), "DarkText")
    
    local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
        Size = UDim2.new(0, TabSizeX, 1, -TopBar.Size.Y.Offset),
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        ScrollBarThickness = 2,
        BackgroundTransparency = 1,
        ScrollBarImageTransparency = 0.3,
        ScrollBarImageColor3 = Theme["Color Theme"] or Color3.fromRGB(255, 255, 255),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        BorderSizePixel = 0,
        Name = "Tab Scroll"
    }, {
        Create("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8)
        }),
        Create("UIListLayout", {
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), "ScrollBar")
    
    local Containers = Create("Frame", Components, {
        Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Name = "Containers"
    })

    local ControlSize1 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.fromOffset(UISizeX, UISizeY),
        Active = true,
        AnchorPoint = Vector2.new(0.8, 0.8),
        BackgroundTransparency = 1,
        Name = "Control Hub Size"
    }))
    
    local ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 20, 1, -30),
        Position = UDim2.new(0, TabSizeX, 1, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        Active = true,
        BackgroundTransparency = 1,
        Name = "Control Tab Size"
    }))
    
    local Minimized = false
    local SaveSize = MainFrame.Size
    
    local function UpdateLayout()
        if Minimized then return end
        
        local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
        local NewWidth = math.clamp(Pos1.X.Offset, 430, 1000)
        local NewHeight = math.clamp(Pos1.Y.Offset, 200, 500)
        local NewTabWidth = math.clamp(Pos2.X.Offset, 135, 250)
        
        ControlSize1.Position = UDim2.fromOffset(NewWidth, NewHeight)
        ControlSize2.Position = UDim2.new(0, NewTabWidth, 1, 0)
        
        MainScroll.Size = UDim2.new(0, NewTabWidth, 1, -TopBar.Size.Y.Offset)
        Containers.Size = UDim2.new(1, -NewTabWidth, 1, -TopBar.Size.Y.Offset)
        MainFrame.Size = ControlSize1.Position
    end
    
    ControlSize1:GetPropertyChangedSignal("Position"):Connect(UpdateLayout)
    ControlSize2:GetPropertyChangedSignal("Position"):Connect(UpdateLayout)
    
    if type(ConnectSave) == "function" then
        ConnectSave(ControlSize1, function()
            if not Minimized and type(SaveJson) == "function" then
                NutriexLibrary.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
                SaveJson("Nutriex_Config.json", NutriexLibrary.Save)
            end
        end)
        
        ConnectSave(ControlSize2, function()
            if type(SaveJson) == "function" then
                NutriexLibrary.Save.TabSize = MainScroll.Size.X.Offset
                SaveJson("Nutriex_Config.json", NutriexLibrary.Save)
            end
        end)
    end
   
    local ButtonsFolder = Create("Folder", TopBar, { Name = "Buttons" })
    
    local CloseButton = Create("ImageButton", {
        Size = UDim2.new(0, 15, 0, 15),
        Position = UDim2.new(1, -12, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10747384394",
        ImageTransparency = 0.3,
        ImageColor3 = Theme["Color Text"] or Color3.fromRGB(245, 245, 245),
        AutoButtonColor = false,
        Name = "Close"
    })
    
    local MinimizeButton = Create("ImageButton", {
        Size = UDim2.new(0, 15, 0, 15),
        Position = UDim2.new(1, -34, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734896206",
        ImageTransparency = 0.3,
        ImageColor3 = Theme["Color Text"] or Color3.fromRGB(245, 245, 245),
        AutoButtonColor = false,
        Name = "Minimize"
    })
    
    CloseButton.Parent = ButtonsFolder
    MinimizeButton.Parent = ButtonsFolder
    
    CloseButton.MouseEnter:Connect(function()
        CreateTween({CloseButton, "ImageTransparency", 0, 0.15})
        CreateTween({CloseButton, "ImageColor3", Color3.fromRGB(255, 75, 75), 0.15})
    end)
    CloseButton.MouseLeave:Connect(function()
        CreateTween({CloseButton, "ImageTransparency", 0.3, 0.15})
        CreateTween({CloseButton, "ImageColor3", Theme["Color Text"] or Color3.fromRGB(245, 245, 245), 0.15})
    end)

    MinimizeButton.MouseEnter:Connect(function()
        CreateTween({MinimizeButton, "ImageTransparency", 0, 0.15})
    end)
    MinimizeButton.MouseLeave:Connect(function()
        CreateTween({MinimizeButton, "ImageTransparency", 0.3, 0.15})
    end)
    
    local Window = {}
    local WaitClick = false
    
    function Window:CloseBtn()
        if typeof(Window.Dialog) == "function" then
           Window:Dialog({
			Title = "Close",
			Text = "You Want Close Nutriex Hub?",
			Options = {
				{"Confirm", function()
					ScreenGui:Destroy()
				end},
				{"Cancel"}
			  }
          })
        else
            ScreenGui:Destroy()
        end
    end
    
    function Window:MinimizeBtn()
        if WaitClick then return end
        WaitClick = true
        
        if Minimized then
            MinimizeButton.Image = "rbxassetid://10734896206"
            CreateTween({MainFrame, "Size", SaveSize, 0.22, true})
            ControlSize1.Visible = true
            ControlSize2.Visible = true
            Minimized = false
        else
            MinimizeButton.Image = "rbxassetid://10734924532"
            SaveSize = MainFrame.Size
            ControlSize1.Visible = false
            ControlSize2.Visible = false
            CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, TopBar.Size.Y.Offset), 0.22, true})
            Minimized = true
        end
        
        WaitClick = false
    end
    
    function Window:Minimize()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    CloseButton.Activated:Connect(function()
        Window:CloseBtn()
    end)
    
    MinimizeButton.Activated:Connect(function()
        Window:MinimizeBtn()
    end)
    
    function Window:AddMinimizeButton(MinConfigs)
        MinConfigs = MinConfigs or {}
        local Button = MakeDrag(Create("ImageButton", ScreenGui, {
            Size = UDim2.fromOffset(35, 35),
            Position = UDim2.fromScale(0.15, 0.15),
            BackgroundTransparency = 0.2,
            BackgroundColor3 = typeof(Theme["Color Hub 2"]) == "Color3" and Theme["Color Hub 2"] or Color3.fromRGB(20, 20, 20),
            AutoButtonColor = false,
            Name = "FloatingMinimizeBtn"
        }))
        
        local Stroke, Corner
        if MinConfigs.Corner then
            Corner = Make("Corner", Button)
            SetProps(Corner, MinConfigs.Corner)
        end
        if MinConfigs.Stroke then
            Stroke = Make("Stroke", Button)
            SetProps(Stroke, MinConfigs.Stroke)
        end
        
        if MinConfigs.Button then
            SetProps(Button, MinConfigs.Button)
        end
        
        Button.Activated:Connect(function()
            Window:Minimize()
        end)
        
        return {
            Stroke = Stroke,
            Corner = Corner,
            Button = Button
        }
    end

    function Window:Set(Val1, Val2)
        if type(Val1) == "string" then
            Title.Text = Val1
        end
        if type(Val2) == "string" then
            SubTitle.Text = Val2
        end
    end        
function Window:Dialog(Configs)
    if MainFrame:FindFirstChild("Dialog") then return end
    if Minimized then
        Window:MinimizeBtn()
    end
    
    local DTitle = Configs[1] or Configs.Title or "Dialog"
    local DText = Configs[2] or Configs.Text or "This is a Dialog"
    local DOptions = Configs[3] or Configs.Options or {}
    
    local Screen = Create("Frame", MainFrame, {
        BackgroundTransparency = 1,
        Active = true,
        BackgroundColor3 = Theme["Color Stroke"] or Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Name = "Dialog",
        ZIndex = 50
    })
    
    if MainCorner then
        MainCorner:Clone().Parent = Screen
    end
    
    local Frame = Create("Frame", Screen, {
        Active = true,
        Size = UDim2.fromOffset(270, 165),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Theme["Color Hub 2"] or Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0,
        ZIndex = 51
    })
    Make("Gradient", Frame, {Rotation = 270})
    Make("Corner", Frame, UDim.new(0, 10))
    Make("Stroke", Frame)
    
    local DialogScale = Instance.new("UIScale")
    DialogScale.Scale = 0.85
    DialogScale.Parent = Frame
    
    InsertTheme(Create("TextLabel", Frame, {
        Font = Enum.Font.Ubuntu,
        Size = UDim2.new(1, -30, 0, 22),
        Text = DTitle,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
        TextSize = 15,
        Position = UDim2.fromOffset(15, 12),
        BackgroundTransparency = 1,
        ZIndex = 52
    }), "Text")
    
    InsertTheme(Create("TextLabel", Frame, {
        Font = Enum.Font.Ubuntu,
        Size = UDim2.new(1, -30, 0, 55),
        Text = DText,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextColor3 = Theme["Color Dark Text"] or Color3.fromRGB(180, 180, 180),
        TextSize = 12,
        Position = UDim2.fromOffset(15, 38),
        BackgroundTransparency = 1,
        TextWrapped = true,
        ZIndex = 52
    }), "DarkText")
    
    local ButtonsHolder = Create("Frame", Frame, {
        Size = UDim2.new(1, -24, 0, 34),
        Position = UDim2.new(0, 12, 1, -12),
        AnchorPoint = Vector2.new(0, 1),
        BackgroundTransparency = 1,
        ZIndex = 52
    })
    
    Create("UIListLayout", ButtonsHolder, {
        Padding = UDim.new(0, 8),
        VerticalAlignment = Enum.VerticalAlignment.Center,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    })
    
    CreateTween({Screen, "BackgroundTransparency", 0.4, 0.15})
    CreateTween({DialogScale, "Scale", 1, 0.15})
    
    local ButtonsList, Dialog = {}, {}
    
    function Dialog:Button(BtnConfigs)
        local Name = BtnConfigs[1] or BtnConfigs.Name or BtnConfigs.Title or "Confirm"
        local Callback = BtnConfigs[2] or BtnConfigs.Callback or function() end
        
        local Button = Create("TextButton", ButtonsHolder, {
            Text = Name,
            Font = Enum.Font.Ubuntu,
            TextSize = 12,
            TextColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            AutoButtonColor = true,
            BorderSizePixel = 0,
            ZIndex = 53
        })
        
        Make("Corner", Button, UDim.new(0, 6))
        Make("Stroke", Button)
        
        table.insert(ButtonsList, Button)
        
        local TotalButtons = #ButtonsList
        for _, btn in ipairs(ButtonsList) do
            btn.Size = UDim2.new(1 / TotalButtons, -(((TotalButtons - 1) * 8) / TotalButtons), 1, 0)
        end
        
        Button.Activated:Connect(function()
            Dialog:Close()
            Callback()
        end)
    end
    
    function Dialog:Close()
        CreateTween({Screen, "BackgroundTransparency", 1, 0.12})
        CreateTween({DialogScale, "Scale", 0.85, 0.12, true})
        Screen:Destroy()
    end
    
    for _, btnData in ipairs(DOptions) do
        Dialog:Button(btnData)
    end
    
    return Dialog
end
	function Window:SelectTab(TabSelect)
		if type(TabSelect) == "number" then
			NutriexLibrary.Tabs[TabSelect].func:Enable()
		else
			for _,Tab in pairs(NutriexLibrary.Tabs) do
				if Tab.Cont == TabSelect.Cont then
					Tab.func:Enable()
				end
			end
		end
	end
local ContainerList = {}
function Window:MakeTab(paste, Configs)
    if type(paste) == "table" then Configs = paste end
    local TName = Configs[1] or Configs.Title or Configs.Name or "Tab!"
    local TIcon = Configs[2] or Configs.Icon or ""
    
    if type(NutriexLibrary) == "table" and type(NutriexLibrary.GetIcon) == "function" then
        TIcon = NutriexLibrary:GetIcon(TIcon)
    end
    
    if type(TIcon) ~= "string" or not TIcon:find("rbxassetid://") or TIcon:gsub("rbxassetid://", ""):len() < 6 then
        TIcon = false
    end
    
    local TabSelect = Make("Button", MainScroll, {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundColor3 = Theme["Color Stroke"] or Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        AutoButtonColor = false
    })
    Make("Corner", TabSelect, UDim.new(0, 6))
    
    local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
        Size = UDim2.new(1, TIcon and -32 or -20, 1, 0),
        Position = UDim2.fromOffset(TIcon and 28 or 16, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Ubuntu,
        Text = TName,
        TextColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = (FirstTab and 0.45) or 0,
        TextTruncate = Enum.TextTruncate.AtEnd
    }), "Text")
    
    local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0, 0.5),
        Image = TIcon or "",
        BackgroundTransparency = 1,
        ImageTransparency = (FirstTab and 0.45) or 0,
        ImageColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
        Visible = TIcon and true or false
    }), "Text")
    
    local Selected = InsertTheme(Create("Frame", TabSelect, {
        Size = FirstTab and UDim2.new(0, 3, 0, 0) or UDim2.new(0, 3, 0, 14),
        Position = UDim2.new(0, 2, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Theme["Color Theme"] or Color3.fromRGB(88, 101, 242),
        BackgroundTransparency = FirstTab and 1 or 0,
        BorderSizePixel = 0
    }), "Theme")
    Make("Corner", Selected, UDim.new(1, 0))
    
    local Container = InsertTheme(Create("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        ScrollBarThickness = 2,
        BackgroundTransparency = 1,
        ScrollBarImageTransparency = 0.2,
        ScrollBarImageColor3 = Theme["Color Theme"] or Color3.fromRGB(88, 101, 242),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Name = ("Container_%s"):format(TName:gsub("[%s%W]+", "_"))
    }, {
        Create("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10)
        }), 
        Create("UIListLayout", {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), "ScrollBar")
    
    table.insert(ContainerList, Container)
    
    if not FirstTab then 
        Container.Parent = Containers 
    end
    
    local Tab = { Enabled = (FirstTab == false), Name = TName, Cont = Container }

    TabSelect.MouseEnter:Connect(function()
        if not Tab.Enabled then
            CreateTween({TabSelect, "BackgroundTransparency", 0.94, 0.15})
            CreateTween({LabelTitle, "TextTransparency", 0.2, 0.15})
            if TIcon then CreateTween({LabelIcon, "ImageTransparency", 0.2, 0.15}) end
        end
    end)
    
    TabSelect.MouseLeave:Connect(function()
        if not Tab.Enabled then
            CreateTween({TabSelect, "BackgroundTransparency", 1, 0.15})
            CreateTween({LabelTitle, "TextTransparency", 0.45, 0.15})
            if TIcon then CreateTween({LabelIcon, "ImageTransparency", 0.45, 0.15}) end
        end
    end)
    
    local function Tabs()
        if Container.Parent and Tab.Enabled then return end
        
        for _, Frame in ipairs(ContainerList) do
            if Frame:IsA("ScrollingFrame") and Frame ~= Container then
                Frame.Parent = nil
            end
        end
        
        Container.Parent = Containers
        Container.Size = UDim2.new(1, 0, 1, 15)
        
        if type(NutriexLibrary) == "table" and type(NutriexLibrary.Tabs) == "table" then
            for _, tabData in ipairs(NutriexLibrary.Tabs) do
                if tabData.Cont ~= Container and tabData.func and type(tabData.func.Disable) == "function" then
                    tabData.func:Disable()
                end
            end
        end
        
        Tab.Enabled = true
        
        CreateTween({TabSelect, "BackgroundTransparency", 0.88, 0.2})
        CreateTween({Container, "Size", UDim2.new(1, 0, 1, 0), 0.25})
        CreateTween({LabelTitle, "TextTransparency", 0, 0.2})
        if TIcon then CreateTween({LabelIcon, "ImageTransparency", 0, 0.2}) end
        CreateTween({Selected, "Size", UDim2.new(0, 3, 0, 14), 0.2})
        CreateTween({Selected, "BackgroundTransparency", 0, 0.2})
    end
    
    TabSelect.Activated:Connect(Tabs)
    
    FirstTab = true
    if type(NutriexLibrary) == "table" and type(NutriexLibrary.Tabs) == "table" then
        table.insert(NutriexLibrary.Tabs, {TabInfo = {Name = TName, Icon = TIcon}, func = Tab, Cont = Container})
    end
    
    function Tab:Disable()
        self.Enabled = false
        Container.Parent = nil
        CreateTween({TabSelect, "BackgroundTransparency", 1, 0.2})
        CreateTween({LabelTitle, "TextTransparency", 0.45, 0.2})
        if TIcon then CreateTween({LabelIcon, "ImageTransparency", 0.45, 0.2}) end
        CreateTween({Selected, "Size", UDim2.new(0, 3, 0, 0), 0.2})
        CreateTween({Selected, "BackgroundTransparency", 1, 0.2})
    end
    
    function Tab:Enable()
        Tabs()
    end
    
    function Tab:SetTitle(NewTitle)
        if type(NewTitle) == "string" then
            TName = NewTitle
            LabelTitle.Text = TName
            Container.Name = ("Container_%s"):format(TName:gsub("[%s%W]+", "_"))
        end
    end
    
    function Tab:Visible(Bool)
        if type(Funcs) == "table" then
            if type(Funcs.ToggleVisible) == "function" then
                Funcs:ToggleVisible(TabSelect, Bool)
            end
            if type(Funcs.ToggleParent) == "function" then
                Funcs:ToggleParent(Container, Bool, Containers)
            end
        else
            TabSelect.Visible = Bool
            if not Bool then Container.Parent = nil end
        end
    end
    
    function Tab:Destroy() 
        for i, c in ipairs(ContainerList) do
            if c == Container then
                table.remove(ContainerList, i)
                break
            end
        end
        TabSelect:Destroy() 
        Container:Destroy() 
    end
    
function Tab:AddSection(Configs)
    local SectionName = type(Configs) == "string" and Configs or Configs[1] or Configs.Name or Configs.Title or Configs.Section or "Section"
    
    local SectionFrame = Create("Frame", Container, {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Name = "Option"
    })
    
    local Indicator = InsertTheme(Create("Frame", SectionFrame, {
        Size = UDim2.new(0, 3, 0, 12),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Theme["Color Theme"] or Color3.fromRGB(88, 101, 242),
        BorderSizePixel = 0
    }), "Theme")
    Make("Corner", Indicator, UDim.new(1, 0))
    
    local SectionLabel = InsertTheme(Create("TextLabel", SectionFrame, {
        Font = Enum.Font.Ubuntu,
        Text = SectionName,
        TextColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left
    }), "Text")
    
    local Section = {}
    
    if type(NutriexLibrary) == "table" and type(NutriexLibrary.Options) == "table" then
        table.insert(NutriexLibrary.Options, {type = "Section", Name = SectionName, func = Section})
    end
    
    function Section:Visible(Bool)
        if Bool == nil then 
            SectionFrame.Visible = not SectionFrame.Visible 
            return SectionFrame.Visible
        end
        SectionFrame.Visible = Bool
    end
    
    function Section:Destroy()
        SectionFrame:Destroy()
    end
    
    function Section:Set(New)
        if New then
            SectionName = type(GetStr) == "function" and GetStr(New) or tostring(New)
            SectionLabel.Text = SectionName
        end
    end
    
    function Section:Get()
        return SectionName
    end
    
    return Section
end
function Tab:AddParagraph(Configs)
    local PName = Configs[1] or Configs.Title or "Paragraph"
    local PDesc = Configs[2] or Configs.Text or ""
    
    local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -16))
    
    local Paragraph = {}
    function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
    function Paragraph:Destroy() Frame:Destroy() end
    function Paragraph:SetTitle(Val)
        LabelFunc:SetTitle(GetStr(Val))
    end
    function Paragraph:SetDesc(Val)
        LabelFunc:SetDesc(GetStr(Val))
    end
    function Paragraph:Set(Val1, Val2)
        if Val1 and Val2 then
            LabelFunc:SetTitle(GetStr(Val1))
            LabelFunc:SetDesc(GetStr(Val2))
        elseif Val1 then
            LabelFunc:SetDesc(GetStr(Val1))
        end
    end
    return Paragraph
end
function Tab:AddButton(Configs)
    local BName = Configs[1] or Configs.Name or Configs.Title or "Button!"
    local BDescription = Configs.Desc or Configs.Description or ""
    local Callback = Funcs:GetCallback(Configs, 2)
    
    local FButton, LabelFunc = ButtonFrame(Container, BName, BDescription, UDim2.new(1, -16))
    
    local ButtonIcon = Create("ImageLabel", FButton, {
        Size = UDim2.new(0, 15, 0, 15),
        Position = UDim2.new(1, -12, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10709791437",
        ImageTransparency = 0.25,
        ImageColor3 = Theme["Color Text"] or Color3.fromRGB(245, 245, 245)
    })
    
    FButton.MouseEnter:Connect(function()
        CreateTween({ButtonIcon, "ImageTransparency", 0, 0.15})
    end)
    
    FButton.MouseLeave:Connect(function()
        CreateTween({ButtonIcon, "ImageTransparency", 0.25, 0.15})
    end)
    
    FButton.Activated:Connect(function()
        Funcs:FireCallback(Callback)
    end)
    
    local Button = {}
    function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
    function Button:Destroy() FButton:Destroy() end
    function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
    function Button:Set(Val1, Val2)
        if type(Val1) == "string" and type(Val2) == "string" then
            LabelFunc:SetTitle(Val1)
            LabelFunc:SetDesc(Val2)
        elseif type(Val1) == "string" then
            LabelFunc:SetTitle(Val1)
        elseif type(Val1) == "function" then
            Callback = Val1
        end
    end
    return Button
end
function Tab:AddToggle(Configs)
    local TName = Configs[1] or Configs.Name or Configs.Title or "Toggle"
    local TDesc = Configs.Desc or Configs.Description or ""
    local Callback = Funcs:GetCallback(Configs, 3)
    local Flag = Configs[4] or Configs.Flag or false
    local Default = Configs[2] or Configs.Default or false
    if CheckFlag(Flag) then Default = GetFlag(Flag) end
    
    local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
    
    local ToggleHolder = InsertTheme(Create("Frame", Button, {
        Size = UDim2.new(0, 36, 0, 18),
        Position = UDim2.new(1, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Stroke"] or Color3.fromRGB(35, 35, 35)
    }), "Stroke")
    Make("Corner", ToggleHolder, UDim.new(0, 6)) 
    
    local Slider = Create("Frame", ToggleHolder, {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -6, 1, -6),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5)
    })
    
    local Toggle = InsertTheme(Create("Frame", Slider, {
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Theme["Color Theme"] or Color3.fromRGB(88, 101, 242)
    }), "Theme")
    
    Make("Corner", Toggle, UDim.new(0, 4))
    
    local WaitClick
    local function SetToggle(Val)
        if WaitClick then return end
        
        WaitClick, Default = true, Val
        SetFlag(Flag, Default)
        Funcs:FireCallback(Callback, Default)
        
        if Default then
            CreateTween({Toggle, "Position", UDim2.new(1, 0, 0.5, 0), 0.2, false, Enum.EasingStyle.Quart, Enum.EasingDirection.Out})
            CreateTween({Toggle, "BackgroundTransparency", 0, 0.2})
            CreateTween({Toggle, "AnchorPoint", Vector2.new(1, 0.5), 0.2})
            CreateTween({Toggle, "Size", UDim2.new(0, 14, 0, 12), 0.1, true})
            CreateTween({Toggle, "Size", UDim2.new(0, 12, 0, 12), 0.1})
        else
            CreateTween({Toggle, "Position", UDim2.new(0, 0, 0.5, 0), 0.2, false, Enum.EasingStyle.Quart, Enum.EasingDirection.Out})
            CreateTween({Toggle, "BackgroundTransparency", 0.6, 0.2})
            CreateTween({Toggle, "AnchorPoint", Vector2.new(0, 0.5), 0.2})
            CreateTween({Toggle, "Size", UDim2.new(0, 14, 0, 12), 0.1, true})
            CreateTween({Toggle, "Size", UDim2.new(0, 12, 0, 12), 0.1})
        end
        WaitClick = false
    end
    
    task.spawn(SetToggle, Default)
    
    Button.Activated:Connect(function()
        SetToggle(not Default)
    end)
    
    local Toggle = {}
    function Toggle:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function Toggle:Destroy() Button:Destroy() end
    function Toggle:Callback(...) Funcs:InsertCallback(Callback, ...)() end
    function Toggle:Set(Val1, Val2)
        if type(Val1) == "string" and type(Val2) == "string" then
            LabelFunc:SetTitle(Val1)
            LabelFunc:SetDesc(Val2)
        elseif type(Val1) == "string" then
            LabelFunc:SetTitle(Val1, false, true)
        elseif type(Val1) == "boolean" then
            if WaitClick and Val2 then
                repeat task.wait() until not WaitClick
            end
            task.spawn(SetToggle, Val1)
        elseif type(Val1) == "function" then
            Callback = Val1
        end
    end
    return Toggle
end
function Tab:AddDropdown(Configs)
			local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
			local DDesc = Configs.Desc or Configs.Description or ""
			local DOptions = Configs[2] or Configs.Options or {}
			local OpDefault = Configs[3] or Configs.Default or {}
			local Flag = Configs[5] or Configs.Flag or false
			local DMultiSelect = Configs.MultiSelect or false
			local Callback = Funcs:GetCallback(Configs, 4)
			
			local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -180))
			
			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")Make("Corner", SelectedFrame, UDim.new(0, 4))
			
			local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.Ubuntu,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = "..."
			}), "Text")
			
			local Arrow = Create("ImageLabel", SelectedFrame, {
				Size = UDim2.new(0, 15, 0, 15),
				Position = UDim2.new(0, -5, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = "rbxassetid://10709791523",
				BackgroundTransparency = 1
			})
			
			local NoClickFrame = Create("TextButton", DropdownHolder, {
        Name = "AntiClick",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        Text = "",
    })
			
			local DropFrame = Create("Frame", NoClickFrame, {
				Size = UDim2.new(SelectedFrame.Size.X, 0, 0),
				BackgroundTransparency = 0.1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AnchorPoint = Vector2.new(0, 1),
				Name = "DropdownFrame",
				ClipsDescendants = true,
				Active = true
			})Make("Corner", DropFrame)Make("Stroke", DropFrame)Make("Gradient", DropFrame, {Rotation = 60})
			
			local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
				ScrollBarImageColor3 = Theme["Color Theme"],
				Size = UDim2.new(1, 0, 1, 0),
				ScrollBarThickness = 1.5,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				ScrollingDirection = "Y",
				AutomaticCanvasSize = "Y",
				Active = true
			}, {
				Create("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}), Create("UIListLayout", {
					Padding = UDim.new(0, 4)
				})
			}), "ScrollBar")
			
			local ScrollSize, WaitClick = 5
			local function Disable()
				WaitClick = true
				CreateTween({Arrow, "Rotation", 0, 0.2})
				CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
				CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
				Arrow.Image = "rbxassetid://10709791523"
				NoClickFrame.Visible = false
				WaitClick = false
			end
			
			local function GetFrameSize()
				return UDim2.fromOffset(152, ScrollSize)
			end
			
			local function CalculateSize()
				local Count = 0
				for _,Frame in pairs(ScrollFrame:GetChildren()) do
					if Frame:IsA("Frame") or Frame.Name == "Option" then
						Count = Count + 1
					end
				end
				ScrollSize = (math.clamp(Count, 0, 10) * 25) + 10
				if NoClickFrame.Visible then
					NoClickFrame.Visible = true
					CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
				end
			end
			
			local function Minimize()
				if WaitClick then return end
				WaitClick = true
				if NoClickFrame.Visible then
					Arrow.Image = "rbxassetid://10709791523"
					CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
					CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
					NoClickFrame.Visible = false
				else
					NoClickFrame.Visible = true
					Arrow.Image = "rbxassetid://10709790948"
					CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.2})
					CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
				end
				WaitClick = false
			end
			
			local function CalculatePos()
				local FramePos = SelectedFrame.AbsolutePosition
				local ScreenSize = ScreenGui.AbsoluteSize
				local ClampX = math.clamp((FramePos.X / UIScale), 0, ScreenSize.X / UIScale - DropFrame.Size.X.Offset)
				local ClampY = math.clamp((FramePos.Y / UIScale) , 0, ScreenSize.Y / UIScale)
				
				local NewPos = UDim2.fromOffset(ClampX, ClampY)
				local AnchorPoint = FramePos.Y > ScreenSize.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
				DropFrame.AnchorPoint = Vector2.new(0, AnchorPoint)
				CreateTween({DropFrame, "Position", NewPos, 0.1})
			end
			
			local AddNewOptions, GetOptions, AddOption, RemoveOption, Selected do
				local Default = type(OpDefault) ~= "table" and {OpDefault} or OpDefault
				local MultiSelect = DMultiSelect
				local Options = {}
				Selected = MultiSelect and {} or CheckFlag(Flag) and GetFlag(Flag) or Default[1]
				
				if MultiSelect then
					for index, Value in pairs(CheckFlag(Flag) and GetFlag(Flag) or Default) do
						if type(index) == "string" and (DOptions[index] or table.find(DOptions, index)) then
							Selected[index] = Value
						elseif DOptions[Value] then
							Selected[Value] = true
						end
					end
				end
				
				local function CallbackSelected()
					SetFlag(Flag, if MultiSelect then Selected else tostring(Selected or "..."))
					Funcs:FireCallback(Callback, Selected)
				end
				
				local function UpdateLabel()
					if MultiSelect then
						local list = {}
						for index, Value in pairs(Selected) do
							if Value then
								table.insert(list, index)
							end
						end
						ActiveLabel.Text = #list > 0 and table.concat(list, ", ") or "..."
					else
						ActiveLabel.Text = tostring(Selected or "...")
					end
				end
				
				local function UpdateSelected()
					if MultiSelect then
						for _,v in pairs(Options) do
							local nodes, Stats = v.nodes, v.Stats
							CreateTween({nodes[2], "BackgroundTransparency", Stats and 0 or 0.8, 0.35})
							CreateTween({nodes[2], "Size", Stats and UDim2.fromOffset(4, 12) or UDim2.fromOffset(4, 4), 0.35})
							CreateTween({nodes[3], "TextTransparency", Stats and 0 or 0.4, 0.35})
						end
					else
						for _,v in pairs(Options) do
							local Slt = v.Value == Selected
							local nodes = v.nodes
							CreateTween({nodes[2], "BackgroundTransparency", Slt and 0 or 1, 0.35})
							CreateTween({nodes[2], "Size", Slt and UDim2.fromOffset(4, 14) or UDim2.fromOffset(4, 4), 0.35})
							CreateTween({nodes[3], "TextTransparency", Slt and 0 or 0.4, 0.35})
						end
					end
					UpdateLabel()
				end
				
				local function Select(Option)
					if MultiSelect then
						Option.Stats = not Option.Stats
						Option.LastCB = tick()
						
						Selected[Option.Name] = Option.Stats
						CallbackSelected()
					else
						Option.LastCB = tick()
						
						Selected = Option.Value
						CallbackSelected()
					end
					UpdateSelected()
				end
				
				AddOption = function(index, Value)
					local Name = tostring(type(index) == "string" and index or Value)
					
					if Options[Name] then return end
					Options[Name] = {
						index = index,
						Value = Value,
						Name = Name,
						Stats = false,
						LastCB = 0
					}
					
					if MultiSelect then
						local Stats = Selected[Name]
						Selected[Name] = Stats or false
						Options[Name].Stats = Stats
					end
					
					local Button = Make("Button", ScrollFrame, {
						Name = "Option",
						Size = UDim2.new(1, 0, 0, 21),
						Position = UDim2.new(0, 0, 0.5),
						AnchorPoint = Vector2.new(0, 0.5)
					})Make("Corner", Button, UDim.new(0, 4))
					
					local IsSelected = InsertTheme(Create("Frame", Button, {
						Position = UDim2.new(0, 1, 0.5),
						Size = UDim2.new(0, 4, 0, 4),
						BackgroundColor3 = Theme["Color Theme"],
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5)
					}), "Theme")Make("Corner", IsSelected, UDim.new(0.5, 0))
					
					local OptioneName = InsertTheme(Create("TextLabel", Button, {
						Size = UDim2.new(1, 0, 1),
						Position = UDim2.new(0, 10),
						Text = Name,
						TextColor3 = Theme["Color Text"],
						Font = Enum.Font.GothamBold,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
						TextTransparency = 0.4
					}), "Text")
					
					Button.Activated:Connect(function()
						Select(Options[Name])
					end)
					
					Options[Name].nodes = {Button, IsSelected, OptioneName}
				end
				
				RemoveOption = function(index, Value)
					local Name = tostring(type(index) == "string" and index or Value)
					if Options[Name] then
						if MultiSelect then Selected[Name] = nil else Selected = nil end
						Options[Name].nodes[1]:Destroy()
						table.clear(Options[Name])
						Options[Name] = nil
					end
				end
				
				GetOptions = function()
					return Options
				end
				
				AddNewOptions = function(List, Clear)
					if Clear then
						table.foreach(Options, RemoveOption)
					end
					table.foreach(List, AddOption)
					CallbackSelected()
					UpdateSelected()
				end
				
				table.foreach(DOptions, AddOption)
				CallbackSelected()
				UpdateSelected()
			end
			
			Button.Activated:Connect(Minimize)
			NoClickFrame.MouseButton1Down:Connect(Disable)
			NoClickFrame.MouseButton1Click:Connect(Disable)
			MainFrame:GetPropertyChangedSignal("Visible"):Connect(Disable)
			SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalculatePos)
			
			Button.Activated:Connect(CalculateSize)
			ScrollFrame.ChildAdded:Connect(CalculateSize)
			ScrollFrame.ChildRemoved:Connect(CalculateSize)
			CalculatePos()
			CalculateSize()
			
			local Dropdown = {}
			function Dropdown:Visible(...) Funcs:ToggleVisible(Button, ...) end
			function Dropdown:Destroy() Button:Destroy() end
			function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(Selected) end
			
			function Dropdown:Add(...)
				local NewOptions = {...}
				if type(NewOptions[1]) == "table" then
					table.foreach(Option, function(_,Name)
						AddOption(Name)
					end)
				else
					table.foreach(NewOptions, function(_,Name)
						AddOption(Name)
					end)
				end
			end
			function Dropdown:Remove(Option)
				for index, Value in pairs(GetOptions()) do
					if type(Option) == "number" and index == Option or Value.Name == "Option" then
						RemoveOption(index, Value.Value)
					end
				end
			end
			function Dropdown:Select(Option)
				if type(Option) == "string" then
					for _,Val in pairs(Options) do
						if Val.Name == Option then
							Val.Active()
						end
					end
				elseif type(Option) == "number" then
					for ind,Val in pairs(Options) do
						if ind == Option then
							Val.Active()
						end
					end
				end
			end
			function Dropdown:Set(Val1, Clear)
				if type(Val1) == "table" then
					AddNewOptions(Val1, not Clear)
				elseif type(Val1) == "function" then
					Callback = Val1
				end
			end
			return Dropdown
		end
 function Tab:AddSlider(Configs)
    local SName = Configs[1] or Configs.Name or Configs.Title or "Slider!"
    local SDesc = Configs.Desc or Configs.Description or ""
    local Min = Configs[2] or Configs.MinValue or Configs.Min or 10
    local Max = Configs[3] or Configs.MaxValue or Configs.Max or 100
    local Increase = Configs[4] or Configs.Increase or 1
    local Callback = Funcs:GetCallback(Configs, 6)
    local Flag = Configs[7] or Configs.Flag or false
    local Default = Configs[5] or Configs.Default or 25
    
    if CheckFlag(Flag) then Default = GetFlag(Flag) end
    Min, Max = Min / Increase, Max / Increase
    
    local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -180))
    
    local SliderHolder = Create("TextButton", Button, {
        Size = UDim2.new(0.45, 0, 1, 0),
        Position = UDim2.new(1, -10, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        AutoButtonColor = false,
        Text = "",
        BackgroundTransparency = 1
    })
    
    local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
        BackgroundColor3 = Theme["Color Stroke"],
        Size = UDim2.new(1, -45, 0, 6),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BorderSizePixel = 0
    }), "Stroke")
    Make("Corner", SliderBar, UDim.new(1, 0)) 
    
    local Indicator = InsertTheme(Create("Frame", SliderBar, {
        BackgroundColor3 = Theme["Color Theme"],
        Size = UDim2.fromScale(0.3, 1),
        BorderSizePixel = 0
    }), "Theme")
    Make("Corner", Indicator, UDim.new(1, 0))

    local SliderIcon = Create("Frame", SliderBar, {
        Size = UDim2.new(0, 14, 0, 14),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.3, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        ZIndex = 1
    })
    Make("Corner", SliderIcon, UDim.new(1, 0))
    
    local KnobStroke = Create("UIStroke", SliderIcon, {
        Color = Color3.fromRGB(0, 0, 0),
        Transparency = 0.85,
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    })

    local LabelVal = InsertTheme(Create("TextLabel", SliderHolder, {
        Size = UDim2.new(0, 35, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        BackgroundTransparency = 1,
        TextColor3 = Theme["Color Text"],
        Font = Enum.Font.FredokaOne,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right
    }), "Text")
    
    local UIScale = Create("UIScale", LabelVal)
    
    local BaseMousePos = Create("Frame", SliderBar, {
        Position = UDim2.new(0, 0, 0.5, 0),
        Visible = false
    })
    
    local function UpdateLabel(NewValue)
        local Number = tonumber(NewValue * Increase)
        Number = math.floor(Number * 100) / 100
        
        Default, LabelVal.Text = Number, tostring(Number)
        Funcs:FireCallback(Callback, Default)
    end
    
    local function ControlPos()
        local MousePos = UserInputService:GetMouseLocation()
        local APos = MousePos.X - SliderBar.AbsolutePosition.X
        local ConfigureDpiPos = APos / SliderBar.AbsoluteSize.X
        
        local ScaledPos = math.clamp(ConfigureDpiPos, 0, 1)
        SliderIcon.Position = UDim2.new(ScaledPos, 0, 0.5, 0)
    end
    
    local function UpdateValues()
        Indicator.Size = UDim2.new(SliderIcon.Position.X.Scale, 0, 1, 0)
        local SliderPos = SliderIcon.Position.X.Scale
        local NewValue = math.floor(((SliderPos * Max) / Max) * (Max - Min) + Min)
        UpdateLabel(NewValue)
    end
    
    local isDragging = false

    SliderHolder.MouseEnter:Connect(function()
        if not isDragging then
            CreateTween({SliderIcon, "Size", UDim2.new(0, 16, 0, 16), 0.15})
        end
    end)

    SliderHolder.MouseLeave:Connect(function()
        if not isDragging then
            CreateTween({SliderIcon, "Size", UDim2.new(0, 14, 0, 14), 0.15})
        end
    end)

    SliderHolder.MouseButton1Down:Connect(function()
        isDragging = true
        CreateTween({SliderIcon, "Size", UDim2.new(0, 18, 0, 18), 0.15})
        Container.ScrollingEnabled = false
        
        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do 
            task.wait()
            ControlPos()
        end
        
        isDragging = false
        CreateTween({SliderIcon, "Size", UDim2.new(0, 14, 0, 14), 0.15})
        Container.ScrollingEnabled = true
        SetFlag(Flag, Default)
    end)
    
    LabelVal:GetPropertyChangedSignal("Text"):Connect(function()
        UIScale.Scale = 0.8
        CreateTween({UIScale, "Scale", 1.15, 0.08})
        task.wait(0.08)
        CreateTween({UIScale, "Scale", 1, 0.1})
    end)
    
    function SetSlider(NewValue)
        if type(NewValue) ~= "number" then return end
        
        local MinVal, MaxVal = Min * Increase, Max * Increase
        local SliderPos = (NewValue - MinVal) / (MaxVal - MinVal)
        
        SetFlag(Flag, NewValue)
        CreateTween({ SliderIcon, "Position", UDim2.fromScale(math.clamp(SliderPos, 0, 1), 0.5), 0.25, true })
    end
    
    SetSlider(Default)
    SliderIcon:GetPropertyChangedSignal("Position"):Connect(UpdateValues)
    UpdateValues()
    
    local Slider = {}
    function Slider:Set(NewVal1, NewVal2)
        if NewVal1 and NewVal2 then
            LabelFunc:SetTitle(NewVal1)
            LabelFunc:SetDesc(NewVal2)
        elseif type(NewVal1) == "string" then
            LabelFunc:SetTitle(NewVal1)
        elseif type(NewVal1) == "function" then
            Callback = NewVal1
        elseif type(NewVal1) == "number" then
            SetSlider(NewVal1)
        end
    end
    function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(tonumber(Default)) end
    function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function Slider:Destroy() Button:Destroy() end
    return Slider
end
function Tab:AddTextBox(Configs)
    local TName = Configs[1] or Configs.Name or Configs.Title or "Text Box"
    local TDesc = Configs.Desc or Configs.Description or ""
    local TDefault = Configs[2] or Configs.Default or ""
    local TPlaceholderText = Configs[5] or Configs.PlaceholderText or "Input..."
    local TClearText = Configs[3] or Configs.ClearText or false
    local Callback = Funcs:GetCallback(Configs, 4)
    
    if type(TDefault) ~= "string" then
        TDefault = tostring(TDefault)
    end
    if TDefault:gsub(" ", ""):len() < 1 then
        TDefault = ""
    end
    
    local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
    
    local SelectedFrame = InsertTheme(Create("Frame", Button, {
        Size = UDim2.new(0, 150, 0, 18),
        Position = UDim2.new(1, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Background"] or Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0
    }), "Background")
    Make("Corner", SelectedFrame, UDim.new(0, 4))
    
    local BoxStroke = InsertTheme(Create("UIStroke", SelectedFrame, {
        Color = Theme["Color Stroke"],
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }), "Stroke")
    
    local Pencil = Create("ImageLabel", SelectedFrame, {
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0, 8, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Image = "rbxassetid://15637081879",
        BackgroundTransparency = 1,
        ImageColor3 = Theme["Color Text"] or Color3.fromRGB(255, 255, 255),
        ImageTransparency = 0.5
    })
    
    local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
        Size = UDim2.new(1, -30, 1, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 26, 0.5, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Ubuntu,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Theme["Color Text"],
        ClearTextOnFocus = TClearText,
        PlaceholderText = TPlaceholderText,
        Text = TDefault, 
        ClipsDescendants = true
    }), "Text")
    
    local TextBox = { OnChanging = false }
    
    local function FireInput()
        local Text = TextBoxInput.Text
        if TextBox.OnChanging then 
            Text = TextBox.OnChanging(Text) or Text 
            TextBoxInput.Text = Text
        end
        Funcs:FireCallback(Callback, Text)
    end
    
    -- Efeitos Visuais ao Focar/Desfocar (Brilho do Lápis e da Borda)
    TextBoxInput.Focused:Connect(function()
        CreateTween({Pencil, "ImageTransparency", 0, 0.2})
        CreateTween({Pencil, "ImageColor3", Theme["Color Theme"], 0.2})
        CreateTween({BoxStroke, "Color", Theme["Color Theme"], 0.2})
    end)
    
    TextBoxInput.FocusLost:Connect(function()
        CreateTween({Pencil, "ImageTransparency", 0.5, 0.2})
        CreateTween({Pencil, "ImageColor3", Theme["Color Text"], 0.2})
        CreateTween({BoxStroke, "Color", Theme["Color Stroke"], 0.2})
        FireInput()
    end)
    
    -- Dispara o callback inicial se existir um Default válido
    if TDefault ~= "" then
        task.spawn(FireInput)
    end
    
    -- Funções Públicas da TextBox
    function TextBox:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function TextBox:Destroy() Button:Destroy() end
    function TextBox:Callback(...) Funcs:InsertCallback(Callback, ...) end
    
    function TextBox:Set(Val1, Val2)
        if type(Val1) == "string" and type(Val2) == "string" then
            LabelFunc:SetTitle(Val1)
            LabelFunc:SetDesc(Val2)
        elseif type(Val1) == "string" then
            TextBoxInput.Text = Val1
            FireInput()
        elseif type(Val1) == "function" then
            Callback = Val1
        end
    end
    
    return TextBox
end
function Tab:AddDiscordInvite(Configs)
    local Title = Configs[1] or Configs.Name or Configs.Title or "Discord Server"
    local Desc = Configs.Desc or Configs.Description or "Join our community for updates and support!"
    local Logo = Configs[2] or Configs.Logo or "rbxassetid://10723041280"
    local Invite = Configs[3] or Configs.Invite or "https://discord.gg/"

    local TweenService = game:GetService("TweenService")
    local TweenFast = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    local InviteHolder = Create("Frame", Container, {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Name = "DiscordInviteOption",
        BackgroundTransparency = 1
    })

    local FrameHolder = InsertTheme(Create("Frame", InviteHolder, {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme["Color Hub 2"],
        ClipsDescendants = false
    }), "Frame")
    
    Make("Corner", FrameHolder, UDim.new(0, 10))
    local Stroke = Make("Stroke", FrameHolder)
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Stroke.Color = Color3.fromRGB(255, 255, 255)
    Stroke.Transparency = 0.9
    Stroke.Thickness = 1.2

    Create("ImageLabel", FrameHolder, {
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.55),
        Size = UDim2.new(1, 14, 1, 14),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6015897843",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.6,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 499, 499),
        ZIndex = 0
    })

    local Padding = Create("UIPadding", FrameHolder, {
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10)
    })

    local HeaderFrame = Create("Frame", FrameHolder, {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        ZIndex = 2
    })

    local ImageLabel = Create("ImageLabel", HeaderFrame, {
        Size = UDim2.fromOffset(36, 36),
        Position = UDim2.fromOffset(0, 0),
        Image = Logo ~= "" and Logo or "rbxassetid://10723041280",
        BackgroundTransparency = 1,
        ZIndex = 2
    })
    Make("Corner", ImageLabel, UDim.new(0, 8))
    local LogoStroke = Make("Stroke", ImageLabel)
    LogoStroke.Transparency = 0.85

    local InviteTag = Create("TextLabel", HeaderFrame, {
        Size = UDim2.new(0, 0, 0, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        TextColor3 = Color3.fromRGB(88, 101, 242),
        BackgroundColor3 = Color3.fromRGB(88, 101, 242),
        BackgroundTransparency = 0.88,
        Font = Enum.Font.Ubuntu,
        TextSize = 9,
        Text = "  " .. Invite .. "  ",
        ZIndex = 2
    })
    Make("Corner", InviteTag, UDim.new(0, 4))

    local LTitle = InsertTheme(Create("TextLabel", HeaderFrame, {
        Size = UDim2.new(1, -120, 0, 16),
        Position = UDim2.fromOffset(44, 0),
        Font = Enum.Font.Ubuntu,
        TextColor3 = Theme["Color Text"],
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextSize = 12,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Text = Title,
        ZIndex = 2
    }), "Text")

    local LDesc = InsertTheme(Create("TextLabel", HeaderFrame, {
        Size = UDim2.new(1, -44, 0, 16),
        Position = UDim2.fromOffset(44, 18),
        Font = Enum.Font.Ubuntu,
        TextColor3 = Theme["Color Dark Text"],
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextSize = 10,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Text = Desc,
        ZIndex = 2
    }), "DarkText")

    local JoinButton = Create("TextButton", FrameHolder, {
        Size = UDim2.new(1, 0, 0, 26),
        Position = UDim2.new(0, 0, 0, 46),
        Text = "Join Discord Server",
        Font = Enum.Font.Ubuntu,
        TextSize = 11,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(88, 101, 242),
        AutoButtonColor = false,
        ZIndex = 2
    })
    Make("Corner", JoinButton, UDim.new(0, 6))

    JoinButton.MouseEnter:Connect(function()
        TweenService:Create(JoinButton, TweenFast, {BackgroundColor3 = Color3.fromRGB(71, 82, 196)}):Play()
    end)

    JoinButton.MouseLeave:Connect(function()
        if not JoinButton:GetAttribute("Copied") then
            TweenService:Create(JoinButton, TweenFast, {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()
        end
    end)

    local ClickDelay = false
    JoinButton.Activated:Connect(function()
        if setclipboard then
            setclipboard(Invite)
        end
        
        if ClickDelay then return end
        ClickDelay = true
        JoinButton:SetAttribute("Copied", true)

        TweenService:Create(JoinButton, TweenFast, {
            BackgroundColor3 = Color3.fromRGB(43, 165, 90)
        }):Play()
        JoinButton.Text = "Link Copied to Clipboard!"

        task.wait(2.5)

        JoinButton:SetAttribute("Copied", false)
        TweenService:Create(JoinButton, TweenFast, {
            BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        }):Play()
        JoinButton.Text = "Join Discord Server"
        ClickDelay = false
    end)

    local DiscordInvite = {}
    function DiscordInvite:Destroy() InviteHolder:Destroy() end
    function DiscordInvite:Visible(...) Funcs:ToggleVisible(InviteHolder, ...) end
    return DiscordInvite
end
		return Tab
	end
	
	CloseButton.Activated:Connect(Window.CloseBtn)
	MinimizeButton.Activated:Connect(Window.MinimizeBtn)
	return Window
end
return NutriexLibrary
