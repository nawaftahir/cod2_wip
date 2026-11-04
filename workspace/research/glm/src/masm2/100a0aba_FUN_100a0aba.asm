.686
.MODEL FLAT, C
EXTRN sub_100650C3:PROC
EXTRN sub_10082EA3:PROC
EXTRN sub_10099562:PROC
EXTRN sub_1009957B:PROC
EXTRN sub_100A0803:PROC
EXTRN sub_100A0815:PROC
EXTRN sub_100A0B65:PROC
EXTRN sub_100A0B68:PROC
EXTRN sub_100A0B6B:PROC
EXTRN sub_100A0B6F:PROC
EXTRN sub_100A0B71:PROC
EXTRN sub_100A0B77:PROC
EXTRN sub_100A0B7A:PROC
EXTRN sub_100A0BB4:PROC
EXTRN sub_100A0BCC:PROC
EXTRN sub_100A0BE5:PROC
.CODE
FUN_100a0aba PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov esi, ecx
    je sub_100A0B6F
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 12]
    call sub_100A0803
    test test eax, eax
    jl sub_100A0B68
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    call sub_100A0815
    test test eax, eax
    jl sub_100A0B7A
    cmp cmp dword ptr [ebp + 12], 1
    jb sub_100A0B65
    cmp cmp dword ptr [ebp + 12], 4
    ja sub_100A0B6B
    cmp cmp dword ptr [ebp + 8], 1
    jb sub_100A0B71
    cmp cmp dword ptr [ebp + 8], 4
    ja sub_100A0B77
    push push 36
    call sub_100650C3
    test test eax, eax
    je sub_100A0BB4
    push push 0
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    push push dword ptr [ebp + 12]
    push push dword ptr [edi + 20]
    push push 2
    call sub_10082EA3
    jmp sub_100A0BCC
    push push 4
    push push 010115288h
    push push 0BEDh
    lea lea eax, [esi + 32]
    push push eax
    push push esi
    call sub_10099562
    add add esp, 20
    jmp sub_100A0BE5
    push push 010115250h
    push push 0BF5h
    lea lea eax, [esi + 32]
    push push eax
    push push esi
    call sub_1009957B
    add add esp, 16
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_100a0aba ENDP
END
