local seed = 1
local fuelslot = 16
os.loadAPI("tortoise")
while true do
    turtle.select(fuelslot)
    if turtle.getFuelLevel() < 1000 then
        tortoise.refuel()
    end
    local distance = 0
    turtle.select(seed)
    while tortoise.forward() do
        distance = distance + 1
        tortoise.turnLeft()
        if tortoise.forward() then
            turtle.digDown()
            tortoise.back()
        end
        tortoise.place()
        tortoise.turnLeft()
        tortoise.turnLeft()
        if tortoise.forward() then
            turtle.digDown()
            tortoise.back()
        end
        tortoise.place()
        tortoise.turnLeft()
    end
    while distance > 0 do
        tortoise.back()
        distance = distance - 1
    end
    os.sleep(60)
end