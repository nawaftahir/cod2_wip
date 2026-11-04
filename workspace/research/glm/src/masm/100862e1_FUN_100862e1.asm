.686
.MODEL FLAT, C
.CODE
FUN_100862e1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx + 4]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx + 4], 32
    mov eax, 010110404h
    je L0
    mov eax, 0101103FCh
L0:
    pop ebp
    ret 4
FUN_100862e1 ENDP
END
