; __SEH_prolog @ 0x100fb610 — auto-synthesized
.CODE
__SEH_prolog PROC
    push 0x100fb664
    mov eax, dword ptr fs:[0]
    push eax
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [esp + 0x10], ebp
    lea ebp, [esp + 0x10]
    sub esp, eax
    push ebx
    push esi
    push edi
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 0x18], esp
    push eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 4], 0xffffffff
    mov dword ptr [ebp - 8], eax
    lea eax, [ebp - 0x10]
    mov dword ptr fs:[0], eax
    ret
__SEH_prolog ENDP
END