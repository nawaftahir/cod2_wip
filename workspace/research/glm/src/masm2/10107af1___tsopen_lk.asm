.686
.MODEL FLAT, C
EXTRN sub_100FC2A2:PROC
EXTRN sub_100FC2B6:PROC
EXTRN sub_100FC32F:PROC
EXTRN sub_100FC343:PROC
EXTRN sub_100FC3BD:PROC
EXTRN sub_100FC3D1:PROC
EXTRN sub_100FC42F:PROC
EXTRN sub_100FC497:PROC
EXTRN sub_100FCF79:PROC
EXTRN sub_10106C08:PROC
EXTRN sub_10106C73:PROC
EXTRN sub_1010783A:PROC
EXTRN sub_101079AC:PROC
EXTRN sub_10107DDB:PROC
EXTRN sub_10107DEB:PROC
EXTRN sub_10107DFD:PROC
EXTRN sub_10107E0F:PROC
EXTRN sub_10107E13:PROC
EXTRN sub_10107E2A:PROC
EXTRN sub_10107E4F:PROC
EXTRN sub_10107EB0:PROC
EXTRN sub_10107EB6:PROC
EXTRN sub_10107ED5:PROC
EXTRN sub_10107EEF:PROC
EXTRN sub_10107EFE:PROC
EXTRN sub_10107F15:PROC
EXTRN sub_10107F24:PROC
EXTRN sub_10107F29:PROC
EXTRN sub_10107F44:PROC
EXTRN sub_10107FC5:PROC
EXTRN sub_10107FC9:PROC
EXTRN sub_10107FCF:PROC
EXTRN sub_10108000:PROC
EXTRN sub_1010800C:PROC
EXTRN sub_10108012:PROC
EXTRN sub_1010804C:PROC
EXTRN sub_1010806D:PROC
EXTRN sub_10108073:PROC
EXTRN sub_10108095:PROC
EXTRN sub_10108ECD:PROC
EXTRN sub_101095D9:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C078:DWORD:DWORD
EXTRN EXTRN fp_1010C084:DWORD:DWORD
EXTRN EXTRN fp_1010C158:DWORD:DWORD
EXTRN EXTRN g_101AE008:DWORD:DWORD
EXTRN EXTRN g_101AE00C:DWORD:DWORD
EXTRN EXTRN g_101AE25C:DWORD:DWORD
.CODE
__tsopen_lk PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    mov mov edx, dword ptr [ebp + 20]
    push push ebx
    push push esi
    xor xor esi, esi
    test test dl, dl
    mov mov dword ptr [ebp - 28], 12
    mov mov dword ptr [ebp - 24], esi
    jns L0
    mov mov dword ptr [ebp - 20], esi
    mov mov byte ptr [ebp - 1], 16
    jmp L1
    mov mov dword ptr [ebp - 20], 1
    mov mov byte ptr [ebp - 1], 0
    mov mov eax, 08000h
    test test eax, edx
    jne L2
    test test dh, 64
    jne L3
    cmp cmp dword ptr [g_101AE25C], eax
    je L4
    or or byte ptr [ebp - 1], 080h
    push push 3
    mov mov eax, edx
    pop pop ebx
    and and eax, ebx
    sub sub eax, esi
    je L6
    dec dec eax
    je L5
    dec dec eax
    jne L9
    mov mov dword ptr [ebp - 16], 0C0000000h
    jmp L7
    mov mov dword ptr [ebp - 16], 040000000h
    jmp L8
    mov mov dword ptr [ebp - 16], 080000000h
    cmp cmp ecx, 16
    je L12
    cmp cmp ecx, 32
    je L11
    cmp cmp ecx, 48
    je L10
L3:
    cmp cmp ecx, 64
    je L10
    call sub_100FC2A2
    mov mov dword ptr [eax], 22
    call sub_100FC2B6
    mov mov dword ptr [eax], esi
    or or eax, -1
    jmp sub_10107E2A
    mov mov dword ptr [ebp - 8], ebx
    jmp L13
    mov mov dword ptr [ebp - 8], 2
    jmp L14
    mov mov dword ptr [ebp - 8], 1
    jmp L15
    mov mov dword ptr [ebp - 8], esi
    mov mov eax, edx
    mov mov edx, 0700h
    and and eax, edx
    mov mov ecx, 0400h
    cmp cmp eax, ecx
    push push edi
    mov mov edi, 0100h
    jg L18
    je L17
    cmp cmp eax, esi
    je L19
    cmp cmp eax, edi
    je L16
    cmp cmp eax, 0200h
    je L21
    cmp cmp eax, 0300h
    jne L20
    mov mov dword ptr [ebp - 12], 2
    jmp L22
    mov mov dword ptr [ebp - 12], 4
    jmp L23
    mov mov dword ptr [ebp - 12], ebx
    jmp L25
    cmp cmp eax, 0500h
    je L25
    cmp cmp eax, 0600h
    je L24
    cmp cmp eax, edx
    je L26
    call sub_100FC32F
    mov mov dword ptr [eax], 22
    call sub_100FC343
    mov mov dword ptr [eax], esi
    or or eax, -1
    jmp sub_10107EB6
    mov mov dword ptr [ebp - 12], 5
    jmp L27
    mov mov dword ptr [ebp - 12], 1
    mov mov eax, dword ptr [ebp + 20]
    test test edi, eax
    mov mov esi, 080h
    je L28
    mov mov ecx, dword ptr [g_101AE008]
    not not ecx
    and and ecx, dword ptr [ebp + 24]
    test test cl, cl
    js L29
    xor xor esi, esi
    inc inc esi
    test test al, 64
    je L30
    or or byte ptr [ebp - 14], 1
    or or esi, 04000000h
L14:
    cmp cmp dword ptr [g_101AE00C], 2
    jne sub_10107DDB
L15:
    or or dword ptr [ebp - 8], 4
    test test ah, 16
    je sub_10107DEB
    or or esi, edi
    test test al, 32
    je sub_10107DFD
    or or esi, 08000000h
    jmp sub_10107E0F
    test test al, 16
    je sub_10107E13
    or or esi, 010000000h
    call sub_101079AC
    mov mov edi, eax
    or or ebx, -1
    cmp cmp edi, ebx
    jne sub_10107E4F
    call sub_100FC3BD
    mov mov dword ptr [eax], 24
    call sub_100FC3D1
    and and dword ptr [eax], 0
    mov mov eax, ebx
    jmp sub_10107F44
    mov mov eax, dword ptr [ebp + 8]
    push push 0
    push push esi
    push push dword ptr [ebp - 12]
    mov mov dword ptr [eax], 1
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edi
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp + 16]
    call dword ptr [fp_1010C078]
    mov mov esi, eax
    cmp cmp esi, ebx
    je sub_10107ED5
    push push esi
    call dword ptr [fp_1010C158]
    test test eax, eax
    jne sub_10107EEF
    push push esi
    call dword ptr [fp_1010C084]
    call dword ptr [fp_1010C054]
    push push eax
    call sub_100FC42F
    pop pop ecx
    jmp sub_10107EB0
    cmp cmp eax, 2
    jne sub_10107F15
    or or byte ptr [ebp - 1], 64
    jmp sub_10107F24
    cmp cmp eax, 3
    jne sub_10107F29
    or or byte ptr [ebp - 1], 8
    push push esi
    push push edi
    call sub_1010783A
    or or byte ptr [ebp - 1], 1
    mov mov eax, edi
    sar sar eax, 5
    lea lea ebx, [eax*4 + 01076ACA0h]
    mov mov eax, edi
    and and eax, 31
    lea lea esi, [eax + eax*8]
    mov mov al, byte ptr [ebp - 1]
L25:
    pop pop ecx
    pop pop ecx
    mov mov ecx, dword ptr [ebx]
    shl shl esi, 2
    mov mov byte ptr [ebp - 1], al
    and and byte ptr [ebp - 1], 72
    mov mov byte ptr [esi + ecx + 4], al
    jne sub_10107FC5
    test test al, al
    jns sub_10107FC9
    test test byte ptr [ebp + 20], 2
    je sub_10107FCF
    push push 2
    push push -1
    push push edi
    call sub_10106C08
    add add esp, 12
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 16], eax
    jne sub_10108000
    call sub_100FC497
    cmp cmp dword ptr [eax], 083h
    jne sub_1010804C
    cmp cmp byte ptr [ebp - 1], 0
    jne sub_1010800C
    test test byte ptr [ebp + 20], 8
    je sub_10108012
    mov mov eax, dword ptr [ebx]
    lea lea eax, [esi + eax + 4]
    or or byte ptr [eax], 32
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    push push 1
    lea lea eax, [ebp - 2]
    push push eax
    push push edi
    mov mov byte ptr [ebp - 2], 0
    call sub_10108ECD
    add add esp, 12
    test test eax, eax
    jne sub_1010806D
    cmp cmp byte ptr [ebp - 2], 26
    jne sub_10108073
    push push dword ptr [ebp - 16]
    push push edi
    call sub_101095D9
    cmp cmp eax, -1
    pop pop ecx
    pop pop ecx
    je sub_10108095
    push push 0
    push push 0
    push push edi
    call sub_10106C73
    add add esp, 12
    cmp cmp eax, -1
    jne sub_1010804C
    push push edi
    call sub_100FCF79
    pop pop ecx
    jmp sub_10107EFE
__tsopen_lk ENDP
END
