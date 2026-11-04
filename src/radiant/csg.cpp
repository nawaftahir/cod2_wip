#include <windows.h>
#include "../universal/assertive.h"

struct eclass_t { unsigned char pad[8]; int fixedsize; };
struct entity_s_def { unsigned char pad[0x50]; eclass_t *eclass; };
struct entity_s { unsigned char pad[8]; entity_s_def *def; };
struct winding_t;
struct plane_t { float normal[3]; int type; double dist; };
struct radmat_t { unsigned char pad[0x1c]; int compileFlags; int surfaceFlags; };
struct texdef_t { radmat_t *radMat; unsigned char pad[24]; };
struct face_t { float planepts[3][3]; texdef_t texdef[3]; unsigned char pad[8]; plane_t plane; unsigned char pad0[8]; winding_t *w; unsigned char pad1[4]; };
struct brush_t { unsigned char pad0[8]; entity_s_def *owner; unsigned char pad1[0x2c]; int faceCount; face_t *faces; unsigned char pad2[4]; void *patch; };
struct selbrush_t { selbrush_t *prev; selbrush_t *next; entity_s *owner; unsigned char pad0[8]; brush_t *def; int faceCount; unsigned char pad1[4]; void *patch; unsigned char pad2[2]; unsigned char hiddenBrush; };
struct qeglobals_t { unsigned char pad0[0x18]; int d_gridsize; unsigned char pad1[0x6c060]; int activeMaterial; };
extern qeglobals_t g_qeglobals;
extern selbrush_t selected_brushes;
extern int g_nUpdateBits;
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
void Brush_GetFaceFlags(brush_t *def, int *outAnySurface, int *outAllSurface, int *outAnyCompile, int *outAllCompile)
{
    assert(def);
    assert(!def->patch);
    int anySurface = 0;
    int allSurface = -1;
    int anyCompile = 0;
    int allCompile = -1;

    for (int faceIndex = 0; faceIndex < def->faceCount; faceIndex++)
    {
        assert(def->faces[faceIndex].texdef[g_qeglobals.activeMaterial].radMat);
        radmat_t *radMat = def->faces[faceIndex].texdef[g_qeglobals.activeMaterial].radMat;
        anySurface |= radMat->surfaceFlags;
        allSurface &= radMat->surfaceFlags;
        anyCompile |= radMat->compileFlags;
        allCompile &= radMat->compileFlags;
    }
    if (outAnySurface)
        *outAnySurface = anySurface;
    if (outAllSurface)
        *outAllSurface = allSurface;
    if (outAnyCompile)
        *outAnyCompile = anyCompile;
    if (outAllCompile)
        *outAllCompile = allCompile;
}
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
bool Brush_IsFixedOrPatch(brush_t *def)
{
    assert(def);
    assert(def->owner);
    assert(def->owner->eclass);
    if (def->owner->eclass->fixedsize)
        return true;
    return def->patch ? true : false;
}

char Brush_FaceFlags_Check80(brush_t *def)
{
    int allCompile;
    Brush_GetFaceFlags(def, NULL, NULL, NULL, &allCompile);
    char c = allCompile & 0x80;
    return !c;
}

bool Brush_IsFiltered(brush_t *def)
{
    int anySurface, allSurface, allCompile;
    Brush_GetFaceFlags(def, &anySurface, &allSurface, NULL, &allCompile);
    if (!(anySurface & 0x20000000))
    {
        if (allSurface & 1)
            return true;
    }
    return false;
}
