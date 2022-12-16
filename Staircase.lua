function detect()
    if turtle.detect() then
        print("Block detected!")
        turtle.dig()
    end
    turtle.forward()
end 

-- Main Code -- 
for i = 0, 7, 1
do  
    detect()
    print("Moved " + i + "block(s)!")
end