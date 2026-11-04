.686
.MODEL FLAT, C
EXTRN sub_100827D6:PROC
EXTRN sub_10082806:PROC
EXTRN sub_10082823:PROC
EXTRN sub_10082838:PROC
EXTRN sub_10082847:PROC
EXTRN sub_10082858:PROC
EXTRN EXTRN fp_1010C090:DWORD:DWORD
EXTRN EXTRN fp_1010C094:DWORD:DWORD
.CODE
FUN_100826bd PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov edx, dword ptr [esi + 8]
    push push edi
    lea lea ecx, [eax - 1]
    not not ecx
    lea lea edi, [eax + edx - 1]
    and and edi, ecx
    add add edi, dword ptr [ebp + 8]
    cmp cmp edi, dword ptr [esi + 16]
    jbe L1
    lea lea edi, [eax + 3]
    mov mov eax, dword ptr [esi + 20]
    and and edi, ecx
    add add edi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp + 12], eax
    cmp cmp edi, eax
    jbe L0
    mov mov eax, dword ptr [ebp + 12]
    add add eax, eax
    cmp cmp edi, eax
    mov mov dword ptr [ebp + 12], eax
    ja L0
    push push 4
    push push 02000h
    push push dword ptr [ebp + 12]
    push push 0
    call dword ptr [fp_1010C094]
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    je sub_10082806
    mov mov eax, dword ptr [esi + 4]
    lea lea ebx, [eax + edi - 1]
    dec dec eax
    push push 4
    not not eax
    push push 01000h
    and and ebx, eax
    push push ebx
    push push dword ptr [ebp - 4]
    call dword ptr [fp_1010C094]
L0:
    test test eax, eax
    jne sub_100827D6
    push push 08000h
    push push eax
    push push dword ptr [ebp - 4]
    call dword ptr [fp_1010C090]
    jmp sub_10082838
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 16], eax
    mov mov dword ptr [esi + 12], ebx
    mov mov eax, dword ptr [esi]
    sub sub eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 8], edi
    add add eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    mov mov ecx, dword ptr [esi + 12]
    cmp cmp edi, ecx
    jbe sub_10082823
    mov mov eax, dword ptr [esi + 4]
    lea lea ebx, [eax + edi - 1]
    dec dec eax
    not not eax
    and and ebx, eax
    push push 4
    push push 01000h
    mov mov eax, ebx
    sub sub eax, ecx
    push push eax
    mov mov eax, dword ptr [esi]
    add add eax, ecx
    push push eax
    call dword ptr [fp_1010C094]
    test test eax, eax
    jne sub_10082847
    xor xor eax, eax
    jmp sub_10082858
FUN_100826bd ENDP
END
