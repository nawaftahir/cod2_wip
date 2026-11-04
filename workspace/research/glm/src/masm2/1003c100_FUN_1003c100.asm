.686
.MODEL FLAT, C
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10766694:DWORD:DWORD
EXTRN EXTRN g_10766698:DWORD:DWORD
EXTRN EXTRN g_1076669C:DWORD:DWORD
EXTRN EXTRN g_107666A0:DWORD:DWORD
EXTRN EXTRN g_107666A4:DWORD:DWORD
EXTRN EXTRN g_107666A8:DWORD:DWORD
EXTRN EXTRN g_107666AC:DWORD:DWORD
EXTRN EXTRN g_107666B0:DWORD:DWORD
EXTRN EXTRN g_107666B4:DWORD:DWORD
EXTRN EXTRN g_107666B8:DWORD:DWORD
EXTRN EXTRN g_107666BC:DWORD:DWORD
EXTRN EXTRN g_107666C0:DWORD:DWORD
EXTRN EXTRN g_107666C4:DWORD:DWORD
EXTRN EXTRN g_107666C8:DWORD:DWORD
EXTRN EXTRN g_107666CC:DWORD:DWORD
EXTRN EXTRN g_107666D0:DWORD:DWORD
EXTRN EXTRN g_107666D4:DWORD:DWORD
EXTRN EXTRN g_107666D8:DWORD:DWORD
EXTRN EXTRN g_107666DC:DWORD:DWORD
EXTRN EXTRN g_107666E0:DWORD:DWORD
EXTRN EXTRN g_107666E4:DWORD:DWORD
EXTRN EXTRN g_107666E8:DWORD:DWORD
EXTRN EXTRN g_107666EC:DWORD:DWORD
EXTRN EXTRN g_107666F0:DWORD:DWORD
EXTRN EXTRN g_107666F4:DWORD:DWORD
EXTRN EXTRN g_107666F8:DWORD:DWORD
EXTRN EXTRN g_107666FC:DWORD:DWORD
EXTRN EXTRN g_10766700:DWORD:DWORD
EXTRN EXTRN g_10766704:DWORD:DWORD
EXTRN EXTRN g_10766708:DWORD:DWORD
EXTRN EXTRN g_1076670C:DWORD:DWORD
EXTRN EXTRN g_10766710:DWORD:DWORD
EXTRN EXTRN g_10766714:DWORD:DWORD
EXTRN EXTRN g_10766715:DWORD:DWORD
EXTRN EXTRN g_107667E4:DWORD:DWORD
EXTRN EXTRN g_107667E8:DWORD:DWORD
.CODE
FUN_1003c100 PROC
    sub sub esp, 68
    mov mov eax, dword ptr [g_101D1BF8]
    push push ebx
    xor xor ebx, ebx
    push push ebx
    push push 089h
    mov mov dword ptr [g_107667E4], 03F800000h
    mov mov dword ptr [g_107667E8], 03F800000h
    mov mov dword ptr [g_10766694], ebx
    mov mov dword ptr [g_107666B4], ebx
    mov mov dword ptr [g_107666D4], ebx
    mov mov dword ptr [g_107666F4], ebx
    mov mov dword ptr [g_10766698], ebx
    mov mov dword ptr [g_107666B8], ebx
    mov mov dword ptr [g_107666D8], ebx
    mov mov dword ptr [g_107666F8], ebx
    mov mov dword ptr [g_1076669C], ebx
    mov mov dword ptr [g_107666BC], ebx
    mov mov dword ptr [g_107666DC], ebx
    mov mov dword ptr [g_107666FC], ebx
    mov mov dword ptr [g_107666A0], ebx
    mov mov dword ptr [g_107666C0], ebx
    mov mov dword ptr [g_107666E0], ebx
    mov mov dword ptr [g_10766700], ebx
    mov mov dword ptr [g_107666A4], ebx
    mov mov dword ptr [g_107666C4], ebx
    mov mov dword ptr [g_107666E4], ebx
    mov mov dword ptr [g_10766704], ebx
    mov mov dword ptr [g_107666A8], ebx
    mov mov dword ptr [g_107666C8], ebx
    mov mov dword ptr [g_107666E8], ebx
    mov mov dword ptr [g_10766708], ebx
    mov mov dword ptr [g_107666AC], ebx
    mov mov dword ptr [g_107666CC], ebx
    mov mov dword ptr [g_107666EC], ebx
    mov mov dword ptr [g_1076670C], ebx
    mov mov dword ptr [g_107666B0], ebx
    mov mov dword ptr [g_107666D0], ebx
    mov mov dword ptr [g_107666F0], ebx
    mov mov dword ptr [g_10766710], ebx
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 1
    push push 093h
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_101D1BF8]
    lea lea edx, [esp + 4]
    push push edx
    mov mov dword ptr [esp + 24], 03F800000h
    mov mov dword ptr [esp + 28], 03F800000h
    mov mov dword ptr [esp + 32], 03F800000h
    mov mov dword ptr [esp + 36], 03F800000h
    mov mov dword ptr [esp + 8], 03F800000h
    mov mov dword ptr [esp + 12], 03F800000h
    mov mov dword ptr [esp + 16], 03F800000h
    mov mov dword ptr [esp + 20], 03F800000h
    mov mov dword ptr [esp + 40], 03F800000h
    mov mov dword ptr [esp + 44], 03F800000h
    mov mov dword ptr [esp + 48], 03F800000h
    mov mov dword ptr [esp + 52], 03F800000h
    mov mov dword ptr [esp + 56], ebx
    mov mov dword ptr [esp + 60], ebx
    mov mov dword ptr [esp + 64], ebx
    mov mov dword ptr [esp + 68], ebx
    mov mov dword ptr [esp + 72], 042000000h
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 0C4h]
    mov mov byte ptr [g_10766714], bl
    mov mov word ptr [g_10766715], bx
    pop pop ebx
    add add esp, 68
    ret ret
FUN_1003c100 ENDP
END
