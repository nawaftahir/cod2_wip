#pragma optimize("p", on)
typedef float vec3_t[3];
float DotProduct(const vec3_t a, const vec3_t b) { return a[0]*b[0] + a[1]*b[1] + a[2]*b[2]; }
