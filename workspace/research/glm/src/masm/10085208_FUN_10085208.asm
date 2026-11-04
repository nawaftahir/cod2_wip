.686
.MODEL FLAT, C
EXTRN sub_100827CA:PROC
.CODE
FUN_10085208 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 19
    mov esi, ecx
    call sub_100827CA
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [esi + 24], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [esi + 28], eax
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [esi + 40], eax
    mov dword ptr [esi], 0101103ECh
    mov dword ptr [esi + 32], 0000F0000h
    mov dword ptr [esi + 36], 000E40000h
    mov eax, esi
    pop esi
    pop ebp
    ret 20
FUN_10085208 ENDP
END
