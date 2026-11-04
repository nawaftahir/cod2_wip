.686
.MODEL FLAT, C
EXTRN sub_10063A89:PROC
EXTRN sub_10063B3D:PROC
EXTRN sub_10063B44:PROC
EXTRN sub_10067777:PROC
EXTRN sub_1008233F:PROC
EXTRN sub_10082689:PROC
EXTRN sub_100F788D:PROC
.CODE
FUN_10063acc PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 56]
    test test ecx, ecx
    je L0
    push push 1
    call sub_10063A89
    push push edi
    mov mov edi, dword ptr [esi + 108]
    test test edi, edi
    je L2
    mov mov ecx, edi
    call L1
L1:
    push push edi
    call sub_100F788D
    pop pop ecx
    cmp cmp dword ptr [esi + 88], 0
    pop pop edi
    je sub_10063B3D
    mov mov ecx, dword ptr [esi + 100]
    test test ecx, ecx
    je sub_10063B44
    mov mov eax, dword ptr [esi + 88]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push eax
    call call dword ptr [edx + 4]
    lea lea ecx, [esi + 76]
L2:
    call sub_1008233F
    lea lea ecx, [esi + 60]
    call sub_10082689
    mov mov ecx, esi
    pop pop esi
    jmp sub_10067777
FUN_10063acc ENDP
END
