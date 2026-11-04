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
EXTRN sub_1009936C:PROC
EXTRN sub_1009937B:PROC
EXTRN sub_1009938E:PROC
EXTRN sub_100993A2:PROC
EXTRN sub_100993BE:PROC
EXTRN sub_100993CD:PROC
EXTRN sub_100993DC:PROC
EXTRN sub_100993E9:PROC
EXTRN sub_100993F4:PROC
EXTRN sub_10099405:PROC
EXTRN sub_10099410:PROC
EXTRN sub_1009941B:PROC
EXTRN sub_10099426:PROC
EXTRN sub_10099431:PROC
EXTRN sub_1009943C:PROC
EXTRN sub_10099447:PROC
EXTRN sub_10099452:PROC
EXTRN sub_1009945D:PROC
.CODE
FUN_10099251 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    call sub_1008F671
    test test eax, eax
    jl sub_1009936C
    mov mov ecx, esi
    call sub_10096F59
    test test eax, eax
    jl sub_1009937B
    push push ebx
    xor xor ebx, ebx
    inc inc ebx
    push push ebx
    mov mov ecx, esi
    call sub_10090EC2
    test test eax, eax
    jl sub_1009938E
    push push edi
    xor xor edi, edi
    push push ebx
    mov mov ecx, esi
    call sub_10094EF4
    test test eax, eax
    je L1
    jl sub_100993A2
    cmp cmp eax, ebx
    je L2
    inc inc edi
    cmp cmp edi, 0100h
    jb L0
    mov mov ecx, esi
    call sub_1008F8FE
    test test eax, eax
    jl sub_100993BE
    mov mov ecx, esi
    call sub_10097674
    test test eax, eax
    jl sub_100993CD
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 16]
    test test eax, eax
    jl sub_100993DC
    push push 0
    mov mov ecx, esi
    call sub_10090F22
    test test eax, eax
L0:
    jl sub_100993E9
    mov mov ecx, esi
    call sub_10098543
    test test eax, eax
    jl sub_100993F4
    mov mov ecx, esi
    mov mov dword ptr [esi + 0DCh], ebx
    call sub_10091188
    test test eax, eax
    jl sub_10099405
    mov mov ecx, esi
    call sub_10098AB9
    test test eax, eax
    jl sub_10099410
    mov mov ecx, esi
    call sub_10089621
    test test eax, eax
    jl sub_1009941B
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 20]
    test test eax, eax
    jl sub_10099426
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 24]
    test test eax, eax
    jl sub_10099431
    mov mov ecx, esi
    call sub_10086F8E
    test test eax, eax
    jl sub_1009943C
    mov mov ecx, esi
    call sub_1008D610
    test test eax, eax
    jl sub_10099447
    mov mov ecx, esi
    call sub_10098D2F
    test test eax, eax
    jl sub_10099452
    mov mov ecx, esi
    call sub_1009151C
    test test eax, eax
    jl sub_1009945D
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    ret ret
FUN_10099251 ENDP
END
