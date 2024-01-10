struct Point
    x::Float64
    y::Float64
end
function distance(p1::Point, p2::Point)
    return sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
end

p1 = Point(1.0, 2.0)
p2 = Point(3.0, 4.0)

println(distance(p1, p2))
