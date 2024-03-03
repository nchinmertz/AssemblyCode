.text
transpose:
    push %rbp
    mov %rsp, %rbp
    push %r8
    push %r9
    push %rbx
    push %rdx
    push %r12
    push %r15
    push %r14
    push %r13
    push %rcx
    mov 24(%rbp), %r8d #num_cols
    mov 32(%rbp), %r9d #num_rows
    mov 40(%rbp), %rbx #input address
    mov 16(%rbp), %rdx #output address
    mov $0, %r12d #n 
    mov $0, %r15d #j

outer:
    cmp %r8d, %r12d
    jge end
    mov %r12d, %r14d #i=n
    mov $0, %r13d #m=0
    jmp inner

inner:
    cmp %r9d, %r13d
    jge inner_done
    mov (%rbx, %r14, 4), %ecx
    movl %ecx, (%rdx, %r15, 4)
    add %r8d, %r14d
    add $1, %r15d
    add $1, %r13d
    jmp inner

inner_done:
    add $1, %r12d
    jmp outer

end:
    pop %rcx
    pop %r13
    pop %r14
    pop %r15
    pop %r12
    pop %rdx
    pop %rbx
    pop %r9
    pop %r8
    add $32, %rbp
    pop %rbp
    ret

