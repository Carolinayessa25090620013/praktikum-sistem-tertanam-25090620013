library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity testbench tidak memiliki port
entity tb_mux4to1 is
end tb_mux4to1;

architecture sim of tb_mux4to1 is
    -- Sinyal internal untuk dihubungkan ke DUT (Device Under Test)
    signal sel_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal in0_tb : STD_LOGIC_VECTOR(3 downto 0) := "0001"; -- Desimal: 1
    signal in1_tb : STD_LOGIC_VECTOR(3 downto 0) := "0010"; -- Desimal: 2
    signal in2_tb : STD_LOGIC_VECTOR(3 downto 0) := "0100"; -- Desimal: 4
    signal in3_tb : STD_LOGIC_VECTOR(3 downto 0) := "1000"; -- Desimal: 8
    signal y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instansiasi DUT
    DUT: entity work.mux4to1
        port map (
            sel => sel_tb,
            in0 => in0_tb,
            in1 => in1_tb,
            in2 => in2_tb,
            in3 => in3_tb,
            y   => y_tb
        );

    -- Process pembangkit stimulus
    stim_proc: process
    begin
        -- Skenario 1: sel = "00" -> y harus memilih in0 (0001)
        sel_tb <= "00";
        wait for 20 ns;
        assert (y_tb = in0_tb)
            report "Gagal pada Skenario sel=00: Nilai y tidak sesuai in0" severity error;

        -- Skenario 2: sel = "01" -> y harus memilih in1 (0010)
        sel_tb <= "01";
        wait for 20 ns;
        assert (y_tb = in1_tb)
            report "Gagal pada Skenario sel=01: Nilai y tidak sesuai in1" severity error;

        -- Skenario 3: sel = "10" -> y harus memilih in2 (0100)
        sel_tb <= "10";
        wait for 20 ns;
        assert (y_tb = in2_tb)
            report "Gagal pada Skenario sel=10: Nilai y tidak sesuai in2" severity error;

        -- Skenario 4: sel = "11" -> y harus memilih in3 (1000)
        sel_tb <= "11";
        wait for 20 ns;
        assert (y_tb = in3_tb)
            report "Gagal pada Skenario sel=11: Nilai y tidak sesuai in3" severity error;

        report "--- SIMULASI SELESAI: SELURUH SKENARIO BERHASIL ---";
        wait; -- Menghentikan simulasi
    end process;

end sim;