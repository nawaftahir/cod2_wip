.686
.MODEL FLAT, C
EXTRN sub_100FC281:PROC
EXTRN sub_100FC295:PROC
EXTRN fp_1010C0C0:DWORD
EXTRN g_101ADD8C:DWORD
EXTRN g_1076AC9C:DWORD
.CODE
__free_osfhnd PROC
    mov ecx, dword ptr [esp + 4]
    cmp ecx, dword ptr [g_1076AC9C]
    push esi
    push edi
    jae L4
    mov eax, ecx
    sar eax, 5
    lea edi, [eax*4 + 01076ACA0h]
    mov eax, ecx
    and eax, 31
    lea esi, [eax + eax*8]
    mov eax, dword ptr [edi]
    shl esi, 2
    add eax, esi
    test byte ptr [eax + 4], 1
    je L4
    cmp dword ptr [eax], -1
    je L4
    cmp dword ptr [g_101ADD8C], 1
    jne L3
    xor eax, eax
    sub ecx, eax
    je L1
    dec ecx
    je L0
    dec ecx
    jne L3
    push eax
    push -12
    jmp L2
L0:
    push eax
    push -11
    jmp L2
L1:
    push eax
    push -10
L2:
    call dword ptr [fp_1010C0C0]
L3:
    mov eax, dword ptr [edi]
    or dword ptr [esi + eax], 0FFFFFFFFh
    xor eax, eax
    jmp L5
L4:
    call sub_100FC281
    mov dword ptr [eax], 9
    call sub_100FC295
    and dword ptr [eax], 0
    or eax, 0FFFFFFFFh
L5:
    pop edi
    pop esi
    ret
__free_osfhnd ENDP
END
