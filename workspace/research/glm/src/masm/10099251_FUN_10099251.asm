.686
.MODEL FLAT, C
EXTRN sub_10086F8E:PROC
EXTRN sub_10089621:PROC
EXTRN sub_1008D610:PROC
EXTRN sub_1008F671:PROC
EXTRN sub_1008F8FE:PROC
EXTRN sub_10090EC2:PROC
EXTRN sub_10090F22:PROC
EXTRN sub_10091188:PROC
EXTRN sub_1009151C:PROC
EXTRN sub_10094EF4:PROC
EXTRN sub_10096F59:PROC
EXTRN sub_10097674:PROC
EXTRN sub_10098543:PROC
EXTRN sub_10098AB9:PROC
EXTRN sub_10098D2F:PROC
.CODE
FUN_10099251 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    call sub_1008F671
    test eax, eax
    jl L5
    mov ecx, esi
    call sub_10096F59
    test eax, eax
    jl L5
    push ebx
    xor ebx, ebx
    inc ebx
    push ebx
    mov ecx, esi
    call sub_10090EC2
    test eax, eax
    jl L4
    push edi
    xor edi, edi
L0:
    push ebx
    mov ecx, esi
    call sub_10094EF4
    test eax, eax
    je L1
    jl L3
    cmp eax, ebx
    je L2
L1:
    inc edi
    cmp edi, 000000100h
    jb L0
L2:
    mov ecx, esi
    call sub_1008F8FE
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10097674
    test eax, eax
    jl L3
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x10]
    test eax, eax
    jl L3
    push 0
    mov ecx, esi
    call sub_10090F22
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10098543
    test eax, eax
    jl L3
    mov ecx, esi
    mov dword ptr [esi + 0000000DCh], ebx
    call sub_10091188
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10098AB9
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10089621
    test eax, eax
    jl L3
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x14]
    test eax, eax
    jl L3
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x18]
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10086F8E
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_1008D610
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_10098D2F
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_1009151C
    test eax, eax
    jl L3
    xor eax, eax
L3:
    pop edi
L4:
    pop ebx
L5:
    pop esi
    ret
FUN_10099251 ENDP
END
