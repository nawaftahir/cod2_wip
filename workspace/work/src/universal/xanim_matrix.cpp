// Retail 1001d660/181 uses the non-/Op quaternion-to-matrix calculation.
// This source grouping is a build candidate, not historical TU provenance.
#include "../qcommon/qcommon.h"

// Existing wrapper, grouped with its non-/Op transform calculation.
void TransformVectorByAnimMat(const float *in, const DObjAnimMat *mat, float *out)
{
    MatrixTransformVectorQuatTrans(in, mat, out);
}

