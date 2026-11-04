.686
.MODEL FLAT, C
EXTRN sub_10063A89:PROC
EXTRN sub_10067777:PROC
EXTRN sub_1008233F:PROC
EXTRN sub_10082689:PROC
EXTRN sub_100F788D:PROC
.CODE
FUN_10063acc PROC
L0:
    mov edi, edi
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 56]
    test ecx, ecx
    je L1
    push 1
    call sub_10063A89
L1:
    push edi
    mov edi, dword ptr [esi + 108]
    test edi, edi
    je L2
    mov ecx, edi
    call L0
    push edi
    call sub_100F788D
    pop ecx
L2:
    cmp dword ptr [esi + 88], 0
    pop edi
    je L3
    mov ecx, dword ptr [esi + 100]
    test ecx, ecx
    je L3
    mov eax, dword ptr [esi + 88]
    mov edx, dword ptr [eax]
    push ecx
    push eax
    call dword ptr [edx + 4]
L3:
    lea ecx, [esi + 76]
    call sub_1008233F
    lea ecx, [esi + 60]
    call sub_10082689
    mov ecx, esi
    pop esi
    jmp sub_10067777
FUN_10063acc ENDP
END
