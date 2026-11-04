.686
.MODEL FLAT, C
EXTRN g_106A3100:DWORD
EXTRN g_106A3104:DWORD
EXTRN g_106A3108:DWORD
EXTRN g_106A310C:DWORD
EXTRN g_106A3110:DWORD
EXTRN g_106A3114:DWORD
EXTRN g_106A3118:DWORD
EXTRN g_106A311C:DWORD
EXTRN g_106A3120:DWORD
EXTRN g_106A3124:DWORD
EXTRN g_106A3128:DWORD
EXTRN g_106A312C:DWORD
.CODE
FUN_1002b9a0 PROC
    xor eax, eax
    push edi
    mov ecx, 00000310Eh
    mov edi, 010696D00h
    rep stosd dword ptr es:[edi], eax
    mov eax, 0106A3128h
    mov dword ptr [g_106A3128], eax
    mov dword ptr [g_106A312C], eax
    mov eax, 0106A3108h
    mov dword ptr [g_106A3108], eax
    mov dword ptr [g_106A310C], eax
    mov eax, 0106A3110h
    mov dword ptr [g_106A3110], eax
    mov dword ptr [g_106A3114], eax
    mov eax, 0106A3118h
    mov dword ptr [g_106A3118], eax
    mov dword ptr [g_106A311C], eax
    mov eax, 0106A3120h
    mov dword ptr [g_106A3120], eax
    mov dword ptr [g_106A3124], eax
    mov dword ptr [g_106A3100], 0106A3100h
    mov dword ptr [g_106A3104], 0106A3100h
    mov eax, 010696F14h
    mov edx, 32
    jmp L0
    lea ebx, [ebx]
L0:
    mov dword ptr [eax - 00000018Ch], 0106A3100h
    mov edi, dword ptr [g_106A3104]
    mov dword ptr [eax - 000000188h], edi
    lea ecx, [eax - 00000018Ch]
    mov dword ptr [g_106A3104], ecx
    mov edi, dword ptr [eax - 000000188h]
    mov dword ptr [edi], ecx
    mov dword ptr [eax - 4], 0106A3100h
    mov edi, dword ptr [g_106A3104]
    mov dword ptr [eax], edi
    lea ecx, [eax - 4]
    mov dword ptr [g_106A3104], ecx
    mov edi, dword ptr [eax]
    mov dword ptr [edi], ecx
    lea ecx, [eax + 000000184h]
    mov dword ptr [ecx], 0106A3100h
    mov edi, dword ptr [g_106A3104]
    mov dword ptr [eax + 000000188h], edi
    mov dword ptr [g_106A3104], ecx
    mov edi, dword ptr [eax + 000000188h]
    mov dword ptr [edi], ecx
    lea ecx, [eax + 00000030Ch]
    mov dword ptr [ecx], 0106A3100h
    mov edi, dword ptr [g_106A3104]
    mov dword ptr [eax + 000000310h], edi
    mov dword ptr [g_106A3104], ecx
    mov edi, dword ptr [eax + 000000310h]
    add eax, 000000620h
    dec edx
    mov dword ptr [edi], ecx
FUN_1002b9a0 ENDP
END
