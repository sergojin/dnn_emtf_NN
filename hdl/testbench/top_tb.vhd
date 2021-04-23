library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is

 

  -- Constants
  constant clk1_period : time := 5 ns;
  constant clk2_period : time := 10 ns;
  
  -- Stimulus signals
  signal clk1 : STD_LOGIC := '0';
  signal clk2 : STD_LOGIC := '0';
  signal data_in : STD_LOGIC_VECTOR(1223 downto 0);
  signal data_reader_reset : STD_LOGIC := '0';
  
  -- Dummy signals
  signal dummy_data : STD_LOGIC_VECTOR(2 downto 0);
  signal dummy_data_valid : STD_LOGIC; 
  signal dummy_EOF : STD_LOGIC;
  
  
    signal data_strobe_in : STD_LOGIC := '0';
  
begin

  -- Instantiate unit under test 
  uut : entity work.test_algo 
  port map (
    clk1 => clk1,
    data_sel => '0',
    data_in_strobe => data_strobe_in,
    data_in => (others => '0'),
    data_out => open
    );
          
  clk1 <= not clk1 after clk1_period;
  clk2 <= not clk2 after clk2_period;
  data_reader_reset <= '1', '0' after 5 ns;
  
    data_strobe_in <= not data_strobe_in after 1000ns;
  
  
  -----------------------------------------------
  -- Processes, entities, generates, etc go here
  -----------------------------------------------
  
  -- Data in from text file
  sim_data_reader: entity work.FILE_READ
    generic map(
      --stim_file => "/home/kreis/git_test/GlobalCorrelator/hdl/testbench/data1.dat",
      stim_file => "data1.dat",
      BIT_WIDTH => 1224
      )
    port map(
      CLK  => clk1,
      RST => data_reader_reset,
      Y(1223 downto 0)  => data_in(1223 downto 0),
      EOG => dummy_EOF
      );
  -- This looks easier: http://digitalmonstrosity.com/quick-link-reading-and-writing-text-files/

  
end Behavioral;
