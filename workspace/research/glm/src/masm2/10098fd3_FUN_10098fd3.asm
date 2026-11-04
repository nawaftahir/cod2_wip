.686
.MODEL FLAT, C
EXTRN sub_10086EEC:PROC
EXTRN sub_1008710C:PROC
EXTRN sub_1008B336:PROC
EXTRN sub_1008B72C:PROC
EXTRN sub_1008BC97:PROC
EXTRN sub_1008BEE4:PROC
EXTRN sub_1008BFAE:PROC
EXTRN sub_1008C4BB:PROC
EXTRN sub_1008C9C8:PROC
EXTRN sub_1008CCEA:PROC
EXTRN sub_1008D4B5:PROC
EXTRN sub_1008D572:PROC
EXTRN sub_1008D78E:PROC
EXTRN sub_1008F711:PROC
EXTRN sub_10093948:PROC
EXTRN sub_10093D33:PROC
EXTRN sub_1009483F:PROC
EXTRN sub_10094A63:PROC
EXTRN sub_10094AE4:PROC
EXTRN sub_10094FDB:PROC
EXTRN sub_1009529E:PROC
EXTRN sub_10096B47:PROC
EXTRN sub_10099266:PROC
EXTRN sub_10099269:PROC
EXTRN sub_10099273:PROC
EXTRN sub_10099275:PROC
EXTRN sub_1009927E:PROC
EXTRN sub_10099284:PROC
EXTRN sub_10099293:PROC
EXTRN sub_100992A2:PROC
EXTRN sub_100992A5:PROC
EXTRN sub_100992AF:PROC
EXTRN sub_100992E1:PROC
EXTRN sub_100992EB:PROC
EXTRN sub_100992F0:PROC
EXTRN sub_100992FF:PROC
EXTRN sub_1009930E:PROC
EXTRN sub_1009931D:PROC
EXTRN sub_10099326:PROC
EXTRN sub_10099327:PROC
EXTRN sub_10099344:PROC
EXTRN sub_10099359:PROC
EXTRN sub_10099362:PROC
EXTRN sub_10099363:PROC
EXTRN sub_10099381:PROC
EXTRN sub_1009938F:PROC
EXTRN sub_1009939F:PROC
EXTRN sub_100993BD:PROC
EXTRN sub_100993C1:PROC
EXTRN sub_100993DB:PROC
EXTRN sub_100993F9:PROC
EXTRN sub_1009940F:PROC
EXTRN sub_10099417:PROC
EXTRN sub_10099420:PROC
EXTRN sub_10099425:PROC
EXTRN sub_1009948D:PROC
EXTRN sub_10099498:PROC
EXTRN sub_100994A3:PROC
EXTRN sub_100994AE:PROC
EXTRN sub_100994B9:PROC
.CODE
FUN_10098fd3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, ecx
    call sub_1008B72C
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jl sub_10099266
    mov mov ecx, esi
    call sub_1008BEE4
    cmp cmp eax, ebx
    jl sub_10099275
    mov mov ecx, esi
    call sub_1009483F
    cmp cmp eax, ebx
    jl sub_10099284
    mov mov ecx, esi
    call sub_10086EEC
    cmp cmp eax, ebx
    jl sub_10099293
    mov mov ecx, esi
    call sub_1008D572
    cmp cmp eax, ebx
    jl sub_100992A2
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 12], ebx
    jbe L0
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax]
    and and edx, 0FFF00000h
    cmp cmp edx, 010200000h
    jne L1
    mov mov edx, dword ptr [eax + 12]
    and and edx, 0FFFFFh
    or or edx, 010000000h
    mov mov dword ptr [eax], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 12]
    jb L0
    test test byte ptr [esi + 0CCh], 4
    je L2
    mov mov dword ptr [esi + 0D8h], 1
    xor xor eax, eax
    jmp sub_100992F0
    mov mov ecx, esi
    call sub_1008F711
    cmp cmp eax, ebx
    jl sub_100992FF
    mov mov ecx, esi
    call sub_1008BC97
    cmp cmp eax, ebx
    jl sub_1009930E
    mov mov dword ptr [ebp - 4], ebx
    push push edi
    mov mov ecx, esi
    call sub_10093D33
    cmp cmp eax, ebx
    jne L3
    xor xor eax, eax
    jmp L4
    jl sub_10099326
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    mov mov edi, ecx
    mov mov ecx, esi
L0:
    call sub_1008BFAE
    cmp cmp eax, ebx
    jne L5
    xor xor eax, eax
    jmp L6
    jl sub_10099344
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_10094AE4
    cmp cmp eax, ebx
    jne L7
    xor xor eax, eax
    jmp L8
    jl sub_10099362
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    push push ebx
    or or edi, ecx
    mov mov ecx, esi
    call sub_10094FDB
    cmp cmp eax, ebx
    jne L9
    xor xor eax, eax
    jmp L10
    jl sub_10099381
L2:
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_1008C4BB
    cmp cmp eax, ebx
    jne sub_10099269
    xor xor eax, eax
    jmp sub_10099273
    jl sub_1009939F
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_1009529E
    cmp cmp eax, ebx
    jne sub_100992A5
    xor xor eax, eax
    jmp sub_100992AF
    jl sub_100993BD
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_1008C9C8
    cmp cmp eax, ebx
    jne sub_100992E1
    xor xor eax, eax
    jmp sub_100992EB
    jl sub_100993DB
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_1008CCEA
    cmp cmp eax, ebx
    jne sub_1009931D
    xor xor eax, eax
    jmp sub_10099327
    jl sub_100993F9
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or edi, ecx
    mov mov ecx, esi
    call sub_10096B47
    cmp cmp eax, ebx
    jne sub_10099359
    xor xor eax, eax
    jmp sub_10099363
    jl sub_10099417
    xor xor ecx, ecx
    cmp cmp eax, ebx
    sete sete cl
    or or ecx, edi
    je sub_1009938F
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 0100h
L5:
    jb sub_1009927E
    cmp cmp dword ptr [ebp - 4], 0100h
    jne sub_100993C1
    push push 0101106E4h
    push push ebx
    push push ebx
    push push esi
    call sub_1008B336
    add add esp, 16
    xor xor edx, edx
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_1009940F
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 1
    je sub_10099420
    test test ch, 12
    jne sub_10099425
    mov mov ecx, dword ptr [esi + 120]
    or or dword ptr [eax + 12], -1
    or or dword ptr [eax + 16], -1
    mov mov dword ptr [eax + 4], ecx
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb sub_1009940F
    mov mov ecx, esi
    call sub_10093948
    cmp cmp eax, ebx
    jl sub_1009948D
    mov mov ecx, esi
    call sub_1008D4B5
    cmp cmp eax, ebx
    jl sub_10099498
    mov mov ecx, esi
    call sub_10094A63
    cmp cmp eax, ebx
    jl sub_100994A3
    mov mov ecx, esi
    call sub_1008710C
    cmp cmp eax, ebx
    jl sub_100994AE
    mov mov ecx, esi
L10:
    call sub_1008D78E
    cmp cmp eax, ebx
    jl sub_100994B9
    mov mov dword ptr [esi + 0D8h], 1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10098fd3 ENDP
END
