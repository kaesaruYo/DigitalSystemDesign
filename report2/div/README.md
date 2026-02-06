除算回路
  
• 𝑧 = 𝑑 × 𝑞 + 𝑟<br>
𝑧: 被除数, 𝑑: 除数, 𝑞:商, 𝑟:余
  
• 仕様<br>
– 入力：被除数z(8bit, unsigned)，除数d(8bit,
unsigned)，clk(1bit), rst(1bit), start(1bit)
なお，d>0とする．(d=0の時の動作はドントケア）<br>
– 出力：商 q (8bit unsigned), 余 r (8bit unsigned),
done (1bit)
           
• 動作概要<br>
– 加えもどし法）により除算を行う
