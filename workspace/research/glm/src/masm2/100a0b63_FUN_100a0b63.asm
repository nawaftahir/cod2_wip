.686
.MODEL FLAT, C
EXTRN sub_100650A4:PROC
EXTRN sub_10082DFC:PROC
EXTRN sub_10099507:PROC
EXTRN sub_100A07F7:PROC
EXTRN sub_100A0BE1:PROC
EXTRN sub_100A0BE8:PROC
EXTRN sub_100A0BF7:PROC
EXTRN sub_100A0C05:PROC
EXTRN sub_100A0C28:PROC
EXTRN sub_100A0C2A:PROC
EXTRN sub_100A0C30:PROC
.CODE
FUN_100a0b63 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 12]
    mov mov esi, ecx
    call sub_100A07F7
    test test eax, eax
    jge L0
    push push 0101152B4h
    push push 0BF2h
    push push 0
    push push esi
    call sub_10099507
    add add esp, 16
    jmp sub_100A0BE1
    push push 24
    call sub_100650A4
    xor xor esi, esi
    cmp cmp eax, esi
    je sub_100A0BE8
    push push dword ptr [ebp + 12]
    mov mov ecx, eax
    push push esi
    call sub_10082DFC
L0:
    jmp sub_100A0BF7
    xor xor eax, eax
    cmp cmp eax, esi
    jne sub_100A0C05
    xor xor eax, eax
    jmp sub_100A0C2A
    cmp cmp dword ptr [ebp + 8], esi
    lea lea ecx, [ebp + 8]
    je sub_100A0C28
    mov mov edx, dword ptr [ecx]
    cmp cmp dword ptr [edx + 4], 8
    jne sub_100A0C30
    lea lea ecx, [edx + 16]
    cmp cmp dword ptr [ecx], esi
    jne sub_100A0C28
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [eax + 16], edx
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp + 8]
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_100a0b63 ENDP
END
