///setup_shader()
var in, out;
    
shader_set(shd_palette_swap);

    in[0] = shader_get_uniform(shd_palette_swap,"u_in1");
    in[1] = shader_get_uniform(shd_palette_swap,"u_in2");
    in[2] = shader_get_uniform(shd_palette_swap,"u_in3");
    in[3] = shader_get_uniform(shd_palette_swap,"u_in4");
    
    shader_set_uniform_f(in[0],in_colour[channel.r_1]/maxChanValue,in_colour[channel.g_1]/maxChanValue,in_colour[channel.b_1]/maxChanValue);
    shader_set_uniform_f(in[1],in_colour[channel.r_2]/maxChanValue,in_colour[channel.g_2]/maxChanValue,in_colour[channel.b_2]/maxChanValue);
    shader_set_uniform_f(in[2],in_colour[channel.r_3]/maxChanValue,in_colour[channel.g_3]/maxChanValue,in_colour[channel.b_3]/maxChanValue);
    shader_set_uniform_f(in[3],in_colour[channel.r_4]/maxChanValue,in_colour[channel.g_4]/maxChanValue,in_colour[channel.b_4]/maxChanValue);
    
    out[0] = shader_get_uniform(shd_palette_swap,"u_out1");
    out[1] = shader_get_uniform(shd_palette_swap,"u_out2");
    out[2] = shader_get_uniform(shd_palette_swap,"u_out3");
    out[3] = shader_get_uniform(shd_palette_swap,"u_out4");
    
    shader_set_uniform_f(out[0],out_colour[cur_palette,channel.r_1]/maxChanValue,out_colour[cur_palette,channel.g_1]/maxChanValue,out_colour[cur_palette,channel.b_1]/maxChanValue);
    shader_set_uniform_f(out[1],out_colour[cur_palette,channel.r_2]/maxChanValue,out_colour[cur_palette,channel.g_2]/maxChanValue,out_colour[cur_palette,channel.b_2]/maxChanValue);
    shader_set_uniform_f(out[2],out_colour[cur_palette,channel.r_3]/maxChanValue,out_colour[cur_palette,channel.g_3]/maxChanValue,out_colour[cur_palette,channel.b_3]/maxChanValue);
    shader_set_uniform_f(out[3],out_colour[cur_palette,channel.r_4]/maxChanValue,out_colour[cur_palette,channel.g_4]/maxChanValue,out_colour[cur_palette,channel.b_4]/maxChanValue);
