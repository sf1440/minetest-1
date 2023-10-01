-- Written By Songyuhao Shi
minetest.log("object_test_obj")

minetest.register_chatcommand("lua_object", {
    description = "List all avaliable chat commands",
    func = function(name, param)
        if param == "" then
            minetest.log("Enter a page number - /lua_object #")
        end
        if param == "1" then
            minetest.log("lua_object_remove\n")
            minetest.log("lua_object_get_pos\n")
            minetest.log("lua_object_set_pos #\n")
            minetest.log("lua_object_move_to #\n")
            minetest.log("lua_object_punch - Not Working\n")
            minetest.log("lua_object_right_click\n")
            minetest.log("lua_object_set_hp - Not Working\n")
            minetest.log("lua_object_get_hp\n")
            minetest.log("lua_object_get_inventory\n")
            minetest.log("lua_object_get_weild_list\n")
        end
        if param == "2" then
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
        end
    end,
})

-- l_remove
minetest.register_chatcommand("lua_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("lua_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:remove()
            end
        end
    end,
})

-- native_remove
minetest.register_chatcommand("native_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("native_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:native_remove()
            end
        end
    end,
})

-- l_get_pos
minetest.register_chatcommand("lua_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("lua_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- native_get_pos
minetest.register_chatcommand("native_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("native_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:native_get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- l_set_pos
minetest.register_chatcommand("lua_object_set_pos", {
    description = "Test Object Set Pos - /lua_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})

-- native_set_pos
minetest.register_chatcommand(" native_object_set_pos", {
    description = "Test Object Set Pos - /native_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:native_set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})

-- l_move_to
minetest.register_chatcommand("lua_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- native_move_to
minetest.register_chatcommand("native_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:native_move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- l_punch
minetest.register_chatcommand("lua_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                for i, floorobj in ipairs(saos) do
                    if not floorobj:isplayer() then
                        -- Wear all objects on floor
                        object:punch(floorobj)
                    end
                end
            end
        end
    end,
})

-- native_punch
minetest.register_chatcommand("native_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                for i, floorobj in ipairs(saos) do
                    if not floorobj:isplayer() then
                        -- Wear all objects on floor
                        object:native_punch(floorobj)
                    end
                end
            end
        end
    end,
})

-- l_right_click
-- right_click(self, clicker)
minetest.register_chatcommand("lua_object_right_click", {
    description = "Test Object Right Click",
    func = function(name, param)
        minetest.log("lua_object_right_click is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        -- Insert Lua code here that if saos == 2 then set plyr = saos[0] and rclk = saos[1]
        if #saos == 2 then
            local plyr = saos[1]
            local rclk = saos[2]
            plyr:right_click(rclk)
            minetest.log("Object: "..plyr:get_player_name().." right clicked on ".. rclk:get_entity_name())
        end
    end,
})

--set_hp

--get_hp
-- get_hp(self)
minetest.register_chatcommand("lua_object_get_hp", {
    description = "Get the player's current HP",
    func = function(name, param)
        minetest.log("lua_object_get_hp is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)
        for i, object in ipairs(saos) do
            local a = object:get_hp()
            minetest.log("The object's HP is currently " ..dump(a))
        end
    end,
})

-- get_inventory(self)
minetest.register_chatcommand("lua_object_get_inventory", {
    description = "Check player's inventory and returns inventory functions",
    func = function(name, param)
        minetest.log("lua_object_get_inventory is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_inventory()
        minetest.log(dump(a:get_list("main")))
    end,
})

-- get_weild_list(self)
minetest.register_chatcommand("lua_object_get_weild_list", {
    description = "Get the player's current HP",
    func = function(name, param)
        minetest.log("lua_object_get_weild_list is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_wield_list()
        minetest.log("The player's wield list is " ..dump(a))
    end,
})

-- l_set_breath
minetest.register_chatcommand("lua_object_set_breath", {
    description = "Test Set Breath - /lua_object_set_breath (breath_value)",
    func = function(name, param)
        minetest.log("lua_object_set_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath_value = tonumber(param)
        if not breath_value then
            minetest.log("Invalid breath value")
            return
        end

        player:set_breath(breath_value)
        minetest.log("Player breath set to: " .. breath_value)
    end,
})

-- l_get_breath
minetest.register_chatcommand("lua_object_get_breath", {
    description = "Test Get Breath",
    func = function(name, param)
        minetest.log("lua_object_get_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath = player:get_breath()
        minetest.log("Player's current breath: " .. breath)
    end,
})

-- native_set_breath
minetest.register_chatcommand("native_object_set_breath", {
    description = "Test Set Breath - /native_object_set_breath (breath_value)",
    func = function(name, param)
        minetest.log("native_object_set_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath_value = tonumber(param)
        if not breath_value then
            minetest.log("Invalid breath value")
            return
        end

        player:native_set_breath(breath_value)
        minetest.log("Player breath set to: " .. breath_value)
    end,
})

-- native_get_breath
minetest.register_chatcommand("native_object_get_breath", {
    description = "Test Get Breath",
    func = function(name, param)
        minetest.log("native_object_get_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath = player:native_get_breath()
        minetest.log("Player's current breath: " .. breath)
    end,
})



-- l_set_fov
minetest.register_chatcommand("lua_object_set_fov", {
    description = "Test Set FOV - /lua_object_set_fov (degrees) (is_multiplier) (transition_time)",
    func = function(name, param)
        minetest.log("lua_object_set_fov is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end
        
        local degrees, is_multiplier, transition_time = string.match(param, "^(%-?%d+%.?%d*) (%a+) (%d+%.?%d*)$")
        degrees = tonumber(degrees)
        transition_time = tonumber(transition_time)
        is_multiplier = is_multiplier == "true"
        
        if not degrees or is_multiplier == nil or not transition_time then
            minetest.log("Invalid FOV values")
            return
        end
        
        player:set_fov(degrees, is_multiplier, transition_time)
        minetest.log("Player FOV set to: degrees: " .. degrees .. " is_multiplier: " .. tostring(is_multiplier) .. " transition_time: " .. transition_time)
    end,
})

-- l_get_fov
minetest.register_chatcommand("lua_object_get_fov", {
    description = "Test Get FOV",
    func = function(name, param)
        minetest.log("lua_object_get_fov is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local degrees, is_multiplier, transition_time = player:get_fov()
        minetest.log("Player's current FOV: degrees: " .. degrees .. " is_multiplier: " .. tostring(is_multiplier) .. " transition_time: " .. transition_time)
    end,
})

-- l_set_attribute
minetest.register_chatcommand("lua_object_set_attribute", {
    description = "Test Set Attribute - /lua_object_set_attribute (attribute) (value)",
    func = function(name, param)
        minetest.log("lua_object_set_attribute is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local attribute, value = string.match(param, "^([^ ]+) (.+)$")
        
        if not attribute or not value then
            minetest.log("Invalid attribute or value")
            return
        end
        
        player:set_attribute(attribute, value)
        minetest.log("Player " .. attribute .. " set to: " .. value)
    end,
})

-- l_get_attribute
minetest.register_chatcommand("lua_object_get_attribute", {
    description = "Test Get Attribute - /lua_object_get_attribute (attribute)",
    func = function(name, param)
        minetest.log("lua_object_get_attribute is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local attribute = param
        
        if not attribute then
            minetest.log("Invalid attribute")
            return
        end
        
        local value = player:get_attribute(attribute)
        minetest.log("Player's " .. attribute .. ": " .. (value or "nil"))
    end,
})

-- l_get_meta
minetest.register_chatcommand("lua_object_get_meta", {
    description = "Test Get Meta",
    func = function(name, param)
        minetest.log("lua_object_get_meta is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local meta = player:get_meta()
        
        if meta then
            minetest.log("Player Meta Retrieved")
        else
            minetest.log("Failed to Retrieve Player Meta")
        end
    end,
})


-- native_set_attribute
minetest.register_chatcommand("native_set_attribute", {
    description = "Test Set Attribute",
    func = function(name, param)
        minetest.log("native_set_attribute is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        -- Assuming param is "attribute value"
        local attribute, value = string.match(param, "([^ ]+) (.+)")
        if not attribute or not value then
            minetest.log("Invalid parameters")
            return
        end

        player:native_set_attribute(attribute, value)
        minetest.log("Attribute " .. attribute .. " set to " .. value)
    end,
})

-- native_get_attribute
minetest.register_chatcommand("native_get_attribute", {
    description = "Test Get Attribute",
    func = function(name, param)
        minetest.log("native_get_attribute is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        if not param then
            minetest.log("Invalid parameter")
            return
        end

        local value = player:native_get_attribute(param)
        if value then
            minetest.log("Attribute " .. param .. " is " .. value)
        else
            minetest.log("Attribute " .. param .. " not found")
        end
    end,
})

-- native_get_meta
minetest.register_chatcommand("native_get_meta", {
    description = "Test Get Meta",
    func = function(name, param)
        minetest.log("native_get_meta is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local meta = player:native_get_meta()
        if meta then
            -- As an example, if param is an attribute name, get it from the MetaDataRef
            if param then
                local value = meta:get_string(param)
                if value then
                    minetest.log("Meta attribute " .. param .. " is " .. value)
                else
                    minetest.log("Meta attribute " .. param .. " not found")
                end
            else
                minetest.log("Meta data retrieved")
            end
        else
            minetest.log("Meta data not found")
        end
    end,
})

--native_set_fov
minetest.register_chatcommand("native_set_fov", {
    description = "Test Set FOV - /native_set_fov (degrees) (is_multiplier) (transition_time)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return true, "Player not found"
        end
        
        local degrees, is_multiplier, transition_time = string.match(param, "(%S+)%s*(%S*)%s*(%S*)")
        
        degrees = tonumber(degrees)
        is_multiplier = is_multiplier == "true"
        transition_time = tonumber(transition_time) or 0 -- default to 0 if not provided
        
        if not degrees then
            return true, "Invalid degrees value"
        end
        
        player:native_set_fov(degrees, is_multiplier, transition_time)
        return true, "Player FOV set to: " .. degrees .. ", is_multiplier: " .. tostring(is_multiplier) .. ", transition_time: " .. transition_time
    end,
})


--native_get_fov
minetest.register_chatcommand("native_get_fov", {
    description = "Test Get FOV",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return true, "Player not found"
        end
        
        local degrees, is_multiplier, transition_time = player:native_get_fov()
        return true, "Player's current FOV: " .. degrees .. ", is_multiplier: " .. tostring(is_multiplier) .. ", transition_time: " .. transition_time
    end,
})

