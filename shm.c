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
  //you write this
  int i, first_index = 0, first_found = 0;
  uint address_v = PGROUNDUP(myproc()->sz);

  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    //Finds the existing page
    if(shm_table.shm_pages[i].id == id){
      //Maps it to existign page
      mappages(myproc()->pgdir,(char*)address_v , PGSIZE, V2P(shm_table.shm_pages[i].frame) , PTE_W|PTE_U);
      //Increments the reference count
      shm_table.shm_pages[i].refcnt++;
      //Dont use first index
      first_found = 0;
      break;
    }
    //Finds the first available index 
    else if (shm_table.shm_pages[i].id == 0 && first_found == 0){
      //stores first index
      first_index = i;
      //sets flag to use first index instead
      first_found = 1;
    }
  }
  
  //No matching address found so using first index instead
  if (first_found){
    //Assign the page id
    shm_table.shm_pages[first_index].id = id;
    //Allocates the page frame
    shm_table.shm_pages[first_index].frame = kalloc();
    //Increments the reference count
    shm_table.shm_pages[first_index].refcnt++;

    //initilaze the frame allocated to 0
    memset(shm_table.shm_pages[first_index].frame, 0, PGSIZE);
    //Maps the virtal page
    mappages(myproc()->pgdir,(char*)address_v , PGSIZE, V2P(shm_table.shm_pages[first_index].frame) , PTE_W|PTE_U);
  }
  //Returns the address of the page through the pointer variable
  *pointer = (char*) address_v;
  //updates the current process size
  //Page size plus current process size
  myproc()->sz += PGSIZE;

  release(&(shm_table.lock));

  return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
  //you write this too!
  int i;
  acquire(&(shm_table.lock));
  //Loops through the pages
  for (i = 0; i< 64; i++) {
    //If matchin id found decrment the refferce
    if(shm_table.shm_pages[i].id == id){
      shm_table.shm_pages[i].refcnt--;
    }
    //If the referece count is 0, reset pages variables
    if (shm_table.shm_pages[i].refcnt == 0){
      shm_table.shm_pages[i].id = 0;
      shm_table.shm_pages[i].frame = 0;
    }
  }
  release(&(shm_table.lock));
  return 0; //added to remove compiler warning -- you should decide what to return
}
