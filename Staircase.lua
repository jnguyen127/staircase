function detectF()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()
end 
function detectD()
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.down()
end 
function digF6()
    for i = 0, 7, 1
    do  
        print("Digging Forward!", i)
        detectF()
    end
end

-- Main Code --
detectF()
detectD()
digF6()
turtle.turnRight()
detectF()
turtle.turnRight()
digF6()
turtle.turnLeft()
detectF()
turtle.turnLeft()
digF6()

