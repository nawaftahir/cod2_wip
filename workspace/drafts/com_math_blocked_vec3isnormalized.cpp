// Drafts from src/universal/com_math.cpp blocked only on Vec3IsNormalized (0x00482600,
// assigned to src/universal/com_files.cpp per data/tu_map.tsv).
// Currently Vec3IsNormalized is not defined in the tree, so LTCG emits cdecl stack
// calls (`push reg; call; add esp, 4`) instead of register `eax` (`mov eax, reg; call`).
// All instructions after the assertMsg call already match retail 100%.

void PerpendicularVector( const vec3_t src, vec3_t dst )
{
	int best;
	vec3_t sq;
	float scale;

#line 1354
	assertMsg(Vec3IsNormalized( src ), "%s", va("%g %g %g", src[0], src[1], src[2]));

	sq[0] = src[0] * src[0];
	sq[1] = src[1] * src[1];
	sq[2] = src[2] * src[2];

	best = sq[1] < sq[0];

	if ( sq[2] < sq[best] )
	{
		best = 2;
	}

	scale = -src[best];
	VectorScale(src, scale, dst);
	dst[best] += 1.0f;
	Vec3Normalize(dst);
}

void ProjectPointOnPlane( const vec3_t p, const vec3_t normal, vec3_t dst )
{
	float scale;

#line 3235
	assertMsg(Vec3IsNormalized( normal ), "%s", va("%g %g %g", normal[0], normal[1], normal[2]));

	scale = -DotProduct(p, normal);
	VectorMA(p, scale, normal, dst);
}
