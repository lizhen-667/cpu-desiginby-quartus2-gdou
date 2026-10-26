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
-- CREATED		"Sun Apr 19 16:33:08 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu_total IS 
	PORT
	(
		M :  IN  STD_LOGIC;
		CN :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		S :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		C1 :  OUT  STD_LOGIC;
		C0 :  OUT  STD_LOGIC;
		F :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END alu_total;

ARCHITECTURE bdf_type OF alu_total IS 

COMPONENT alu_4_bit
	PORT(CN : IN STD_LOGIC;
		 M : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 CN4 : OUT STD_LOGIC;
		 F : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	F_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 



C0 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1;


b2v_inst1 : alu_4_bit
PORT MAP(CN => SYNTHESIZED_WIRE_2,
		 M => M,
		 A => A(7 DOWNTO 4),
		 B => B(7 DOWNTO 4),
		 S => S,
		 CN4 => SYNTHESIZED_WIRE_3,
		 F => F_ALTERA_SYNTHESIZED(7 DOWNTO 4));


b2v_inst2 : alu_4_bit
PORT MAP(CN => CN,
		 M => M,
		 A => A(3 DOWNTO 0),
		 B => B(3 DOWNTO 0),
		 S => S,
		 CN4 => SYNTHESIZED_WIRE_2,
		 F => F_ALTERA_SYNTHESIZED(3 DOWNTO 0));


SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_3);



SYNTHESIZED_WIRE_1 <= NOT(M);



C1 <= NOT(F_ALTERA_SYNTHESIZED(0) OR F_ALTERA_SYNTHESIZED(2) OR F_ALTERA_SYNTHESIZED(1) OR F_ALTERA_SYNTHESIZED(3) OR F_ALTERA_SYNTHESIZED(5) OR F_ALTERA_SYNTHESIZED(4) OR F_ALTERA_SYNTHESIZED(6) OR F_ALTERA_SYNTHESIZED(7));

F <= F_ALTERA_SYNTHESIZED;

END bdf_type;