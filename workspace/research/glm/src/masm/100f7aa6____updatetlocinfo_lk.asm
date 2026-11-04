.686
.MODEL FLAT, C
EXTRN sub_100F7A91:PROC
EXTRN sub_100FB11A:PROC
EXTRN g_101A4684:DWORD
.CODE
___updatetlocinfo_lk PROC
    push esi
    call sub_100FB11A
    mov esi, eax
    mov ecx, dword ptr [esi + 100]
    cmp ecx, dword ptr [g_101A4684]
    je L9
    xor edx, edx
    cmp ecx, edx
    je L4
    mov eax, dword ptr [ecx + 44]
    dec dword ptr [ecx]
    cmp eax, edx
    je L0
    dec dword ptr [eax]
L0:
    mov eax, dword ptr [ecx + 52]
    cmp eax, edx
    je L1
    dec dword ptr [eax]
L1:
    mov eax, dword ptr [ecx + 48]
    cmp eax, edx
    je L2
    dec dword ptr [eax]
L2:
    mov eax, dword ptr [ecx + 64]
    cmp eax, edx
    je L3
    dec dword ptr [eax]
L3:
    mov eax, dword ptr [ecx + 76]
    dec dword ptr [eax + 0000000B4h]
L4:
    mov eax, dword ptr [g_101A4684]
    mov dword ptr [esi + 100], eax
    mov eax, dword ptr [g_101A4684]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101A4684]
    cmp dword ptr [eax + 44], edx
    je L5
    mov eax, dword ptr [eax + 44]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101A4684]
L5:
    cmp dword ptr [eax + 52], edx
    je L6
    mov eax, dword ptr [eax + 52]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101A4684]
L6:
    cmp dword ptr [eax + 48], edx
    je L7
    mov eax, dword ptr [eax + 48]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101A4684]
L7:
    cmp dword ptr [eax + 64], edx
    je L8
    mov eax, dword ptr [eax + 64]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101A4684]
L8:
    mov eax, dword ptr [eax + 76]
    inc dword ptr [eax + 0000000B4h]
    cmp ecx, edx
    je L9
    cmp dword ptr [ecx], edx
    jne L9
    cmp ecx, 0101A4630h
    je L9
    push ecx
    call sub_100F7A91
    pop ecx
L9:
    mov eax, dword ptr [esi + 100]
    pop esi
    ret
___updatetlocinfo_lk ENDP
END
