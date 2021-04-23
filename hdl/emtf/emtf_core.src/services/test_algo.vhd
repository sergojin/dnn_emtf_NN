library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_algo is
    port(
        clk1 : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(2047 downto 0);
        data_out : out STD_LOGIC_VECTOR(2047 downto 0)
    );
end test_algo;

architecture Behavioral of test_algo is

    signal bram_to_hls : STD_LOGIC_VECTOR(1223 downto 0);
    signal hls_to_ila : STD_LOGIC_VECTOR(31 downto 0);
    signal bram_address : STD_LOGIC_VECTOR(2 downto 0) := B"000";
    signal COUNT : integer range 0 to 200 := 0;
    signal res_valid : STD_LOGIC_VECTOR(0 downto 0);
    signal data_valid : STD_LOGIC_VECTOR(0 downto 0);        
    
--    attribute mark_debug : string;
--    attribute mark_debug of bram_to_hls : signal is "true"; 

    component myproject
       port (ap_clk : in STD_LOGIC;
             ap_rst : in STD_LOGIC;
             ap_start : in STD_LOGIC;
             ap_done : out STD_LOGIC;
             ap_idle : out STD_LOGIC;
             ap_ready : out STD_LOGIC;
             data_V : in STD_LOGIC_VECTOR (1223 downto 0);
             data_V_ap_vld : in STD_LOGIC;
             res_V : out STD_LOGIC_VECTOR (17 downto 0);
             res_V_ap_vld : out STD_LOGIC;
             const_size_in : out STD_LOGIC_VECTOR (15 downto 0);
             const_size_in_ap_vld : out STD_LOGIC;
             const_size_out : out STD_LOGIC_VECTOR (15 downto 0);
             const_size_out_ap_vld : out STD_LOGIC );
    end component;

    component ila_0
    port(clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0));
    end component;

begin

    process(clk1)
    begin
      if (rising_edge(clk1)) then
          if ( COUNT  <  8 ) then
            data_valid <= "1";           
             COUNT <= COUNT + 1;
          elsif (COUNT = 100) then
             COUNT <= 0;
          else
            data_valid <= "0";           
             COUNT <= COUNT + 1;
           end if;
          data_out(31 downto 0) <= hls_to_ila;
          data_out(2047 downto 32) <= (others => '0');  
       end if;
    end process;

         
    my_hls_label : myproject
        PORT MAP(
                ap_clk => clk1,
                ap_rst => '0',  
                ap_start => '1',
                ap_done => open,
                ap_idle => open,
                ap_ready => open,
                data_V => data_in(1223 downto 0),
                data_V_ap_vld => '1',-- data_valid(0),
                res_V => hls_to_ila (17 downto 0),
                --res_V => data_out(17 downto 0),
                res_V_ap_vld => res_valid(0),
                const_size_in => open,
                const_size_in_ap_vld => open,
                const_size_out => open,
                const_size_out_ap_vld => open);
    
    my_ila_label : ila_0
        PORT MAP(
                clk => clk1,
                probe0 => res_valid,
                probe1 => data_in(31 downto 0),
                probe2 => data_in(63 downto 32),
                probe3 => data_valid,
                probe4 => hls_to_ila);
                    
    
end Behavioral;
