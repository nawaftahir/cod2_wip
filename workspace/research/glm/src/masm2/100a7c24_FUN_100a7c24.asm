.686
.MODEL FLAT, C
EXTRN sub_1006C51E:PROC
EXTRN sub_1008539D:PROC
EXTRN sub_1008582D:PROC
EXTRN sub_100858AA:PROC
EXTRN sub_1008611D:PROC
EXTRN sub_10086200:PROC
EXTRN sub_100A7DF8:PROC
EXTRN sub_100A7E07:PROC
EXTRN sub_100A7E33:PROC
EXTRN sub_100A7E35:PROC
EXTRN sub_100A7ECC:PROC
EXTRN sub_100A7ED1:PROC
EXTRN sub_100A7EDB:PROC
EXTRN sub_100A7EDC:PROC
EXTRN sub_100A7EDF:PROC
EXTRN sub_100A7EE6:PROC
EXTRN sub_100A7EFC:PROC
EXTRN sub_100A7F02:PROC
EXTRN sub_100A7F04:PROC
EXTRN sub_100A7F06:PROC
EXTRN sub_100A7F10:PROC
.CODE
FUN_100a7c24 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 12]
    push push edi
    push push 116
    mov mov dword ptr [ebp - 16], eax
    call sub_1008582D
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_1008539D
    mov mov edi, eax
    jmp L1
    xor xor edi, edi
    test test edi, edi
    jne L2
    mov mov eax, 08007000Eh
    jmp sub_100A7DF8
    push push ebx
    push push 0
    push push 4
    push push 4
    push push 010000004h
    mov mov ecx, edi
    call sub_100858AA
    test test eax, eax
    jl L5
    or or dword ptr [ebp - 4], -1
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ecx
    jbe L3
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, ecx
    shl shl eax, 2
L2:
    mov mov edx, dword ptr [eax + edx]
    mov mov edx, dword ptr [edx + 4]
    cmp cmp edx, dword ptr [esi + 084h]
    jne L4
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [eax + edx]
    mov mov edx, dword ptr [edx + 16]
    mov mov ebx, dword ptr [edi + 8]
    mov mov dword ptr [ebx + edx*4], ecx
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [eax + edx]
    mov mov ebx, dword ptr [esi + 088h]
    mov mov dword ptr [edx + 4], ebx
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [eax + edx]
    or or dword ptr [edx + 12], -1
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx]
    mov mov eax, dword ptr [eax + 108]
    mov mov dword ptr [ebp - 4], eax
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb L3
    xor xor ebx, ebx
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push 0
    push push dword ptr [esi + 084h]
    mov mov ecx, esi
    call sub_10086200
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx + ebx*4], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [eax + ebx*4], -1
    je sub_100A7E07
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    and and dword ptr [eax + 60], 0
    mov mov ecx, dword ptr [ebp - 4]
    inc inc ebx
    cmp cmp ebx, 4
    mov mov dword ptr [eax + 108], ecx
    jb L6
    push push edi
    mov mov ecx, esi
    call sub_1008611D
    test test eax, eax
    jge sub_100A7E33
    mov mov esi, eax
    push push 1
    mov mov ecx, edi
    call sub_1006C51E
    mov mov eax, esi
    jmp sub_100A7ECC
    mov mov esi, 08007000Eh
    jmp sub_100A7E35
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 12], eax
L4:
    jbe sub_100A7EDB
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    je sub_100A7EDC
    mov mov ecx, dword ptr [eax + 12]
    test test ecx, ecx
    mov mov dword ptr [ebp - 20], ecx
    je sub_100A7EE6
    mov mov edx, dword ptr [eax + 16]
    mov mov edx, dword ptr [edx]
    mov mov ebx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov edx, dword ptr [edx + 4]
    cmp cmp edx, dword ptr [esi + 084h]
    jne sub_100A7EFC
    and and dword ptr [ebp - 4], 0
    test test ecx, ecx
    jbe sub_100A7F04
    jmp sub_100A7ED1
    mov mov eax, dword ptr [ebp - 8]
    xor xor ecx, ecx
    jmp sub_100A7EDF
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [eax]
    cmp cmp ebx, dword ptr [ecx + edx]
    jne sub_100A7F10
    mov mov edx, dword ptr [edi + 8]
    mov mov edx, dword ptr [ecx + edx]
    mov mov dword ptr [eax], edx
    add add ecx, 4
    cmp cmp ecx, 16
    jb sub_100A7F02
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100A7F06
    mov mov eax, dword ptr [ebp - 12]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 12], eax
    jb sub_100A7EDB
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
L6:
    ret ret
FUN_100a7c24 ENDP
END
