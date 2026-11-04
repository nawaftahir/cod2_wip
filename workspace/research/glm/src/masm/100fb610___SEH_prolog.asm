.686
.MODEL FLAT, C
.CODE
__SEH_prolog PROC
    push 0100FB664h
    mov eax, dword ptr fs:[0]
    push eax
    mov eax, dword ptr [esp + 16]
    mov dword ptr [esp + 16], ebp
    lea ebp, [esp + 16]
    sub esp, eax
    push ebx
    push esi
    push edi
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 24], esp
    push eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 4], 0FFFFFFFFh
    mov dword ptr [ebp - 8], eax
    lea eax, [ebp - 16]
    mov dword ptr fs:[0], eax
    ret
__SEH_prolog ENDP
END
