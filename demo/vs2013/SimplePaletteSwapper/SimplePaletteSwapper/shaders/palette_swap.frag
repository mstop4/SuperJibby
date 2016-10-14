// Simple 4-colour palette swap shader
// By: M.S.T.O.P.

uniform sampler2D u_texture;

uniform vec3 u_out1;
uniform vec3 u_out2;
uniform vec3 u_out3;
uniform vec3 u_out4;

uniform vec3 u_in1;
uniform vec3 u_in2;
uniform vec3 u_in3;
uniform vec3 u_in4;

void main()
{
    float colour_thres = 4.0/255.0;
    vec4 cur_pos = texture2D( u_texture, gl_TexCoord[0].xy);
    
    if (distance(cur_pos.rgb, u_in1) < colour_thres)
        gl_FragColor = gl_Color * vec4(u_out1,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in2) < colour_thres)
        gl_FragColor = gl_Color * vec4(u_out2,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in3) < colour_thres)
        gl_FragColor = gl_Color * vec4(u_out3,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in4) < colour_thres)
        gl_FragColor = gl_Color * vec4(u_out4,cur_pos.a);
		
	else	
		gl_FragColor = gl_Color * vec4(0.0,0.0,1.0,1.0);
}