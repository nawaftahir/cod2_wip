.686
.MODEL FLAT, C
EXTRN sub_100FE846:PROC
EXTRN fp_1010C04C:DWORD
EXTRN fp_1010C07C:DWORD
.CODE
__ms_p5_mp_test_fdiv PROC
    push 01017CE2Ch
    call dword ptr [fp_1010C07C]
    test eax, eax
    je L0
    push 01017CE10h
    push eax
    call dword ptr [fp_1010C04C]
    test eax, eax
    je L0
    push 0
    call eax
    ret
L0:
    jmp sub_100FE846
__ms_p5_mp_test_fdiv ENDP
END
