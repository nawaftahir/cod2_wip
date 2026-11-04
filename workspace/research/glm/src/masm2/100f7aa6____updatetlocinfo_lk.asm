.686
.MODEL FLAT, C
EXTRN sub_100F7A91:PROC
EXTRN sub_100F7B79:PROC
EXTRN sub_100F7B7A:PROC
EXTRN sub_100F7B98:PROC
EXTRN sub_100F7BB6:PROC
EXTRN sub_100F7BD4:PROC
EXTRN sub_100F7C0B:PROC
EXTRN sub_100F7C0F:PROC
EXTRN sub_100F7C17:PROC
EXTRN sub_100FB11A:PROC
EXTRN EXTRN g_101A4684:DWORD:DWORD
.CODE
___updatetlocinfo_lk PROC
    push push esi
    call sub_100FB11A
    mov mov esi, eax
    mov mov ecx, dword ptr [esi + 100]
    cmp cmp ecx, dword ptr [g_101A4684]
    je sub_100F7B79
    xor xor edx, edx
    cmp cmp ecx, edx
    je L2
    mov mov eax, dword ptr [ecx + 44]
    dec dec dword ptr [ecx]
    cmp cmp eax, edx
    je L0
    dec dec dword ptr [eax]
    mov mov eax, dword ptr [ecx + 52]
    cmp cmp eax, edx
    je L1
    dec dec dword ptr [eax]
    mov mov eax, dword ptr [ecx + 48]
    cmp cmp eax, edx
    je L3
    dec dec dword ptr [eax]
    mov mov eax, dword ptr [ecx + 64]
    cmp cmp eax, edx
    je L4
    dec dec dword ptr [eax]
    mov mov eax, dword ptr [ecx + 76]
    dec dec dword ptr [eax + 0B4h]
    mov mov eax, dword ptr [g_101A4684]
    mov mov dword ptr [esi + 100], eax
    mov mov eax, dword ptr [g_101A4684]
    inc inc dword ptr [eax]
    mov mov eax, dword ptr [g_101A4684]
L1:
    cmp cmp dword ptr [eax + 44], edx
    je sub_100F7B7A
    mov mov eax, dword ptr [eax + 44]
    inc inc dword ptr [eax]
    mov mov eax, dword ptr [g_101A4684]
    cmp cmp dword ptr [eax + 52], edx
L3:
    je sub_100F7B98
    mov mov eax, dword ptr [eax + 52]
    inc inc dword ptr [eax]
    mov mov eax, dword ptr [g_101A4684]
    cmp cmp dword ptr [eax + 48], edx
    je sub_100F7BB6
    mov mov eax, dword ptr [eax + 48]
    inc inc dword ptr [eax]
    mov mov eax, dword ptr [g_101A4684]
    cmp cmp dword ptr [eax + 64], edx
    je sub_100F7BD4
    mov mov eax, dword ptr [eax + 64]
    inc inc dword ptr [eax]
    mov mov eax, dword ptr [g_101A4684]
    mov mov eax, dword ptr [eax + 76]
    inc inc dword ptr [eax + 0B4h]
    cmp cmp ecx, edx
    je sub_100F7C0B
    cmp cmp dword ptr [ecx], edx
    jne sub_100F7C0F
    cmp cmp ecx, 0101A4630h
    je sub_100F7C17
    push push ecx
    call sub_100F7A91
    pop pop ecx
    mov mov eax, dword ptr [esi + 100]
    pop pop esi
    ret ret
___updatetlocinfo_lk ENDP
END
