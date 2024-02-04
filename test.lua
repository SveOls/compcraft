local fuelslot = 16
local log = 1
local sapling = 2
local roundssince = 0
os.loadAPI("tortoise")
while true do
    turtle.select(fuelslot)
    peripheral.call("back", "clear")
    peripheral.call("back", "write", turtle.getItemCount().."\n")
    peripheral.call("back", "write", turtle.getFuelLevel())
    if turtle.getFuelLevel() < 100 then
        write("refueling from ")
        write(turtle.getFuelLevel())
        write(" to ")
        turtle.select(fuelslot)
        tortoise.refuel()
        print(turtle.getFuelLevel())
        write("time since last refuel: ")
        print(roundssince)
        roundssince = 0
    else
        roundssince = roundssince + 1
    end
    tortoise.forward()
    while not turtle.inspectDown() do
        tortoise.turnRight()
        turtle.select(log)
        local tree = turtle.compare()
        if tree then
            tortoise.setReturn()
            turtle.dig()
            tortoise.forward()
            while turtle.compareUp() do
                turtle.digUp()
                tortoise.up()
            end
        end
        tortoise.goReturn()
        turtle.select(sapling)
        turtle.place()
        if turtle.compare() then 
            turtle.suck()
            turtle.suckDown()
            tortoise.turnLeft()
            turtle.place()
            if turtle.compare() then
                tortoise.turnLeft()
            else
                turtle.select(log)
                if turtle.compare() then
                    tortoise.turnLeft()
                else
                    turtle.forward()
                end
            end
        else
            turtle.suckDown()
            tortoise.forward()
        end
    end
    tortoise.turnRight()
    turtle.select(log)
    local totallog = turtle.getItemCount()
    turtle.dropDown(totallog - 1)
    for i=1,16 do
        if i ~= log and i ~= sapling and i ~= fuelslot then
            turtle.select(i)
            turtle.dropDown()
        end
    end
    os.sleep(60)
end