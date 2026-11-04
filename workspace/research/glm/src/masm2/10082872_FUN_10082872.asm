.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082872 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 1
    mov mov edx, ecx
    call sub_100827C9
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [edx + 8], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 12], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx], 01010FFCCh
    mov mov eax, edx
    pop pop ebp
    ret ret 12
FUN_10082872 ENDP
END
