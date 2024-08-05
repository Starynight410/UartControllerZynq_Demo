#include "I2C_func.h"

// ==============================IIC Function==============================
u32 IIC_Init(XIicPs *Xiicps,u16 deviceid,u32 FsclHz)
{
	u32 state;
	XIicPs_Config * IIC_Config;
	IIC_Config=XIicPs_LookupConfig(deviceid);
	state=XIicPs_CfgInitialize(Xiicps,IIC_Config,IIC_Config->BaseAddress);
	if(state!=XST_SUCCESS){
		xil_printf("CfgInit Error!\r\n");
		return XST_FAILURE;
	}

	state=XIicPs_SelfTest(Xiicps);//IIC自查
	if(state!=XST_SUCCESS){
		xil_printf("SelfTest Error!\r\n");
		return XST_FAILURE;
	}

	state=XIicPs_SetSClk(Xiicps,FsclHz);//IIC设置传输速度
	if(state!=XST_SUCCESS){
		xil_printf("SetClk Error!\r\n");
			return XST_FAILURE;
	}
	return XST_SUCCESS;
}


// IIC transmit
u32 IIC_Write_EEPROM(XIicPs *Xiicps,u8 *MsgPtr,u16 ByteCount)
{
	u16 Address=IIC_START_ADDR;
	u32 WrOffset;
	u32 status;

	MsgPtr[0] = (u8) (Address);
	WrOffset = 1;

	status = XIicPs_MasterSendPolled(Xiicps,MsgPtr,ByteCount+WrOffset,IIC_SLAVE_ADDR);

	if (status != XST_SUCCESS) {
		xil_printf("IIC WriteData Error\r\n");
		return XST_FAILURE;
	}
	xil_printf("IIC WriteData succeed\r\n");

	while (XIicPs_BusIsBusy(Xiicps)); //等待总线空闲

	usleep(250000);

	return XST_SUCCESS;
}


u32 IIC_Read_EEPROM(XIicPs *Xiicps,u8 *MsgPtr_w,u8 *MsgPtr_r,u16 ByteCount){
	u16 Address=IIC_START_ADDR;
	u32 WrOffset;
	u32 status;

	MsgPtr_w[0] = (u8) (Address);
	WrOffset = 1;

	status = XIicPs_MasterSendPolled(Xiicps,MsgPtr_w,WrOffset,IIC_SLAVE_ADDR);

	while (XIicPs_BusIsBusy(Xiicps));

	usleep(250000);

	if (status != XST_SUCCESS) {
				print("Find Slave Address Error\r\n");
				return XST_FAILURE;
	}

	status = XIicPs_MasterRecvPolled(Xiicps, MsgPtr_r,ByteCount,IIC_SLAVE_ADDR);
	if (status != XST_SUCCESS) {
			print("Read Address Error\r\n");
				return XST_FAILURE;
	}

	while (XIicPs_BusIsBusy(Xiicps));//等待总线空闲

	return XST_SUCCESS;
}

