`ifndef ADDR_CMD
    `define ADDR_CMD
       
`define		   WORK_MODE                                     20'd1
`define		   MASTER_SWITCH                                 20'd2
`define		   SOFT_WARE                                     20'd3
                                                             
`define		   MAIN_SWITCH_1                                 20'd4
`define		   MAIN_SWITCH_2                                 20'd5
`define		   MAIN_SWITCH_3                                 20'd6
`define		   MAIN_SWITCH_4                                 20'd7
`define		   MAIN_SWITCH_5                                 20'd8
`define		   MAIN_SWITCH_6                                 20'd9
`define		   MAIN_SWITCH_7                                 20'd10
`define		   MAIN_SWITCH_8                                 20'd11
                                                             
`define		   MAIN_SWITCH_9                                 20'd12
`define		   MAIN_SWITCH_10                                20'd13
`define		   MAIN_SWITCH_11                                20'd14
`define		   MAIN_SWITCH_12                                20'd15
`define		   MAIN_SWITCH_13                                20'd16
`define		   MAIN_SWITCH_14                                20'd17
`define		   MAIN_SWITCH_15                                20'd18
`define		   MAIN_SWITCH_16                                20'd19
                                                             
                                                             
`define		   DB_WIDTH_GPI1                                 20'd20
`define		   DB_WIDTH_GPI2                                 20'd21
`define		   DB_WIDTH_GPI3                                 20'd22
`define		   DB_WIDTH_GPI4                                 20'd23
`define		   DB_WIDTH_GPI5                                 20'd24
`define		   DB_WIDTH_GPI6                                 20'd25
`define		   DB_WIDTH_GPI7                                 20'd26
`define		   DB_WIDTH_GPI8                                 20'd27
                                                             
`define		   MUL_FREQUENCY_COEFFICIENT_GPI1                20'd28
`define		   MUL_FREQUENCY_COEFFICIENT_GPI2                20'd29
`define		   MUL_FREQUENCY_COEFFICIENT_GPI3                20'd30
`define		   MUL_FREQUENCY_COEFFICIENT_GPI4                20'd31
`define		   MUL_FREQUENCY_COEFFICIENT_GPI5                20'd32
`define		   MUL_FREQUENCY_COEFFICIENT_GPI6                20'd33
`define		   MUL_FREQUENCY_COEFFICIENT_GPI7                20'd34
`define		   MUL_FREQUENCY_COEFFICIENT_GPI8                20'd35
                                                             
`define		   MUL_FREQUENCY_PERIOD_GPI1                    20'd36
`define		   MUL_FREQUENCY_PERIOD_GPI2                    20'd37
`define		   MUL_FREQUENCY_PERIOD_GPI3                    20'd38
`define		   MUL_FREQUENCY_PERIOD_GPI4                    20'd39
`define		   MUL_FREQUENCY_PERIOD_GPI5                    20'd40
`define		   MUL_FREQUENCY_PERIOD_GPI6                    20'd41
`define		   MUL_FREQUENCY_PERIOD_GPI7                    20'd42
`define		   MUL_FREQUENCY_PERIOD_GPI8                    20'd43
                                                             
`define		   USER_OUTPUT_1                                 20'd44
`define		   USER_OUTPUT_2                                 20'd45
`define		   USER_OUTPUT_3                                 20'd46
`define		   USER_OUTPUT_4                                 20'd47
`define		   USER_OUTPUT_5                                 20'd48
`define		   USER_OUTPUT_6                                 20'd49
`define		   USER_OUTPUT_7                                 20'd50
`define		   USER_OUTPUT_8                                 20'd51
                                                             
`define		   INVERT_EN_GPO1                                20'd52
`define		   INVERT_EN_GPO2                                20'd53
`define		   INVERT_EN_GPO3                                20'd54
`define		   INVERT_EN_GPO4                                20'd55
`define		   INVERT_EN_GPO5                                20'd56
`define		   INVERT_EN_GPO6                                20'd57
`define		   INVERT_EN_GPO7                                20'd58
`define		   INVERT_EN_GPO8                                20'd59
                                                             
`define        GPO_MASK1                                     20'd60
`define        GPO_MASK2                                     20'd61
`define        GPO_MASK3                                     20'd62
`define        GPO_MASK4                                     20'd63
`define        GPO_MASK5                                     20'd64
`define        GPO_MASK6                                     20'd65
`define        GPO_MASK7                                     20'd66
`define        GPO_MASK8                                     20'd67
                                                             
`define		   OUTPUT_WIDTH_GPO1                             20'd68
`define		   OUTPUT_WIDTH_GPO2                             20'd69
`define		   OUTPUT_WIDTH_GPO3                             20'd70
`define		   OUTPUT_WIDTH_GPO4                             20'd71
`define		   OUTPUT_WIDTH_GPO5                             20'd72
`define		   OUTPUT_WIDTH_GPO6                             20'd73
`define		   OUTPUT_WIDTH_GPO7                             20'd74
`define		   OUTPUT_WIDTH_GPO8                             20'd75
                                                             
                                                             
`define        BRIGHTNESS_LIGHT1                             20'd76
`define        BRIGHTNESS_LIGHT2                             20'd77
`define        BRIGHTNESS_LIGHT3                             20'd78
`define        BRIGHTNESS_LIGHT4                             20'd79
`define        BRIGHTNESS_LIGHT5                             20'd80
`define        BRIGHTNESS_LIGHT6                             20'd81
`define        BRIGHTNESS_LIGHT7                             20'd82
`define        BRIGHTNESS_LIGHT8                             20'd83
`define        BRIGHTNESS_LIGHT9                             20'd84
`define        BRIGHTNESS_LIGHT10                            20'd85
`define        BRIGHTNESS_LIGHT11                            20'd86
`define        BRIGHTNESS_LIGHT12                            20'd87
`define        BRIGHTNESS_LIGHT13                            20'd88
`define        BRIGHTNESS_LIGHT14                            20'd89
`define        BRIGHTNESS_LIGHT15                            20'd90
`define        BRIGHTNESS_LIGHT16                            20'd91
                                                             
`define        BRIGHTNESS_ALL_LIGHT1                         20'd92
`define        BRIGHTNESS_ALL_LIGHT2                         20'd93
`define        BRIGHTNESS_ALL_LIGHT3                         20'd94
`define        BRIGHTNESS_ALL_LIGHT4                         20'd95
`define        BRIGHTNESS_ALL_LIGHT5                         20'd96
`define        BRIGHTNESS_ALL_LIGHT6                         20'd97
`define        BRIGHTNESS_ALL_LIGHT7                         20'd98
`define        BRIGHTNESS_ALL_LIGHT8                         20'd99
`define        BRIGHTNESS_ALL_LIGHT9                         20'd100
`define        BRIGHTNESS_ALL_LIGHT10                        20'd101
`define        BRIGHTNESS_ALL_LIGHT11                        20'd102
`define        BRIGHTNESS_ALL_LIGHT12                        20'd103
`define        BRIGHTNESS_ALL_LIGHT13                        20'd104
`define        BRIGHTNESS_ALL_LIGHT14                        20'd105
`define        BRIGHTNESS_ALL_LIGHT15                        20'd106
`define        BRIGHTNESS_ALL_LIGHT16                        20'd107
                                                             
`define        GPI_SECELT_LIGHT1                             20'd108
`define        GPI_SECELT_LIGHT2                             20'd109
`define        GPI_SECELT_LIGHT3                             20'd110
`define        GPI_SECELT_LIGHT4                             20'd111
`define        GPI_SECELT_LIGHT5                             20'd112
`define        GPI_SECELT_LIGHT6                             20'd113
`define        GPI_SECELT_LIGHT7                             20'd114
`define        GPI_SECELT_LIGHT8                             20'd115
`define        GPI_SECELT_LIGHT9                             20'd116
`define        GPI_SECELT_LIGHT10                            20'd117
`define        GPI_SECELT_LIGHT11                            20'd118
`define        GPI_SECELT_LIGHT12                            20'd119
`define        GPI_SECELT_LIGHT13                            20'd120
`define        GPI_SECELT_LIGHT14                            20'd121
`define        GPI_SECELT_LIGHT15                            20'd122
`define        GPI_SECELT_LIGHT16                            20'd123
                                                             
                                                             
                                                             
`define		   TRIGGER_POLARITY_LIGHT1                       20'd124
`define		   TRIGGER_POLARITY_LIGHT2                       20'd125
`define		   TRIGGER_POLARITY_LIGHT3                       20'd126
`define		   TRIGGER_POLARITY_LIGHT4                       20'd127
`define		   TRIGGER_POLARITY_LIGHT5                       20'd128
`define		   TRIGGER_POLARITY_LIGHT6                       20'd129
`define		   TRIGGER_POLARITY_LIGHT7                       20'd130
`define		   TRIGGER_POLARITY_LIGHT8                       20'd131
`define		   TRIGGER_POLARITY_LIGHT9                       20'd132
`define		   TRIGGER_POLARITY_LIGHT10                      20'd133
`define		   TRIGGER_POLARITY_LIGHT11                      20'd134
`define		   TRIGGER_POLARITY_LIGHT12                      20'd135
`define		   TRIGGER_POLARITY_LIGHT13                      20'd136
`define		   TRIGGER_POLARITY_LIGHT14                      20'd137
`define		   TRIGGER_POLARITY_LIGHT15                      20'd138
`define		   TRIGGER_POLARITY_LIGHT16                      20'd139
                                                             
`define		   TRIGGER_POLARITY_CYCLE                        20'd140
                                                             
`define		   CHX_WIDTH_LIGHT1                              20'd141
`define		   CHX_WIDTH_LIGHT2                              20'd142
`define		   CHX_WIDTH_LIGHT3                              20'd143
`define		   CHX_WIDTH_LIGHT4                              20'd144
`define		   CHX_WIDTH_LIGHT5                              20'd145
`define		   CHX_WIDTH_LIGHT6                              20'd146
`define		   CHX_WIDTH_LIGHT7                              20'd147
`define		   CHX_WIDTH_LIGHT8                              20'd148
`define		   CHX_WIDTH_LIGHT9                              20'd149
`define		   CHX_WIDTH_LIGHT10                             20'd150
`define		   CHX_WIDTH_LIGHT11                             20'd151
`define		   CHX_WIDTH_LIGHT12                             20'd152
`define		   CHX_WIDTH_LIGHT13                             20'd153
`define		   CHX_WIDTH_LIGHT14                             20'd154
`define		   CHX_WIDTH_LIGHT15                             20'd155
`define		   CHX_WIDTH_LIGHT16                             20'd156
                                                             
`define		   CHX_DELAY_LIGHT1                              20'd157
`define		   CHX_DELAY_LIGHT2                              20'd158
`define		   CHX_DELAY_LIGHT3                              20'd159
`define		   CHX_DELAY_LIGHT4                              20'd160
`define		   CHX_DELAY_LIGHT5                              20'd161
`define		   CHX_DELAY_LIGHT6                              20'd162
`define		   CHX_DELAY_LIGHT7                              20'd163
`define		   CHX_DELAY_LIGHT8                              20'd164
`define		   CHX_DELAY_LIGHT9                              20'd165
`define		   CHX_DELAY_LIGHT10                             20'd166
`define		   CHX_DELAY_LIGHT11                             20'd167
`define		   CHX_DELAY_LIGHT12                             20'd168
`define		   CHX_DELAY_LIGHT13                             20'd169
`define		   CHX_DELAY_LIGHT14                             20'd170
`define		   CHX_DELAY_LIGHT15                             20'd171
`define		   CHX_DELAY_LIGHT16                             20'd172
                                                             
`define		   CHX_DELAY_GPO1                                20'd173
`define		   CHX_DELAY_GPO2                                20'd174
`define		   CHX_DELAY_GPO3                                20'd175
`define		   CHX_DELAY_GPO4                                20'd176
`define		   CHX_DELAY_GPO5                                20'd177
`define		   CHX_DELAY_GPO6                                20'd178
`define		   CHX_DELAY_GPO7                                20'd179
`define		   CHX_DELAY_GPO8                                20'd180
                                                             
`define        STEP_GROUP1                                   20'd181
`define        GPI_GROUP1                                    20'd182
`define		   GPO_FUNCTION                                  20'd183
`define		   GROUP_SWITCH                                  20'd184
`define		   STEP_END_TIME                                 20'd185
`define		   CYCLE_RST                                     20'd186
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             
`define        STEP_MASK_GPO1_STANDARD                       20'd187
`define        STEP_MASK_GPO2_STANDARD                       20'd188
`define        STEP_MASK_GPO3_STANDARD                       20'd189
`define        STEP_MASK_GPO4_STANDARD                       20'd190
`define        STEP_MASK_GPO5_STANDARD                       20'd191
`define        STEP_MASK_GPO6_STANDARD                       20'd192
`define        STEP_MASK_GPO7_STANDARD                       20'd193
`define        STEP_MASK_GPO8_STANDARD                       20'd194
                                                             
                                                             
                                                             
                                                             
                                                             
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT1                  20'd195
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT2                  20'd196
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT3                  20'd197
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT4                  20'd198
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT5                  20'd199
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT6                  20'd200
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT7                  20'd201
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT8                  20'd202
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT9                  20'd203
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT10                 20'd204
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT11                 20'd205
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT12                 20'd206
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT13                 20'd207
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT14                 20'd208
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT15                 20'd209
`define	       HIGH_PULSE_WIDTH_REAL_LIGHT16                 20'd210

`define	       FIRMWARE_VERSION                              20'd211
`define	       GPI_STATE                                     20'd212

`define	       GPI_PluseCount1                               20'd213
`define	       GPI_PluseCount2                               20'd214
`define	       GPI_PluseCount3                               20'd215
`define	       GPI_PluseCount4                               20'd216
`define	       GPI_PluseCount5                               20'd217
`define	       GPI_PluseCount6                               20'd218
`define	       GPI_PluseCount7                               20'd219
`define	       GPI_PluseCount8                               20'd220

`define	       GPO_PluseCount1                               20'd221
`define	       GPO_PluseCount2                               20'd222
`define	       GPO_PluseCount3                               20'd223
`define	       GPO_PluseCount4                               20'd224
`define	       GPO_PluseCount5                               20'd225
`define	       GPO_PluseCount6                               20'd226
`define	       GPO_PluseCount7                               20'd227
`define	       GPO_PluseCount8                               20'd228

`define        StepCnt_STATE                                 20'd229

`define        KEY_VALUE                                     20'd230

`define        GROUP_VALUE                                   20'd231

`define        OUTVEN                                       20'd234

`define        INVEN                                        20'd237

`define        TURBO1                                        20'd238
`define        TURBO2                                        20'd239
`define        TURBO3                                        20'd240
`define        TURBO4                                        20'd241
`define        TURBO5                                        20'd242
`define        TURBO6                                        20'd243
`define        TURBO7                                        20'd244
`define        TURBO8                                        20'd245


`define        StepCnt_Total                                 20'd247

`define		   DacData_light1								 20'd246
`define		   DacData_light2								 20'd248
`define		   DacData_light3								 20'd249
`define		   DacData_light4								 20'd250
`define		   DacData_light5								 20'd251
`define		   DacData_light6								 20'd252
`define		   DacData_light7								 20'd253
`define		   DacData_light8								 20'd254

`define		   PW1									 		 20'd255
`define		   PW2								 	 		 20'd256
`define		   PW3								 	 		 20'd257
`define		   PW4								 	 		 20'd258
`define		   PW5								 	 		 20'd259
`define		   PW6								 	 		 20'd260
`define		   PW7								 	 		 20'd261
`define		   PW8								 	 		 20'd262
`define		   LIGHT_MODE						 	 		 20'd263

`define		   TEMP_DATA1						 	 		 20'd265
`define		   TEMP_DATA2						 	 		 20'd266
`define		   TEMP_DATA3						 	 		 20'd267
`define		   TEMP_DATA4						 	 		 20'd268
`define		   DEVICE_ALARM						 	 		 20'd269

`define        INTR0_TRIGGER_WIDTH_CNT                       20'd270
`define        INTR1_TRIGGER_WIDTH_CNT                       20'd271
`define        INTR0_TRIGGER_PERIOD_CNT                      20'd272
`define        INTR1_TRIGGER_PERIOD_CNT                      20'd273

`define        LIGHT_WIDTH_LIMIT_ENABLE                      20'd274


`define        CYCLE_STEP_CONTROL_ENABLE                     20'd275
`define        CYCLE_STEP_CONTROL_START                      20'd276
`define        CYCLE_STEP_CONTROL_STOP                       20'd277

`endif
