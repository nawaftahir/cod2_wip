.686
.MODEL FLAT, C
EXTRN sub_100376C2:PROC
EXTRN sub_100376DC:PROC
EXTRN sub_10060358:PROC
EXTRN sub_10061CFE:PROC
EXTRN EXTRN g_10198384:DWORD:DWORD
EXTRN EXTRN g_10198388:DWORD:DWORD
.CODE
FUN_10037670 PROC
    push push edi
    mov mov edi, eax
    call sub_10060358
    mov mov eax, edi
    lea lea edx, [eax + 1]
    lea lea ecx, [ecx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    add add eax, 5
    cmp cmp eax, 64
    jb sub_100376C2
    push push edi
    push push 01019838Ch
L0:
    push push 1
    call sub_10061CFE
    add add esp, 12
    dec dec edi
    mov mov al, byte ptr [edi + 1]
    inc inc edi
    test test al, al
    jne sub_100376DC
    mov mov eax, dword ptr [g_10198384]
    mov mov dword ptr [edi], eax
    mov mov cx, word ptr [g_10198388]
    mov mov word ptr [edi + 4], cx
    pop pop edi
    ret ret
FUN_10037670 ENDP
END
