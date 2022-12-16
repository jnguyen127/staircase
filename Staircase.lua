function detect()
    if turtle.detect() then
        print("Block detected!")
        turtle.dig()
    end
    turtle.forward()
end 

-- Main Code -- 
for i = 0, 10, 1
do  
    detect()
    print(i)
end