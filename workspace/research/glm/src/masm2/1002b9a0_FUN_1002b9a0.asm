.686
.MODEL FLAT, C
EXTRN EXTRN g_106A3100:DWORD:DWORD
EXTRN EXTRN g_106A3104:DWORD:DWORD
EXTRN EXTRN g_106A3108:DWORD:DWORD
EXTRN EXTRN g_106A310C:DWORD:DWORD
EXTRN EXTRN g_106A3110:DWORD:DWORD
EXTRN EXTRN g_106A3114:DWORD:DWORD
EXTRN EXTRN g_106A3118:DWORD:DWORD
EXTRN EXTRN g_106A311C:DWORD:DWORD
EXTRN EXTRN g_106A3120:DWORD:DWORD
EXTRN EXTRN g_106A3124:DWORD:DWORD
EXTRN EXTRN g_106A3128:DWORD:DWORD
EXTRN EXTRN g_106A312C:DWORD:DWORD
.CODE
FUN_1002b9a0 PROC
    xor xor eax, eax
    push push edi
    mov mov ecx, 0310Eh
    mov mov edi, 010696D00h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, 0106A3128h
    mov mov dword ptr [g_106A3128], eax
    mov mov dword ptr [g_106A312C], eax
    mov mov eax, 0106A3108h
    mov mov dword ptr [g_106A3108], eax
    mov mov dword ptr [g_106A310C], eax
    mov mov eax, 0106A3110h
    mov mov dword ptr [g_106A3110], eax
    mov mov dword ptr [g_106A3114], eax
    mov mov eax, 0106A3118h
    mov mov dword ptr [g_106A3118], eax
    mov mov dword ptr [g_106A311C], eax
    mov mov eax, 0106A3120h
    mov mov dword ptr [g_106A3120], eax
    mov mov dword ptr [g_106A3124], eax
    mov mov dword ptr [g_106A3100], 0106A3100h
    mov mov dword ptr [g_106A3104], 0106A3100h
    mov mov eax, 010696F14h
    mov mov edx, 32
    jmp L0
    lea lea ebx, [ebx]
    mov mov dword ptr [eax - 018Ch], 0106A3100h
    mov mov edi, dword ptr [g_106A3104]
    mov mov dword ptr [eax - 0188h], edi
    lea lea ecx, [eax - 018Ch]
    mov mov dword ptr [g_106A3104], ecx
    mov mov edi, dword ptr [eax - 0188h]
    mov mov dword ptr [edi], ecx
    mov mov dword ptr [eax - 4], 0106A3100h
    mov mov edi, dword ptr [g_106A3104]
    mov mov dword ptr [eax], edi
    lea lea ecx, [eax - 4]
    mov mov dword ptr [g_106A3104], ecx
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [edi], ecx
    lea lea ecx, [eax + 0184h]
    mov mov dword ptr [ecx], 0106A3100h
    mov mov edi, dword ptr [g_106A3104]
    mov mov dword ptr [eax + 0188h], edi
    mov mov dword ptr [g_106A3104], ecx
    mov mov edi, dword ptr [eax + 0188h]
    mov mov dword ptr [edi], ecx
    lea lea ecx, [eax + 030Ch]
    mov mov dword ptr [ecx], 0106A3100h
    mov mov edi, dword ptr [g_106A3104]
    mov mov dword ptr [eax + 0310h], edi
    mov mov dword ptr [g_106A3104], ecx
    mov mov edi, dword ptr [eax + 0310h]
    add add eax, 0620h
    dec dec edx
    mov mov dword ptr [edi], ecx
FUN_1002b9a0 ENDP
END
