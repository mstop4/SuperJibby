///setup_shader()
var in, out;
    
shader_set(shd_palette_swap);

    in[0] = shader_get_uniform(shd_palette_swap,"u_in1");
    in[1] = shader_get_uniform(shd_palette_swap,"u_in2");
    in[2] = shader_get_uniform(shd_palette_swap,"u_in3");
    in[3] = shader_get_uniform(shd_palette_swap,"u_in4");
    
    shader_set_uniform_f(in[0],in_colour[0,channel.r]/maxChanValue,in_colour[0,channel.g]/maxChanValue,in_colour[0,channel.b]/maxChanValue);
    shader_set_uniform_f(in[1],in_colour[1,channel.r]/maxChanValue,in_colour[1,channel.g]/maxChanValue,in_colour[1,channel.b]/maxChanValue);
    shader_set_uniform_f(in[2],in_colour[2,channel.r]/maxChanValue,in_colour[2,channel.g]/maxChanValue,in_colour[2,channel.b]/maxChanValue);
    shader_set_uniform_f(in[3],in_colour[3,channel.r]/maxChanValue,in_colour[3,channel.g]/maxChanValue,in_colour[3,channel.b]/maxChanValue);
    
    out[0] = shader_get_uniform(shd_palette_swap,"u_out1");
    out[1] = shader_get_uniform(shd_palette_swap,"u_out2");
    out[2] = shader_get_uniform(shd_palette_swap,"u_out3");
    out[3] = shader_get_uniform(shd_palette_swap,"u_out4");
    
    shader_set_uniform_f(out[0],out_colour[0,channel.r]/maxChanValue,out_colour[0,channel.g]/maxChanValue,out_colour[0,channel.b]/maxChanValue);
    shader_set_uniform_f(out[1],out_colour[1,channel.r]/maxChanValue,out_colour[1,channel.g]/maxChanValue,out_colour[1,channel.b]/maxChanValue);
    shader_set_uniform_f(out[2],out_colour[2,channel.r]/maxChanValue,out_colour[2,channel.g]/maxChanValue,out_colour[2,channel.b]/maxChanValue);
    shader_set_uniform_f(out[3],out_colour[3,channel.r]/maxChanValue,out_colour[3,channel.g]/maxChanValue,out_colour[3,channel.b]/maxChanValue);
