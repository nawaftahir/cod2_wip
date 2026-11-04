.686
.MODEL FLAT, C
EXTRN g_101D1BF8:DWORD
EXTRN g_10766694:DWORD
EXTRN g_10766698:DWORD
EXTRN g_1076669C:DWORD
EXTRN g_107666A0:DWORD
EXTRN g_107666A4:DWORD
EXTRN g_107666A8:DWORD
EXTRN g_107666AC:DWORD
EXTRN g_107666B0:DWORD
EXTRN g_107666B4:DWORD
EXTRN g_107666B8:DWORD
EXTRN g_107666BC:DWORD
EXTRN g_107666C0:DWORD
EXTRN g_107666C4:DWORD
EXTRN g_107666C8:DWORD
EXTRN g_107666CC:DWORD
EXTRN g_107666D0:DWORD
EXTRN g_107666D4:DWORD
EXTRN g_107666D8:DWORD
EXTRN g_107666DC:DWORD
EXTRN g_107666E0:DWORD
EXTRN g_107666E4:DWORD
EXTRN g_107666E8:DWORD
EXTRN g_107666EC:DWORD
EXTRN g_107666F0:DWORD
EXTRN g_107666F4:DWORD
EXTRN g_107666F8:DWORD
EXTRN g_107666FC:DWORD
EXTRN g_10766700:DWORD
EXTRN g_10766704:DWORD
EXTRN g_10766708:DWORD
EXTRN g_1076670C:DWORD
EXTRN g_10766710:DWORD
EXTRN g_10766714:DWORD
EXTRN g_10766715:DWORD
EXTRN g_107667E4:DWORD
EXTRN g_107667E8:DWORD
.CODE
FUN_1003c100 PROC
    sub esp, 68
    mov eax, dword ptr [g_101D1BF8]
    push ebx
    xor ebx, ebx
    push ebx
    push 000000089h
    mov dword ptr [g_107667E4], 03F800000h
    mov dword ptr [g_107667E8], 03F800000h
    mov dword ptr [g_10766694], ebx
    mov dword ptr [g_107666B4], ebx
    mov dword ptr [g_107666D4], ebx
    mov dword ptr [g_107666F4], ebx
    mov dword ptr [g_10766698], ebx
    mov dword ptr [g_107666B8], ebx
    mov dword ptr [g_107666D8], ebx
    mov dword ptr [g_107666F8], ebx
    mov dword ptr [g_1076669C], ebx
    mov dword ptr [g_107666BC], ebx
    mov dword ptr [g_107666DC], ebx
    mov dword ptr [g_107666FC], ebx
    mov dword ptr [g_107666A0], ebx
    mov dword ptr [g_107666C0], ebx
    mov dword ptr [g_107666E0], ebx
    mov dword ptr [g_10766700], ebx
    mov dword ptr [g_107666A4], ebx
    mov dword ptr [g_107666C4], ebx
    mov dword ptr [g_107666E4], ebx
    mov dword ptr [g_10766704], ebx
    mov dword ptr [g_107666A8], ebx
    mov dword ptr [g_107666C8], ebx
    mov dword ptr [g_107666E8], ebx
    mov dword ptr [g_10766708], ebx
    mov dword ptr [g_107666AC], ebx
    mov dword ptr [g_107666CC], ebx
    mov dword ptr [g_107666EC], ebx
    mov dword ptr [g_1076670C], ebx
    mov dword ptr [g_107666B0], ebx
    mov dword ptr [g_107666D0], ebx
    mov dword ptr [g_107666F0], ebx
    mov dword ptr [g_10766710], ebx
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 1
    push 000000093h
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_101D1BF8]
    lea edx, [esp + 4]
    push edx
    mov dword ptr [esp + 24], 03F800000h
    mov dword ptr [esp + 28], 03F800000h
    mov dword ptr [esp + 32], 03F800000h
    mov dword ptr [esp + 36], 03F800000h
    mov dword ptr [esp + 8], 03F800000h
    mov dword ptr [esp + 12], 03F800000h
    mov dword ptr [esp + 16], 03F800000h
    mov dword ptr [esp + 20], 03F800000h
    mov dword ptr [esp + 40], 03F800000h
    mov dword ptr [esp + 44], 03F800000h
    mov dword ptr [esp + 48], 03F800000h
    mov dword ptr [esp + 52], 03F800000h
    mov dword ptr [esp + 56], ebx
    mov dword ptr [esp + 60], ebx
    mov dword ptr [esp + 64], ebx
    mov dword ptr [esp + 68], ebx
    mov dword ptr [esp + 72], 042000000h
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc4]
    mov byte ptr [g_10766714], bl
    mov word ptr [g_10766715], bx
    pop ebx
    add esp, 68
    ret
FUN_1003c100 ENDP
END
