.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10083650 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 17
    mov mov edx, ecx
    call sub_100827C9
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [edx + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 20], eax
    mov mov dword ptr [edx], 01011008Ch
    mov mov eax, edx
    pop pop ebp
    ret ret 8
FUN_10083650 ENDP
END
