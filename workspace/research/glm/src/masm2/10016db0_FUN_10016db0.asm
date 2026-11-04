.686
.MODEL FLAT, C
EXTRN sub_10016DE1:PROC
EXTRN sub_10016DE2:PROC
EXTRN sub_10016DE7:PROC
EXTRN sub_10016DF3:PROC
.CODE
FUN_10016db0 PROC
    push push esi
    xor xor esi, esi
    mov mov eax, dword ptr [esi + 0101DA564h]
    test test eax, eax
    je sub_10016DE1
    mov mov cl, byte ptr [eax + 10]
    test test cl, cl
    mov mov eax, dword ptr [eax + 12]
    push push eax
    jne sub_10016DE7
    mov mov ecx, dword ptr [eax]
    call call dword ptr [ecx + 8]
    jmp sub_10016DF3
    mov mov edx, dword ptr [eax]
    call call dword ptr [edx + 8]
    add add esi, 4
    cmp cmp esi, 0400h
    jb sub_10016DE2
    pop pop esi
    ret ret
FUN_10016db0 ENDP
END
