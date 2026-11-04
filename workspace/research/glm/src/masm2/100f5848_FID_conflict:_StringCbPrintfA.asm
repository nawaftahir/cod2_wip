.686
.MODEL FLAT, C
EXTRN sub_100CC739:PROC
.CODE
FID_conflict:_StringCbPrintfA PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    cmp cmp dword ptr [ebp + 12], 07FFFFFFFh
    jbe L0
    mov mov eax, 080070057h
    pop pop ebp
    ret ret
    lea lea eax, [ebp + 20]
    push push eax
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_100CC739
    pop pop ebp
    ret ret
FID_conflict:_StringCbPrintfA ENDP
END
