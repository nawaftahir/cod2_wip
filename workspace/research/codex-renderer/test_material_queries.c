#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "src/material_queries.c"

const unsigned char *renderer_in_use_dvar;

int main(void)
{
    unsigned char *material;
    unsigned char *technique_set;
    unsigned char *technique;
    int dvar[3];
    const char *name;

    material = (unsigned char *)calloc(1, 0x40);
    technique_set = (unsigned char *)calloc(1, 0x60);
    technique = (unsigned char *)calloc(1, 8);
    assert(material != 0 && technique_set != 0 && technique != 0);

    name = "material-test";
    *(const char **)material = name;
    assert(R_GetMaterialName(material) == name);
    material[14] = 3;
    material[15] = 7;
    assert(R_GetMaterialSubimageCount(material) == 21);
    material[14] = 255;
    material[15] = 255;
    assert(R_GetMaterialSubimageCount(material) == 65025);

    memset(dvar, 0, sizeof(dvar));
    renderer_in_use_dvar = (const unsigned char *)dvar;
    *(const unsigned char **)(material + 0x38) = technique_set;
    assert(R_IsMaterialRefractive(material) == 0);
    *(const unsigned char **)(technique_set + 0x58) = technique;
    assert(R_IsMaterialRefractive(material) == 0);
    technique[4] = 1;
    assert(R_IsMaterialRefractive(material) == 1);
    technique[4] = 2;
    assert(R_IsMaterialRefractive(material) == 0);
    technique[4] = 3;
    dvar[2] = 2;
    assert(R_IsMaterialRefractive(material) == 0);

    free(technique);
    free(technique_set);
    free(material);
    return 0;
}
