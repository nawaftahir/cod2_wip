.686
.MODEL FLAT, C
EXTRN sub_10086314:PROC
EXTRN sub_100F5E10:PROC
EXTRN sub_100F78BE:PROC
.CODE
FUN_10086472 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 64
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 104]
    push push edi
    push push 63
    push push dword ptr [eax + 24]
    lea lea eax, [ebp - 64]
    push push eax
    mov mov edi, ecx
    call sub_100F5E10
    add add esp, 12
    lea lea eax, [ebp - 64]
    push push eax
    push push esi
    mov mov ecx, edi
    mov mov byte ptr [ebp - 1], 0
    call sub_10086314
    mov mov esi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp + 12]
    push push eax
    push push 01011040Ch
    push push esi
    push push edi
    call sub_100F78BE
    add add esp, 20
    mov mov byte ptr [edi + esi - 1], 0
    pop pop edi
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret 12
FUN_10086472 ENDP
END
