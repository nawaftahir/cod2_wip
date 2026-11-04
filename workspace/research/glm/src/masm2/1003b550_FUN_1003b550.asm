.686
.MODEL FLAT, C
EXTRN sub_1003A67D:PROC
EXTRN sub_1003A923:PROC
EXTRN sub_1003A956:PROC
EXTRN sub_1003AAAC:PROC
EXTRN sub_1003B1B4:PROC
EXTRN sub_1003B4E4:PROC
EXTRN sub_1003B7B0:PROC
EXTRN sub_1003B7B6:PROC
EXTRN sub_1003B7C5:PROC
EXTRN sub_1003B7DE:PROC
EXTRN sub_1003B808:PROC
EXTRN sub_1003B82A:PROC
EXTRN sub_1003B842:PROC
EXTRN sub_1003B861:PROC
EXTRN sub_1003B8B5:PROC
EXTRN sub_1003B8BB:PROC
EXTRN sub_1003B8D0:PROC
EXTRN sub_1003B8E4:PROC
EXTRN sub_1003E6A2:PROC
EXTRN EXTRN g_1010C0E0:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDC4:DWORD:DWORD
EXTRN EXTRN g_101D1B3C:DWORD:DWORD
EXTRN EXTRN g_101D481C:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDB0:DWORD:DWORD
EXTRN EXTRN g_1072DE30:DWORD:DWORD
EXTRN EXTRN g_1072DE34:DWORD:DWORD
EXTRN EXTRN g_1072DE38:DWORD:DWORD
EXTRN EXTRN g_1072DE3C:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003b550 PROC
    mov mov eax, dword ptr [g_1072DDB0]
    sub sub esp, 8
    and and eax, 080000001h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    push push edi
    jns L0
    dec dec eax
    or or eax, -2
    inc inc eax
    mov mov ecx, dword ptr [g_1072DE30]
    lea lea ebx, [eax + ecx*2]
    mov mov eax, dword ptr [ebp + ebx*4 + 36]
    test test eax, eax
    jne L1
    mov mov esi, ebp
    call sub_1003B4E4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A923
    mov mov eax, dword ptr [g_101D1B3C]
    cmp cmp dword ptr [g_1072D9BC], eax
    mov mov edi, eax
    mov mov esi, 3
    jne L4
    cmp cmp dword ptr [g_1072D9C0], esi
    je L6
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L5
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L7
    call sub_1003A956
    push push 31
    call sub_1003A67D
    add add esp, 4
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    lea lea esi, [eax + 01072DEE0h]
L3:
    lea lea edi, [eax + 01072EBB0h]
    mov mov ecx, 0334h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fild fild dword ptr [g_1072DE3C]
    fdivr fdivr dword ptr [g_1019BDC4]
    mov mov byte ptr [esp + 30], 0
    mov mov byte ptr [esp + 29], 0
    mov mov byte ptr [esp + 28], 0
    mov mov byte ptr [esp + 31], 0FFh
    mov mov edx, dword ptr [esp + 28]
    push push edx
    sub sub esp, 8
L4:
    inc inc dword ptr [g_10730550]
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1072DE38]
    fdivr fdivr dword ptr [g_1019BDC4]
    fstp fstp dword ptr [esp]
    call sub_1003B1B4
    mov mov al, byte ptr [ebx + ebp + 44]
    add add esp, 12
    test test al, al
    je sub_1003B7C5
L6:
    push push 1
    push push 4
    mov mov dword ptr [esp + 24], 0
    mov mov eax, dword ptr [ebp + ebx*4 + 36]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 24]
    push push edx
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 1
    jne sub_1003B7B0
    mov mov esi, dword ptr [g_1010C0E0]
    push push 0
    call call esi
    mov mov eax, dword ptr [ebp + ebx*4 + 36]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 4
    lea lea edx, [esp + 24]
    push push edx
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 1
    je sub_1003B7B6
    test test eax, eax
    je sub_1003B7DE
    mov mov byte ptr [ebp + 16], 1
    mov mov eax, dword ptr [g_101D481C]
    mov mov ecx, dword ptr [esp + 16]
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 28], eax
    jbe sub_1003B808
    mov mov byte ptr [ebp + 16], 1
    test test ecx, ecx
    mov mov dword ptr [esp + 20], ecx
    fild fild dword ptr [esp + 20]
    jge sub_1003B82A
    fadd fadd dword ptr [g_1019BC80]
    fidiv fidiv dword ptr [esp + 28]
    jmp sub_1003B842
    fld fld dword ptr [g_1019BC84]
    mov mov eax, dword ptr [g_1072DE30]
    test test eax, eax
    jne sub_1003B861
    mov mov dword ptr [ebp + 20], 0
    fadd fadd dword ptr [ebp + 20]
    fst fst dword ptr [ebp + 20]
    mov mov eax, dword ptr [g_1072DE34]
    mov mov ecx, dword ptr [g_1072DE30]
    dec dec eax
    cmp cmp ecx, eax
    jne sub_1003B8BB
    fcomp fcomp dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003B8B5
    mov mov dword ptr [ebp + 20], 03F800000h
    mov mov al, byte ptr [ebp + 16]
    test test al, al
    jne sub_1003B8D0
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ebp + 24], ecx
    mov mov byte ptr [ebp + 16], 0
    jmp sub_1003B8E4
    fstp fstp st(0)
    mov mov eax, dword ptr [ebp + ebx*4 + 36]
    mov mov edx, dword ptr [eax]
    push push 2
    push push eax
    call call dword ptr [edx + 24]
    call sub_1003AAAC
    mov mov eax, dword ptr [ebp + ebx*4 + 36]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push eax
    call call dword ptr [ecx + 24]
    mov mov byte ptr [ebx + ebp + 44], 1
    call sub_1003E6A2
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_1003b550 ENDP
END
