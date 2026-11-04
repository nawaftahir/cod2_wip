; __fassign @ 0x100fe4bf — auto-synthesized
    sub_1010647f PROTO C
    sub_10106515 PROTO C
.CODE
__fassign PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    cmp dword ptr [ebp + 8], 0
    push dword ptr [ebp + 0x10]
    je L0
    lea eax, [ebp - 8]
    push eax
    call sub_1010647f
    mov eax, dword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax + 4], ecx
    leave
    ret
    lea eax, [ebp + 8]
    push eax
    call sub_10106515
    mov eax, dword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], ecx
    leave
    ret
__fassign ENDP
END