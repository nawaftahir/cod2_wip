// Drafts from src/xanim/dobj.cpp blocked on banned __asm in FastSinCos (com_math.h).
// DObjSetLocalTagInternal (0x004a6ff0, 320 B): attempt 1/3 -> 25%, 358/320 B (+0x5);
// retail inlines FastSinCos fsincos at +0x48, +0x72, +0x9d, whereas non-asm FastSinCos
// emits 6 calls to sin/cos.
// DObjSetLocalBoneIndex (0x004a71d0, 52 B): attempt 1/3 -> 36%, 47/52 B (+0x3);
// calls DObjSetLocalTagInternal and inherits shifted /LTCG register allocation.

void DObjSetLocalTagInternal(const DObj_s *obj, const float *trans, const float *angles, int boneIndex)
{
	DObjAnimMat *rotTrans;
	vec2_t yaw;
	vec2_t roll;
	vec2_t pitch;
	vec4_t tempQuat;

	rotTrans = DObjGetRotTransArray(obj);

	if ( !rotTrans )
		return;

	rotTrans += boneIndex;

	if ( angles )
	{
		FastSinCos(angles[1] * 0.0087266462f, &yaw[0], &yaw[1]);
		FastSinCos(angles[0] * 0.0087266462f, &pitch[0], &pitch[1]);
		FastSinCos(angles[2] * 0.0087266462f, &roll[0], &roll[1]);

		tempQuat[0] = -pitch[0] * yaw[0];
		tempQuat[1] = pitch[0] * yaw[1];
		tempQuat[2] = pitch[1] * yaw[0];
		tempQuat[3] = pitch[1] * yaw[1];

		rotTrans->quat[0] = roll[0] * tempQuat[3] + roll[1] * tempQuat[0];
		rotTrans->quat[1] = roll[1] * tempQuat[1] + roll[0] * tempQuat[2];
		rotTrans->quat[2] = -roll[0] * tempQuat[1] + roll[1] * tempQuat[2];
		rotTrans->quat[3] = roll[1] * tempQuat[3] - roll[0] * tempQuat[0];
	}
	else
	{
		Vector4Set(rotTrans->quat, 0, 0, 0, 1);
	}

	rotTrans->transWeight = 0;
	VectorCopy(trans, rotTrans->trans);
}

bool DObjSetLocalBoneIndex(const DObj_s *obj, int *partBits, int boneIndex, const float *trans, const float *angles)
{
	if ( !DObjSetRotTransIndex(obj, partBits, boneIndex) )
		return false;

	DObjSetLocalTagInternal(obj, trans, angles, boneIndex);
	return true;
}
