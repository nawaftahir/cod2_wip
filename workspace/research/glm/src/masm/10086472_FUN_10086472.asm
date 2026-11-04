.686
.MODEL FLAT, C
EXTRN sub_10086314:PROC
EXTRN sub_100F5E10:PROC
EXTRN sub_100F78BE:PROC
.CODE
FUN_10086472 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 64
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 104]
    push edi
    push 63
    push dword ptr [eax + 24]
    lea eax, [ebp - 64]
    push eax
    mov edi, ecx
    call sub_100F5E10
    add esp, 12
    lea eax, [ebp - 64]
    push eax
    push esi
    mov ecx, edi
    mov byte ptr [ebp - 1], 0
    call sub_10086314
    mov esi, dword ptr [ebp + 16]
    mov edi, dword ptr [ebp + 12]
    push eax
    push 01011040Ch
    push esi
    push edi
    call sub_100F78BE
    add esp, 20
    mov byte ptr [edi + esi - 1], 0
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 12
FUN_10086472 ENDP
END
