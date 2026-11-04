.686
.MODEL FLAT, C
EXTRN sub_10060358:PROC
EXTRN sub_10061CFE:PROC
EXTRN g_10198384:DWORD
EXTRN g_10198388:DWORD
.CODE
FUN_10037670 PROC
    push edi
    mov edi, eax
    call sub_10060358
    mov eax, edi
    lea edx, [eax + 1]
    lea ecx, [ecx]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    add eax, 5
    cmp eax, 64
    jb L1
    push edi
    push 01019838Ch
    push 1
    call sub_10061CFE
    add esp, 12
L1:
    dec edi
L2:
    mov al, byte ptr [edi + 1]
    inc edi
    test al, al
    jne L2
    mov eax, dword ptr [g_10198384]
    mov dword ptr [edi], eax
    mov cx, word ptr [g_10198388]
    mov word ptr [edi + 4], cx
    pop edi
    ret
FUN_10037670 ENDP
END
