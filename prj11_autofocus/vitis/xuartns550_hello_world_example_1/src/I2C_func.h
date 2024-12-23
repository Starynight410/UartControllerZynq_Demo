#ifndef SRC_EEPROM_H_
#define SRC_EEPROM_H_

#include "xiicps.h"
#include "xuartps.h"
#include "sleep.h"

#define IIC_DEVICE_ID XPAR_PS7_I2C_0_DEVICE_ID
#define IIC_SLAVE_ADDR 0x50 //IIC地址这里是7位地址而不是8位
#define IIC_START_ADDR 0 //IIC从机开始读写寄存器数据位置

/*IIC Init*/
u32 IIC_Init(XIicPs *Xiicps,u16 deviceid,u32 FsclHz);
u32 IIC_Write_EEPROM(XIicPs *Xiicps,u8 *MsgPtr,u16 ByteCount);
u32 IIC_Read_EEPROM(XIicPs *Xiicps,u8 *MsgPtr_w,u8 *MsgPtr_r,u16 ByteCount);

#endif /* SRC_EEPROM_H_ */
