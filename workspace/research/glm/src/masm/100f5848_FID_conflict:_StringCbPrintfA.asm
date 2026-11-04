.686
.MODEL FLAT, C
EXTRN sub_100CC739:PROC
.CODE
FID_conflict:_StringCbPrintfA PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 12], 07FFFFFFFh
    jbe L0
    mov eax, 080070057h
    pop ebp
    ret
L0:
    lea eax, [ebp + 20]
    push eax
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_100CC739
    pop ebp
    ret
FID_conflict:_StringCbPrintfA ENDP
END
