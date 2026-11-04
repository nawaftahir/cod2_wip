.686
.MODEL FLAT, C
EXTRN sub_1006507E:PROC
EXTRN sub_10082897:PROC
EXTRN sub_100A087A:PROC
EXTRN sub_100A0A40:PROC
EXTRN sub_100A0A4E:PROC
EXTRN sub_100A0A61:PROC
.CODE
FUN_100a09ec PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    push push 20
    mov mov edi, ecx
    call sub_1006507E
    test test eax, eax
    je L0
    push push 0101151E8h
    push push 0
    push push dword ptr [ebp + 12]
    mov mov ecx, eax
    call sub_10082897
    mov mov esi, eax
    jmp sub_100A0A40
    xor xor esi, esi
    test test esi, esi
    jne sub_100A0A4E
    xor xor eax, eax
    jmp sub_100A0A61
    push push esi
    push push dword ptr [ebp + 8]
    mov mov ecx, edi
    call sub_100A087A
    and and dword ptr [esi + 8], 0
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_100a09ec ENDP
END
