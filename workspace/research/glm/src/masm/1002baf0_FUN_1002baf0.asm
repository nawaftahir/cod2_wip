.686
.MODEL FLAT, C
EXTRN sub_1002AAE3:PROC
EXTRN sub_1002BA0E:PROC
EXTRN g_106A3104:DWORD
EXTRN g_106A312C:DWORD
.CODE
FUN_1002baf0 PROC
    mov eax, dword ptr [g_106A312C]
    test eax, eax
    je L2
    cmp eax, 0106A3128h
    je L1
    push esi
    push edi
L0:
    push 4
    push 0
    push eax
    push 010696D00h
    mov esi, eax
    call sub_1002AAE3
    mov eax, dword ptr [g_106A312C]
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [eax]
    lea ecx, [eax + 4]
    mov dword ptr [edx], edi
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + 4], ecx
    lea eax, [esi + 000000088h]
    mov dword ptr [eax], 0106A3100h
    mov edx, dword ptr [g_106A3104]
    mov dword ptr [eax + 4], edx
    mov dword ptr [g_106A3104], eax
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_106A312C]
    add esp, 16
    cmp eax, 0106A3128h
    jne L0
    pop edi
    pop esi
L1:
    jmp sub_1002BA0E
L2:
    ret
FUN_1002baf0 ENDP
END
