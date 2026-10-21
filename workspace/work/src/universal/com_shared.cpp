#include "../qcommon/qcommon.h"

// Renderer copy: only the memory helpers of the engine TU are linked into gfx_d3d.

static __declspec(noinline) void _copyDWord( unsigned int *dest, const unsigned int constant, const unsigned int count )
{
	__asm
	{
			mov		edx, dest
			mov		eax, constant
			mov		ecx, count
			and		ecx, ~7
			jz		padding
			sub		ecx, 8
			jmp		loopu
			align	16
loopu:
			test	[edx + ecx * 4 + 28], ebx	// fetch next block destination to L1 cache
			mov		[edx + ecx * 4 + 0], eax
			mov		[edx + ecx * 4 + 4], eax
			mov		[edx + ecx * 4 + 8], eax
			mov		[edx + ecx * 4 + 12], eax
			mov		[edx + ecx * 4 + 16], eax
			mov		[edx + ecx * 4 + 20], eax
			mov		[edx + ecx * 4 + 24], eax
			mov		[edx + ecx * 4 + 28], eax
			sub		ecx, 8
			jge		loopu
padding:
			mov		ecx, count
			mov		ebx, ecx
			and		ecx, 7
			jz		outta
			and		ebx, ~7
			lea		edx, [edx + ebx * 4]		// advance dest pointer
			test	[edx + 0], eax				// fetch destination to L1 cache
			cmp		ecx, 4
			jl		skip4
			mov		[edx + 0], eax
			mov		[edx + 4], eax
			mov		[edx + 8], eax
			mov		[edx + 12], eax
			add		edx, 16
			sub		ecx, 4
skip4:
			cmp		ecx, 2
			jl		skip2
			mov		[edx + 0], eax
			mov		[edx + 4], eax
			add		edx, 8
			sub		ecx, 2
skip2:
			cmp		ecx, 1
			jl		outta
			mov		[edx + 0], eax
outta:
	}
}

// optimized memory copy routine that handles all alignment cases and block sizes efficiently
__declspec(noinline) void Com_Memcpy( void *dest, const void *src, int count )
{
	// prefetch source (Q3 Com_Prefetch, PRE_READ)
	__asm
	{
			mov		ebx, src
			mov		ecx, count
			cmp		ecx, 4096					// clamp to 4kB
			jle		skipClamp
			mov		ecx, 4096
skipClamp:
			add		ecx, 0x1f
			shr		ecx, 5						// number of cache lines
			jz		skip
			jmp		loopie
			align	16
loopie:
			test	byte ptr [ebx], al
			add		ebx, 32
			dec		ecx
			jnz		loopie
skip:
	}

	__asm
	{
		push	edi
		push	esi
		mov		ecx, count
		cmp		ecx, 0							// count = 0 check (just to be on the safe side)
		je		outta
		mov		edx, dest
		mov		ebx, src
		cmp		ecx, 32							// padding only?
		jl		padding

		mov		edi, ecx
		and		edi, ~31						// edi = count & ~31
		sub		edi, 32

		align	16
loopMisAligned:
		mov		eax, [ebx + edi + 0 + 0 * 8]
		mov		esi, [ebx + edi + 4 + 0 * 8]
		mov		[edx + edi + 0 + 0 * 8], eax
		mov		[edx + edi + 4 + 0 * 8], esi
		mov		eax, [ebx + edi + 0 + 1 * 8]
		mov		esi, [ebx + edi + 4 + 1 * 8]
		mov		[edx + edi + 0 + 1 * 8], eax
		mov		[edx + edi + 4 + 1 * 8], esi
		mov		eax, [ebx + edi + 0 + 2 * 8]
		mov		esi, [ebx + edi + 4 + 2 * 8]
		mov		[edx + edi + 0 + 2 * 8], eax
		mov		[edx + edi + 4 + 2 * 8], esi
		mov		eax, [ebx + edi + 0 + 3 * 8]
		mov		esi, [ebx + edi + 4 + 3 * 8]
		mov		[edx + edi + 0 + 3 * 8], eax
		mov		[edx + edi + 4 + 3 * 8], esi
		sub		edi, 32
		jge		loopMisAligned

		mov		edi, ecx
		and		edi, ~31
		add		ebx, edi						// increase src pointer
		add		edx, edi						// increase dst pointer
		and		ecx, 31							// new count
		jz		outta							// if count = 0, get outta here

padding:
		cmp		ecx, 16
		jl		skip16
		mov		eax, dword ptr [ebx]
		mov		dword ptr [edx], eax
		mov		eax, dword ptr [ebx + 4]
		mov		dword ptr [edx + 4], eax
		mov		eax, dword ptr [ebx + 8]
		mov		dword ptr [edx + 8], eax
		mov		eax, dword ptr [ebx + 12]
		mov		dword ptr [edx + 12], eax
		sub		ecx, 16
		add		ebx, 16
		add		edx, 16
skip16:
		cmp		ecx, 8
		jl		skip8
		mov		eax, dword ptr [ebx]
		mov		dword ptr [edx], eax
		mov		eax, dword ptr [ebx + 4]
		sub		ecx, 8
		mov		dword ptr [edx + 4], eax
		add		ebx, 8
		add		edx, 8
skip8:
		cmp		ecx, 4
		jl		skip4
		mov		eax, dword ptr [ebx]			// here 4-7 bytes
		add		ebx, 4
		sub		ecx, 4
		mov		dword ptr [edx], eax
		add		edx, 4
skip4:											// 0-3 remaining bytes
		cmp		ecx, 2
		jl		skip2
		mov		ax, word ptr [ebx]				// two bytes
		cmp		ecx, 3							// less than 3?
		mov		word ptr [edx], ax
		jl		outta
		mov		al, byte ptr [ebx + 2]			// last byte
		mov		byte ptr [edx + 2], al
		jmp		outta
skip2:
		cmp		ecx, 1
		jl		outta
		mov		al, byte ptr [ebx]
		mov		byte ptr [edx], al
outta:
		pop		esi
		pop		edi
	}
}

__declspec(noinline) void Com_Memset( void *dest, int val, int count )
{
	unsigned int fillval;

	if ( count < 8 )
	{
		__asm
		{
			mov		edx, dest
			mov		eax, val
			mov		ah, al
			mov		ebx, eax
			and		ebx, 0xffff
			shl		eax, 16
			add		eax, ebx					// eax now contains pattern
			mov		ecx, count
			cmp		ecx, 4
			jl		skip4
			mov		[edx], eax					// copy first dword
			add		edx, 4
			sub		ecx, 4
skip4:
			cmp		ecx, 2
			jl		skip2
			mov		word ptr [edx], ax			// copy 2 bytes
			add		edx, 2
			sub		ecx, 2
skip2:
			cmp		ecx, 0
			je		skip1
			mov		byte ptr [edx], al			// copy single byte
skip1:
		}
		return;
	}

	fillval = val;

	fillval = fillval | ( fillval << 8 );
	fillval = fillval | ( fillval << 16 );			// fill dword with 8-bit pattern

	_copyDWord( (unsigned int *)dest, fillval, count / 4 );

	__asm											// padding of 0-3 bytes
	{
		mov		ecx, count
		mov		eax, ecx
		and		ecx, 3
		jz		skipA
		and		eax, ~3
		mov		ebx, dest
		add		ebx, eax
		mov		eax, fillval
		cmp		ecx, 2
		jl		skipB
		mov		word ptr [ebx], ax
		cmp		ecx, 2
		je		skipA
		mov		byte ptr [ebx + 2], al
		jmp		skipA
skipB:
		cmp		ecx, 0
		je		skipA
		mov		byte ptr [ebx], al
skipA:
	}
}
