x = 0
y = 0
z = 0
facing = "front"
checkpoints = {}
save_check = false

function setReturn()
    save_check = true
end

function goReturn()
    save_check = false
    local a = table.remove(checkpoints)
    while(a) do
        if a == "down" then
            turtle.digUp()
            up()
        elseif a == "up" then
            turtle.digDown()
            down()
        elseif a == "forward" then
            local t = back()
            print(t)
            if not t then
                print("what")
                turtle.turnLeft()
                turtle.turnLeft()
                turtle.dig()
                turtle.turnLeft()
                turtle.turnLeft()
                back()
            end
        elseif a == "back" then
            turtle.dig()
            forward()
        elseif a == "turnRight" then
            turnLeft()
        elseif a == "turnLeft" then
            turnRight()
        end
        a = table.remove(checkpoints)
    end
end

function checkpoints.push(dir)
    if save_check then
        table.insert(checkpoints, dir)
    end
end

function debug()
    print("["..x..", "..y..", "..z.."]")
    print(facing)
end

function refuel()
    local itemc = turtle.getItemCount()
    if itemc > 0 then
        turtle.refuel(itemc - 1)
    end
end

function groundLevel()
    return y > 0 
end

function up()
    local r = turtle.up()
    if r then
        y = y + 1
        checkpoints.push("up")
    end
    return r
end

function down()
    local r = turtle.down()
    if r then
        y = y - 1
        checkpoints.push("down")
    end
    return r
end

function forward()
    local r = turtle.forward()
    if r then
        checkpoints.push("forward")
        if facing == "front" then
            x = x + 1
        elseif facing == "left" then
            z = z - 1
        elseif facing == "back" then 
            x = x - 1
        elseif facing == "right" then
            z = z + 1
        end
    end
    return r
end

function back()
    local r = turtle.back()
    if r then
        checkpoints.push("back")
        if facing == "front" then
            x = x - 1
        elseif facing == "left" then
            z = z + 1
        elseif facing == "back" then 
            x = x + 1
        elseif facing == "right" then
            z = z - 1
        end
    end
    return r
end

function turnLeft()
    local r = turtle.turnLeft()
    if r then
        checkpoints.push("turnLeft")
        if facing == "front" then
            facing = "left"
        elseif facing == "left" then
            facing = "back" 
        elseif facing == "back" then 
            facing = "right"
        elseif facing == "right" then
            facing = "front"
        end
    end
    return r
end

function turnRight()
    local r = turtle.turnRight()
    if r then
        checkpoints.push("turnRight")
        if facing == "front" then
            facing = "right"
        elseif facing == "left" then
            facing = "front" 
        elseif facing == "back" then 
            facing = "left"
        elseif facing == "right" then
            facing = "back"
        end
    end
    return r
end