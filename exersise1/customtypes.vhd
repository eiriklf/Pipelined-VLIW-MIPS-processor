--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package customtypes is

  
  type proOP is
    record
        jump     :   STD_LOGIC;
        memwrite     :   STD_LOGIC;
        regwrite     :   STD_LOGIC;
        memtoreg     :   STD_LOGIC;
        alusrc     :   STD_LOGIC;
		  branch     :   STD_LOGIC;
		  regdest     :   STD_LOGIC;
								
    end record;



end customtypes;

