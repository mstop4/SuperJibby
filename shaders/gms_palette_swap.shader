//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple 4-colour palette swap shader
// By: M.S.T.O.P.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

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
    vec4 cur_pos = texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (distance(cur_pos.rgb, u_in1) < colour_thres)
        gl_FragColor = v_vColour * vec4(u_out1,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in2) < colour_thres)
        gl_FragColor = v_vColour * vec4(u_out2,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in3) < colour_thres)
        gl_FragColor = v_vColour * vec4(u_out3,cur_pos.a);
        
    else if (distance(cur_pos.rgb, u_in4) < colour_thres)
        gl_FragColor = v_vColour * vec4(u_out4,cur_pos.a);
        
    else
        gl_FragColor = v_vColour * vec4(0.0,0.0,1.0,1.0);  
}


