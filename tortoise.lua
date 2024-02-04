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
    local a = table.remove(checkpoints)
    while(a) do
        if a == "down" then
            turtle.digUp()
            up()
        elseif a == "up" then
            turtle.digDown()
            down()
        elseif a == "forward" then
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.dig()
            turtle.turnLeft()
            turtle.turnLeft()
            back()
        elseif a == "back" then
            turtle.dig()
            forward()
        end
        a = checkpoints.pop()
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
    if turtle.up() then
        y = y + 1
        checkpoints.push("up")
    end
end

function down() 
    if turtle.down() then
        y = y - 1
        checkpoints.push("down")
    end
end

function forward()
    if turtle.forward() then
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
end

function back()
    if turtle.back() then
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
end

function turnLeft()
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
    turtle.turnLeft()
end

function turnRight()
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
    turtle.turnRight()
end