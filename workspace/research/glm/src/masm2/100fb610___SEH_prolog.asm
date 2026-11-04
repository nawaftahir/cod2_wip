.686
.MODEL FLAT, C
.CODE
__SEH_prolog PROC
    push push 0100FB664h
    mov mov eax, dword ptr fs:[0]
    push push eax
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [esp + 16], ebp
    lea lea ebp, [esp + 16]
    sub sub esp, eax
    push push ebx
    push push esi
    push push edi
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 24], esp
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 4], -1
    mov mov dword ptr [ebp - 8], eax
    lea lea eax, [ebp - 16]
    mov mov dword ptr fs:[0], eax
    ret ret
__SEH_prolog ENDP
END
