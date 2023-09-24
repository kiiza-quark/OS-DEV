;
; A sample boot sector program that loops forever
;

org 0x7c00      ; Set the origin to 0x7C00 (default boot sector address)

section .text
    ; Bootloader entry point
    start:
        mov ah, 0x0e    ; Function to print character
        mov al, 'H'     ; Character to print
        int 0x10        ; Call interrupt 0x10 (video services)

        mov ah, 0x0e    ; Function to print character
        mov al, 'i'     ; Character to print
        int 0x10        ; Call interrupt 0x10 (video services)

        jmp $           ; Jump to the current address (infinite loop)

    times 510-($-$) db 0 ; Fill the rest of the boot sector with zeros
    dw 0xaa55           ; Boot signature (required to be recognized as bootable)