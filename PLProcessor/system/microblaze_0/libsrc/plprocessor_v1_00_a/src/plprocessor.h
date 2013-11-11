/*****************************************************************************
* Filename:          C:\Users\torbjlan\dmkonsttdt4255_work\PLProcessor\system/drivers/plprocessor_v1_00_a/src/plprocessor.h
* Version:           1.00.a
* Description:       plprocessor Driver Header File
* Date:              Mon Nov 11 22:23:30 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef PLPROCESSOR_H
#define PLPROCESSOR_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 */
#define PLPROCESSOR_USER_SLV_SPACE_OFFSET (0x00000000)
#define PLPROCESSOR_SLV_REG0_OFFSET (PLPROCESSOR_USER_SLV_SPACE_OFFSET + 0x00000000)
#define PLPROCESSOR_SLV_REG1_OFFSET (PLPROCESSOR_USER_SLV_SPACE_OFFSET + 0x00000004)
#define PLPROCESSOR_SLV_REG2_OFFSET (PLPROCESSOR_USER_SLV_SPACE_OFFSET + 0x00000008)
#define PLPROCESSOR_SLV_REG3_OFFSET (PLPROCESSOR_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define PLPROCESSOR_SLV_REG4_OFFSET (PLPROCESSOR_USER_SLV_SPACE_OFFSET + 0x00000010)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a PLPROCESSOR register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the PLPROCESSOR device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void PLPROCESSOR_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define PLPROCESSOR_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a PLPROCESSOR register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the PLPROCESSOR device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 PLPROCESSOR_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define PLPROCESSOR_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from PLPROCESSOR user logic slave registers.
 *
 * @param   BaseAddress is the base address of the PLPROCESSOR device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void PLPROCESSOR_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 PLPROCESSOR_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define PLPROCESSOR_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (PLPROCESSOR_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define PLPROCESSOR_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (PLPROCESSOR_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define PLPROCESSOR_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (PLPROCESSOR_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define PLPROCESSOR_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (PLPROCESSOR_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define PLPROCESSOR_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (PLPROCESSOR_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))

#define PLPROCESSOR_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (PLPROCESSOR_SLV_REG0_OFFSET) + (RegOffset))
#define PLPROCESSOR_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (PLPROCESSOR_SLV_REG1_OFFSET) + (RegOffset))
#define PLPROCESSOR_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (PLPROCESSOR_SLV_REG2_OFFSET) + (RegOffset))
#define PLPROCESSOR_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (PLPROCESSOR_SLV_REG3_OFFSET) + (RegOffset))
#define PLPROCESSOR_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (PLPROCESSOR_SLV_REG4_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the PLPROCESSOR instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus PLPROCESSOR_SelfTest(void * baseaddr_p);

#endif /** PLPROCESSOR_H */
