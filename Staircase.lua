function detectF()
    checkFuel()
    while turtle.detect()
    do
        turtle.dig()
        print("Waiting for potential gravel/sand...")
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
        print("Digging Forward!", i)
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
            if turtle.getSelectedSlot() then
                turtle.refuel()
                break
            end
        end
    end
    if turtle.getSelectedSlot() < 1 then 
        return
    end
end

function placeStairs()
    for i = 1, 8
    do
        turtle.select(i)
        if turtle.getSelectedSlot() then
            turtle.place()
            break
        end
    end
    if turtle.getSelectedSlot() < 1 then 
        return
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
        if turtle.getSelectedSlot() > 1 then
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
            detectF()
            turtle.turnLeft()
            for i = 0, 3
            do
                detectF()
            end
            break
        end
    end
    if turtle.getSelectedSlot() < 1 then
        return
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
    detectD()
    i = i + 1
end


