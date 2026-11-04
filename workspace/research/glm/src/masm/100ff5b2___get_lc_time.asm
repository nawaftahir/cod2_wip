.686
.MODEL FLAT, C
EXTRN sub_10108558:PROC
EXTRN sub_10108569:PROC
EXTRN sub_1010857A:PROC
EXTRN sub_1010858B:PROC
EXTRN sub_1010859F:PROC
EXTRN sub_101085B0:PROC
EXTRN sub_101085BE:PROC
EXTRN sub_101085CF:PROC
EXTRN sub_101085E3:PROC
EXTRN sub_101085F4:PROC
EXTRN sub_10108605:PROC
EXTRN sub_10108616:PROC
EXTRN sub_1010862A:PROC
EXTRN sub_1010863B:PROC
EXTRN sub_1010864C:PROC
EXTRN sub_1010865D:PROC
EXTRN sub_10108671:PROC
EXTRN sub_10108682:PROC
EXTRN sub_10108693:PROC
EXTRN sub_101086A4:PROC
EXTRN sub_101086B8:PROC
EXTRN sub_101086C9:PROC
EXTRN sub_101086DA:PROC
EXTRN sub_101086EB:PROC
EXTRN sub_101086FF:PROC
EXTRN sub_10108710:PROC
EXTRN sub_10108721:PROC
EXTRN sub_10108732:PROC
EXTRN sub_10108746:PROC
EXTRN sub_10108757:PROC
EXTRN sub_10108768:PROC
EXTRN sub_10108779:PROC
EXTRN sub_10108790:PROC
EXTRN sub_101087A4:PROC
EXTRN sub_101087B8:PROC
EXTRN sub_101087CC:PROC
EXTRN sub_101087E3:PROC
EXTRN sub_101087F7:PROC
EXTRN sub_1010880B:PROC
EXTRN sub_1010881F:PROC
EXTRN sub_10108836:PROC
EXTRN sub_1010884A:PROC
EXTRN sub_10108861:PROC
EXTRN sub_1010887A:PROC
EXTRN g_101AE1D2:DWORD
EXTRN g_101AE1D4:DWORD
.CODE
__get_lc_time PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    test esi, esi
    movzx eax, word ptr [g_101AE1D2]
    movzx ecx, word ptr [g_101AE1D4]
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], ecx
    jne L0
    or eax, 0FFFFFFFFh
    leave
    ret
L0:
    push ebx
    push edi
    lea ecx, [esi + 4]
    push ecx
    push 49
    xor ebx, ebx
    push eax
    inc ebx
    push ebx
    call sub_10108558
    mov edi, eax
    lea eax, [esi + 8]
    push eax
    push 50
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108569
    or edi, eax
    lea eax, [esi + 12]
    push eax
    push 51
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010857A
    or edi, eax
    lea eax, [esi + 16]
    push eax
    push 52
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010858B
    add esp, 64
    or edi, eax
    lea eax, [esi + 20]
    push eax
    push 53
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010859F
    or edi, eax
    lea eax, [esi + 24]
    push eax
    push 54
    push dword ptr [ebp - 4]
    push ebx
    call sub_101085B0
    push esi
    push 55
    push dword ptr [ebp - 4]
    or edi, eax
    push ebx
    call sub_101085BE
    or edi, eax
    lea eax, [esi + 32]
    push eax
    push 42
    push dword ptr [ebp - 4]
    push ebx
    call sub_101085CF
    add esp, 64
    or edi, eax
    lea eax, [esi + 36]
    push eax
    push 43
    push dword ptr [ebp - 4]
    push ebx
    call sub_101085E3
    or edi, eax
    lea eax, [esi + 40]
    push eax
    push 44
    push dword ptr [ebp - 4]
    push ebx
    call sub_101085F4
    or edi, eax
    lea eax, [esi + 44]
    push eax
    push 45
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108605
    or edi, eax
    lea eax, [esi + 48]
    push eax
    push 46
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108616
    add esp, 64
    or edi, eax
    lea eax, [esi + 52]
    push eax
    push 47
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010862A
    or edi, eax
    lea eax, [esi + 28]
    push eax
    push 48
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010863B
    or edi, eax
    lea eax, [esi + 56]
    push eax
    push 68
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010864C
    or edi, eax
    lea eax, [esi + 60]
    push eax
    push 69
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010865D
    add esp, 64
    or edi, eax
    lea eax, [esi + 64]
    push eax
    push 70
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108671
    or edi, eax
    lea eax, [esi + 68]
    push eax
    push 71
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108682
    or edi, eax
    lea eax, [esi + 72]
    push eax
    push 72
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108693
    or edi, eax
    lea eax, [esi + 76]
    push eax
    push 73
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086A4
    add esp, 64
    or edi, eax
    lea eax, [esi + 80]
    push eax
    push 74
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086B8
    or edi, eax
    lea eax, [esi + 84]
    push eax
    push 75
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086C9
    or edi, eax
    lea eax, [esi + 88]
    push eax
    push 76
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086DA
    or edi, eax
    lea eax, [esi + 92]
    push eax
    push 77
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086EB
    add esp, 64
    or edi, eax
    lea eax, [esi + 96]
    push eax
    push 78
    push dword ptr [ebp - 4]
    push ebx
    call sub_101086FF
    or edi, eax
    lea eax, [esi + 100]
    push eax
    push 79
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108710
    or edi, eax
    lea eax, [esi + 104]
    push eax
    push 56
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108721
    or edi, eax
    lea eax, [esi + 108]
    push eax
    push 57
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108732
    add esp, 64
    or edi, eax
    lea eax, [esi + 112]
    push eax
    push 58
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108746
    or edi, eax
    lea eax, [esi + 116]
    push eax
    push 59
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108757
    or edi, eax
    lea eax, [esi + 120]
    push eax
    push 60
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108768
    or edi, eax
    lea eax, [esi + 124]
    push eax
    push 61
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108779
    add esp, 64
    or edi, eax
    lea eax, [esi + 000000080h]
    push eax
    push 62
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108790
    or edi, eax
    lea eax, [esi + 000000084h]
    push eax
    push 63
    push dword ptr [ebp - 4]
    push ebx
    call sub_101087A4
    or edi, eax
    lea eax, [esi + 000000088h]
    push eax
    push 64
    push dword ptr [ebp - 4]
    push ebx
    call sub_101087B8
    or edi, eax
    lea eax, [esi + 00000008Ch]
    push eax
    push 65
    push dword ptr [ebp - 4]
    push ebx
    call sub_101087CC
    add esp, 64
    or edi, eax
    lea eax, [esi + 000000090h]
    push eax
    push 66
    push dword ptr [ebp - 4]
    push ebx
    call sub_101087E3
    or edi, eax
    lea eax, [esi + 000000094h]
    push eax
    push 67
    push dword ptr [ebp - 4]
    push ebx
    call sub_101087F7
    or edi, eax
    lea eax, [esi + 000000098h]
    push eax
    push 40
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010880B
    or edi, eax
    lea eax, [esi + 00000009Ch]
    push eax
    push 41
    push dword ptr [ebp - 4]
    push ebx
    call sub_1010881F
    add esp, 64
    or edi, eax
    lea eax, [esi + 0000000A0h]
    push eax
    push 31
    push dword ptr [ebp - 8]
    push ebx
    call sub_10108836
    or edi, eax
    lea eax, [esi + 0000000A4h]
    push eax
    push 32
    push dword ptr [ebp - 8]
    push ebx
    call sub_1010884A
    or edi, eax
    lea eax, [esi + 0000000A8h]
    push eax
    push 000001003h
    push dword ptr [ebp - 8]
    push ebx
    call sub_10108861
    mov ebx, dword ptr [ebp - 8]
    or edi, eax
    lea eax, [esi + 0000000B0h]
    push eax
    push 000001009h
    push ebx
    push 0
    call sub_1010887A
    add esp, 64
    or edi, eax
    mov dword ptr [esi + 0000000ACh], ebx
    mov eax, edi
    pop edi
    pop ebx
    leave
    ret
__get_lc_time ENDP
END
