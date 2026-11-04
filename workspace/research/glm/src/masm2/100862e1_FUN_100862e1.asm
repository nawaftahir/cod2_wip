.686
.MODEL FLAT, C
EXTRN sub_1008631E:PROC
.CODE
FUN_100862e1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov edx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [edx + 4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    test test byte ptr [ecx + 4], 32
    mov mov eax, 010110404h
    je sub_1008631E
    mov mov eax, 0101103FCh
    pop pop ebp
    ret ret 4
FUN_100862e1 ENDP
END
