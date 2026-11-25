#include "q_shared.h"
#include "assertive.h"

// the 72-byte path node; layout from the node init/copy bodies
struct vp_node_t
{
	const char *targetname;
	const char *target;
	int spawnflags;
	short index;
	short pad;
	int rotated;
	float speed;
	float lookahead;
	float origin[3];
	float dir[3];
	float angles[3];
	float length;
	short next;
	short prev;
};

// the 200-byte follower state; the two nodes at +0x38 and +0x80 are the switch-node pair
struct vp_pos_t
{
	short nodeIdx;
	short endOfPath;
	float frac;
	float speed;
	float lookahead;
	float slide;
	float origin[3];
	float angles[3];
	float lookPos[3];
	vp_node_t switchNode[2];
};

struct GfxPointVertex
{
	float xyz[3];
	unsigned char color[4];
};

struct vp_prefs_t
{
	char pad[0x290];
	int arrowTime;
	int arrowSize;
};

struct vp_eclass_t
{
	int pad0;
	const char *name;
	int fixedsize;
};

struct vp_epairs_t
{
	void *first;
};

struct entity_t
{
	unsigned char pad0[0x50];
	vp_eclass_t *eclass;
	unsigned char pad1[4];
	float origin[3];
	vp_epairs_t epairs;
};

struct vp_branddef_t
{
	unsigned char pad0[8];
	entity_t *owner;
};

struct brush_t
{
	brush_t *prev;
	brush_t *next;
	struct vp_entity_t *owner;
	brush_t *ownerNext;
	brush_t *ownerPrev;
	vp_branddef_t *def;
};

struct vp_entity_t
{
	vp_entity_t *prev;
	vp_entity_t *next;
	entity_t *def;
	brush_t brushes;
};

extern const char *FUN_00464bb0(vp_epairs_t *epairs, const char *key);
extern bool FUN_00465d80(entity_t *def, const char *key);
extern void FUN_00465d50(entity_t *def, const char *key, vec3_t out);
extern bool FUN_0044f5d0(brush_t *brush);
extern void Sys_Printf(const char *fmt, ...);

extern void (*Byte4PackPixelColor)(const float *from, void *to);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);
extern float DAT_011297a8[4];
extern vp_prefs_t *DAT_01233b64;
extern unsigned char DAT_01129888;
extern brush_t DAT_010a44b4;
extern vp_entity_t DAT_010a43d0;
extern unsigned char DAT_0124a4ce;
extern unsigned char DAT_0124a4cf;
extern unsigned char DAT_0124a4d0;

#define VP_MAX_NODES 1500

short DAT_01154630;
vp_node_t DAT_01154680[VP_MAX_NODES];
int DAT_0059273c = 1;
float DAT_00592740[3] = { 3.1415927f, 3.1415927f, 3.1415927f };
float DAT_0124b630[3];
float DAT_0124b63c[3];
float DAT_0124b648[3];

int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
int FUN_004939a0(vp_pos_t *pos, int stopNode);
vp_pos_t *FUN_00493850(vp_pos_t *pos, short nodeIdx);
void Com_Printf(const char *fmt, ...);
float LerpAngle(float from, float to, float frac);

#define vp_assert0(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 0, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
#define vp_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)

void FUN_00491c80(const float *from, const float *to, int forceFlush)
{
	vec3_t dir;
	GfxPointVertex verts[2];

	dir[0] = to[0] - from[0];
	dir[1] = to[1] - from[1];
	dir[2] = to[2] - from[2];
	Vec3Normalize(dir);

	if ( DAT_0059273c )
	{
		DAT_0059273c = 0;
	}
	else
	{
		float dot = DAT_0124b648[2] * dir[2] + DAT_0124b648[1] * dir[1] + DAT_0124b648[0] * dir[0];

		if ( dot >= 0.9999f && !forceFlush )
		{
			DAT_0124b63c[0] = to[0];
			DAT_0124b63c[1] = to[1];
			DAT_0124b63c[2] = to[2];
			return;
		}

		verts[0].xyz[0] = DAT_0124b630[0];
		verts[0].xyz[1] = DAT_0124b630[1];
		verts[0].xyz[2] = DAT_0124b630[2];
		Byte4PackPixelColor(DAT_011297a8, verts[0].color);
		verts[1].xyz[0] = DAT_0124b63c[0];
		verts[1].xyz[1] = DAT_0124b63c[1];
		verts[1].xyz[2] = DAT_0124b63c[2];
		*(unsigned int *)verts[1].color = *(unsigned int *)verts[0].color;
		R_AddCmd_Line3D(1, 1, verts);
	}

	DAT_0124b630[0] = from[0];
	DAT_0124b630[1] = from[1];
	DAT_0124b630[2] = from[2];
	DAT_0124b63c[0] = to[0];
	DAT_0124b63c[1] = to[1];
	DAT_0124b63c[2] = to[2];
	DAT_0124b648[0] = dir[0];
	DAT_0124b648[1] = dir[1];
	DAT_0124b648[2] = dir[2];
}

void FUN_00491de0(const float *angles, const float *origin)
{
	int arrowSize = DAT_01233b64->arrowSize;
	float size;
	float pts[5][3];
	float mtx[4][3];
	float world[5][3];
	unsigned int color;
	GfxPointVertex verts[12];
	int vertCount;
	int i;

	if ( arrowSize <= 0 )
		return;

	size = (float)arrowSize;

	pts[0][0] = 0.5f;
	pts[0][1] = 0.0f;
	pts[0][2] = 0.0f;
	pts[1][0] = -0.5f;
	pts[1][1] = -0.40000001f;
	pts[1][2] = 0.0f;
	pts[2][0] = -0.5f;
	pts[2][1] = 0.40000001f;
	pts[2][2] = 0.0f;
	pts[3][0] = -0.5f;
	pts[3][1] = 0.0f;
	pts[3][2] = 0.40000001f;
	pts[4][0] = -0.5f;
	pts[4][1] = 0.0f;
	pts[4][2] = 0.0f;

	AnglesToAxis(angles, (vec3_t *)mtx);
	mtx[3][0] = origin[0];
	mtx[3][1] = origin[1];
	mtx[3][2] = origin[2];

	for ( i = 0; i < 5; i++ )
	{
		pts[i][0] = size * pts[i][0];
		pts[i][1] = pts[i][1] * size;
		pts[i][2] = size * pts[i][2];
		MatrixTransformVector43(pts[i], mtx, world[i]);
	}

	Byte4PackPixelColor(DAT_011297a8, &color);

	vertCount = R_Add3DLine(verts, world[0], world[1], &color, 1, 0, 12);
	vertCount = R_Add3DLine(verts, world[1], world[2], &color, 1, vertCount, 12);
	vertCount = R_Add3DLine(verts, world[2], world[0], &color, 1, vertCount, 12);
	vertCount = R_Add3DLine(verts, world[3], world[4], &color, 1, vertCount, 12);
	vertCount = R_Add3DLine(verts, world[4], origin, &color, 1, vertCount, 12);
	vertCount = R_Add3DLine(verts, origin, world[3], &color, 1, vertCount, 12);

#line 158
	vp_assert1( vertCount == 12 );

	if ( vertCount )
		R_AddCmd_Line3D(vertCount / 2, 1, verts);
}

void FUN_004920d0(vp_node_t *node, short index)
{
	node->index = index;
	node->targetname = 0;
	node->target = 0;
	node->spawnflags = 0;
	node->rotated = 0;
	node->speed = node->lookahead = -1.0f;
	node->origin[0] = 0.0f;
	node->origin[1] = 0.0f;
	node->origin[2] = 0.0f;
	node->dir[0] = 0.0f;
	node->dir[1] = 0.0f;
	node->dir[2] = 0.0f;
	node->angles[0] = DAT_00592740[0];
	node->angles[1] = DAT_00592740[1];
	node->angles[2] = DAT_00592740[2];
	node->length = 0.0f;
	node->next = -1;
	node->prev = -1;
}

void FUN_00492130(const vp_node_t *src, vp_node_t *dst)
{
	dst->targetname = src->targetname;
	dst->target = src->target;
	dst->spawnflags = src->spawnflags;
	dst->index = src->index;
	dst->rotated = src->rotated;
	dst->speed = src->speed;
	dst->lookahead = src->lookahead;
	dst->origin[0] = src->origin[0];
	dst->origin[1] = src->origin[1];
	dst->origin[2] = src->origin[2];
	dst->dir[0] = src->dir[0];
	dst->dir[1] = src->dir[1];
	dst->dir[2] = src->dir[2];
	dst->angles[0] = src->angles[0];
	dst->angles[1] = src->angles[1];
	dst->angles[2] = src->angles[2];
	dst->length = src->length;
	dst->next = src->next;
	dst->prev = src->prev;
}

short FUN_004921b0(const char *targetname, const float *origin)
{
	short i;

	if ( !targetname )
		return -1;

	i = 0;
	if ( DAT_01154630 <= 0 )
		return -1;

	while ( strcmp(DAT_01154680[i].targetname, targetname)
		|| ( origin && ( origin[0] != DAT_01154680[i].origin[0]
			|| origin[1] != DAT_01154680[i].origin[1]
			|| origin[2] != DAT_01154680[i].origin[2] ) ) )
	{
		if ( ++i >= DAT_01154630 )
			return -1;
	}

	return i;
}

int FUN_00492270(short from, short to)
{
	short hops;
	short next;
	vp_node_t *node;

	if ( from < 0 )
		return 0;
	if ( to < 0 )
		return 0;

	hops = 0;
	node = &DAT_01154680[from];
	if ( DAT_01154630 <= 0 )
		return 0;

	for ( ;; )
	{
		next = node->next;
		hops++;
		if ( next == to )
			break;
		if ( next >= 0 && next != from )
		{
			node = &DAT_01154680[next];
			if ( hops < DAT_01154630 )
				continue;
		}
		return 0;
	}

	return 1;
}

float FUN_004922d0(short index)
{
	vp_node_t *fwdNode = &DAT_01154680[index];
	vp_node_t *backNode;
	short prev;
	short next;
	short hops;
	float distFwd = 0.0f;
	float distBack = 0.0f;
	float fwdSpeed = -1.0f;
	float backSpeed = -1.0f;
	float total;

	if ( fwdNode->speed >= 0.0f )
		return fwdNode->speed;

	prev = fwdNode->prev;
	if ( prev >= 0 )
	{
		hops = 0;
		backNode = &DAT_01154680[prev];
		if ( DAT_01154630 > 0 )
		{
			for ( ;; )
			{
				hops++;
				distBack = backNode->length + distBack;
				if ( backNode->speed >= 0.0f )
				{
					backSpeed = backNode->speed;
					break;
				}
				prev = backNode->prev;
				if ( prev >= 0 && prev != index )
				{
					backNode = &DAT_01154680[prev];
					if ( hops < DAT_01154630 )
						continue;
				}
				break;
			}
		}
	}

	hops = 0;
	if ( DAT_01154630 > 0 )
	{
		for ( ;; )
		{
			hops++;
			if ( fwdNode->speed >= 0.0f )
			{
				fwdSpeed = fwdNode->speed;
				break;
			}
			next = fwdNode->next;
			if ( next >= 0 && next != index )
			{
				distFwd = fwdNode->length + distFwd;
				fwdNode = &DAT_01154680[next];
				if ( hops < DAT_01154630 )
					continue;
			}
			break;
		}
	}

	if ( backSpeed < 0.0f )
	{
		if ( fwdSpeed < 0.0f )
			return 0.0f;
		return fwdSpeed;
	}
	if ( fwdSpeed < 0.0f )
		return backSpeed;

	total = distFwd + distBack;
	if ( total > 0.0f )
		return ( fwdSpeed - backSpeed ) * ( distBack / total ) + backSpeed;
	return 0.0f;
}

float FUN_00492450(short index)
{
	vp_node_t *fwdNode = &DAT_01154680[index];
	vp_node_t *backNode;
	short prev;
	short next;
	short hops;
	float distFwd = 0.0f;
	float distBack = 0.0f;
	float fwdLook = -1.0f;
	float backLook = -1.0f;
	float total;

	if ( fwdNode->lookahead >= 0.0f )
		return fwdNode->lookahead;

	prev = fwdNode->prev;
	if ( prev >= 0 )
	{
		hops = 0;
		backNode = &DAT_01154680[prev];
		if ( DAT_01154630 > 0 )
		{
			for ( ;; )
			{
				hops++;
				distBack = backNode->length + distBack;
				if ( backNode->lookahead > 0.0f )
				{
					backLook = backNode->lookahead;
					break;
				}
				prev = backNode->prev;
				if ( prev >= 0 && prev != index )
				{
					backNode = &DAT_01154680[prev];
					if ( hops < DAT_01154630 )
						continue;
				}
				break;
			}
		}
	}

	hops = 0;
	if ( DAT_01154630 > 0 )
	{
		for ( ;; )
		{
			hops++;
			if ( fwdNode->lookahead > 0.0f )
			{
				fwdLook = fwdNode->lookahead;
				break;
			}
			next = fwdNode->next;
			if ( next >= 0 && next != index )
			{
				distFwd = fwdNode->length + distFwd;
				fwdNode = &DAT_01154680[next];
				if ( hops < DAT_01154630 )
					continue;
			}
			break;
		}
	}

	if ( backLook < 0.0f )
	{
		if ( fwdLook < 0.0f )
			return 0.0f;
		return fwdLook;
	}
	if ( fwdLook < 0.0f )
		return backLook;

	total = distFwd + distBack;
	if ( total > 0.0f )
		return ( fwdLook - backLook ) * ( distBack / total ) + backLook;
	return 0.0f;
}

void FUN_004925d0(float *out, int index)
{
	vp_node_t *fwdNode = &DAT_01154680[(short)index];
	vp_node_t *backNode;
	short prev;
	short next;
	short hops;
	float distFwd = 0.0f;
	float distBack = 0.0f;
	float backAng[3] = { DAT_00592740[0], DAT_00592740[1], DAT_00592740[2] };
	float fwdAng[3] = { DAT_00592740[0], DAT_00592740[1], DAT_00592740[2] };
	float total;
	bool backUnset;
	bool fwdUnset;

	if ( DAT_00592740[0] != fwdNode->angles[0]
		|| DAT_00592740[1] != fwdNode->angles[1]
		|| DAT_00592740[2] != fwdNode->angles[2] )
	{
		out[0] = fwdNode->angles[0];
		out[1] = fwdNode->angles[1];
		out[2] = fwdNode->angles[2];
		return;
	}

	prev = fwdNode->prev;
	if ( prev >= 0 )
	{
		hops = 0;
		backNode = &DAT_01154680[prev];
		if ( DAT_01154630 > 0 )
		{
			for ( ;; )
			{
				hops++;
				distBack = backNode->length + distBack;
				if ( DAT_00592740[0] != backNode->angles[0]
					|| DAT_00592740[1] != backNode->angles[1]
					|| DAT_00592740[2] != backNode->angles[2] )
				{
					backAng[0] = backNode->angles[0];
					backAng[1] = backNode->angles[1];
					backAng[2] = backNode->angles[2];
					break;
				}
				prev = backNode->prev;
				if ( prev >= 0 && prev != (short)index )
				{
					backNode = &DAT_01154680[prev];
					if ( hops < DAT_01154630 )
						continue;
				}
				break;
			}
		}
	}

	hops = 0;
	if ( DAT_01154630 > 0 )
	{
		for ( ;; )
		{
			hops++;
			if ( DAT_00592740[0] != fwdNode->angles[0]
				|| DAT_00592740[1] != fwdNode->angles[1]
				|| DAT_00592740[2] != fwdNode->angles[2] )
			{
				fwdAng[0] = fwdNode->angles[0];
				fwdAng[1] = fwdNode->angles[1];
				fwdAng[2] = fwdNode->angles[2];
				break;
			}
			next = fwdNode->next;
			if ( next >= 0 && next != (short)index )
			{
				distFwd = fwdNode->length + distFwd;
				fwdNode = &DAT_01154680[next];
				if ( hops < DAT_01154630 )
					continue;
			}
			break;
		}
	}

	backUnset = ( DAT_00592740[0] == backAng[0] && DAT_00592740[1] == backAng[1] && DAT_00592740[2] == backAng[2] );
	fwdUnset = ( DAT_00592740[0] == fwdAng[0] && DAT_00592740[1] == fwdAng[1] && DAT_00592740[2] == fwdAng[2] );

	if ( backUnset && fwdUnset )
	{
		out[0] = 0.0f;
		out[1] = 0.0f;
		out[2] = 0.0f;
		return;
	}
	if ( backUnset )
	{
		out[0] = fwdAng[0];
		out[1] = fwdAng[1];
		out[2] = fwdAng[2];
		return;
	}
	if ( fwdUnset )
	{
		out[0] = backAng[0];
		out[1] = backAng[1];
		out[2] = backAng[2];
		return;
	}

	total = distFwd + distBack;
	if ( total > 0.0f )
	{
		float frac = distBack / total;

		out[0] = AngleNormalize180(fwdAng[0] - backAng[0]) * frac + backAng[0];
		out[1] = AngleNormalize180(fwdAng[1] - backAng[1]) * frac + backAng[1];
		out[2] = AngleNormalize180(fwdAng[2] - backAng[2]) * frac + backAng[2];
	}
	else
	{
		out[0] = 0.0f;
		out[1] = 0.0f;
		out[2] = 0.0f;
	}
}

float FUN_004929b0(const vp_pos_t *pos)
{
	vp_node_t *node = &DAT_01154680[pos->nodeIdx];
	short next = node->next;
	float value;

	if ( next < 0 )
		return node->speed;

	value = DAT_01154680[next].speed;
	value = ( value - node->speed ) * pos->frac + node->speed;
	return value;
}

float FUN_00492a00(const vp_pos_t *pos)
{
	vp_node_t *node = &DAT_01154680[pos->nodeIdx];
	short next = node->next;
	float value;

	if ( next < 0 )
		return node->lookahead;

	value = DAT_01154680[next].lookahead;
	value = ( value - node->lookahead ) * pos->frac + node->lookahead;
	return value;
}

float FUN_00492a50(const vp_pos_t *pos)
{
	vp_node_t *node = &DAT_01154680[pos->nodeIdx];
	short next = node->next;
	float value;

	if ( next < 0 )
	{
		value = 1.0f;
		if ( !node->rotated )
			value = 0.0f;
		return value;
	}

	if ( node->rotated && DAT_01154680[next].rotated )
		return 1.0f;
	if ( !node->rotated && DAT_01154680[next].rotated )
		return pos->frac;
	if ( node->rotated && !DAT_01154680[next].rotated )
		return 1.0f - pos->frac;
	return 0.0f;
}

void FUN_00492af0(const vp_pos_t *pos, float *angles)
{
	vp_node_t *node = &DAT_01154680[pos->nodeIdx];
	short next = node->next;
	vp_node_t *nextNode;
	float from[3];
	float to[3];
	int i;

	if ( next < 0 )
	{
		if ( node->rotated )
		{
			angles[0] = node->angles[0];
			angles[1] = node->angles[1];
			angles[2] = node->angles[2];
		}
		return;
	}

	nextNode = &DAT_01154680[next];

	if ( node->rotated )
	{
		if ( nextNode->rotated )
		{
			from[0] = node->angles[0];
			from[1] = node->angles[1];
			from[2] = node->angles[2];
			to[0] = nextNode->angles[0];
			to[1] = nextNode->angles[1];
			to[2] = nextNode->angles[2];
		}
		else
		{
			from[0] = node->angles[0];
			from[1] = node->angles[1];
			from[2] = node->angles[2];
			to[0] = angles[0];
			to[1] = angles[1];
			to[2] = angles[2];
		}
	}
	else
	{
		if ( !nextNode->rotated )
			return;
		from[0] = angles[0];
		from[1] = angles[1];
		from[2] = angles[2];
		to[0] = nextNode->angles[0];
		to[1] = nextNode->angles[1];
		to[2] = nextNode->angles[2];
	}

	for ( i = 0; i < 3; i++ )
	{
		angles[i] = LerpAngle(from[i], to[i], pos->frac);
		angles[i] = AngleNormalize180(angles[i]);
	}
}

void FUN_00492c50(const vp_pos_t *pos, float *out)
{
	vp_node_t *node = &DAT_01154680[pos->nodeIdx];
	float remaining = pos->lookahead * pos->speed;
	float along = 0.0f;
	short hops = 0;
	short next;

	remaining = remaining + node->length * pos->frac;

	if ( DAT_01154630 <= 0 )
	{
		along = remaining;
	}
	else
	{
		for ( ;; )
		{
			next = node->next;
			hops++;
			if ( next < 0 || node->length == 0.0f )
			{
				along = 0.0f;
				break;
			}
			if ( node->length > remaining )
			{
				along = remaining;
				break;
			}
			remaining = remaining - node->length;
			node = &DAT_01154680[next];
			if ( hops >= DAT_01154630 )
			{
				along = remaining;
				break;
			}
		}
	}

	out[0] = along * node->dir[0] + node->origin[0];
	out[1] = along * node->dir[1] + node->origin[1];
	out[2] = along * node->dir[2] + node->origin[2];
}

int FUN_00492d00(vp_pos_t *pos, const float *dir, short stopNode)
{
	short cur = pos->nodeIdx;
	float frac = pos->frac;
	vp_node_t *node = &DAT_01154680[cur];
	int hitStop = 0;
	short hops = 0;
	short next;
	float t = 0.0f;
	float back[3];
	float fwd[3];
	float dBack;
	float dFwd;

	if ( DAT_01154630 > 0 )
	{
		for ( ;; )
		{
			hops++;
			node = &DAT_01154680[cur];
			if ( cur == stopNode )
				hitStop = 1;
			next = node->next;
			if ( next < 0 || node->length == 0.0f )
				break;

			back[0] = pos->origin[0] - node->origin[0];
			back[1] = pos->origin[1] - node->origin[1];
			back[2] = pos->origin[2] - node->origin[2];
			dBack = back[0] * dir[0] + back[2] * dir[2] + back[1] * dir[1];

			fwd[0] = DAT_01154680[next].origin[0] - pos->origin[0];
			fwd[1] = DAT_01154680[next].origin[1] - pos->origin[1];
			fwd[2] = DAT_01154680[next].origin[2] - pos->origin[2];
			dFwd = fwd[0] * dir[0] + fwd[2] * dir[2] + fwd[1] * dir[1];

			if ( dBack == 0.0f && dFwd == 0.0f )
				break;
			if ( dBack >= 0.0f && dFwd >= 0.0f )
			{
				t = dBack / ( dFwd + dBack );
				break;
			}
			cur = next;
			if ( hops >= DAT_01154630 )
				goto seat;
		}
		frac = t;
	}

seat:
	pos->nodeIdx = cur;
	pos->endOfPath = ( node->next < 0 );
	pos->frac = frac;
	pos->speed = FUN_004929b0(pos);
	pos->lookahead = FUN_00492a00(pos);
	pos->slide = FUN_00492a50(pos);
	return hitStop;
}

void FUN_00492f20(vp_pos_t *pos)
{
	short slot = FUN_004921b0(pos->switchNode[0].targetname, 0);

	if ( slot >= 0 )
		FUN_00492130(&pos->switchNode[0], &DAT_01154680[slot]);
}

void FUN_00492f50(vp_pos_t *pos)
{
	short slot = FUN_004921b0(pos->switchNode[0].targetname, 0);

	if ( slot >= 0 )
		FUN_00492130(&pos->switchNode[1], &DAT_01154680[slot]);
}

void FUN_00492f80(const vp_pos_t *start)
{
	vp_pos_t prev;
	vp_pos_t cur;
	int arrowTime = DAT_01233b64->arrowTime;
	int steps = 0;
	int elapsed = 0;
	int maxTime = arrowTime;
	int done = 0;
	int stopNode = -1;
	int hitStop;

	if ( arrowTime < 0 )
		maxTime = 0;

	memcpy(&prev, start, sizeof(prev));
	memcpy(&cur, start, sizeof(cur));
	DAT_0059273c = 1;

	for ( ;; )
	{
		steps++;
		if ( steps > 50000 )
		{
			Com_Printf("WARNING: Invalid vehicle path.  Possible infinite loop\n");
			return;
		}

		if ( prev.nodeIdx != start->nodeIdx )
			stopNode = start->nodeIdx;

		memcpy(&prev, &cur, sizeof(prev));
		hitStop = FUN_004939a0(&cur, stopNode);
		if ( cur.endOfPath || hitStop )
			done = 1;

		FUN_00491c80(prev.origin, cur.origin, done);

		if ( elapsed <= maxTime )
		{
			elapsed += 50;
		}
		else
		{
			FUN_00491de0(cur.angles, cur.origin);
			elapsed = 0;
		}

		if ( done )
			return;
	}
}

void FUN_004930b0()
{
	DAT_01154630 = 0;
}

void FUN_004930c0()
{
	DAT_01154630 = 0;
}

void FUN_004930d0()
{
	short count = DAT_01154630;
	short i = 0;
	short last = 0;
	short j;
	short k;
	vp_node_t *node;
	vp_node_t *n;

	if ( DAT_01154630 > 0 )
	{
		node = &DAT_01154680[0];
		do
		{
			if ( node->target )
				node->next = FUN_004921b0(node->target, 0);

			j = 0;
			for ( ;; )
			{
				last = i;
				if ( i != j && !strcmp(node->targetname, DAT_01154680[j].target) )
				{
					node->prev = j;
					break;
				}
				if ( ++j >= DAT_01154630 )
					break;
			}
			if ( node->next == i )
				node->next = -1;
			if ( node->prev == i )
				node->prev = -1;
			count = DAT_01154630;
			node++;
			i++;
		}
		while ( (short)(last + 1) < DAT_01154630 );

		if ( DAT_01154630 > 0 )
		{
			n = &DAT_01154680[0];
			i = DAT_01154630;
			do
			{
				short next = n->next;

				if ( next >= 0 )
				{
					n->dir[0] = DAT_01154680[next].origin[0] - n->origin[0];
					n->dir[1] = DAT_01154680[next].origin[1] - n->origin[1];
					n->dir[2] = DAT_01154680[next].origin[2] - n->origin[2];
					n->length = Vec3Normalize(n->dir);
					if ( !n->rotated )
						vectoangles(n->dir, n->angles);
				}
				n++;
				i--;
			}
			while ( i );
			count = DAT_01154630;
		}
	}

	k = 0;
	if ( count > 0 )
	{
		n = &DAT_01154680[0];
		do
		{
			n->speed = FUN_004922d0(k);
			n->lookahead = FUN_00492450(k);
			if ( n->rotated )
				FUN_004925d0(n->angles, k);

			n->angles[0] = AngleNormalize180(n->angles[0]);
			n->angles[1] = AngleNormalize180(n->angles[1]);
			n->angles[2] = AngleNormalize180(n->angles[2]);

			if ( n->speed <= 0.0f || n->lookahead <= 0.0f )
				n->next = -1;
			if ( n->next < 0 )
			{
				if ( n->speed <= 0.0f )
					n->speed = 1.0f;
				if ( n->lookahead <= 0.0f )
					n->lookahead = 1.0f;
			}
			k++;
			n++;
		}
		while ( k < DAT_01154630 );
	}
}

void FUN_00493390()
{
	brush_t *brush;
	vp_entity_t *ent;
	vp_eclass_t *eclass;
	vp_node_t *node;
	vp_pos_t pos;
	short selNode;
	short i;

	if ( (DAT_01129888 & 4) != 0 )
		return;
	if ( DAT_010a44b4.next == &DAT_010a44b4 )
		return;

	brush = DAT_010a44b4.prev;

#line 1276
	vp_assert0( brush );
	vp_assert0( brush->owner );
	vp_assert0( brush->owner->def == brush->def->owner );

	eclass = brush->owner->def->eclass;
	if ( !eclass->fixedsize || ( _stricmp(eclass->name, "info_vehicle_node") && _stricmp(eclass->name, "info_vehicle_node_rotate") ) )
		return;

	DAT_01154630 = 0;

	for ( ent = DAT_010a43d0.next; ent != &DAT_010a43d0; ent = ent->next )
	{
		eclass = ent->def->eclass;
		if ( !eclass->fixedsize || ( _stricmp(eclass->name, "info_vehicle_node") && _stricmp(eclass->name, "info_vehicle_node_rotate") ) )
			continue;
		if ( FUN_0044f5d0(ent->brushes.ownerNext) )
			continue;

		if ( DAT_01154630 >= VP_MAX_NODES )
		{
			Sys_Printf("Warning: Max vehicle Nodes hit [%d]\n", VP_MAX_NODES);
			break;
		}

		node = &DAT_01154680[DAT_01154630];
		FUN_004920d0(node, DAT_01154630);

		if ( !_stricmp(eclass->name, "info_vehicle_node_rotate") )
			node->rotated = 1;

		node->targetname = FUN_00464bb0(&ent->def->epairs, "targetname");
		node->target = FUN_00464bb0(&ent->def->epairs, "target");
		node->spawnflags = atoi(FUN_00464bb0(&ent->def->epairs, "spawnflags")) & 1;

		if ( node->targetname && *node->targetname )
		{
			const char *value = FUN_00464bb0(&ent->def->epairs, "speed");

			if ( value && *value )
				node->speed = (float)(atof(value) * 17.6f);

			value = FUN_00464bb0(&ent->def->epairs, "lookahead");
			if ( value && *value )
				node->lookahead = (float)atof(value);

			node->origin[0] = ent->def->origin[0];
			node->origin[1] = ent->def->origin[1];
			node->origin[2] = ent->def->origin[2];
			if ( FUN_00465d80(ent->def, "angles") )
				FUN_00465d50(ent->def, "angles", node->angles);
			DAT_01154630++;
		}
	}

	FUN_004930d0();

	selNode = FUN_004921b0(FUN_00464bb0(&brush->owner->def->epairs, "targetname"), brush->owner->def->origin);
	if ( selNode >= 0 )
	{
		for ( i = 0; i < DAT_01154630; i++ )
		{
			if ( DAT_01154680[i].spawnflags )
			{
				if ( i == selNode || FUN_00492270(i, selNode) )
					FUN_00492f80(FUN_00493850(&pos, i));
			}
		}
	}
}

void FUN_00493720(vp_pos_t *pos)
{
	pos->endOfPath = 0;
	pos->frac = 0.0f;
	pos->speed = 0.0f;
	pos->lookahead = 0.0f;
	pos->slide = 0.0f;
	pos->nodeIdx = -1;
	pos->origin[0] = 0.0f;
	pos->origin[1] = 0.0f;
	pos->origin[2] = 0.0f;
	pos->angles[0] = 0.0f;
	pos->angles[1] = 0.0f;
	pos->angles[2] = 0.0f;
	pos->lookPos[0] = 0.0f;
	pos->lookPos[1] = 0.0f;
	pos->lookPos[2] = 0.0f;

	pos->switchNode[0].targetname = 0;
	pos->switchNode[0].target = 0;
	pos->switchNode[0].spawnflags = 0;
	pos->switchNode[0].index = -1;
	pos->switchNode[0].rotated = 0;
	pos->switchNode[0].speed = -1.0f;
	pos->switchNode[0].lookahead = -1.0f;
	pos->switchNode[0].origin[0] = 0.0f;
	pos->switchNode[0].origin[1] = 0.0f;
	pos->switchNode[0].origin[2] = 0.0f;
	pos->switchNode[0].dir[0] = 0.0f;
	pos->switchNode[0].dir[1] = 0.0f;
	pos->switchNode[0].dir[2] = 0.0f;
	pos->switchNode[0].angles[0] = DAT_00592740[0];
	pos->switchNode[0].angles[1] = DAT_00592740[1];
	pos->switchNode[0].angles[2] = DAT_00592740[2];
	pos->switchNode[0].length = 0.0f;
	pos->switchNode[0].next = -1;
	pos->switchNode[0].prev = -1;

	pos->switchNode[1].targetname = 0;
	pos->switchNode[1].target = 0;
	pos->switchNode[1].spawnflags = 0;
	pos->switchNode[1].index = -1;
	pos->switchNode[1].rotated = 0;
	pos->switchNode[1].speed = -1.0f;
	pos->switchNode[1].lookahead = -1.0f;
	pos->switchNode[1].origin[0] = 0.0f;
	pos->switchNode[1].origin[1] = 0.0f;
	pos->switchNode[1].origin[2] = 0.0f;
	pos->switchNode[1].dir[0] = 0.0f;
	pos->switchNode[1].dir[1] = 0.0f;
	pos->switchNode[1].dir[2] = 0.0f;
	pos->switchNode[1].angles[0] = DAT_00592740[0];
	pos->switchNode[1].angles[1] = DAT_00592740[1];
	pos->switchNode[1].angles[2] = DAT_00592740[2];
	pos->switchNode[1].length = 0.0f;
	pos->switchNode[1].next = -1;
	pos->switchNode[1].prev = -1;
}

// Retail one-byte RET body verified with MSVC 7.1. Original entry-point ownership/signature remains provisional.
extern "C" void FUN_00493840() {}

vp_pos_t *FUN_00493850(vp_pos_t *pos, short nodeIdx)
{
	vp_node_t *node = &DAT_01154680[nodeIdx];

	pos->nodeIdx = nodeIdx;
	pos->endOfPath = 0;
	pos->frac = 0.0f;
	pos->speed = node->speed;
	pos->lookahead = node->lookahead;
	pos->slide = node->rotated ? 1.0f : 0.0f;
	pos->origin[0] = node->origin[0];
	pos->origin[1] = node->origin[1];
	pos->origin[2] = node->origin[2];
	pos->angles[0] = node->angles[0];
	pos->angles[1] = node->angles[1];
	pos->angles[2] = node->angles[2];
	pos->lookPos[0] = node->origin[0];
	pos->lookPos[1] = node->origin[1];
	pos->lookPos[2] = node->origin[2];

	pos->switchNode[0].targetname = 0;
	pos->switchNode[0].target = 0;
	pos->switchNode[0].spawnflags = 0;
	pos->switchNode[0].rotated = 0;
	pos->switchNode[0].index = -1;
	pos->switchNode[0].speed = -1.0f;
	pos->switchNode[0].lookahead = -1.0f;
	pos->switchNode[0].origin[0] = 0.0f;
	pos->switchNode[0].origin[1] = 0.0f;
	pos->switchNode[0].origin[2] = 0.0f;
	pos->switchNode[0].dir[0] = 0.0f;
	pos->switchNode[0].dir[1] = 0.0f;
	pos->switchNode[0].dir[2] = 0.0f;
	pos->switchNode[0].angles[0] = DAT_00592740[0];
	pos->switchNode[0].angles[1] = DAT_00592740[1];
	pos->switchNode[0].angles[2] = DAT_00592740[2];
	pos->switchNode[0].length = 0.0f;
	pos->switchNode[0].next = -1;
	pos->switchNode[0].prev = -1;

	pos->switchNode[1].speed = -1.0f;
	pos->switchNode[1].lookahead = -1.0f;
	pos->switchNode[1].targetname = 0;
	pos->switchNode[1].target = 0;
	pos->switchNode[1].spawnflags = 0;
	pos->switchNode[1].index = -1;
	pos->switchNode[1].rotated = 0;
	pos->switchNode[1].origin[0] = 0.0f;
	pos->switchNode[1].origin[1] = 0.0f;
	pos->switchNode[1].origin[2] = 0.0f;
	pos->switchNode[1].dir[0] = 0.0f;
	pos->switchNode[1].dir[1] = 0.0f;
	pos->switchNode[1].dir[2] = 0.0f;
	pos->switchNode[1].angles[0] = DAT_00592740[0];
	pos->switchNode[1].angles[1] = DAT_00592740[1];
	pos->switchNode[1].angles[2] = DAT_00592740[2];
	pos->switchNode[1].length = 0.0f;
	pos->switchNode[1].next = -1;
	pos->switchNode[1].prev = -1;
	return pos;
}

int FUN_004939a0(vp_pos_t *pos, int stopNode)
{
	int result = 0;
	vec3_t vec;
	float step;

	if ( pos->endOfPath )
		return 0;

	FUN_00492f20(pos);
	FUN_00492c50(pos, pos->lookPos);

	vec[0] = pos->lookPos[0] - pos->origin[0];
	vec[1] = pos->lookPos[1] - pos->origin[1];
	vec[2] = pos->lookPos[2] - pos->origin[2];

	if ( Vec3Normalize(vec) <= 0.0f )
	{
		pos->endOfPath = 1;
	}
	else
	{
		vectoangles(vec, pos->angles);
		pos->angles[0] = AngleNormalize180(pos->angles[0]);
		pos->angles[1] = AngleNormalize180(pos->angles[1]);
		pos->angles[2] = AngleNormalize180(pos->angles[2]);

		step = pos->speed * 0.05f;
		pos->origin[0] = step * vec[0] + pos->origin[0];
		pos->origin[1] = vec[1] * step + pos->origin[1];
		pos->origin[2] = vec[2] * step + pos->origin[2];

		result = FUN_00492d00(pos, vec, (short)stopNode);
		FUN_00492af0(pos, pos->angles);
	}

	FUN_00492f50(pos);
	return result;
}

void FUN_00493af0(vp_pos_t *pos, short src, short dst)
{
	vp_node_t *node;
	vp_node_t *srcNode;

	pos->switchNode[0].targetname = 0;
	pos->switchNode[0].target = 0;
	pos->switchNode[0].spawnflags = 0;
	pos->switchNode[0].rotated = 0;
	pos->switchNode[0].index = -1;
	pos->switchNode[0].speed = -1.0f;
	pos->switchNode[0].lookahead = -1.0f;
	pos->switchNode[0].origin[0] = 0.0f;
	pos->switchNode[0].origin[1] = 0.0f;
	pos->switchNode[0].origin[2] = 0.0f;
	pos->switchNode[0].dir[0] = 0.0f;
	pos->switchNode[0].dir[1] = 0.0f;
	pos->switchNode[0].dir[2] = 0.0f;
	pos->switchNode[0].angles[0] = DAT_00592740[0];
	pos->switchNode[0].angles[1] = DAT_00592740[1];
	pos->switchNode[0].angles[2] = DAT_00592740[2];
	pos->switchNode[0].next = -1;
	pos->switchNode[0].prev = -1;
	pos->switchNode[0].length = 0.0f;

	node = &pos->switchNode[1];
	node->index = -1;
	node->targetname = 0;
	node->target = 0;
	node->spawnflags = 0;
	node->rotated = 0;
	node->speed = -1.0f;
	node->lookahead = -1.0f;
	node->origin[0] = 0.0f;
	node->origin[1] = 0.0f;
	node->origin[2] = 0.0f;
	node->dir[0] = 0.0f;
	node->dir[1] = 0.0f;
	node->dir[2] = 0.0f;
	node->angles[0] = DAT_00592740[0];
	node->angles[1] = DAT_00592740[1];
	node->angles[2] = DAT_00592740[2];
	node->next = -1;
	node->prev = -1;
	node->length = 0.0f;

	if ( src >= 0 && dst >= 0 )
	{
		srcNode = &DAT_01154680[src];
		FUN_00492130(srcNode, &pos->switchNode[0]);
		FUN_00492130(srcNode, &pos->switchNode[1]);
		pos->switchNode[0].next = dst;
		pos->switchNode[0].dir[0] = DAT_01154680[dst].origin[0] - srcNode->origin[0];
		pos->switchNode[0].dir[1] = DAT_01154680[dst].origin[1] - srcNode->origin[1];
		pos->switchNode[0].dir[2] = DAT_01154680[dst].origin[2] - srcNode->origin[2];
		pos->switchNode[0].length = Vec3Normalize(pos->switchNode[0].dir);
	}
}
