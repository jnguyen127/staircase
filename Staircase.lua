function detect()
    if turtle.detect() then
        return 1
    else 
        return 0
    end
end 

for i = 0, 10, 1
do  
    if detect() then
        turtle.dig()
    end
    turtle.forward()
end