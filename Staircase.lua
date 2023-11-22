function detectF()
    checkFuel()
    while turtle.detect()
    do
        turtle.dig()
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
        i = 1
        while i <= 16
        do
            turtle.select(i)        
            if turtle.getItemDetail(i) == nil and i < 16 then
                i = i + 1
            elseif (turtle.getItemDetail(i).name == "minecraft:coal" or turtle.getItemDetail(i).name == "minecraft:charcoal") and turtle.getItemCount(i) > 1 then
                turtle.refuel()
                break
            elseif i == 16 then 
                print("No more fuel! :(")
                while 1 do end
            elseif turtle.getItemDetail(i) ~= nil and i < 16 then
                i = i + 1
            end
        end
    end
end

function placeStairs()
    i = 1
    while i <= 16
    do
        turtle.select(i)
        if turtle.getItemDetail(i) == nil and i < 16 then
            i = i + 1
        elseif turtle.getItemDetail(i).name == "minecraft:cobblestone_stairs" and turtle.getItemCount(i) > 1 then
            turtle.place()
            break
        elseif i == 16 then 
            print("No more stairs! :(")
            while 1 do 
        end
        elseif turtle.getItemDetail(i) ~= nil and i < 16 then
            i = i + 1
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
    i = 1
    while i <= 16
    do
        turtle.select(i)      
        if turtle.getItemDetail(i) == nil and i < 16 then
            i = i + 1
        elseif turtle.getItemDetail(i).name == "minecraft:torch" and turtle.getItemCount(i) > 1 then
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
        elseif i == 16 then
            print("No more torches! :(")
            while 1 do 
        end
        elseif turtle.getItemDetail(i) ~= nil and i < 16 then
            i = i + 1
        end
    end
end

-- Main Code --
detectD()
j = 0
while 1
do
    ClearLeftToRight()
    placeMove()
    turtle.turnRight()
    turtle.turnRight()
    if j % 5 == 0 then
        placeTorches()
    end
    detectD()
    j = j + 1
end
