.686
.MODEL FLAT, C
EXTRN sub_100165F0:PROC
EXTRN sub_1001751B:PROC
EXTRN sub_10017523:PROC
EXTRN sub_10017525:PROC
.CODE
FUN_100174c0 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov ebp, 0101D7FCCh
    mov mov dword ptr [esp + 16], 32
    cmp cmp dword ptr [ebp], 0
    je sub_1001751B
    lea lea ebx, [ebp + 8]
    mov mov esi, 01018EAC8h
    mov mov edi, ebx
    mov mov eax, dword ptr [ebx - 4]
    mov mov ecx, dword ptr [ebp]
    push push esi
    push push eax
    push push ecx
    call sub_100165F0
    mov mov dword ptr [edi], eax
    add add esi, 21
    add add esp, 12
    add add edi, 4
    cmp cmp esi, 01018EB1Ch
    jl sub_10017525
    mov mov eax, dword ptr [esp + 16]
    add add ebp, 24
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_10017523
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100174c0 ENDP
END
