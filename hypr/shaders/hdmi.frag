#version 300 es

precision mediump float;

in vec2 v_texcoord;

layout(location = 0) out vec4 fragColor;

uniform sampler2D tex;

void main() {
  vec4 pix= texture(tex, v_texcoord);

  pix.xyz = pow(pix.xyz, vec3(1.22f));

  fragColor = pix;
}

