local FuncsV3 = {}
local SaveConfig = {}

local function Checker(Val, Val1, Val2)
  return typeof(Val) == Val1 and Val or Val2
end

function FuncsV3:SetTable(path)
  SaveConfig = type(path) == "table" and path or {}
end

function FuncsV3:Toggle(Tab, Name, Content, Default, Callback)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))
  Callback = Checker(Callback, "function", function() end)

  local _default = Default == "Save"
  and Checker(SaveConfig[Name], "boolean", false)
  or Checker(Default, "boolean", false)

  return Tab:AddToggle({
    Title = Name,
    Content = Content,
    Default = _default,
    Callback = Callback
  })
end

function FuncsV3:Button(Tab, Name, Content, Callback)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))
  Callback = Checker(Callback, "function", function() end)

  return Tab:AddButton({
    Title = Name,
    Content = Content,
    Icon = "rbxassetid://16932740082",
    Callback = Callback
  })
end

function FuncsV3:Slider(Tab, Name, Content, Increment, Min, Max, Default, Callback)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))
  Increment = Checker(Increment, "number", 1)
  Min = Checker(Min, "number", 0)
  Max = Checker(Max, "number", 100)
  Callback = Checker(Callback, "function", function() end)

  local _default = Default == "Save"
  and Checker(SaveConfig[Name], "number", Min)
  or Checker(Default, "number", Min)

  return Tab:AddSlider({
    Title = Name,
    Content = Content,
    Increment = Increment,
    Min = Min,
    Max = Max,
    Default = _default,
    Callback = Callback
  })
end

function FuncsV3:Dropdown(Tab, Name, Content, multi, options, Default, Callback)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))
  multi = Checker(multi, "boolean", false)
  options = Checker(options, "table", { "" })
  Callback = Checker(Callback, "function", function() end)

  local _default
  local sourceVal = (Default == "Save") and SaveConfig[Name] or (SaveConfig[Name] or Default)
  if type(sourceVal) == "table" then
    _default = sourceVal
  elseif type(sourceVal) == "string" and sourceVal ~= "" then
    _default = {sourceVal}
  else
    _default = {}
  end

  return Tab:AddDropdown({
    Title = Name,
    Content = Content,
    Multi = multi,
    Options = options,
    Default = _default,
    Callback = Callback
  })
end

function FuncsV3:Textbox(Tab, Name, Content, Default, Callback)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))
  Callback = Checker(Callback, "function", function() end)

  local _default = Default == "Save"
  and Checker(SaveConfig[Name], "string", "")
  or Checker(Default, "string", "")

  return Tab:AddInput({
    Title = Name,
    Content = Content,
    Default = _default,
    Callback = Callback
  })
end

function FuncsV3:Label(Tab, Name, Content)
  Name = Checker(Name, "string", tostring(Name))
  Content = Checker(Content, "string", tostring(Content))

  return Tab:AddParagraph({
    Title = Name,
    Content = Content
  })
end

return FuncsV3