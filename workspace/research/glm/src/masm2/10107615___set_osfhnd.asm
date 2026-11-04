.686
.MODEL FLAT, C
EXTRN sub_100FC27E:PROC
EXTRN sub_100FC292:PROC
EXTRN sub_101076A3:PROC
EXTRN sub_101076A5:PROC
EXTRN sub_101076A9:PROC
EXTRN sub_101076B3:PROC
EXTRN sub_101076B4:PROC
EXTRN sub_101076B8:PROC
EXTRN sub_101076F1:PROC
EXTRN EXTRN fp_1010C0C0:DWORD:DWORD
EXTRN EXTRN g_101ADD8C:DWORD:DWORD
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__set_osfhnd PROC
    mov mov ecx, dword ptr [esp + 4]
    cmp cmp ecx, dword ptr [g_1076AC9C]
    push push esi
    push push edi
    jae L0
    mov mov eax, ecx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ecx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    mov mov eax, dword ptr [edi]
    shl shl esi, 2
    cmp cmp dword ptr [esi + eax], -1
    jne sub_101076A5
    cmp cmp dword ptr [g_101ADD8C], 1
    push push ebx
    mov mov ebx, dword ptr [esp + 20]
    jne sub_101076A9
    sub sub ecx, 0
    je sub_101076A5
    dec dec ecx
    je sub_101076A3
    dec dec ecx
    jne sub_101076B4
    push push ebx
    push push -12
    jmp sub_101076B3
    push push ebx
    push push -11
    jmp sub_101076B8
    push push ebx
    push push -10
    call dword ptr [fp_1010C0C0]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [esi + eax], ebx
    xor xor eax, eax
    pop pop ebx
    jmp sub_101076F1
    call sub_100FC27E
    mov mov dword ptr [eax], 9
    call sub_100FC292
    and and dword ptr [eax], 0
    or or eax, -1
    pop pop edi
    pop pop esi
    ret ret
__set_osfhnd ENDP
END
