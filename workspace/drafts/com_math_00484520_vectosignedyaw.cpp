// Draft from src/universal/com_math.cpp (0x00484520, 278 B) - 97% match (278/278),
// failed only at +0xfe..+0x111 where retail hoists `fld dword ptr [ebp-4]`
// before `jne` in assert(yaw <= 180) and sinks `pop esi` after `fld` on `call esi`.
// Left out after 3 attempts per worker rule.

vec_t vectosignedyaw( vec3_t vec )
{
	float yaw;

	if ( vec[1] == 0.0f && vec[0] == 0.0f )
	{
		yaw = 0.0f;
	}
	else
	{
		yaw = (float)atan2(vec[1], vec[0]) * 180.0f / 3.141592741012573f;
#line 1134
		assert(yaw >= -180);
#line 1135
		assert(yaw <= 180);
	}

	return yaw;
}
