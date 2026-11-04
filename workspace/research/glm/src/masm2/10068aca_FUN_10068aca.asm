.686
.MODEL FLAT, C
EXTRN sub_10068B4F:PROC
EXTRN sub_10068B62:PROC
EXTRN sub_10068B69:PROC
EXTRN sub_10068B70:PROC
EXTRN sub_10068B77:PROC
EXTRN sub_10068B7E:PROC
EXTRN sub_10068B85:PROC
EXTRN sub_10068B8C:PROC
EXTRN sub_10068B93:PROC
EXTRN sub_10068B9A:PROC
EXTRN sub_10068BA1:PROC
EXTRN sub_10068BA8:PROC
EXTRN sub_10068BAF:PROC
EXTRN sub_10068BB6:PROC
EXTRN sub_10068BBD:PROC
.CODE
FUN_10068aca PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    movzx movzx eax, byte ptr [ebp + 8]
    cmp cmp eax, 13
    ja sub_10068B4F
    jmp jmp dword ptr [eax*4 + 010068B4Ah]
    mov mov eax, 01010EBE8h
    jmp sub_10068B62
    mov mov eax, 01010EBDCh
    jmp sub_10068B69
    mov mov eax, 01010EBCCh
    jmp sub_10068B70
    mov mov eax, 01010EBC4h
    jmp sub_10068B77
    mov mov eax, 01010EBBCh
    jmp sub_10068B7E
    mov mov eax, 01010EBB0h
    jmp sub_10068B85
    mov mov eax, 01010EBA8h
    jmp sub_10068B8C
    mov mov eax, 01010EB9Ch
    jmp sub_10068B93
    mov mov eax, 01010EB90h
    jmp sub_10068B9A
    mov mov eax, 01010EB84h
    jmp sub_10068BA1
    mov mov eax, 01010EB7Ch
    jmp sub_10068BA8
    mov mov eax, 01010EB70h
    jmp sub_10068BAF
    mov mov eax, 01010EB78h
    jmp sub_10068BB6
    mov mov eax, 01010EB68h
    jmp sub_10068BBD
    mov mov eax, 01010EBF4h
    pop pop ebp
    ret ret 4
FUN_10068aca ENDP
END
