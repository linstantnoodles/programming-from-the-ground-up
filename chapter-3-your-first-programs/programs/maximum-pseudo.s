items = 12,32,333,2

mov %curr_register items.first
mov %max_register items.first
mov 0 index_register

start_loop
    if number is 0
    exit with max
    
    load number from curr_register
    compare it with that's in max_register
    if higher, set it in max_register
    update_index
    go to start_loop

exit
    
