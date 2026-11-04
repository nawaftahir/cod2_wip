// Material and technique loading.
#include "a2.h"

int Material_TechniqueTypeForName(const char *name)
{
    const char *techniqueNames[34];
    unsigned int techniqueIndex;

    techniqueNames[0] = "\"depth prepass\"";
    techniqueNames[1] = "\"sky\"";
    techniqueNames[2] = "\"build floatz\"";
    techniqueNames[3] = "\"unlit no fog\"";
    techniqueNames[4] = "\"unlit linear fog\"";
    techniqueNames[5] = "\"unlit exp fog\"";
    techniqueNames[6] = "\"lightmap no fog\"";
    techniqueNames[7] = "\"lightmap linear fog\"";
    techniqueNames[8] = "\"lightmap exp fog\"";
    techniqueNames[9] = "\"lightprobe no fog\"";
    techniqueNames[10] = "\"lightprobe linear fog\"";
    techniqueNames[11] = "\"lightprobe exp fog\"";
    techniqueNames[12] = "\"lightprobe smodel no fog\"";
    techniqueNames[13] = "\"lightprobe smodel linear fog\"";
    techniqueNames[14] = "\"lightprobe smodel exp fog\"";
    techniqueNames[15] = "\"lightprobe smodel cached no fog\"";
    techniqueNames[16] = "\"lightprobe smodel cached linear fog\"";
    techniqueNames[17] = "\"lightprobe smodel cached exp fog\"";
    techniqueNames[18] = "\"pointlight no fog\"";
    techniqueNames[19] = "\"pointlight linear fog\"";
    techniqueNames[20] = "\"pointlight exp fog\"";
    techniqueNames[21] = "\"emissive no fog\"";
    techniqueNames[22] = "\"emissive linear fog\"";
    techniqueNames[23] = "\"emissive exp fog\"";
    techniqueNames[24] = "\"emissive feathered no fog\"";
    techniqueNames[25] = "\"emissive feathered linear fog\"";
    techniqueNames[26] = "\"emissive feathered exp fog\"";
    techniqueNames[27] = "\"fakelight normal\"";
    techniqueNames[28] = "\"fakelight view\"";
    techniqueNames[29] = "\"solid wireframe\"";
    techniqueNames[30] = "\"shaded wireframe\"";
    techniqueNames[31] = "\"shadowcookie caster\"";
    techniqueNames[32] = "\"shadowcookie receiver\"";
    techniqueNames[33] = "\"debug bumpmap\"";
    for (techniqueIndex = 0; techniqueIndex < 34; ++techniqueIndex)
    {
        if (!strcmp(name, techniqueNames[techniqueIndex]))
            return techniqueIndex;
    }
    return 34;
}
