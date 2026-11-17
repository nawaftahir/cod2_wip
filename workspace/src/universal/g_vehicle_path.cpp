#include "q_shared.h"

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

#define VP_MAX_NODES 1500

short DAT_01154630;
vp_node_t DAT_01154680[VP_MAX_NODES];
float DAT_00592740[3] = { 3.1415927f, 3.1415927f, 3.1415927f };

short FUN_004921b0(const char *targetname, const float *origin);

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

void FUN_004930b0()
{
	DAT_01154630 = 0;
}

void FUN_004930c0()
{
	DAT_01154630 = 0;
}

extern "C" void FUN_00493840() {}
