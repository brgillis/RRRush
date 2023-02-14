//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_frac;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(gl_FragColor.r + u_frac.x * (1.0 - gl_FragColor.g),
					    gl_FragColor.g + u_frac.y * (1.0 - gl_FragColor.g),
						gl_FragColor.b + u_frac.z * (1.0 - gl_FragColor.b),
						gl_FragColor.a);
}
