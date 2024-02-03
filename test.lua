local fuelslot = 16
local log = 1
local sapling = 2
local x, y, z = 0, 0, 0
local roundssince = 0
while true do
    if turtle.getFuelLevel() < 100 then
        write("refueling from ")
        write(turtle.getFuelLevel())
        write(" to ")
        turtle.select(fuelslot)
        turtle.refuel()
        print(turtle.getFuelLevel())
        write("time since last refuel: ")
        print(roundssince)
        roundssince = 0
    else
        roundssince = roundssince + 1
    end
    turtle.forward()
    x = x + 1
    while not turtle.inspectDown() do
        turtle.turnRight()
        turtle.select(log)
        if turtle.compare() then
            turtle.dig()
            turtle.forward()
            z = z + 1
            while turtle.compareUp() do
                turtle.digUp()
                turtle.up()
                y = y + 1
            end
        end
        while y > 0 do
            turtle.down()
            y = y - 1
        end
        while z > 0 do 
            turtle.back()
            z = z - 1
        end
        turtle.select(sapling)
        turtle.place()
        if turtle.compare() then 
            turtle.suck()
            turtle.suckDown()
            turtle.turnLeft()
            turtle.forward()
            x = x + 1
        else
            turtle.suckDown()
            turtle.forward()
            turtle.suckDown()
            turtle.forward()
            z = z + 2
            turtle.turnRight()
            while x > 0 do
                turtle.suckDown()
                turtle.forward()
                x = x - 1
            end
            turtle.turnRight() 
            turtle.suckDown()
            turtle.forward() 
            turtle.suckDown()
            turtle.suck()
            turtle.forward() 
            z = z - 2
            turtle.turnRight()
        end
    end
    turtle.select(log)
    local totallog = turtle.getItemCount()
    turtle.dropDown(totallog - 1)
    turtle.select(sapling)
    turtle.suckDown()
    for i=1,16 do
        if i ~= log and i ~= sapling and i ~= fuelslot then
            turtle.select(i)
            turtle.dropDown()
        end
    end
    os.sleep(60)
end