.686
.MODEL FLAT, C
EXTRN sub_100827CA:PROC
.CODE
FUN_10085208 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push 19
    mov mov esi, ecx
    call sub_100827CA
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [esi + 24], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [esi + 28], eax
    mov mov eax, dword ptr [ebp + 24]
    mov mov dword ptr [esi + 40], eax
    mov mov dword ptr [esi], 0101103ECh
    mov mov dword ptr [esi + 32], 0F0000h
    mov mov dword ptr [esi + 36], 0E40000h
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret 20
FUN_10085208 ENDP
END
