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
    turtle.select(logslot)
    local logc = turtle.getItemCount()
    turtle.dropDown(logc - 1)
    tortoise.goReturn()
    tortoise.forward()
    turtle.suckUp()
    turtle.select(pieceslot)
    local piecec = turtle.getItemCount()
    if piecec > 1 then
        turtle.dropUp(piecec - 1)
    end
    tortoise.turnLeft()
    for i=1,16 do
        turtle.select(i)
        if turtle.compareTo(pieceslot) and i ~= fuelslot then
            if i == pieceslot then
                local c = turtle.getItemCount()
                if c > 1 then
                    turtle.drop(c - 1)
                end
            else
                turtle.drop()
            end
        end
    end
    tortoise.turnRight()
    tortoise.forward()
    tortoise.forward()
    tortoise.turnLeft()
    for i=1,16 do
        turtle.select(i)
        if i == logslot or i == stickslot or i == appleslot or i == saplingslot or i == pieceslot or i == fuelslot then
            local c = turtle.getItemCount()
            if c > 1 then
                turtle.drop(c - 1)
            end
        else
            turtle.drop()
        end
    end
    tortoise.turnLeft()
    tortoise.forward()
    tortoise.forward()
    tortoise.turnRight()
    os.sleep(30)
end