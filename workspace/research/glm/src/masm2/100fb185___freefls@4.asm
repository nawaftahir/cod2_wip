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
EXTRN sub_100FB2BE:PROC
EXTRN sub_100FB2C2:PROC
EXTRN sub_100FB2C3:PROC
EXTRN sub_100FB2CA:PROC
EXTRN sub_100FB328:PROC
EXTRN sub_100FB33C:PROC
EXTRN sub_100FB350:PROC
EXTRN sub_100FB362:PROC
EXTRN sub_100FB364:PROC
EXTRN sub_100FB366:PROC
EXTRN sub_100FB39D:PROC
EXTRN sub_100FB3A4:PROC
EXTRN sub_100FB3A8:PROC
EXTRN sub_100FB3E1:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB775:PROC
EXTRN sub_100FC102:PROC
EXTRN sub_100FC133:PROC
EXTRN EXTRN g_101A4684:DWORD:DWORD
EXTRN EXTRN g_1076AA34:DWORD:DWORD
.CODE
__freefls@4 PROC
    push push 16
    push push 01017C7A8h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    xor xor edi, edi
    cmp cmp esi, edi
    je sub_100FB2C3
    mov mov eax, dword ptr [esi + 36]
    cmp cmp eax, edi
    je L0
    push push eax
    call sub_100F84F6
    pop pop ecx
    mov mov eax, dword ptr [esi + 44]
    cmp cmp eax, edi
    je L1
    push push eax
    call sub_100F8504
    pop pop ecx
    mov mov eax, dword ptr [esi + 52]
    cmp cmp eax, edi
    je L2
    push push eax
    call sub_100F8512
    pop pop ecx
    mov mov eax, dword ptr [esi + 60]
    cmp cmp eax, edi
    je L3
    push push eax
    call sub_100F8520
    pop pop ecx
    mov mov eax, dword ptr [esi + 68]
    cmp cmp eax, edi
    je L4
    push push eax
    call sub_100F852E
    pop pop ecx
    mov mov eax, dword ptr [esi + 72]
    cmp cmp eax, edi
    je L5
    push push eax
    call sub_100F853C
    pop pop ecx
    mov mov eax, dword ptr [esi + 84]
    cmp cmp eax, 0101A4E88h
    je L6
    push push eax
    call sub_100F854D
    pop pop ecx
    push push 13
    call sub_100FC102
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    mov mov eax, dword ptr [esi + 96]
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, edi
    je sub_100FB2BE
    dec dec dword ptr [eax]
    jne sub_100FB2C2
    cmp cmp eax, dword ptr [g_1076AA34]
    je sub_100FB2CA
    push push eax
    call sub_100F8575
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100FB366
    push push 12
    call sub_100FC133
    pop pop ecx
L4:
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [esi + 100]
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, edi
    je sub_100FB362
    dec dec dword ptr [eax]
    cmp cmp dword ptr [eax + 44], edi
    je sub_100FB328
    mov mov ecx, dword ptr [eax + 44]
    dec dec dword ptr [ecx]
    cmp cmp dword ptr [eax + 52], edi
    je sub_100FB33C
    mov mov ecx, dword ptr [eax + 52]
    dec dec dword ptr [ecx]
    cmp cmp dword ptr [eax + 48], edi
    je sub_100FB350
    mov mov ecx, dword ptr [eax + 48]
    dec dec dword ptr [ecx]
    cmp cmp dword ptr [eax + 64], edi
    je sub_100FB364
    mov mov ecx, dword ptr [eax + 64]
    dec dec dword ptr [ecx]
    mov mov ecx, dword ptr [eax + 76]
L6:
    dec dec dword ptr [ecx + 0B4h]
    cmp cmp eax, dword ptr [g_101A4684]
    je sub_100FB39D
    cmp cmp eax, 0101A4630h
    je sub_100FB3A4
    cmp cmp dword ptr [eax], edi
    jne sub_100FB3A8
    push push eax
    call sub_100F7AEA
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100FB3E1
    push push esi
    call sub_100F85F4
    pop pop ecx
    call sub_100FB775
    ret ret 4
__freefls@4 ENDP
END
