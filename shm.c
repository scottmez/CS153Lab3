#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
  int i;  
  uint temp_id = 0;
  int temp_i;
  uint found = 0; //declaring local variables
  uint a;

  acquire(&(shm_table.lock)); //1. acquire lock on shm_table
  for (i = 0; i< 64; i++) { //2. search for page with .id == id
    if (shm_table.shm_pages[i].id == id) { //for the if
      found = shm_table.shm_pages[i].id;
      temp_i = i;
      a = PGROUNDUP(found);
      break;
    }
    if ((shm_table.shm_pages[i].id == 0) && (temp_id == 0)) { //for the else
      temp_id == shm_table.shm_pages[i].id;
      temp_i = i;
      a = PGROUNDUP(temp_id); 
    }
  }
  if (found != 0) { // if found
    mappages(myproc()->pgdir, (char*)a, PGSIZE, V2P(shm_table.shm_pages[temp_i].frame), PTE_W|PTE_U);// a. map it to the existing page (using mappages())
    shm_table.shm_pages[temp_i].refcnt++; // b. increment refnct
  }
  else if (temp_id != 0){ //else if we found a page thats available
    // a. find first avail page (already done in for loop)
    shm_table.shm_pages[temp_i].frame = kalloc();// b. page.frame = kalloc()
    shm_table.shm_pages[temp_i].refcnt++; // c. increment the refnct
    memset(shm_table.shm_pages[temp_i].frame, 0, PGSIZE);// d. Initialize the frame allocated to 0 (use memset())
    mappages(myproc()->pgdir, (char*)a, PGSIZE, V2P(shm_table.shm_pages[temp_i].frame), PTE_W|PTE_U);// e. map the new page (using mappages())
  }
  
  *pointer = (char*)myproc()->sz;// 4. return the address of the page through the pointer variable [*pointer = (char*)size;]
  myproc()->sz = ;// 5. update current process size 
  release(&(shm_table.lock));// 6. release lock

return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
//you write this too!




return 0; //added to remove compiler warning -- you should decide what to return
}
