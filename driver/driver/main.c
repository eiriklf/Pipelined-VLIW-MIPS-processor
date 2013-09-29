#include <stdio.h>

#include "xbasic_types.h" // for Xuint32 type
#include "xparameters.h" // includes constants for device memory map

// IMPORTANT: These defines/includes depend on the name of your peripheral!
//            You may need to update them...
#include "tdt4255_exercise.h"
#define WR TDT4255_EXERCISE_mWriteReg
#define RR TDT4255_EXERCISE_mReadReg
#define BASE XPAR_TDT4255_EXERCISE_0_BASEADDR
// Name dependent defines/includes ends here

#define CMD_NONE 0
#define CMD_WI 1
#define CMD_RD 2
#define CMD_WD 3
#define CMD_RUN 4

#define STATUS_DONE 3

#define REG_CMD 0
#define REG_ADDR_IN 4
#define REG_DATA_IN 8
#define REG_STATUS 12
#define REG_DATA_OUT 16

#define HOST_CMD_INSTRUCTION    'i'
#define HOST_CMD_WRITE_DATA     'd'
#define HOST_CMD_READ_DATA      'r'
#define HOST_CMD_START_STOP_CPU 's'

void wait(){
  while(RR(BASE, REG_STATUS) != STATUS_DONE){
  }
}

void writeData(int command, Xuint32 address, Xuint32 data){
  WR(BASE, REG_ADDR_IN, address);
  WR(BASE, REG_DATA_IN, data);
  
  // the command triggers the FPGA, so we write this value last
  WR(BASE, REG_CMD, command);
  
  // clean up
  WR(BASE, REG_CMD, CMD_NONE);
  WR(BASE, REG_ADDR_IN, 0);
  WR(BASE, REG_DATA_IN, 0);
}

Xuint32 readData(int command, Xuint32 address){
 
  WR(BASE, REG_ADDR_IN, address);
  
  // the command triggers the FPGA, so we write this value last
  WR(BASE, REG_CMD, command);
  
  wait();
  
  // clean up
  Xint32 outdata = RR(BASE, REG_DATA_OUT);

  WR(BASE, REG_CMD, CMD_NONE);
  WR(BASE, REG_ADDR_IN, 0);
  return outdata;
}

Xuint32 readCharacter()
  {
  Xuint32 thisChar = 0;
  Xuint32 newChar = 0;
  while(thisChar == 0)
    {
    thisChar = getchar();
    }
  if(thisChar == 0x000000FF)
    {
    while(newChar == 0)
	   {
      newChar = getchar();
	   }
	 if(newChar == 0x000000FF)
	   {
	    return 0x000000FF;
	   }
	 return 0;
    }
  return thisChar;
  }

Xuint32 recieveAddress(){
  Xuint32 thisChar = readCharacter();

  return thisChar;
}

Xuint32 recieveData(){
  Xuint32 char1 = readCharacter();
  Xuint32 char2 = readCharacter();
  Xuint32 char3 = readCharacter();
  Xuint32 char4 = readCharacter();
  
  Xuint32 retval = (char1 << 24) | (char2 << 16) | (char3 << 8) | char4;
  
  return retval;
}

int main(){
  char curChar;
  Xuint32 address, data;
 
  xil_printf("FPGA started in Processor Mode, waiting for input\r\n");

  for(;;){
    
    curChar = getchar(); // retrieve character from stdin

    if(curChar != '\0'){
      if(curChar == HOST_CMD_INSTRUCTION){
        address = recieveAddress();
        data = recieveData();
        writeData(CMD_WI, address, data);
        xil_printf("Wrote data %d to instruction address %d\r\n", data, address);
      }
      else if(curChar == HOST_CMD_WRITE_DATA){
        address = recieveAddress();
        data = recieveData();
        writeData(CMD_WD, address, data);
        xil_printf("Wrote data %d to data address %d\r\n", data, address);
      }
      else if(curChar == HOST_CMD_READ_DATA){
        address = recieveAddress();
        data = readData(CMD_RD, address);
        xil_printf("Recieved data %d from address %d\r\n", data, address);
      }
      else if(curChar == HOST_CMD_START_STOP_CPU){
        WR(BASE, REG_CMD, CMD_RUN);
        xil_printf("CPU started, send s command to stop\r\n");
        while(getchar() != HOST_CMD_START_STOP_CPU);
        WR(BASE, REG_CMD, CMD_NONE);
        xil_printf("CPU stopped, ready to recieve commands\r\n");
      }
      else{
        xil_printf("Recieved unknown command %c\r\n", curChar);
      }
    }
  }
}
