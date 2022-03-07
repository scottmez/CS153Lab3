


struct shm_cnt {
    struct uspinlock lock;
    int cnt;
};

int main(int argc, char *argv[]) 
{
    int pid;
    int i = 0;
    struct shm_cnt *counter;
        pid=fork();
        sleep(1);

    //shm_open: first process will create the page, the second will just attach to the same page
    //we get the virtual address of the pafe returned into the counter 
    //which we can no0w use but will be shared between the two processes

    shm_open(1,(char**)&counter);

    // printf(1,"%s")
    return 0;
}