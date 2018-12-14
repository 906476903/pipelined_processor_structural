library ieee;
use ieee.std_logic_1164.all;
library work;


entity datapath_pipelined is
	--generic (
	--	data_file : string
	--);
	port(
		clk : in std_logic;
		rst, forward: in std_logic
	);
end datapath_pipelined;

architecture structural of datapath_pipelined is


----------delaration of the component



component and_gate is
	port (
		x : in std_logic;
		y : in std_logic;
		z : out std_logic
		);
end component;

component or_gate is
	port (
		x : in std_logic;
		y : in std_logic;
		z : out std_logic
	);
end component;

component not_gate is
	port (
		x : in std_logic;
		z : out std_logic
		);
end component;


component mux_n is
  generic (
	n	: integer
  );
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end component;


component mux_32 is
	port (
		sel : in std_logic;
		src0 : in std_logic_vector(31 downto 0);
		src1 : in std_logic_vector(31 downto 0);
		z : out std_logic_vector(31 downto 0)
		);
end component;


signal target_id, pc_4_if, instruction_if, pc_4_if_id, instruction_if_id: std_logic_vector(31 downto 0);

component if_stage is
	port (
		stall : in std_logic;
		branch : in std_logic;
		target_mem_stage : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		pc_4 : out std_logic_vector(31 downto 0);
		instruction : out std_logic_vector(31 downto 0)
	);
end component;


component if_id_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	i_in : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	pc_4_out : out std_logic_vector(31 downto 0);
	i_out : out std_logic_vector(31 downto 0)
  );
end component;

signal instruction_id_ctr, instruction_id, pc_4_id, busa_id, busb_id : std_logic_vector(31 downto 0);
signal beq_id, bne_id, bgtz_id, extop_id, aluSrc_id, memWr_id, memToReg_id, regDst_id, regWr_id : std_logic;
signal aluop_id : std_logic_vector(3 downto 0);              --
signal branch_id : std_logic;
signal imm_16_id, imm_16_id_ex : std_logic_vector(15 downto 0);
signal rt_id, rd_id, rt_rd_mem_wb: std_logic_vector(4 downto 0);
signal shamt_id: std_logic_vector(4 downto 0);-----------------shamt id

component id_stage is
	port (
		beq : in std_logic;
		bne : in std_logic;
		bgtz : in std_logic;
		regwr : in std_logic;
		pc_4_in : in std_logic_vector(31 downto 0);
		instruction_in : in std_logic_vector(31 downto 0);
		rt_rd_wr_stage : in std_logic_vector(4 downto 0);
		din_wr_stage : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		target_out : out std_logic_vector(31 downto 0);
		branch_out : out std_logic;
		instruction_out : out std_logic_vector(31 downto 0);
		pc_4_out : out std_logic_vector(31 downto 0);
		imm_16_out : out std_logic_vector(15 downto 0);
		busa_out : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_out : out std_logic_vector(4 downto 0);
		rd_out : out std_logic_vector(4 downto 0);
		shamt : out std_logic_vector(4 downto 0)-----------------shamt
	);
end component;

component stall_unit is
	port (
	rt_id_ex, rd_id_ex, rs_if_id, rt_if_id : in std_logic_vector(4 downto 0);
	memtoreg_id_ex: in std_logic;
	branch_id : in std_logic;
	aluSrc_id: in std_logic;
	regWr_id,regwr_id_ex : in std_logic;
	stall : out std_logic
);
end component;

component id_ctr_stage is
	port (
		instruction_in : in std_logic_vector(31 downto 0);
		instruction_out : out std_logic_vector(31 downto 0);
		beq : out std_logic;
		bne : out std_logic;
		bgtz : out std_logic;
		extop_out : out std_logic;
		alusrc_out : out std_logic;
		aluop_out : out std_logic_vector(3 downto 0);   -------------
		regdst_out : out std_logic;
		memwr_out : out std_logic;
		memtoreg_out : out std_logic;
		regwr_out : out std_logic		
	);
end component;

signal id_ex_instruction, pc_4_id_ex, busb_id_ex, busa_id_ex : std_logic_vector(31 downto 0);
signal extop_id_ex, alusrc_id_ex, regdst_id_ex, memwr_id_ex, branch_id_ex, memtoreg_id_ex, regwr_id_ex, zer_ex : std_logic;
signal aluop_id_ex : std_logic_vector(3 downto 0);       --
signal rt_id_ex, rd_id_ex, rt_rd_out_ex, m1, m2 : std_logic_vector(4 downto 0);
signal shamt_id_ex : std_logic_vector(4 downto 0); ------------------------shamt id ex reg

component id_ex_ctr_reg is
  port (
	instruction_in : in std_logic_vector(31 downto 0);
	extop_in : in std_logic;
	alusrc_in : in std_logic;
	aluop_in : in std_logic_vector(3 downto 0);          --
	regdst_in : in std_logic;
	memwr_in : in std_logic;
	--branch_in : in std_logic;
	memtoreg_in : in std_logic;
	regwr_in : in std_logic;
	clk : in std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	extop_out : out std_logic;
	alusrc_out : out std_logic;
	aluop_out : out std_logic_vector(3 downto 0);          --
	regdst_out : out std_logic;
	memwr_out : out std_logic;
	--branch_out : out std_logic;
	memtoreg_out : out std_logic;
	regwr_out : out std_logic
  );
end component;
  
component id_ex_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	imm_16_in : in std_logic_vector(15 downto 0);
	busa_in : in std_logic_vector(31 downto 0);
	busb_in : in std_logic_vector(31 downto 0);
	rt_in : in std_logic_vector(4 downto 0);
	rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	shamt_in : in std_logic_vector(4 downto 0);------------------shamt
	pc_4_out : out std_logic_vector(31 downto 0);
	imm_16_out : out std_logic_vector(15 downto 0);
	busa_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_out : out std_logic_vector(4 downto 0);
	rd_out : out std_logic_vector(4 downto 0);
	shamt_out : out std_logic_vector(4 downto 0)-------------shamt
  );
end component;

signal fA, fB, fwA, fwB, zer : std_logic_vector(1 downto 0);
signal r1, busa_id_ex_forward, r2, busb_id_ex_forward, target_ex, busb_ex : std_logic_vector(31 downto 0);

component ex_stage is
	port (
		pc_4_in : in std_logic_vector(31 downto 0);
		imm_16_in : in std_logic_vector(15 downto 0);
		busa_in : in std_logic_vector(31 downto 0);
		busb_in : in std_logic_vector(31 downto 0);
		rt_in : in std_logic_vector(4 downto 0);
		rd_in : in std_logic_vector(4 downto 0);
		extop : in std_logic;
		regdst : in std_logic;
		alusrc : in std_logic;
		aluop : in std_logic_vector(3 downto 0);       --
		--target : out std_logic_vector(31 downto 0);
		zero : out std_logic;
		aluout : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_rd_out : out std_logic_vector(4 downto 0);
		shamt_in : in std_logic_vector(4 downto 0)-----------shamt
		
	);
end component;

signal target_ex_mem, busb_ex_mem, aluout_ex_mem, ex_mem_instruction, dout_mem, aluout_mem : std_logic_vector(31 downto 0);
signal zer_ex_mem, regdst_ex, alusrc_ex : std_logic;
signal memwr_ex_mem, branch_ex_mem, memtoreg_ex_mem, regwr_ex_mem, branch_mem : std_logic;
signal rt_rd_out_ex_mem, rt_rd_mem : std_logic_vector(4 downto 0);
--signal aluop_ex : std_logic_vector(3 downto 0);        --
signal stall : std_logic;

component ex_mem_reg is
  port (
	--target_in : in std_logic_vector(31 downto 0);
	zero_in : in std_logic;
	aluout_in : in std_logic_vector(31 downto 0);
	busb_in : in std_logic_vector(31 downto 0);
	rt_rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	--target_out : out std_logic_vector(31 downto 0);
	zero_out : out std_logic;
	aluout_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_rd_out : out std_logic_vector(4 downto 0)
  );
end component;
  
component ex_mem_ctr_reg is
  port (
	instruction_in : in std_logic_vector(31 downto 0);
	memwr_in : in std_logic;
	--branch_in : in std_logic;
	memtoreg_in : in std_logic;
	regwr_in : in std_logic;
	clk : in std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	memwr_out : out std_logic;
	--branch_out : out std_logic;
	memtoreg_out : out std_logic;
	regwr_out : out std_logic
  );
end component;
  
component mem_stage is
	port (
		--branch : in std_logic;
		zero : in std_logic;
		aluout_in : in std_logic_vector(31 downto 0);
		busb_in : in std_logic_vector(31 downto 0);
		rt_rd_in : in std_logic_vector(4 downto 0);
		memwr : in std_logic;
		--branch_out : out std_logic;
		dout : out std_logic_vector(31 downto 0);
		aluout_out : out std_logic_vector(31 downto 0);
		rt_rd_out : out std_logic_vector(4 downto 0)
	);
end component;

signal mem_wb_instruction, dout_mem_wb, aluout_mem_wb, dout_wb, aluout_ex : std_logic_vector(31 downto 0);
signal memtoreg_mem_wb, regwr_mem_wb, extop_ex : std_logic;

component mem_wr_ctr_reg is
  port (
	instruction_in : in std_logic_vector(31 downto 0);
	memtoreg_in : in std_logic;
	regwr_in : in std_logic;
	clk : in std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	memtoreg_out : out std_logic;
	regwr_out : out std_logic
  );
end component;
  
component mem_wr_reg is
  port (
	dout_in : in std_logic_vector(31 downto 0);
	aluout_in : in std_logic_vector(31 downto 0);
	rt_rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	dout_out : out std_logic_vector(31 downto 0);
	aluout_out : out std_logic_vector(31 downto 0);
	rt_rd_out : out std_logic_vector(4 downto 0)
  );
end component;
  
component wr_stage is
	port (
		dout_in : in std_logic_vector(31 downto 0);
		aluout_in : in std_logic_vector(31 downto 0);
		memtoreg : in std_logic;
		din_out : out std_logic_vector(31 downto 0)
	);
end component;
	
component forwarding_unit is
	port (
		id_ex_rs, id_ex_rt: in std_logic_vector(4 downto 0);
		ex_mem_we, mem_wb_we: in std_logic;
		ex_mem_rd, mem_wb_rd: in std_logic_vector(4 downto 0);
		forwardA, forwardB: out std_logic_vector(1 downto 0)
		);
end component;



-------------intermid wires

signal not_clk : std_logic;



---------------data path

begin

not_clk <= not clk;
----------------sll_select


----------------IF

if_stage_map: if_stage port map (
		stall => stall,
		branch => branch_id,
		target_mem_stage => target_id,
		reset => rst,
		clk => clk,
		pc_4 => pc_4_if,
		instruction => instruction_if
	);

if_id_reg0: if_id_reg port map (
	pc_4_in => pc_4_if,
	i_in => instruction_if,
	clk => not_clk,
	pc_4_out => pc_4_if_id,
	i_out => instruction_if_id
  );
		

-----------------ID
id_ctr_stage_map: id_ctr_stage port map (
		instruction_in => instruction_if_id,
		instruction_out => instruction_id_ctr,
		beq => beq_id,
		bne => bne_id,
		bgtz => bgtz_id,
		extop_out => extop_id,
		alusrc_out => aluSrc_id,
		aluop_out => aluop_id,
		regdst_out => regDst_id,
		memwr_out => memWr_id,
		memtoreg_out => memToReg_id,
		regwr_out => regWr_id
	);

	

	

	
id_stage0: id_stage port map(
		beq => beq_id,
		bne => bne_id,
		bgtz => bgtz_id,
		regwr => regwr_id_ex,
		pc_4_in => pc_4_if_id,
		instruction_in => instruction_if_id,
		rt_rd_wr_stage => rt_rd_mem_wb,
		din_wr_stage => dout_wb,
		reset => rst,
		clk => clk,
		target_out => target_id,
		branch_out => branch_id,
		instruction_out => instruction_id,
		pc_4_out => pc_4_id,
		imm_16_out => imm_16_id,
		busa_out => busa_id,
		busb_out => busb_id,
		rt_out => rt_id,
		rd_out => rd_id,
		shamt => shamt_id ----------------shamt id
	);

id_ex_ctr_reg_map: id_ex_ctr_reg port map (
	instruction_in => instruction_id,
	extop_in => extop_id,
	alusrc_in => aluSrc_id,
	aluop_in => aluop_id,
	regdst_in => regDst_id,
	memwr_in => memWr_id,
	--branch_in => branch_id,
	memtoreg_in => memToReg_id,
	regwr_in => regWr_id,
	clk => not_clk,
	instruction_out => id_ex_instruction,
	extop_out => extop_id_ex,
	alusrc_out => alusrc_id_ex,
	aluop_out => aluop_id_ex,
	regdst_out => regdst_id_ex,
	memwr_out => memwr_id_ex,
	--branch_out => branch_id_ex,
	memtoreg_out => memtoreg_id_ex,
	regwr_out => regwr_id_ex
	);

id_ex_reg_map: id_ex_reg port map (
	pc_4_in => pc_4_id,
	imm_16_in => imm_16_id,
	busa_in => busa_id,
	busb_in => busb_id,
	rt_in => rt_id,
	rd_in => rd_id,
	clk => not_clk,
	shamt_in => shamt_id, ------------shamt id
	pc_4_out => pc_4_id_ex,
	imm_16_out => imm_16_id_ex,
	busa_out => busa_id_ex,
	busb_out => busb_id_ex,
	rt_out => rt_id_ex,
	rd_out => rd_id_ex,
	shamt_out => shamt_id_ex -------------shamt id ex reg
  );
 

stall_unit_map: stall_unit port map (
	rt_id_ex => rt_id_ex,
	rd_id_ex => rd_id_ex,
	rs_if_id => instruction_if_id(25 downto 21),
	rt_if_id => instruction_if_id(20 downto 16),
	memtoreg_id_ex => memtoreg_id_ex,
	branch_id => branch_id,
	aluSrc_id => aluSrc_id,
	regWr_id => regWr_id,
	regwr_id_ex => regwr_id_ex,
	stall => stall
	); 

-----------------EXE

mux_mem: mux_n generic map(n => 5) port map (
	ex_mem_instruction(29), ex_mem_instruction(15 downto 11), ex_mem_instruction(20 downto 16), m1);
mux_wb: mux_n generic map(n => 5) port map (
	mem_wb_instruction(29), mem_wb_instruction(15 downto 11), mem_wb_instruction(20 downto 16), m2);

forwarding_map: forwarding_unit port map (
	id_ex_rs => id_ex_instruction(25 downto 21),
	id_ex_rt => id_ex_instruction(20 downto 16),
	ex_mem_we => regwr_ex_mem,
	mem_wb_we => regwr_mem_wb,
	ex_mem_rd => rt_rd_out_ex_mem,
	mem_wb_rd => rt_rd_mem_wb,
	forwardA => fA,
	forwardB => fB
	);
	
mux_10: mux_n generic map (n => 2) port map (forward, "00", fA, fwA);
mux_11: mux_n generic map (n => 2) port map (forward, "00", fB, fwB);

mux_12: mux_n generic map (n => 32) port map (fwA(0), busa_id_ex, aluout_mem_wb, r1);
mux_13: mux_n generic map (n => 32) port map (fwA(1), r1, aluout_ex_mem, busa_id_ex_forward);
mux_14: mux_n generic map (n => 32) port map (fwB(0), busb_id_ex, aluout_mem_wb, r2);
mux_15: mux_n generic map (n => 32) port map (fwB(1), r2, aluout_ex_mem, busb_id_ex_forward);

ex_stage_map: ex_stage port map(
		pc_4_in => pc_4_id_ex,
		imm_16_in => imm_16_id_ex,
		busa_in => busa_id_ex_forward,
		busb_in => busb_id_ex_forward,
		rt_in => rt_id_ex,
		rd_in => rd_id_ex,
		extop => extop_id_ex,
		regdst => regdst_id_ex,
		alusrc => alusrc_id_ex,
		--aluop => aluop_ex,
		aluop => aluop_id_ex, --
		--target => target_ex,
		zero => zer_ex,
		aluout => aluout_ex,
		busb_out => busb_ex,
		rt_rd_out => rt_rd_out_ex,
		shamt_in => shamt_id_ex
		
	);
		
ex_mem_reg_map: ex_mem_reg port map(
	--target_in => target_ex,
	zero_in => zer_ex,
	aluout_in => aluout_ex,
	busb_in => busb_ex,
	rt_rd_in => rt_rd_out_ex,
	clk => not_clk,
	--target_out => target_ex_mem,
	zero_out => zer_ex_mem,
	aluout_out => aluout_ex_mem,
	busb_out => busb_ex_mem,
	rt_rd_out => rt_rd_out_ex_mem
  );

ex_mem_ctr_reg_map: ex_mem_ctr_reg port map(
	instruction_in => id_ex_instruction,
	memwr_in => memwr_id_ex,
	--branch_in => branch_id_ex,
	memtoreg_in => memtoreg_id_ex,
	regwr_in => regwr_id_ex,
	clk => not_clk,
	instruction_out => ex_mem_instruction,
	memwr_out => memwr_ex_mem,
	--branch_out => branch_ex_mem,
	memtoreg_out => memtoreg_ex_mem,
	regwr_out => regwr_ex_mem
  );
-----------------Mem


mem_stage_map: mem_stage port map(
		--branch => branch_ex_mem,
		zero => zer_ex_mem,
		aluout_in => aluout_ex_mem,
		busb_in => busb_ex_mem,
		rt_rd_in => rt_rd_out_ex_mem,
		memwr => memwr_ex_mem,
		--branch_out => branch_mem,
		dout => dout_mem,
		aluout_out => aluout_mem,
		rt_rd_out => rt_rd_mem
	);
	
	
mem_wr_ctr_reg_map: mem_wr_ctr_reg port map (
	instruction_in => ex_mem_instruction,
	memtoreg_in => memtoreg_ex_mem,
	regwr_in => regwr_ex_mem,
	clk => not_clk,
	instruction_out => mem_wb_instruction,
	memtoreg_out => memtoreg_mem_wb,
	regwr_out => regwr_mem_wb
	);
	
mem_wr_reg_map: mem_wr_reg port map (
	dout_in => dout_mem,
	aluout_in => aluout_mem,
	rt_rd_in => rt_rd_mem,
	clk => not_clk,
	dout_out => dout_mem_wb,
	aluout_out => aluout_mem_wb,
	rt_rd_out => rt_rd_mem_wb
  );



-----------------WB
wr_stage_map: wr_stage port map (
		dout_in => dout_mem_wb,
		aluout_in => aluout_mem_wb,
		memtoreg => memtoreg_mem_wb,
		din_out => dout_wb
	);
		
end architecture structural;

