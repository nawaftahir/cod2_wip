/* Reconstructed 3x3 double-precision linear mapping solver.
   The original Radiant solver operates on three projected plane points.
   All six functions are trial candidates until retail comparison succeeds. */
#include <string.h>
#include "com_math.h"
#include "assertive.h"

// x87-era engine macro: the MSVC 7.1 CRT does not provide C99 isnan.
#undef IS_NAN
#define IS_NAN(x) ((*(const unsigned int *)&(x) & 0x7f800000U) == 0x7f800000U)

extern "C" int Vec3MajorAxis(const float *);

struct LinearMapping_t {
    double matrix[3][3];
    double lu[3][3];
    int pivot[3];
    int axis0;
    int axis1;
    int axis2;
};

/* Scaled partial-pivoting LU decomposition of a 3x3 system. */
extern "C" int LU_Decompose(double a[3][3], int index[3])
{
    double scale[3];
    int largest = 0;
    for (int row = 0; row != 3; ++row)
    {
        double maxAbs = 0.0;
        for (int col = 0; col != 3; ++col)
        {
            const double v = fabs(a[row][col]);
            if (maxAbs < v)
                maxAbs = v;
        }
        if (maxAbs == 0.0)
            return 0;
        scale[row] = 1.0 / maxAbs;
    }

    for (int col = 0; col != 3; ++col)
    {
        int row;
        for (row = 0; row < col; ++row)
        {
            double sum = a[row][col];
            for (int k = 0; k < row; ++k)
                sum -= a[row][k] * a[k][col];
            a[row][col] = sum;
        }
        double maxScore = 0.0;
        for (row = col; row < 3; ++row)
        {
            double sum = a[row][col];
            for (int k = 0; k < col; ++k)
                sum -= a[row][k] * a[k][col];
            a[row][col] = sum;
            const double score = scale[row] * fabs(sum);
            if (maxScore < score)
            {
                maxScore = score;
                largest = row;
            }
        }
        if (a[largest][col] == 0.0)
            return 0;
        if (largest != col)
        {
            for (int k = 0; k < 3; ++k)
            {
                double value = a[largest][k];
                a[largest][k] = a[col][k];
                a[col][k] = value;
            }
            scale[largest] = scale[col];
        }
        index[col] = largest;
        if (col < 2)
        {
            double inv = 1.0 / a[col][col];
            for (row = col + 1; row < 3; ++row)
                a[row][col] *= inv;
        }
    }
    return a[0][0] != 0.0 && a[1][1] != 0.0 && a[2][2] != 0.0;
}

/* Forward and backward substitution for the pivoted matrix. */
extern "C" void LU_BackSubstitute(const double a[3][3], double b[3], const int index[3])
{
    int first = -1;
    for (int row = 0; row != 3; ++row)
    {
        int p = index[row];
        double sum = b[p];
        b[p] = b[row];
        if (first >= 0)
        {
            for (int col = first; col < row; ++col)
                sum -= a[row][col] * b[col];
        }
        else if (sum != 0.0)
        {
            first = row;
        }
        b[row] = sum;
    }
    for (int row = 2; row >= 0; --row)
    {
        double sum = b[row];
        for (int col = row + 1; col < 3; ++col)
            sum -= a[row][col] * b[col];
        b[row] = sum / a[row][row];
    }
}

/* A single residual-correction step improves numerical stability. */
extern "C" void LU_Refine(const double lu[3][3], const int index[3],
                            const double matrix[3][3], const double rhs[3],
                            double solution[3])
{
    double residual[3];
    for (int i = 0; i < 3; ++i)
    {
        residual[i] = matrix[i][0] * solution[0] - rhs[i]
                    + matrix[i][1] * solution[1]
                    + matrix[i][2] * solution[2];
    }
    LU_BackSubstitute(lu, residual, index);
    for (int i = 0; i < 3; ++i)
        solution[i] -= residual[i];
}

extern "C" void LinearMapping_Evaluate(const LinearMapping_t *mapping,
                                         float c0, float c1, float c2,
                                         int axis0, int axis1, int axis2,
                                         const int *index, const double lu[3][3],
                                         float output[4])
{
    double solution[3] = { c0, c1, c2 };
    double rhs[3] = { c0, c1, c2 };
    LU_BackSubstitute(lu, solution, index);
    LU_Refine(lu, index, mapping->matrix, rhs, solution);
    output[axis0] = (float)solution[0];
    output[axis1] = (float)solution[1];
    output[axis2] = 0.0f;
    output[3] = (float)solution[2];

#line 159 "\\trees\\cod2src\\src\\universal\\linearmapping.cpp"
    const float *vec = output;
    assert(!IS_NAN((vec)[0]) && !IS_NAN((vec)[1]) &&
           !IS_NAN((vec)[2]) && !IS_NAN((vec)[3]));
}

extern "C" int LinearMapping_Solve(const float normal[3], const float p0[3],
                                     const float p1[3], const float p2[3],
                                     LinearMapping_t *mapping)
{
    mapping->axis2 = Vec3MajorAxis(normal);
    mapping->axis1 = (~mapping->axis2) & 2;
    mapping->axis0 = (~mapping->axis2) & 1;

    const float *points[3] = { p0, p1, p2 };
    for (int row = 0; row < 3; ++row)
    {
        mapping->matrix[row][0] = points[row][mapping->axis0];
        mapping->matrix[row][1] = points[row][mapping->axis1];
        mapping->matrix[row][2] = 1.0;
    }
    memcpy(mapping->lu, mapping->matrix, sizeof(mapping->matrix));
    return LU_Decompose(mapping->lu, mapping->pivot);
}

extern "C" void LinearMapping_Apply(const LinearMapping_t *mapping,
                                      float c0, float c1, float c2,
                                      float output[4])
{
#line 189 "\\trees\\cod2src\\src\\universal\\linearmapping.cpp"
    const LinearMapping_t *solver = mapping;
    assert(solver);
    LinearMapping_Evaluate(mapping, c0, c1, c2,
                           mapping->axis0, mapping->axis1, mapping->axis2,
                           mapping->pivot, mapping->lu, output);
}
