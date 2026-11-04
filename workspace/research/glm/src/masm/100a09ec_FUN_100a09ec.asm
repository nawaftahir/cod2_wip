.686
.MODEL FLAT, C
EXTRN sub_1006507E:PROC
EXTRN sub_10082897:PROC
EXTRN sub_100A087A:PROC
.CODE
FUN_100a09ec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 20
    mov edi, ecx
    call sub_1006507E
    test eax, eax
    je L0
    push 0101151E8h
    push 0
    push dword ptr [ebp + 12]
    mov ecx, eax
    call sub_10082897
    mov esi, eax
    jmp L1
L0:
    xor esi, esi
L1:
    test esi, esi
    jne L2
    xor eax, eax
    jmp L3
L2:
    push esi
    push dword ptr [ebp + 8]
    mov ecx, edi
    call sub_100A087A
    and dword ptr [esi + 8], 0
L3:
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_100a09ec ENDP
END
