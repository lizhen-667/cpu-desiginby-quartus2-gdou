-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"
-- CREATED		"Sat Apr 18 20:54:55 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cpu_top IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RST :  IN  STD_LOGIC;
		eq3 :  IN  STD_LOGIC
	);
END cpu_top;

ARCHITECTURE bdf_type OF cpu_top IS 

COMPONENT sijiepai_cpu_demo
	PORT(RST : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 T4 : OUT STD_LOGIC;
		 T3 : OUT STD_LOGIC;
		 T2 : OUT STD_LOGIC;
		 T1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT register_cpu_demo
	PORT(CLK : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 WR_R : IN STD_LOGIC;
		 T4 : IN STD_LOGIC;
		 Rd : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Rs : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Write_Data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Read_Data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_mux1
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc_counter_cpu_demo
	PORT(CLK : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 T4 : IN STD_LOGIC;
		 Set_PC : IN STD_LOGIC;
		 Jump_Addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 PC_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT oc_cpu_demo
	PORT(T1 : IN STD_LOGIC;
		 T2 : IN STD_LOGIC;
		 T3 : IN STD_LOGIC;
		 T4 : IN STD_LOGIC;
		 op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 LD_IR : OUT STD_LOGIC;
		 LD_AD : OUT STD_LOGIC;
		 WR_R : OUT STD_LOGIC;
		 WR_M : OUT STD_LOGIC;
		 Set_Pc : OUT STD_LOGIC;
		 M : OUT STD_LOGIC;
		 S0 : OUT STD_LOGIC;
		 S1 : OUT STD_LOGIC;
		 S2 : OUT STD_LOGIC;
		 S3 : OUT STD_LOGIC;
		 CN : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ir_demo
	PORT(CLK : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 T2 : IN STD_LOGIC;
		 LD_IR : IN STD_LOGIC;
		 IM_output : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT im_cpu_demo
	PORT(CLK : IN STD_LOGIC;
		 Rden : IN STD_LOGIC;
		 PC_output : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 IR_input : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dm_cpu_demp
	PORT(WR_M : IN STD_LOGIC;
		 T4 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 register_write : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 register_read : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_total
	PORT(CN : IN STD_LOGIC;
		 M : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C1 : OUT STD_LOGIC;
		 C0 : OUT STD_LOGIC;
		 F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ad_cpu_demo
	PORT(CLK : IN STD_LOGIC;
		 LD_AD : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 Addr_In : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 AD_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	AD_Out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	CN :  STD_LOGIC;
SIGNAL	F :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	IR_input :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	LD_AD :  STD_LOGIC;
SIGNAL	LD_IR :  STD_LOGIC;
SIGNAL	M :  STD_LOGIC;
SIGNAL	op :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	PC_Out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	q :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Rd :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Read_Data :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	register_read :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Rs :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	S :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	set_pc :  STD_LOGIC;
SIGNAL	T1 :  STD_LOGIC;
SIGNAL	T2 :  STD_LOGIC;
SIGNAL	T3 :  STD_LOGIC;
SIGNAL	T4 :  STD_LOGIC;
SIGNAL	WR_M :  STD_LOGIC;
SIGNAL	WR_R :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN 
SYNTHESIZED_WIRE_1 <= '1';

op(3) <= GDFX_TEMP_SIGNAL_0(15);
op(2) <= GDFX_TEMP_SIGNAL_0(14);
op(1) <= GDFX_TEMP_SIGNAL_0(13);
op(0) <= GDFX_TEMP_SIGNAL_0(12);
Rd(1) <= GDFX_TEMP_SIGNAL_0(11);
Rd(0) <= GDFX_TEMP_SIGNAL_0(10);
Rs(1) <= GDFX_TEMP_SIGNAL_0(9);
Rs(0) <= GDFX_TEMP_SIGNAL_0(8);
q(7) <= GDFX_TEMP_SIGNAL_0(7);
q(6) <= GDFX_TEMP_SIGNAL_0(6);
q(5) <= GDFX_TEMP_SIGNAL_0(5);
q(4) <= GDFX_TEMP_SIGNAL_0(4);
q(3) <= GDFX_TEMP_SIGNAL_0(3);
q(2) <= GDFX_TEMP_SIGNAL_0(2);
q(1) <= GDFX_TEMP_SIGNAL_0(1);
q(0) <= GDFX_TEMP_SIGNAL_0(0);



b2v_inst : sijiepai_cpu_demo
PORT MAP(RST => RST,
		 CLK => CLK,
		 T4 => T4,
		 T3 => T3,
		 T2 => T2,
		 T1 => T1);


b2v_inst1 : register_cpu_demo
PORT MAP(CLK => CLK,
		 RST => RST,
		 WR_R => WR_R,
		 T4 => T4,
		 Rd => Rd,
		 Rs => Rs,
		 Write_Data => SYNTHESIZED_WIRE_0,
		 Read_Data => Read_Data);


b2v_inst10 : lpm_mux1
PORT MAP(sel => eq3,
		 data0x => F,
		 data1x => register_read,
		 result => SYNTHESIZED_WIRE_0);


b2v_inst2 : pc_counter_cpu_demo
PORT MAP(CLK => CLK,
		 RST => RST,
		 T4 => T4,
		 Set_PC => set_pc,
		 Jump_Addr => AD_Out,
		 PC_Out => PC_Out);


b2v_inst3 : oc_cpu_demo
PORT MAP(T1 => T1,
		 T2 => T2,
		 T3 => T3,
		 T4 => T4,
		 op => op,
		 LD_IR => LD_IR,
		 LD_AD => LD_AD,
		 WR_R => WR_R,
		 WR_M => WR_M,
		 Set_Pc => set_pc,
		 M => M,
		 S0 => S(0),
		 S1 => S(1),
		 S2 => S(2),
		 S3 => S(3),
		 CN => CN);


b2v_inst4 : ir_demo
PORT MAP(CLK => CLK,
		 RST => RST,
		 T2 => T2,
		 LD_IR => LD_IR,
		 IM_output => IR_input,
		 q => GDFX_TEMP_SIGNAL_0);


b2v_inst5 : im_cpu_demo
PORT MAP(CLK => CLK,
		 Rden => SYNTHESIZED_WIRE_1,
		 PC_output => PC_Out,
		 IR_input => IR_input);


b2v_inst6 : dm_cpu_demp
PORT MAP(WR_M => WR_M,
		 T4 => T4,
		 CLK => CLK,
		 ADDR => AD_Out,
		 register_write => F,
		 register_read => register_read);


b2v_inst7 : alu_total
PORT MAP(CN => CN,
		 M => M,
		 A => Read_Data,
		 B => Read_Data,
		 S => S,
		 F => F);


b2v_inst8 : ad_cpu_demo
PORT MAP(CLK => CLK,
		 LD_AD => LD_AD,
		 RST => RST,
		 Addr_In => q,
		 AD_Out => AD_Out);



op(3 DOWNTO 0) <= GDFX_TEMP_SIGNAL_0(15 DOWNTO 12);
q(7 DOWNTO 0) <= GDFX_TEMP_SIGNAL_0(7 DOWNTO 0);
Rd(1 DOWNTO 0) <= GDFX_TEMP_SIGNAL_0(11 DOWNTO 10);
Rs(1 DOWNTO 0) <= GDFX_TEMP_SIGNAL_0(9 DOWNTO 8);
END bdf_type;