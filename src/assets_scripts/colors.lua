local pb = pb or require("PudimBasicsGl") ---@diagnostic disable-line: undefined-global


return {
    --              r    g    b
    
    ["white"]   = pb.renderer.color(241, 242, 218),
    [0]         = pb.renderer.color(241, 242, 218),


    ["yellow"]  = pb.renderer.color(255, 206, 150),
    [1]         = pb.renderer.color(255, 206, 150),
    
    ["Red"]     = pb.renderer.color(255, 119, 119),
    [2]         = pb.renderer.color(255, 119, 119),

    ["black"]   = pb.renderer.color(0, 48, 59),
    [3]         = pb.renderer.color(0, 48, 59),
}