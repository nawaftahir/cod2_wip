.686
.MODEL FLAT, C
EXTRN sub_100165DF:PROC
EXTRN sub_10016782:PROC
.CODE
FUN_10016740 PROC
    push push esi
    push push edi
    mov mov esi, 8
    mov mov edi, 01018EAC8h
    lea lea esp, [esp]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [eax]
    push push edi
    push push ecx
    push push edx
    call sub_100165DF
    mov mov ecx, dword ptr [ebx]
    mov mov dword ptr [esi + ecx], eax
    add add esi, 4
    add add esp, 12
    add add edi, 21
    cmp cmp esi, 24
    jl sub_10016782
    pop pop edi
    pop pop esi
    ret ret
FUN_10016740 ENDP
END
