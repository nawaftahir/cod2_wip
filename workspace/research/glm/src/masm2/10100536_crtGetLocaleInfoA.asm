.686
.MODEL FLAT, C
EXTRN sub_100F5EC3:PROC
EXTRN sub_10100620:PROC
EXTRN sub_10100623:PROC
EXTRN sub_10100626:PROC
EXTRN sub_10100628:PROC
EXTRN sub_1010062D:PROC
EXTRN sub_1010062F:PROC
EXTRN sub_10100633:PROC
EXTRN sub_1010065D:PROC
EXTRN sub_10100662:PROC
EXTRN sub_1010066D:PROC
EXTRN sub_10100678:PROC
EXTRN sub_10100682:PROC
EXTRN sub_1010068C:PROC
EXTRN sub_10100696:PROC
EXTRN EXTRN fp_1010C190:DWORD:DWORD
.CODE
crtGetLocaleInfoA PROC
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push 26
    xor xor esi, esi
    pop pop edi
    mov mov ebx, dword ptr [ebp + 20]
    lea lea eax, [edi + esi]
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov ecx, eax
    imul imul ecx, ecx, 44
    mov mov ecx, dword ptr [ecx + 01017D488h]
    cmp cmp dword ptr [ebp + 8], ecx
    je L3
    jae L1
    lea lea edi, [eax - 1]
    jmp L2
    lea lea esi, [eax + 1]
    cmp cmp esi, edi
    jle L0
    push push ebx
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C190]
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 16
    mov mov ecx, dword ptr [ebp + 12]
    dec dec ecx
    je sub_10100633
    dec dec ecx
    dec dec ecx
    je sub_1010062D
L1:
    sub sub ecx, 4
    je sub_10100628
    sub sub ecx, 4
L2:
    je sub_10100623
    sub sub ecx, 0FF6h
    je sub_10100620
    dec dec ecx
    je L5
    dec dec ecx
    dec dec ecx
    jne L4
    imul imul eax, eax, 44
L3:
    add add eax, 01017D4ACh
    jmp sub_10100662
    imul imul eax, eax, 44
    mov mov eax, dword ptr [eax + 01017D49Ch]
    jmp sub_1010066D
    imul imul eax, eax, 44
    mov mov eax, dword ptr [eax + 01017D494h]
    jmp sub_10100678
    imul imul eax, eax, 44
    add add eax, 01017D4A4h
    jmp sub_10100682
    imul imul eax, eax, 44
    add add eax, 01017D4A0h
    jmp sub_1010068C
L4:
    imul imul eax, eax, 44
    add add eax, 01017D498h
    jmp sub_10100696
    imul imul eax, eax, 44
    add add eax, 01017D48Ch
    test test eax, eax
    je sub_10100626
    cmp cmp ebx, 1
    jl sub_1010062F
    mov mov esi, dword ptr [ebp + 16]
    lea lea ecx, [ebx - 1]
    push push ecx
    push push eax
    push push esi
    call sub_100F5EC3
    xor xor eax, eax
    add add esp, 12
    mov mov byte ptr [esi + ebx - 1], 0
    inc inc eax
    jmp sub_1010065D
crtGetLocaleInfoA ENDP
END
