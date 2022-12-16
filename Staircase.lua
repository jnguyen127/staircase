function detectF()
    checkFuel()
    while turtle.detect()
    do
        turtle.dig()
        sleep(0.5)
    end
    turtle.forward()
end 

function detectD()
    checkFuel()
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.down()
end 

function digF6()
    checkFuel()
    for i = 0, 4
    do  
        detectF()
    end
end

function goForwardR()
    checkFuel()
    digF6()
    turtle.turnRight()
    detectF()
    turtle.turnRight()
end

function goForwardL()
    checkFuel()
    digF6()
    turtle.turnLeft()
    detectF()
    turtle.turnLeft()
end

function ClearLeftToRight()
    checkFuel()
    goForwardR()
    goForwardL()
    goForwardR()
    goForwardL()
    digF6()
    turtle.turnRight()
    turtle.turnRight()
    for i = 0, 3
    do
        detectF()
    end
end

function checkFuel()
    if turtle.getFuelLevel() < 100 then
        for i = 13, 16
        do
            turtle.select(i)
            if (turtle.getItemDetail(i) == "minecraft:coal" or turtle.getItemDetail(i) == "minecraft:charcoal") and turtle.getItemCount(i) < 1 then
                print("Refueling!")
                turtle.refuel()
                break
            end
            if i == 16 and turtle.getItemCount(i) < 1 and (turtle.getItemDetail(i) ~= "minecraft:coal" or turtle.getItemDetail(i) ~= "minecraft:charcoal") then 
                print("No more fuel! :(")
                return
            end
        end
    end
end

function placeStairs()
    for i = 1, 8
    do
        turtle.select(i)
        if turtle.getItemDetail(i) == "minecraft:deepslate_tile_stairs" and turtle.getItemCount(i) < 1 then
            print("Placing stairs!", i)
            turtle.place()
            break
        end
        print(turtle.getItemDetail(i))
        if i == 8 and turtle.getItemCount(i) < 1 and turtle.getItemDetail(i) ~= "minecraft:deepslate_tile_stairs" then 
            print("No more stairs! :(")
            return
        end
    end
end

function placeMove()
    for i = 0, 4
    do
        placeStairs()
        if i == 4 then
            break
        end
        turtle.turnRight()
        detectF()
        turtle.turnLeft()
    end
end

function placeTorches()
    for i = 0, 3
    do
        detectF()
    end
    turtle.turnRight()
    detectF()
    turtle.turnLeft()
    turtle.turnLeft()
    for i = 9, 12
    do
        turtle.select(i)
        if turtle.getItemDetail(i) == "minecraft:torch" and turtle.getItemCount(i) < 1 then
            print("Placing torches!", i)
            turtle.place()
            turtle.turnRight()
            turtle.turnRight()
            detectF()
            detectF()
            turtle.place()
            turtle.turnLeft()
            turtle.turnLeft()
            detectF()
            detectF()
            turtle.turnLeft()
            detectF()
            turtle.turnRight()
            detectF()
            turtle.turnLeft()
            detectF()
            detectF()
            detectF()
            turtle.turnRight()
            turtle.turnRight()
            break
        end
        if i == 12 and turtle.getItemCount(i) < 1 and turtle.getItemDetail(i) ~= "minecraft:torch" then
            print("No more torches! :(")
            return
        end
    end
    
end

-- Main Code --
detectD()
i = 0
while 1
do
    ClearLeftToRight()
    placeMove()
    turtle.turnRight()
    turtle.turnRight()
    if i % 5 == 0 then
        placeTorches()
    end
    detectD()
    i = i + 1
end