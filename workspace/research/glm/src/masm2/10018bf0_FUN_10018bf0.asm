.686
.MODEL FLAT, C
EXTRN sub_100188FC:PROC
EXTRN sub_1001891B:PROC
EXTRN sub_10018944:PROC
EXTRN sub_10018967:PROC
EXTRN sub_10018982:PROC
EXTRN sub_1001899D:PROC
EXTRN sub_100189BC:PROC
EXTRN sub_100189DB:PROC
EXTRN sub_100189FA:PROC
EXTRN sub_10018A19:PROC
EXTRN sub_10018A38:PROC
EXTRN sub_10018B40:PROC
EXTRN sub_10018BC3:PROC
EXTRN sub_10018D57:PROC
EXTRN sub_10018D76:PROC
.CODE
FUN_10018bf0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    mov mov esi, eax
    lea lea eax, [esi + 4]
    push push eax
    push push 01018FED0h
    push push 010195AECh
    push push ebp
    call sub_100188FC
    add add esp, 16
    test test al, al
    jne L0
    pop pop esi
    pop pop ebp
    ret ret
    push push edi
    lea lea edi, [esi + 8]
    push push edi
    push push 01018FEF0h
    push push 01019575Ch
    push push ebp
    call sub_1001891B
    add add esp, 16
    test test al, al
    jne L1
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    push push ebx
L0:
    mov mov ebx, dword ptr [edi]
    call sub_10018B40
    lea lea edi, [esi + 12]
    push push edi
    push push 01018FF30h
    push push 010195744h
    push push ebp
    call sub_10018944
    add add esp, 16
    test test al, al
    pop pop ebx
    je L2
    mov mov edi, dword ptr [edi]
    call sub_10018BC3
    lea lea ecx, [esi + 16]
    push push ecx
    push push 01018FF70h
    push push 010195AC0h
    push push ebp
    call sub_10018967
    add add esp, 16
L1:
    test test al, al
    je L3
    lea lea edx, [esi + 20]
    push push edx
    push push 01018FF90h
    push push 010195AB4h
    push push ebp
    call sub_10018982
    add add esp, 16
    test test al, al
    je L4
    lea lea eax, [esi + 24]
    push push eax
    push push 01018FFB0h
    push push 010195AA8h
    push push ebp
    call sub_1001899D
    add add esp, 16
    test test al, al
    je L5
    lea lea ecx, [esi + 28]
    push push ecx
    push push 01018FFD0h
    push push 010195A9Ch
    push push ebp
    call sub_100189BC
    add add esp, 16
    test test al, al
    je L6
    lea lea edx, [esi + 32]
    push push edx
L4:
    push push 010190000h
    push push 010195A98h
    push push ebp
    call sub_100189DB
    add add esp, 16
    test test al, al
    je L7
    lea lea eax, [esi + 36]
    push push eax
L5:
    push push 010190020h
    push push 010195A88h
    push push ebp
    call sub_100189FA
    add add esp, 16
    test test al, al
    je sub_10018D57
    lea lea ecx, [esi + 40]
    push push ecx
L6:
    push push 010190060h
    push push 010195A74h
    push push ebp
    call sub_10018A19
    add add esp, 16
    test test al, al
    je sub_10018D76
    add add esi, 44
    push push esi
L7:
    push push 010190040h
    push push 010195A7Ch
    push push ebp
    call sub_10018A38
    add add esp, 16
    pop pop edi
    test test al, al
    pop pop esi
    setne setne al
    pop pop ebp
    ret ret
FUN_10018bf0 ENDP
END
