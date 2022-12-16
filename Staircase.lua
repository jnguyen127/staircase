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
    detectF()
    detectD()
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
    for i = 1, 15
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
    placeStairs()
    turtle.turnRight()
    detectF()
    turtle.turnLeft()
end

-- Main Code --
while 1
do
    ClearLeftToRight()
    placeMove()
end


