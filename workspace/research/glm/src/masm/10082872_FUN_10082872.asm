.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082872 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 1
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 12], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx], 01010FFCCh
    mov eax, edx
    pop ebp
    ret 12
FUN_10082872 ENDP
END
