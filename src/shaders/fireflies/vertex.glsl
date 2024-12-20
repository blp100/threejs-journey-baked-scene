uniform float uTime;
uniform float uPixelRatio;
uniform float uSize;

attribute float aScale;

void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  modelPosition.y += sin(uTime + modelPosition.x * 100.0) * aScale * 0.2;
  modelPosition.x += cos(uTime + 70.0) * aScale * 0.1;
  modelPosition.z += sin(uTime * 2.0 + 50.0) * aScale * 0.05;

  vec4 viewPosition = viewMatrix * modelPosition;

  gl_Position = projectionMatrix * viewPosition;
  gl_PointSize = uSize * aScale * uPixelRatio;
  gl_PointSize *= 1.0 / -viewPosition.z;
}