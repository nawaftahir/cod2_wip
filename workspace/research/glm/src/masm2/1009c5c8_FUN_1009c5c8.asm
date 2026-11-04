.686
.MODEL FLAT, C
EXTRN sub_100650F5:PROC
EXTRN sub_1006511F:PROC
EXTRN sub_1006514A:PROC
EXTRN sub_10065173:PROC
EXTRN sub_1008298B:PROC
EXTRN sub_10082F00:PROC
EXTRN sub_100832F1:PROC
EXTRN sub_10083535:PROC
EXTRN sub_1009A695:PROC
EXTRN sub_1009C70A:PROC
EXTRN sub_1009C712:PROC
EXTRN sub_1009C71C:PROC
EXTRN sub_1009C727:PROC
EXTRN sub_1009C731:PROC
EXTRN sub_1009C749:PROC
EXTRN sub_1009C757:PROC
EXTRN sub_1009C762:PROC
EXTRN sub_1009C79D:PROC
EXTRN sub_1009C7A3:PROC
EXTRN sub_1009C7B4:PROC
EXTRN sub_1009C7CE:PROC
EXTRN sub_1009C7EC:PROC
EXTRN sub_1009C7F7:PROC
EXTRN sub_1009C800:PROC
EXTRN sub_1009C81A:PROC
EXTRN sub_1009C82C:PROC
.CODE
FUN_1009c5c8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    xor xor ebx, ebx
    cmp cmp edi, ebx
    mov mov dword ptr [ebp - 4], ecx
    je sub_1009C712
    cmp cmp dword ptr [edi + 4], 15
    jne sub_1009C71C
    mov mov eax, dword ptr [edi + 48]
    cmp cmp eax, ebx
    je sub_1009C727
    cmp cmp dword ptr [edi + 52], 4
    jb sub_1009C731
    mov mov eax, dword ptr [eax]
    mov mov ecx, 0FFFF0000h
    and and eax, ecx
    cmp cmp eax, 07FFE0000h
    je L2
    cmp cmp eax, 07FFF0000h
    je L1
    cmp cmp eax, 0FFFE0000h
    je L0
    cmp cmp eax, ecx
    jne sub_1009C757
    mov mov dword ptr [ebp + 8], 25
    jmp L3
    mov mov dword ptr [ebp + 8], 26
    jmp L4
    mov mov dword ptr [ebp + 8], 27
    jmp L5
    mov mov dword ptr [ebp + 8], 28
    push push 80
    call sub_100650F5
    cmp cmp eax, ebx
    je L6
    lea lea ecx, [edi + 16]
    push push ecx
    push push 1
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, eax
    call sub_100832F1
    mov mov esi, eax
    jmp sub_1009C70A
    xor xor esi, esi
    cmp cmp esi, ebx
    je sub_1009C7A3
    push push 36
    call sub_1006511F
    cmp cmp eax, ebx
    je sub_1009C749
    push push 0200h
    push push 1
    push push 1
    push push dword ptr [ebp + 8]
L2:
    mov mov ecx, eax
    push push 3
    call sub_10082F00
    jmp sub_1009C762
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 16], eax
    je sub_1009C7CE
    push push 64
    call sub_1006514A
    cmp cmp eax, ebx
    je sub_1009C79D
    lea lea ecx, [edi + 16]
    push push ecx
    push push dword ptr [edi + 52]
L3:
    mov mov ecx, eax
    push push dword ptr [edi + 48]
    push push 5
    call sub_10083535
    jmp sub_1009C7B4
    xor xor eax, eax
    cmp cmp eax, ebx
L5:
    mov mov dword ptr [esi + 32], eax
    je sub_1009C7F7
    push push 20
    call sub_10065173
    cmp cmp eax, ebx
    je sub_1009C7EC
    push push 010114AE8h
    push push ebx
    push push dword ptr [esi + 32]
    mov mov ecx, eax
    call sub_1008298B
    jmp sub_1009C800
    xor xor eax, eax
    cmp cmp eax, ebx
    je sub_1009C81A
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    mov mov dword ptr [esi + 32], eax
    call sub_1009A695
    mov mov eax, esi
    jmp sub_1009C82C
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1009c5c8 ENDP
END
