library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_algo is
    port(
        clk1 : in STD_LOGIC;
        data_sel : in STD_LOGIC; --0 := from PCIe, 1:= from internal BlkRAM
        data_in_strobe : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(701 downto 0);
        data_out : out STD_LOGIC_VECTOR(12+12+8+3 downto 0)
    );
end test_algo;

architecture Behavioral of test_algo is


    component blk_mem_gen_0
    port(clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(701 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(701 DOWNTO 0));
    end component;
    
     component eleven2nine_lut
    port(clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    
     component eleven2two_lut
    port(clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
    end component;


    component ila_0
    port(clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe4 : IN STD_LOGIC_VECTOR(23 downto 0);
        probe5 : IN STD_LOGIC_VECTOR(23 downto 0);
        probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0));
    end component;
    
    component emtfptnn
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        input1_0_V_ap_vld : IN STD_LOGIC;
        input1_1_V_ap_vld : IN STD_LOGIC;
        input1_2_V_ap_vld : IN STD_LOGIC;
        input1_3_V_ap_vld : IN STD_LOGIC;
        input1_4_V_ap_vld : IN STD_LOGIC;
        input1_5_V_ap_vld : IN STD_LOGIC;
        input1_6_V_ap_vld : IN STD_LOGIC;
        input1_7_V_ap_vld : IN STD_LOGIC;
        input1_8_V_ap_vld : IN STD_LOGIC;
        input1_9_V_ap_vld : IN STD_LOGIC;
        input1_10_V_ap_vld : IN STD_LOGIC;
        input1_11_V_ap_vld : IN STD_LOGIC;
        input1_12_V_ap_vld : IN STD_LOGIC;
        input1_13_V_ap_vld : IN STD_LOGIC;
        input1_14_V_ap_vld : IN STD_LOGIC;
        input1_15_V_ap_vld : IN STD_LOGIC;
        input1_16_V_ap_vld : IN STD_LOGIC;
        input1_17_V_ap_vld : IN STD_LOGIC;
        input1_18_V_ap_vld : IN STD_LOGIC;
        input1_19_V_ap_vld : IN STD_LOGIC;
        input1_20_V_ap_vld : IN STD_LOGIC;
        input1_21_V_ap_vld : IN STD_LOGIC;
        input1_22_V_ap_vld : IN STD_LOGIC;
        input1_0_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_1_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_2_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_3_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_4_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_5_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_6_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_7_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_8_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_9_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_10_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_11_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_12_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_13_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_14_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_15_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_16_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_17_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_18_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_19_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_20_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_21_V : IN STD_LOGIC_VECTOR (17 downto 0);
        input1_22_V : IN STD_LOGIC_VECTOR (17 downto 0);
        layer16_out_0_V : OUT STD_LOGIC_VECTOR (11 downto 0);
        layer16_out_0_V_ap_vld : OUT STD_LOGIC;
        layer16_out_1_V : OUT STD_LOGIC_VECTOR (11 downto 0);
        layer16_out_1_V_ap_vld : OUT STD_LOGIC;
        const_size_in_1 : OUT STD_LOGIC_VECTOR (15 downto 0);
        const_size_in_1_ap_vld : OUT STD_LOGIC;
        const_size_out_1 : OUT STD_LOGIC_VECTOR (15 downto 0);
        const_size_out_1_ap_vld : OUT STD_LOGIC );
    end component;


    signal bram_to_hls : STD_LOGIC_VECTOR(701 downto 0);
    signal hls_to_ila : STD_LOGIC_VECTOR(12+12+8+3-1 downto 0);
    
    
    
    signal bram_address : unsigned(3 downto 0) := (others => '1');
    
    signal layer16_out_valid : STD_LOGIC;
    signal data_valid, dvDbg1, dvDbg1a,dvDbg1b, dvDbg1c, dvDbg2, dvDbg3 : STD_LOGIC:= '0';
    signal data, dataDbg1, dataDbg1a,dataDbg1b, dataDbg1c, dataDbg2  : STD_LOGIC_VECTOR(701 downto 0);
        
    signal doutDbg1, doutDbg2, doutDbg3:  STD_LOGIC_VECTOR(12+12+8+3-1 downto 0);
    signal dvOutDbg1, dvOutDbg2, dvOutDbg3 : STD_LOGIC:= '0';
    
    signal reset : std_logic := '1';
    signal reset_count : unsigned(3 downto 0) := (others => '0');
        
    signal start : std_logic := '0';
    signal data_source_read_enable : std_logic := '0';
    signal ready,algo_start : std_logic;       
    
    signal data_in_start : std_logic := '0';
    
    attribute mark_debug : string;
    attribute mark_debug of clk1 : signal is "true"; 
    --attribute mark_debug of hls_to_ila : signal is "true"; 
    attribute mark_debug of data_sel : signal is "true"; 
    attribute mark_debug of ready : signal is "true"; 
    
    attribute mark_debug of dvDbg3 : signal is "true";         
    attribute mark_debug of dvOutDbg3 : signal is "true"; 
    
    --========================================
    --top declarations...
    --========================================
    
    
        	signal vb_deltaPhi1 	 : std_logic;
	signal vb_deltaPhi2 	 : std_logic;
	signal vb_deltaPhi3 	 : std_logic;
	signal vb_deltaPhi4 	 : std_logic;
	signal vb_deltaPhi5 	 : std_logic;
	signal vb_deltaPhi6 	 : std_logic;
	signal vb_deltaTheta1 	 : std_logic;
	signal vb_deltaTheta2 	 : std_logic;
	signal vb_deltaTheta3 	 : std_logic;
	signal vb_deltaTheta4 	 : std_logic;
	signal vb_deltaTheta5 	 : std_logic;
	signal vb_deltaTheta6 	 : std_logic;
	signal vb_bend1 	 : std_logic;
	signal vb_bend2 	 : std_logic;
	signal vb_bend3 	 : std_logic;
	signal vb_bend4 	 : std_logic;
	signal vb_ME1_fr 	 : std_logic;
	signal vb_theta 	 : std_logic;
	signal vb_ME1_ring 	 : std_logic;
	signal vb_RPCbit1 	 : std_logic;
	signal vb_RPCbit2 	 : std_logic;
	signal vb_RPCbit3 	 : std_logic;
	signal vb_RPCbit4 	 : std_logic;
	signal vb_layer16_out_invpt 	 : std_logic;
	signal vb_layer16_out_d0 	 : std_logic;
	signal deltaPhi1 	 : std_logic_vector(17 downto 0);
	signal deltaPhi2 	 : std_logic_vector(17 downto 0);
	signal deltaPhi3 	 : std_logic_vector(17 downto 0);
	signal deltaPhi4 	 : std_logic_vector(17 downto 0);
	signal deltaPhi5 	 : std_logic_vector(17 downto 0);
	signal deltaPhi6 	 : std_logic_vector(17 downto 0);
	signal deltaTheta1 	 : std_logic_vector(17 downto 0);
	signal deltaTheta2 	 : std_logic_vector(17 downto 0);
	signal deltaTheta3 	 : std_logic_vector(17 downto 0);
	signal deltaTheta4 	 : std_logic_vector(17 downto 0);
	signal deltaTheta5 	 : std_logic_vector(17 downto 0);
	signal deltaTheta6 	 : std_logic_vector(17 downto 0);
	signal bend1 	 : std_logic_vector(17 downto 0);
	signal bend2 	 : std_logic_vector(17 downto 0);
	signal bend3 	 : std_logic_vector(17 downto 0);
	signal bend4 	 : std_logic_vector(17 downto 0);
	signal ME1_fr 	 : std_logic_vector(17 downto 0);
	signal theta 	 : std_logic_vector(17 downto 0);
	signal ME1_ring 	 : std_logic_vector(17 downto 0);
	signal RPCbit1 	 : std_logic_vector(17 downto 0);
	signal RPCbit2 	 : std_logic_vector(17 downto 0);
	signal RPCbit3 	 : std_logic_vector(17 downto 0);
	signal RPCbit4 	 : std_logic_vector(17 downto 0);
	signal layer16_out_invpt 	 : std_logic_vector(11 downto 0);
	signal layer16_out_d0 	 : std_logic_vector(11 downto 0);


	attribute mark_debug of deltaPhi1 	 : signal is "true";
	attribute mark_debug of deltaPhi2 	 : signal is "true";
	attribute mark_debug of deltaPhi3 	 : signal is "true";
	attribute mark_debug of deltaPhi4 	 : signal is "true";
	attribute mark_debug of deltaPhi5 	 : signal is "true";
	attribute mark_debug of deltaPhi6 	 : signal is "true";
	attribute mark_debug of deltaTheta1 	 : signal is "true";
	attribute mark_debug of deltaTheta2 	 : signal is "true";
	attribute mark_debug of deltaTheta3 	 : signal is "true";
	attribute mark_debug of deltaTheta4 	 : signal is "true";
	attribute mark_debug of deltaTheta5 	 : signal is "true";
	attribute mark_debug of deltaTheta6 	 : signal is "true";
	attribute mark_debug of bend1 	 : signal is "true";
	attribute mark_debug of bend2 	 : signal is "true";
	attribute mark_debug of bend3 	 : signal is "true";
	attribute mark_debug of bend4 	 : signal is "true";
	attribute mark_debug of ME1_fr 	 : signal is "true";
	attribute mark_debug of theta 	 : signal is "true";
	attribute mark_debug of ME1_ring 	 : signal is "true";
	attribute mark_debug of RPCbit1 	 : signal is "true";
	attribute mark_debug of RPCbit2 	 : signal is "true";
	attribute mark_debug of RPCbit3 	 : signal is "true";
	attribute mark_debug of RPCbit4 	 : signal is "true";
	attribute mark_debug of layer16_out_invpt 	 : signal is "true";
	attribute mark_debug of layer16_out_d0 	 : signal is "true";

    
    
    --========================================
    --end top declarations...
    --========================================
begin
      
          
    process(clk1)
    begin
        if(rising_edge(clk1)) then
            doutDbg1 <= hls_to_ila(12+12+8+3-1 downto 0);
            doutDbg2 <= doutDbg1;
            doutDbg3 <= doutDbg2;
            
            dvOutDbg1 <= layer16_out_valid;
            dvOutDbg2 <= dvOutDbg1;
            dvOutDbg3 <= dvOutDbg2;     
            
            
            data_out(12+12+8+3-1 downto 0) <= doutDbg3(12+12+8+3-1 downto 0);
            data_out(12+12+8+3) <= dvOutDbg2;  
        end if;        
    end process;
   
   
    data_source_gen : for i in 0 to 0 generate
        constant READ_LATENCY : natural := 2; --1 is minimum
        signal read_enable_shr : std_logic_vector(READ_LATENCY-1 downto 0) := (others => '0'); --represent latency when data is ready out of source
        
        signal count : unsigned (7 downto 0) := (others => '0');
        
    begin
        
        start <= read_enable_shr(READ_LATENCY-1); --source data is ready for algo   
                            
        --generate shift register if latency is long enough to require it
        readEnableShiftGen : if READ_LATENCY > 1 generate        
            process(clk1)
            begin
                if (rising_edge(clk1)) then
                
                    read_enable_shr(READ_LATENCY-1 downto 1) <= read_enable_shr(READ_LATENCY-2 downto 0);
                    --read_enable_shr(READ_LATENCY-1) <= read_enable_shr(READ_LATENCY-2) or read_enable_shr(READ_LATENCY-1); -- to hold high after start!
                    
                end if;
            end process;
        end generate readEnableShiftGen; 
        
        
        process(clk1)
        begin
          if (rising_edge(clk1)) then          
            
            read_enable_shr(0) <= data_source_read_enable;  
            data_source_read_enable <= '0';
            
            reset <= '0';
            if(reset_count < 10) then
                if(reset_count < 8) then 
                    reset <= '1';
                end if;
                reset_count <= reset_count + 1;
                
            elsif(start = '0' or ready = '1') then
            
                count <= count + 1;
                if( count < 10 ) then
                    data_source_read_enable <= '1'; --ready for next read from source
                    bram_address <= bram_address + 1;
                elsif (count = 100) then --restart data source process!
                    count <= (others => '0'); -- reset count
                    bram_address <= (others => '1'); --reset source address to "-1"
                end if;
                
            end if;
            
          end if;
        end process;
    end generate;
    
    
      data_in_start_gen : for i in 0 to 0 generate
          constant READ_LATENCY : natural := 4; --1 is minimum
          signal read_enable_shr : std_logic_vector(READ_LATENCY-1 downto 0) := (others => '0'); --represent latency when data is ready out of source
                    
      begin
          
          data_in_start <= read_enable_shr(READ_LATENCY-1); --source data is ready for algo   
                              
          --generate shift register if latency is long enough to require it
          readEnableShiftGen : if READ_LATENCY > 1 generate        
              process(clk1)
              begin
                  if (rising_edge(clk1)) then
                  
                      read_enable_shr(READ_LATENCY-1 downto 1) <= read_enable_shr(READ_LATENCY-2 downto 0);
                      --read_enable_shr(READ_LATENCY-1) <= read_enable_shr(READ_LATENCY-2) or read_enable_shr(READ_LATENCY-1); -- to hold high after start!
                      
                  end if;
              end process;
          end generate readEnableShiftGen; 
          
        process(clk1)
        begin
        if (rising_edge(clk1)) then          
        
            read_enable_shr(0) <= data_in_strobe;  
        end if;
        end process;
    end generate;
    
    
    algo_start <= start when data_sel = '1' else data_in_start; --data_in_strobe;
    data_valid <=  start when data_sel = '1' else data_in_start; --for now one valid bit, but valid bus could indicate partial input readiness
    data <= bram_to_hls(701 downto 0) when data_sel = '1' else data_in;


--    my_ila_label : ila_0
--        PORT MAP(
--                clk => clk1,
--                probe0(0) => layer16_out_valid,
--                probe1 => data(31 downto 0),
--                probe2 => data(63 downto 32),
--                probe3(0) => data_valid,
--                probe4 => hls_to_ila(23 downto 0),
--                probe5 => hls_to_ila(35 downto 18),
--                probe6(0) => data_sel,
--                probe7(0) => ready);
                   
    
    
    my_bram_label : blk_mem_gen_0
        PORT MAP(
                clka  => clk1, 
                ena   => '1',
                wea   => "0", 
                addra => std_logic_vector(bram_address),
                dina  => (others => '0'), 
                douta => bram_to_hls);

    my_hls_label : emtfptnn --entity work.emtfptnn
        PORT MAP(
                ap_clk => clk1,
                ap_rst => reset,  
                ap_start => algo_start,
                ap_done => open,
                ap_idle => open,
                ap_ready => ready,
                
              --========================================
                --entity port map...
                --========================================
                
                
                
                
                            input1_0_V      => deltaPhi1,
                            input1_1_V      => deltaPhi2,
                            input1_2_V      => deltaPhi3,
                            input1_3_V      => deltaPhi4,
                            input1_4_V      => deltaPhi5,
                            input1_5_V      => deltaPhi6,
                            input1_6_V      => deltaTheta1,
                            input1_7_V      => deltaTheta2,
                            input1_8_V      => deltaTheta3,
                            input1_9_V      => deltaTheta4,
                            input1_10_V      => deltaTheta5,
                            input1_11_V      => deltaTheta6,
                            input1_12_V      => bend1,
                            input1_13_V      => bend2,
                            input1_14_V      => bend3,
                            input1_15_V      => bend4,
                            input1_16_V      => ME1_fr,
                            input1_17_V      => theta,
                            input1_18_V      => ME1_ring,
                            input1_19_V      => RPCbit1,
                            input1_20_V      => RPCbit2,
                            input1_21_V      => RPCbit3,
                            input1_22_V      => RPCbit4,
                            input1_0_V_ap_vld      => vb_deltaPhi1,
                            input1_1_V_ap_vld      => vb_deltaPhi2,
                            input1_2_V_ap_vld      => vb_deltaPhi3,
                            input1_3_V_ap_vld      => vb_deltaPhi4,
                            input1_4_V_ap_vld      => vb_deltaPhi5,
                            input1_5_V_ap_vld      => vb_deltaPhi6,
                            input1_6_V_ap_vld      => vb_deltaTheta1,
                            input1_7_V_ap_vld      => vb_deltaTheta2,
                            input1_8_V_ap_vld      => vb_deltaTheta3,
                            input1_9_V_ap_vld      => vb_deltaTheta4,
                            input1_10_V_ap_vld      => vb_deltaTheta5,
                            input1_11_V_ap_vld      => vb_deltaTheta6,
                            input1_12_V_ap_vld      => vb_bend1,
                            input1_13_V_ap_vld      => vb_bend2,
                            input1_14_V_ap_vld      => vb_bend3,
                            input1_15_V_ap_vld      => vb_bend4,
                            input1_16_V_ap_vld      => vb_ME1_fr,
                            input1_17_V_ap_vld      => vb_theta,
                            input1_18_V_ap_vld      => vb_ME1_ring,
                            input1_19_V_ap_vld      => vb_RPCbit1,
                            input1_20_V_ap_vld      => vb_RPCbit2,
                            input1_21_V_ap_vld      => vb_RPCbit3,
                            input1_22_V_ap_vld      => vb_RPCbit4,
                            layer16_out_0_V      => layer16_out_invpt,
                            layer16_out_1_V      => layer16_out_d0,
                            layer16_out_0_V_ap_vld      => vb_layer16_out_invpt,
                            layer16_out_1_V_ap_vld      => vb_layer16_out_d0,
                
                
                --========================================
                --end entity port map...
                --========================================


                const_size_in_1 => open,
                const_size_in_1_ap_vld => open,
                const_size_out_1 => open,
                const_size_out_1_ap_vld => open);
    
                --========================================
                --data map...
                --========================================
                
                
                
                
        deltaPhi1 	 <= data(17 downto 0);
	deltaPhi2 	 <= data(35 downto 18);
	deltaPhi3 	 <= data(53 downto 36);
	deltaPhi4 	 <= data(71 downto 54);
	deltaPhi5 	 <= data(89 downto 72);
	deltaPhi6 	 <= data(107 downto 90);
	deltaTheta1 	 <= data(125 downto 108);
	deltaTheta2 	 <= data(143 downto 126);
	deltaTheta3 	 <= data(161 downto 144);
	deltaTheta4 	 <= data(179 downto 162);
	deltaTheta5 	 <= data(197 downto 180);
	deltaTheta6 	 <= data(215 downto 198);
	bend1 	 <= data(233 downto 216);
	bend2 	 <= data(251 downto 234);
	bend3 	 <= data(269 downto 252);
	bend4 	 <= data(287 downto 270);
	ME1_fr 	 <= data(305 downto 288);
	theta 	 <= data(323 downto 306);
	ME1_ring 	 <= data(341 downto 324);
	RPCbit1 	 <= data(359 downto 342);
	RPCbit2 	 <= data(377 downto 360);
	RPCbit3 	 <= data(395 downto 378);
	RPCbit4 	 <= data(413 downto 396);


                    vb_deltaPhi1      <= data_valid;
                    vb_deltaPhi2      <= data_valid;
                    vb_deltaPhi3      <= data_valid;
                    vb_deltaPhi4      <= data_valid;
                    vb_deltaPhi5      <= data_valid;
                    vb_deltaPhi6      <= data_valid;
                    vb_deltaTheta1      <= data_valid;
                    vb_deltaTheta2      <= data_valid;
                    vb_deltaTheta3      <= data_valid;
                    vb_deltaTheta4      <= data_valid;
                    vb_deltaTheta5      <= data_valid;
                    vb_deltaTheta6      <= data_valid;
                    vb_bend1      <= data_valid;
                    vb_bend2      <= data_valid;
                    vb_bend3      <= data_valid;
                    vb_bend4      <= data_valid;
                    vb_ME1_fr      <= data_valid;
                    vb_theta      <= data_valid;
                    vb_ME1_ring      <= data_valid;
                    vb_RPCbit1      <= data_valid;
                    vb_RPCbit2      <= data_valid;
                    vb_RPCbit3      <= data_valid;
                    vb_RPCbit4      <= data_valid;
                
                
                 
	hls_to_ila(11 downto 0) 	 <= layer16_out_invpt;
	hls_to_ila(23 downto 12) 	 <= layer16_out_d0;

                    layer16_out_valid      <= vb_layer16_out_invpt or vb_layer16_out_d0;
                
                
                --========================================
                --end data map...
                --========================================

    
    my_11_9_lut : eleven2nine_lut
        PORT MAP(
                clka  => clk1, 
                addra => std_logic_vector(hls_to_ila(10 downto 0)),
                douta => hls_to_ila(24+8-1 downto 24)
                );
    my_11_2_lut : eleven2two_lut
        PORT MAP(
                clka  => clk1, 
                addra => std_logic_vector(hls_to_ila(23 downto 13)),
                douta => hls_to_ila(24+8+3-1 downto 24+8)
                );
           
    
end Behavioral;
