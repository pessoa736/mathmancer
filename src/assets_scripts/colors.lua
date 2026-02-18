local pb = pb or require("PudimBasicsGl") ---@diagnostic disable-line: undefined-global


return {
    --              r    g    b
    
    ["white"]   = pb.renderer.color255(241, 242, 218),
    [0]         = pb.renderer.color255(241, 242, 218),


    ["yellow"]  = pb.renderer.color255(255, 206, 150),
    [1]         = pb.renderer.color255(255, 206, 150),
    
    ["Red"]     = pb.renderer.color255(255, 119, 119),
    [2]         = pb.renderer.color255(255, 119, 119),

    ["black"]   = pb.renderer.color255(0,   48, 59),
    [3]         = pb.renderer.color255(0,   48, 59),
}