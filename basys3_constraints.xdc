## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]
create_clock -period 10.000 -name sys_clock -waveform {0.000 5.000} -add [get_ports sys_clock]

## Switches
#set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]



# LEDs
set_property PACKAGE_PIN U16 [get_ports {led_16bits_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[0]}]
set_property PACKAGE_PIN E19 [get_ports {led_16bits_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[1]}]
set_property PACKAGE_PIN U19 [get_ports {led_16bits_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[2]}]
set_property PACKAGE_PIN V19 [get_ports {led_16bits_tri_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[3]}]
set_property PACKAGE_PIN W18 [get_ports {led_16bits_tri_o[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[4]}]
set_property PACKAGE_PIN U15 [get_ports {led_16bits_tri_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[5]}]
set_property PACKAGE_PIN U14 [get_ports {led_16bits_tri_o[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[6]}]
set_property PACKAGE_PIN V14 [get_ports {led_16bits_tri_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[7]}]
set_property PACKAGE_PIN V13 [get_ports {led_16bits_tri_o[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[8]}]
set_property PACKAGE_PIN V3 [get_ports {led_16bits_tri_o[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[9]}]
set_property PACKAGE_PIN W3 [get_ports {led_16bits_tri_o[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[10]}]
set_property PACKAGE_PIN U3 [get_ports {led_16bits_tri_o[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[11]}]
set_property PACKAGE_PIN P3 [get_ports {led_16bits_tri_o[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[12]}]
set_property PACKAGE_PIN N3 [get_ports {led_16bits_tri_o[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[13]}]
set_property PACKAGE_PIN P1 [get_ports {led_16bits_tri_o[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[14]}]
set_property PACKAGE_PIN L1 [get_ports {led_16bits_tri_o[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_16bits_tri_o[15]}]




#Buttons
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
#set_property PACKAGE_PIN T18 [get_ports btnU]
#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports btnL]
#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#set_property PACKAGE_PIN T17 [get_ports btnR]
#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]
#set_property IOSTANDARD LVCMOS33 [get_ports btnD]


##Pmod Header JA
##Sch name = JA1
#set_property PACKAGE_PIN J1 [get_ports {i2s_clk1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {i2s_clk1}]
##Sch name = JA2
#set_property PACKAGE_PIN L2 [get_ports {i2s_lrclk_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {i2s_lrclk_1}]
##Sch name = JA3
#set_property PACKAGE_PIN J2 [get_ports {mic_data_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {mic_data_1}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports {JA[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
#set_property PACKAGE_PIN H1 [get_ports {JA[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
##Sch name = JA8
#set_property PACKAGE_PIN K2 [get_ports {JA[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]
## SPI Clock (SCK)
#set_property PACKAGE_PIN J1 [get_ports {SPI_CLK}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {SPI_CLK}]

### SPI Chip Select (CS)
#set_property PACKAGE_PIN L2 [get_ports {SPI_CS}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {SPI_CS}]

### SPI Master Out, Slave In (MOSI → PICO)
#set_property PACKAGE_PIN J2 [get_ports {SPI_PICO}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {SPI_PICO}]

### SPI Master In, Slave Out (MISO → POCI)
#set_property PACKAGE_PIN G2 [get_ports {SPI_POCI}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {SPI_POCI}]


#Pmod Header JB
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {Dir_A}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Dir_A}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {Dir_B}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Dir_B}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {PWM_Out}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PWM_Out}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {A1}]
set_property IOSTANDARD LVCMOS33 [get_ports {A1}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {B1}]
set_property IOSTANDARD LVCMOS33 [get_ports {B1}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {A2}]
set_property IOSTANDARD LVCMOS33 [get_ports {A2}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {B2}]
set_property IOSTANDARD LVCMOS33 [get_ports {B2}]
##Sch name = JB10
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]



##Pmod Header JC
##Sch name = JC1
#set_property PACKAGE_PIN K17 [get_ports {JC[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[0]}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {JC[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[1]}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {JC[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
##Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {JC[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
##Sch name = JC7
#set_property PACKAGE_PIN L17 [get_ports {JC[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[4]}]
##Sch name = JC8
#set_property PACKAGE_PIN M19 [get_ports {JC[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[5]}]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
#set_property PACKAGE_PIN R18 [get_ports {JC[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[7]}]


##Pmod Header JXADC
##Sch name = XA1_P
#set_property PACKAGE_PIN J3 [get_ports {JXADC[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[0]}]
##Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {JXADC[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[1]}]
##Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {JXADC[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[2]}]
##Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {JXADC[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[3]}]
##Sch name = XA1_N
#set_property PACKAGE_PIN K3 [get_ports {JXADC[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[4]}]
##Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {JXADC[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[5]}]
##Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {JXADC[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[6]}]
##Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {JXADC[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[7]}]



##VGA Connector
#set_property PACKAGE_PIN G19 [get_ports {vgaRed[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
#set_property PACKAGE_PIN H19 [get_ports {vgaRed[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
#set_property PACKAGE_PIN J19 [get_ports {vgaRed[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
#set_property PACKAGE_PIN N19 [get_ports {vgaRed[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
#set_property PACKAGE_PIN N18 [get_ports {vgaBlue[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
#set_property PACKAGE_PIN L18 [get_ports {vgaBlue[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
#set_property PACKAGE_PIN K18 [get_ports {vgaBlue[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
#set_property PACKAGE_PIN J18 [get_ports {vgaBlue[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
#set_property PACKAGE_PIN J17 [get_ports {vgaGreen[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
#set_property PACKAGE_PIN H17 [get_ports {vgaGreen[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
#set_property PACKAGE_PIN G17 [get_ports {vgaGreen[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
#set_property PACKAGE_PIN D17 [get_ports {vgaGreen[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
#set_property PACKAGE_PIN P19 [get_ports Hsync]
#set_property IOSTANDARD LVCMOS33 [get_ports Hsync]
#set_property PACKAGE_PIN R19 [get_ports Vsync]
#set_property IOSTANDARD LVCMOS33 [get_ports Vsync]


#USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports usb_uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_uart_rxd]
set_property PACKAGE_PIN A18 [get_ports usb_uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_uart_txd]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]
#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]
#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]
#set_property PULLUP true [get_ports PS2Data]

#Quad SPI Flash
#Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
#STARTUPE2 primitive.
#set_property PACKAGE_PIN D18 [get_ports {qspi_flash_io0_io}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {qspi_flash_io0_io}]
#set_property PACKAGE_PIN D19 [get_ports {qspi_flash_io1_io}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {qspi_flash_io1_io}]
#set_property PACKAGE_PIN G18 [get_ports {qspi_flash_io2_io}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {qspi_flash_io2_io}]
#set_property PACKAGE_PIN F18 [get_ports {qspi_flash_io3_io}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {qspi_flash_io3_io}]
#set_property PACKAGE_PIN K19 [get_ports qspi_flash_ss_io]
#	set_property IOSTANDARD LVCMOS33 [get_ports qspi_flash_ss_io]


