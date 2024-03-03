.text

aaronize:
    push %rbp
    mov %rsp, %rbp
    push %rbx
    push %r12
    push %r13
    push %rdx
    push %r11
    push %r15
    push %rcx
    push %r10
    push %r14
    push %rax
    push %r9
    mov 40(%rbp), %rbx #input
    mov 32(%rbp), %r12 #length
    mov 24(%rbp), %r13 #times
    mov 16(%rbp), %rdx #output
    mov %rsp, %r9
    mov %r12, %r11
    imul $4, %r11
    sub %r11, %r9 #cur_arr
    mov $0, %r15 #i

original:
    cmp %r12, %r15
    jge start
    movl (%rbx, %r15, 4), %ecx
    movl %ecx, (%r9, %r15, 4)
    inc %r15
    jmp original

start:
    mov %r12, %r11
    sub $1, %r11 #length-1
    mov $0, %r10 #n

loop:
    cmp %r13, %r10
    jge exit
    mov $0, %r15
    jmp element

element:
    cmp %r12, %r15
    jge element_exit
    mov %r15, %r14
    movl (%r9, %r15, 4), %ecx
    cmp $0, %r15 
    je element_first
    cmp %r11, %r15
    je element_last
    inc %r14
    movl (%r9, %r14, 4), %eax
    add %eax, %ecx
    mov %r15, %r14
    dec %r14
    movl (%r9, %r14, 4), %eax
    add %eax, %ecx
    movl %ecx, (%rdx, %r15, 4)
    inc %r15
    jmp element

element_first:
    inc %r14
    movl (%r9, %r14, 4), %eax
    add %eax, %ecx
    movl %ecx, (%rdx, %r15, 4)
    inc %r15
    jmp element

element_last:
    dec %r14
    movl (%r9, %r14, 4), %eax
    add %eax, %ecx
    movl %ecx, (%rdx, %r15, 4)
    inc %r15

element_exit:
    mov $0, %r15
    inc %r10
    jmp update_cur

update_cur:
    cmp %r12, %r15
    jge loop
    movl (%rdx, %r15, 4), %ecx
    movl %ecx, (%r9, %r15, 4)
    inc %r15
    jmp update_cur

exit:
    imul $4, %r12
    add %r12, %r9
    pop %r9
    pop %rax
    pop %r14
    pop %r10
    pop %rcx
    pop %r15
    pop %r11
    pop %rdx
    pop %r13
    pop %r12
    pop %rbx
    add $32, %rbp
    pop %rbp
    ret
