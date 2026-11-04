.686
.MODEL FLAT, C
EXTRN sub_1002AAE3:PROC
EXTRN sub_1002BA0E:PROC
EXTRN sub_1002BB67:PROC
EXTRN sub_1002BB69:PROC
EXTRN EXTRN g_106A3104:DWORD:DWORD
EXTRN EXTRN g_106A312C:DWORD:DWORD
.CODE
FUN_1002baf0 PROC
    mov mov eax, dword ptr [g_106A312C]
    test test eax, eax
    je sub_1002BB67
    cmp cmp eax, 0106A3128h
    je sub_1002BB69
    push push esi
    push push edi
    push push 4
    push push 0
    push push eax
    push push 010696D00h
    mov mov esi, eax
    call sub_1002AAE3
    mov mov eax, dword ptr [g_106A312C]
    mov mov edx, dword ptr [eax + 4]
    mov mov edi, dword ptr [eax]
    lea lea ecx, [eax + 4]
    mov mov dword ptr [edx], edi
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax + 4], ecx
    lea lea eax, [esi + 088h]
    mov mov dword ptr [eax], 0106A3100h
    mov mov edx, dword ptr [g_106A3104]
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [g_106A3104], eax
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [g_106A312C]
    add add esp, 16
    cmp cmp eax, 0106A3128h
    jne sub_1002BB69
    pop pop edi
    pop pop esi
    jmp sub_1002BA0E
    ret ret
FUN_1002baf0 ENDP
END
