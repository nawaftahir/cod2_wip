// bulk draft of retail 0x0045f340 (Brush_Rotate, eax=origin); kept out of the build: it flips matched entity.cpp 0x4656b0/0x465780/0x467510 (LTCG tie)
// 0x0045f340 (855 B): rotate a brush by a 3x3 matrix about an origin, keeping the textures locked when asked
void FUN_0045f340(brush_t *b, float *matrix, int a, int axis, float angle, bool flip, float *origin)
{
    if (b->patch)
    {
#line 4268
        assert(b->def->patch == b->patch->def);
        FUN_0042eaf0(b->def->patch, origin, matrix, a != 0);
        return;
    }
    bool lock[2];
    lock[0] = *(int *)(dword_01233b64 + 0x244) != 0;
    lock[1] = *(int *)(dword_01233b64 + 0x1bc) != 0;
#line 4277
    assert(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    brushdef_t *def = b->def;
    if (e->eclass->fixedsize == 0)
    {
        for (int i = 0; i < def->faceCount; i++)
        {
            face_t *f = &def->faces[i];
            if (flip)
            {
                vec3_t tmp;
                VectorCopy(f->planepts[0], tmp);
                VectorCopy(f->planepts[2], f->planepts[0]);
                VectorCopy(tmp, f->planepts[2]);
            }
            float st[2][3][2];
            FUN_00454b70(st, f);
            for (int j = 0; j < 3; j++)
            {
                vec3_t v;
                VectorSubtract(f->planepts[j], origin, v);
                for (int k = 0; k < 3; k++)
                    f->planepts[j][k] = v[0] * matrix[k * 3] + origin[k] + v[2] * matrix[k * 3 + 2] + v[1] * matrix[k * 3 + 1];
            }
            FUN_00454c80(f, st, lock);
        }
    }
    else
    {
        if (angle == 0.0f)
            return;
        vec3_t rel, ang = { 0, 0, 0 };
        ang[axis] = angle;
        VectorSubtract(e->origin, origin, rel);
        if (rel[0] * rel[0] + rel[1] * rel[1] + rel[2] * rel[2] != 0.0f)
        {
            vec3_t rot;
            VectorRotate(rel, ang, rot);
            VectorSubtract(rot, rel, rel);
            FUN_0045e1a0(def, rel, true);
        }
        vec3_t angles, axisIn[3], axisOut[3];
        FUN_00467640(e, angles);
        AnglesToAxis(angles, axisIn);
        for (int i = 0; i < 3; i++)
            Vec3Rotate(axisIn[i], (const vec3_t *)matrix, axisOut[i]);
        AxisToAngles(axisOut, angles);
        FUN_00465bf0(e, "angles", va("%g %g %g", angles[0], angles[1], angles[2]));
    }
    FUN_0045a220(def, true);
    if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    def->version++;
}
