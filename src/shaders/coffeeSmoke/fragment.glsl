uniform sampler2D uPerlinTexture;
varying vec2 vUv;
uniform float uTime;

void main() {

    // scale 
    vec2 smokeUv = vUv;

    smokeUv.x *= .5;
    smokeUv.y *= .3;
    smokeUv.y -= uTime * .03;

    float smoke = texture(uPerlinTexture, smokeUv).r;

    smoke = smoothstep(0.4, 1.0, smoke);

    smoke *= smoothstep(0.0, 0.1, vUv.x);
    smoke *= smoothstep(0.0, 0.1, 1.0 - vUv.x);
    smoke *= smoothstep(1.0, .4, vUv.y);
    smoke *= smoothstep(.0, .1, vUv.y);

    gl_FragColor = vec4(.6, .3, .2, smoke);
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}