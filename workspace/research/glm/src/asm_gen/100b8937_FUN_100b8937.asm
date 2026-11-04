; FUN_100b8937 @ 0x100b8937 — auto-synthesized
    sub_100c521f PROTO C
    sub_100f7884 PROTO C
.CODE
FUN_100b8937 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov dword ptr [esi], 0x10117dc0
    call sub_100c521f
    test byte ptr [ebp + 8], 1
    je L0
    push esi
    call sub_100f7884
    pop ecx
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b8937 ENDP
END