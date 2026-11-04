.686
.MODEL FLAT, C
EXTRN sub_100FC27E:PROC
EXTRN sub_100FC292:PROC
EXTRN fp_1010C0C0:DWORD
EXTRN g_101ADD8C:DWORD
EXTRN g_1076AC9C:DWORD
.CODE
__set_osfhnd PROC
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
    cmp dword ptr [esi + eax], -1
    jne L4
    cmp dword ptr [g_101ADD8C], 1
    push ebx
    mov ebx, dword ptr [esp + 20]
    jne L3
    sub ecx, 0
    je L1
    dec ecx
    je L0
    dec ecx
    jne L3
    push ebx
    push -12
    jmp L2
L0:
    push ebx
    push -11
    jmp L2
L1:
    push ebx
    push -10
L2:
    call dword ptr [fp_1010C0C0]
L3:
    mov eax, dword ptr [edi]
    mov dword ptr [esi + eax], ebx
    xor eax, eax
    pop ebx
    jmp L5
L4:
    call sub_100FC27E
    mov dword ptr [eax], 9
    call sub_100FC292
    and dword ptr [eax], 0
    or eax, 0FFFFFFFFh
L5:
    pop edi
    pop esi
    ret
__set_osfhnd ENDP
END
