.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_100833d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 14
    mov edx, ecx
    call sub_100827CB
    fld qword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [edx + 24]
    mov esi, dword ptr [ebp + 20]
    push 8
    pop ecx
    mov dword ptr [edx + 16], eax
    lea edi, [edx + 32]
    mov dword ptr [edx], 010110068h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 16
FUN_100833d8 ENDP
END
