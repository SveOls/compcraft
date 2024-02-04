local logslot = 1
local stickslot = 2
local saplingslot = 3
local appleslot = 4
local pieceslot = 5
local fuelslot = 16
os.loadAPI("tortoise")
while true do
    if turtle.getFuelLevel() < 200 then
        turtle.select(fuelslot)
        tortoise.refuel()
    end
    turtle.suck()
    turtle.suck()
    turtle.suck()
    tortoise.turnRight()
    tortoise.forward()
    tortoise.setReturn()
    tortoise.up()
    tortoise.up()
    tortoise.forward()
    while turtle.detectDown() do
        turtle.select(logslot)
        local logc = turtle.getItemCount()
        turtle.dropDown(logc - 1)
        tortoise.forward()
    end
    tortoise.goReturn()
    tortoise.setReturn()
    tortoise.forward()
    while turtle.detectUp() do
        turtle.select(fuelslot)
        turtle.suckUp()
        turtle.select(pieceslot)
        local piecec = turtle.getItemCount()
        if piecec > 1 then
            turtle.dropUp(piecec - 1)
        end
        tortoise.forward()
    end
    tortoise.goReturn()
    tortoise.forward()
    tortoise.turnLeft()
    for i=1,16 do
        turtle.select(i)
        if turtle.compareTo(pieceslot) and i ~= fuelslot and i ~= pieceslot then
            turtle.drop()
        end
    end
    tortoise.turnRight()
    tortoise.forward()
    tortoise.forward()
    tortoise.turnLeft()
    for i=1,16 do
        turtle.select(i)
        if i ~= logslot and i ~= fuelslot and i ~= pieceslot then
            if  i == stickslot or i == appleslot or i == saplingslot then
                local c = turtle.getItemCount()
                if c > 1 then
                    turtle.drop(c - 1)
                end
            else
                turtle.drop()
            end
        end
    end
    tortoise.turnLeft()
    tortoise.forward()
    tortoise.forward()
    tortoise.forward()
    tortoise.forward()
    tortoise.turnRight()
    os.sleep(120)
end