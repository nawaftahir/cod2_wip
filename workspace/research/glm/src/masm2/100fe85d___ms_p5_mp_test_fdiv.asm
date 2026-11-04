.686
.MODEL FLAT, C
EXTRN sub_100FE846:PROC
EXTRN sub_100FE890:PROC
EXTRN sub_100FE8A0:PROC
EXTRN EXTRN fp_1010C04C:DWORD:DWORD
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
.CODE
__ms_p5_mp_test_fdiv PROC
    push push 01017CE2Ch
    call dword ptr [fp_1010C07C]
    test test eax, eax
    je sub_100FE890
    push push 01017CE10h
    push push eax
    call dword ptr [fp_1010C04C]
    test test eax, eax
    je sub_100FE8A0
    push push 0
    call call eax
    ret ret
    jmp sub_100FE846
__ms_p5_mp_test_fdiv ENDP
END
