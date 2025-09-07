-- control.lua
-- Factorio Foundry Mod
-- Main control script

script.on_init(function()
    -- Initialization code here
end)

script.on_configuration_changed(function(data)
    -- Handle mod configuration changes here
end)

script.on_load(function()
    -- Code to run when a save is loaded
    print("Nauvis Foundry Mod loaded 1")
    game.print("Nauvis Foundry Mod loaded 2")
end)

script.on_event(defines.events.on_console_command, function()
    
end)

-- Example event handler
-- script.on_event(defines.events.on_tick, function(event)
--     -- Code to run every tick
-- end)