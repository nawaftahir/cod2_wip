void FUN_00405640(const float *origin, float radius, const float *color, int segments);

#line 1416
void __stdcall FUN_004061f0(brush_t *brush, CCamWnd *camera)
{
    if (FUN_0044f5d0(brush))
        return;
    vec3_t origin;
    origin[0] = (brush->def->mins[0] + brush->def->maxs[0]) * 0.5f;
    origin[1] = (brush->def->mins[1] + brush->def->maxs[1]) * 0.5f;
    origin[2] = (brush->def->mins[2] + brush->def->maxs[2]) * 0.5f;
    assert(brush->owner->def == brush->def->owner);
    atof(ValueForKey(brush->owner->def->epairs, "light"));
    float color[4];
    color[0] = color[1] = color[2] = 1.0f;
    CString str = ValueForKey(brush->owner->def->epairs, "_color");
    if (str.GetLength() > 0)
    {
        float r, g, b;
        if (sscanf(str, "%f %f %f", &r, &g, &b) == 3)
        {
            color[0] = r;
            color[1] = g;
            color[2] = b;
        }
    }
    color[0] *= 0.125f;
    color[1] *= 0.125f;
    color[2] *= 0.125f;
    color[3] = 1.0f;
    float radius = atof(ValueForKey(brush->owner->def->epairs, "radius"));
    FUN_00405640(origin, radius, color, 32);
}
