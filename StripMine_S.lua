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
    if turtle.detectUp() then
        turtle.digUp()
    end
end 

function digF20(j)
    checkFuel()
    for i = 0, 1
    do  
        detectF()
        detectD()
    end
    if j % 5 == 0 then
        placeTorches()
    end
end

function goForwardR(j)
    checkFuel()
    digF20(j)
    turtle.turnRight()
    detectF()
    detectD()
    turtle.turnRight()
end

function goForwardL(j)
    checkFuel()
    digF20(j)
    turtle.turnLeft()
    detectF()
    detectD()
    turtle.turnLeft()
end

function ClearStraight()
    j = 0
    while 1 do
        checkFuel()
        goForwardR(j)
        j = j + 1
        goForwardL(j)
        j = j + 1
    end
end

function placeTorches()
    while i <= 16
    do
        turtle.select(i)      
        if turtle.getItemDetail(i) == nil and i < 16 then
            i = i + 1
        elseif turtle.getItemDetail(i).name == "minecraft:torch" and turtle.getItemCount(i) > 1 then
            turtle.placeDown()
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

function checkFuel()
    if turtle.getFuelLevel() < 100 then
        i = 1
        while i <= 16
        do
            turtle.select(i)        
            if turtle.getItemDetail(i) == nil and i < 16 then
                i = i + 1
            elseif (turtle.getItemDetail(i).name == "minecraft:coal" or turtle.getItemDetail(i).name == "minecraft:charcoal") and turtle.getItemCount(i) > 1 then
                print("Refueling!")
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

-- Main Code --
detectD()
while 1
do
    ClearStraight()
end
