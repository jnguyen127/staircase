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
    for i = 0, 4
    do  
        print("Digging Forward!", i)
        detectF()
    end
end

function goForwardR()
    digF6()
    turtle.turnRight()
    detectF()
    turtle.turnRight()
end

function goForwardL()
    digF6()
    turtle.turnLeft()
    detectF()
    turtle.turnLeft()
end

-- Main Code --
detectF()
detectD()
goForwardR()
goForwardL()
goForwardR()
goForwardL()
digF6()
turtle.turnRight()
turtle.turnRight()
for i = 0, 5
do
    detectF()
end
turtle.turnRight()
turtle.turnRight()

detectF()
detectD()
goForwardL()
goForwardR()
goForwardL()
goForwardR()
digF6()
turtle.turnLeft()
turtle.turnLeft()
for i = 0, 5
do
    detectF()
end
turtle.turnLeft()
turtle.turnLeft()