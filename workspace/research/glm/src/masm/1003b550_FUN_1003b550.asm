.686
.MODEL FLAT, C
EXTRN sub_1003A67D:PROC
EXTRN sub_1003A923:PROC
EXTRN sub_1003A956:PROC
EXTRN sub_1003AAAC:PROC
EXTRN sub_1003B1B4:PROC
EXTRN sub_1003B4E4:PROC
EXTRN sub_1003E6A2:PROC
EXTRN g_1010C0E0:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC80:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDC4:DWORD
EXTRN g_101D1B3C:DWORD
EXTRN g_101D481C:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDB0:DWORD
EXTRN g_1072DE30:DWORD
EXTRN g_1072DE34:DWORD
EXTRN g_1072DE38:DWORD
EXTRN g_1072DE3C:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1003b550 PROC
    mov eax, dword ptr [g_1072DDB0]
    sub esp, 8
    and eax, 080000001h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    push edi
    jns L0
    dec eax
    or eax, 0FFFFFFFEh
    inc eax
L0:
    mov ecx, dword ptr [g_1072DE30]
    lea ebx, [eax + ecx*2]
    mov eax, dword ptr [ebp + ebx*4 + 36]
    test eax, eax
    jne L1
    mov esi, ebp
    call sub_1003B4E4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
L1:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L3
L2:
    call sub_1003A923
L3:
    mov eax, dword ptr [g_101D1B3C]
    cmp dword ptr [g_1072D9BC], eax
    mov edi, eax
    mov esi, 3
    jne L4
    cmp dword ptr [g_1072D9C0], esi
    je L7
L4:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L5
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L6
L5:
    call sub_1003A956
L6:
    push 31
    call sub_1003A67D
    add esp, 4
L7:
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    lea esi, [eax + 01072DEE0h]
    lea edi, [eax + 01072EBB0h]
    mov ecx, 000000334h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fild dword ptr [g_1072DE3C]
    fdivr dword ptr [g_1019BDC4]
    mov byte ptr [esp + 30], 0
    mov byte ptr [esp + 29], 0
    mov byte ptr [esp + 28], 0
    mov byte ptr [esp + 31], 0000000FFh
    mov edx, dword ptr [esp + 28]
    push edx
    sub esp, 8
    inc dword ptr [g_10730550]
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1072DE38]
    fdivr dword ptr [g_1019BDC4]
    fstp dword ptr [esp]
    call sub_1003B1B4
    mov al, byte ptr [ebx + ebp + 44]
    add esp, 12
    test al, al
    je L13
    push 1
    push 4
    mov dword ptr [esp + 24], 0
    mov eax, dword ptr [ebp + ebx*4 + 36]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 24]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 1
    jne L9
    mov esi, dword ptr [g_1010C0E0]
L8:
    push 0
    call esi
    mov eax, dword ptr [ebp + ebx*4 + 36]
    mov ecx, dword ptr [eax]
    push 1
    push 4
    lea edx, [esp + 24]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 1
    je L8
L9:
    test eax, eax
    je L10
    mov byte ptr [ebp + 16], 1
L10:
    mov eax, dword ptr [g_101D481C]
    mov ecx, dword ptr [esp + 16]
    cmp ecx, eax
    mov dword ptr [esp + 28], eax
    jbe L11
    mov byte ptr [ebp + 16], 1
L11:
    test ecx, ecx
    mov dword ptr [esp + 20], ecx
    fild dword ptr [esp + 20]
    jge L12
    fadd dword ptr [g_1019BC80]
L12:
    fidiv dword ptr [esp + 28]
    jmp L14
L13:
    fld dword ptr [g_1019BC84]
L14:
    mov eax, dword ptr [g_1072DE30]
    test eax, eax
    jne L15
    mov dword ptr [ebp + 20], 0
L15:
    fadd dword ptr [ebp + 20]
    fst dword ptr [ebp + 20]
    mov eax, dword ptr [g_1072DE34]
    mov ecx, dword ptr [g_1072DE30]
    dec eax
    cmp ecx, eax
    jne L18
    fcomp dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 65
    jne L16
    mov dword ptr [ebp + 20], 03F800000h
L16:
    mov al, byte ptr [ebp + 16]
    test al, al
    jne L17
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ebp + 24], ecx
L17:
    mov byte ptr [ebp + 16], 0
    jmp L19
L18:
    fstp st(0)
L19:
    mov eax, dword ptr [ebp + ebx*4 + 36]
    mov edx, dword ptr [eax]
    push 2
    push eax
    call dword ptr [edx + 0x18]
    call sub_1003AAAC
    mov eax, dword ptr [ebp + ebx*4 + 36]
    mov ecx, dword ptr [eax]
    push 1
    push eax
    call dword ptr [ecx + 0x18]
    mov byte ptr [ebx + ebp + 44], 1
    call sub_1003E6A2
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_1003b550 ENDP
END
