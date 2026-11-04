.686
.MODEL FLAT, C
EXTRN sub_100F7AEA:PROC
EXTRN sub_100F84F6:PROC
EXTRN sub_100F8504:PROC
EXTRN sub_100F8512:PROC
EXTRN sub_100F8520:PROC
EXTRN sub_100F852E:PROC
EXTRN sub_100F853C:PROC
EXTRN sub_100F854D:PROC
EXTRN sub_100F8575:PROC
EXTRN sub_100F85F4:PROC
EXTRN sub_100FB366:PROC
EXTRN sub_100FB3E1:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB775:PROC
EXTRN sub_100FC102:PROC
EXTRN sub_100FC133:PROC
EXTRN g_101A4684:DWORD
EXTRN g_1076AA34:DWORD
.CODE
__freefls@4 PROC
    push 16
    push 01017C7A8h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    xor edi, edi
    cmp esi, edi
    je L13
    mov eax, dword ptr [esi + 36]
    cmp eax, edi
    je L0
    push eax
    call sub_100F84F6
    pop ecx
L0:
    mov eax, dword ptr [esi + 44]
    cmp eax, edi
    je L1
    push eax
    call sub_100F8504
    pop ecx
L1:
    mov eax, dword ptr [esi + 52]
    cmp eax, edi
    je L2
    push eax
    call sub_100F8512
    pop ecx
L2:
    mov eax, dword ptr [esi + 60]
    cmp eax, edi
    je L3
    push eax
    call sub_100F8520
    pop ecx
L3:
    mov eax, dword ptr [esi + 68]
    cmp eax, edi
    je L4
    push eax
    call sub_100F852E
    pop ecx
L4:
    mov eax, dword ptr [esi + 72]
    cmp eax, edi
    je L5
    push eax
    call sub_100F853C
    pop ecx
L5:
    mov eax, dword ptr [esi + 84]
    cmp eax, 0101A4E88h
    je L6
    push eax
    call sub_100F854D
    pop ecx
L6:
    push 13
    call sub_100FC102
    pop ecx
    mov dword ptr [ebp - 4], edi
    mov eax, dword ptr [esi + 96]
    mov dword ptr [ebp - 28], eax
    cmp eax, edi
    je L7
    dec dword ptr [eax]
    jne L7
    cmp eax, dword ptr [g_1076AA34]
    je L7
    push eax
    call sub_100F8575
    pop ecx
L7:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FB366
    push 12
    call sub_100FC133
    pop ecx
    mov dword ptr [ebp - 4], 1
    mov eax, dword ptr [esi + 100]
    mov dword ptr [ebp - 32], eax
    cmp eax, edi
    je L12
    dec dword ptr [eax]
    cmp dword ptr [eax + 44], edi
    je L8
    mov ecx, dword ptr [eax + 44]
    dec dword ptr [ecx]
L8:
    cmp dword ptr [eax + 52], edi
    je L9
    mov ecx, dword ptr [eax + 52]
    dec dword ptr [ecx]
L9:
    cmp dword ptr [eax + 48], edi
    je L10
    mov ecx, dword ptr [eax + 48]
    dec dword ptr [ecx]
L10:
    cmp dword ptr [eax + 64], edi
    je L11
    mov ecx, dword ptr [eax + 64]
    dec dword ptr [ecx]
L11:
    mov ecx, dword ptr [eax + 76]
    dec dword ptr [ecx + 0000000B4h]
    cmp eax, dword ptr [g_101A4684]
    je L12
    cmp eax, 0101A4630h
    je L12
    cmp dword ptr [eax], edi
    jne L12
    push eax
    call sub_100F7AEA
    pop ecx
L12:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FB3E1
    push esi
    call sub_100F85F4
    pop ecx
L13:
    call sub_100FB775
    ret 4
__freefls@4 ENDP
END
