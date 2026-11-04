.686
.MODEL FLAT, C
EXTRN sub_100165DF:PROC
.CODE
FUN_10016740 PROC
    push esi
    push edi
    mov esi, 8
    mov edi, 01018EAC8h
    lea esp, [esp]
L0:
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [eax]
    push edi
    push ecx
    push edx
    call sub_100165DF
    mov ecx, dword ptr [ebx]
    mov dword ptr [esi + ecx], eax
    add esi, 4
    add esp, 12
    add edi, 21
    cmp esi, 24
    jl L0
    pop edi
    pop esi
    ret
FUN_10016740 ENDP
END
