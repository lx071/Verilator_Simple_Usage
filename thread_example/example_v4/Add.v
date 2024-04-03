module Add( 
    input [99:0] a, b,
    input cin,
	output cout,
    output [99:0] sum );
    
	wire [99:0] carry;
	wire [99:0] sum1;
	
	assign sum = sum1;
	assign cout = carry[99];
	
    full_adder inst0(.a(a[0]), .b(b[0]), .cin(cin), .carry(carry[0]), .sum1(sum1[0]));
    full_adder inst1(.a(a[1]), .b(b[1]), .cin(carry[0]), .carry(carry[1]), .sum1(sum1[1]));
    full_adder inst2(.a(a[2]), .b(b[2]), .cin(carry[1]), .carry(carry[2]), .sum1(sum1[2]));
    full_adder inst3(.a(a[3]), .b(b[3]), .cin(carry[2]), .carry(carry[3]), .sum1(sum1[3]));
    full_adder inst4(.a(a[4]), .b(b[4]), .cin(carry[3]), .carry(carry[4]), .sum1(sum1[4]));
    full_adder inst5(.a(a[5]), .b(b[5]), .cin(carry[4]), .carry(carry[5]), .sum1(sum1[5]));
    full_adder inst6(.a(a[6]), .b(b[6]), .cin(carry[5]), .carry(carry[6]), .sum1(sum1[6]));
    full_adder inst7(.a(a[7]), .b(b[7]), .cin(carry[6]), .carry(carry[7]), .sum1(sum1[7]));
    full_adder inst8(.a(a[8]), .b(b[8]), .cin(carry[7]), .carry(carry[8]), .sum1(sum1[8]));
    full_adder inst9(.a(a[9]), .b(b[9]), .cin(carry[8]), .carry(carry[9]), .sum1(sum1[9]));
    full_adder inst10(.a(a[10]), .b(b[10]), .cin(carry[9]), .carry(carry[10]), .sum1(sum1[10]));
    full_adder inst11(.a(a[11]), .b(b[11]), .cin(carry[10]), .carry(carry[11]), .sum1(sum1[11]));
    full_adder inst12(.a(a[12]), .b(b[12]), .cin(carry[11]), .carry(carry[12]), .sum1(sum1[12]));
    full_adder inst13(.a(a[13]), .b(b[13]), .cin(carry[12]), .carry(carry[13]), .sum1(sum1[13]));
    full_adder inst14(.a(a[14]), .b(b[14]), .cin(carry[13]), .carry(carry[14]), .sum1(sum1[14]));
    full_adder inst15(.a(a[15]), .b(b[15]), .cin(carry[14]), .carry(carry[15]), .sum1(sum1[15]));
    full_adder inst16(.a(a[16]), .b(b[16]), .cin(carry[15]), .carry(carry[16]), .sum1(sum1[16]));
    full_adder inst17(.a(a[17]), .b(b[17]), .cin(carry[16]), .carry(carry[17]), .sum1(sum1[17]));
    full_adder inst18(.a(a[18]), .b(b[18]), .cin(carry[17]), .carry(carry[18]), .sum1(sum1[18]));
    full_adder inst19(.a(a[19]), .b(b[19]), .cin(carry[18]), .carry(carry[19]), .sum1(sum1[19]));
    full_adder inst20(.a(a[20]), .b(b[20]), .cin(carry[19]), .carry(carry[20]), .sum1(sum1[20]));
    full_adder inst21(.a(a[21]), .b(b[21]), .cin(carry[20]), .carry(carry[21]), .sum1(sum1[21]));
    full_adder inst22(.a(a[22]), .b(b[22]), .cin(carry[21]), .carry(carry[22]), .sum1(sum1[22]));
    full_adder inst23(.a(a[23]), .b(b[23]), .cin(carry[22]), .carry(carry[23]), .sum1(sum1[23]));
    full_adder inst24(.a(a[24]), .b(b[24]), .cin(carry[23]), .carry(carry[24]), .sum1(sum1[24]));
    full_adder inst25(.a(a[25]), .b(b[25]), .cin(carry[24]), .carry(carry[25]), .sum1(sum1[25]));
    full_adder inst26(.a(a[26]), .b(b[26]), .cin(carry[25]), .carry(carry[26]), .sum1(sum1[26]));
    full_adder inst27(.a(a[27]), .b(b[27]), .cin(carry[26]), .carry(carry[27]), .sum1(sum1[27]));
    full_adder inst28(.a(a[28]), .b(b[28]), .cin(carry[27]), .carry(carry[28]), .sum1(sum1[28]));
    full_adder inst29(.a(a[29]), .b(b[29]), .cin(carry[28]), .carry(carry[29]), .sum1(sum1[29]));
    full_adder inst30(.a(a[30]), .b(b[30]), .cin(carry[29]), .carry(carry[30]), .sum1(sum1[30]));
    full_adder inst31(.a(a[31]), .b(b[31]), .cin(carry[30]), .carry(carry[31]), .sum1(sum1[31]));
    full_adder inst32(.a(a[32]), .b(b[32]), .cin(carry[31]), .carry(carry[32]), .sum1(sum1[32]));
    full_adder inst33(.a(a[33]), .b(b[33]), .cin(carry[32]), .carry(carry[33]), .sum1(sum1[33]));
    full_adder inst34(.a(a[34]), .b(b[34]), .cin(carry[33]), .carry(carry[34]), .sum1(sum1[34]));
    full_adder inst35(.a(a[35]), .b(b[35]), .cin(carry[34]), .carry(carry[35]), .sum1(sum1[35]));
    full_adder inst36(.a(a[36]), .b(b[36]), .cin(carry[35]), .carry(carry[36]), .sum1(sum1[36]));
    full_adder inst37(.a(a[37]), .b(b[37]), .cin(carry[36]), .carry(carry[37]), .sum1(sum1[37]));
    full_adder inst38(.a(a[38]), .b(b[38]), .cin(carry[37]), .carry(carry[38]), .sum1(sum1[38]));
    full_adder inst39(.a(a[39]), .b(b[39]), .cin(carry[38]), .carry(carry[39]), .sum1(sum1[39]));
    full_adder inst40(.a(a[40]), .b(b[40]), .cin(carry[39]), .carry(carry[40]), .sum1(sum1[40]));
    full_adder inst41(.a(a[41]), .b(b[41]), .cin(carry[40]), .carry(carry[41]), .sum1(sum1[41]));
    full_adder inst42(.a(a[42]), .b(b[42]), .cin(carry[41]), .carry(carry[42]), .sum1(sum1[42]));
    full_adder inst43(.a(a[43]), .b(b[43]), .cin(carry[42]), .carry(carry[43]), .sum1(sum1[43]));
    full_adder inst44(.a(a[44]), .b(b[44]), .cin(carry[43]), .carry(carry[44]), .sum1(sum1[44]));
    full_adder inst45(.a(a[45]), .b(b[45]), .cin(carry[44]), .carry(carry[45]), .sum1(sum1[45]));
    full_adder inst46(.a(a[46]), .b(b[46]), .cin(carry[45]), .carry(carry[46]), .sum1(sum1[46]));
    full_adder inst47(.a(a[47]), .b(b[47]), .cin(carry[46]), .carry(carry[47]), .sum1(sum1[47]));
    full_adder inst48(.a(a[48]), .b(b[48]), .cin(carry[47]), .carry(carry[48]), .sum1(sum1[48]));
    full_adder inst49(.a(a[49]), .b(b[49]), .cin(carry[48]), .carry(carry[49]), .sum1(sum1[49]));
    full_adder inst50(.a(a[50]), .b(b[50]), .cin(carry[49]), .carry(carry[50]), .sum1(sum1[50]));
    full_adder inst51(.a(a[51]), .b(b[51]), .cin(carry[50]), .carry(carry[51]), .sum1(sum1[51]));
    full_adder inst52(.a(a[52]), .b(b[52]), .cin(carry[51]), .carry(carry[52]), .sum1(sum1[52]));
    full_adder inst53(.a(a[53]), .b(b[53]), .cin(carry[52]), .carry(carry[53]), .sum1(sum1[53]));
    full_adder inst54(.a(a[54]), .b(b[54]), .cin(carry[53]), .carry(carry[54]), .sum1(sum1[54]));
    full_adder inst55(.a(a[55]), .b(b[55]), .cin(carry[54]), .carry(carry[55]), .sum1(sum1[55]));
    full_adder inst56(.a(a[56]), .b(b[56]), .cin(carry[55]), .carry(carry[56]), .sum1(sum1[56]));
    full_adder inst57(.a(a[57]), .b(b[57]), .cin(carry[56]), .carry(carry[57]), .sum1(sum1[57]));
    full_adder inst58(.a(a[58]), .b(b[58]), .cin(carry[57]), .carry(carry[58]), .sum1(sum1[58]));
    full_adder inst59(.a(a[59]), .b(b[59]), .cin(carry[58]), .carry(carry[59]), .sum1(sum1[59]));
    full_adder inst60(.a(a[60]), .b(b[60]), .cin(carry[59]), .carry(carry[60]), .sum1(sum1[60]));
    full_adder inst61(.a(a[61]), .b(b[61]), .cin(carry[60]), .carry(carry[61]), .sum1(sum1[61]));
    full_adder inst62(.a(a[62]), .b(b[62]), .cin(carry[61]), .carry(carry[62]), .sum1(sum1[62]));
    full_adder inst63(.a(a[63]), .b(b[63]), .cin(carry[62]), .carry(carry[63]), .sum1(sum1[63]));
    full_adder inst64(.a(a[64]), .b(b[64]), .cin(carry[63]), .carry(carry[64]), .sum1(sum1[64]));
    full_adder inst65(.a(a[65]), .b(b[65]), .cin(carry[64]), .carry(carry[65]), .sum1(sum1[65]));
    full_adder inst66(.a(a[66]), .b(b[66]), .cin(carry[65]), .carry(carry[66]), .sum1(sum1[66]));
    full_adder inst67(.a(a[67]), .b(b[67]), .cin(carry[66]), .carry(carry[67]), .sum1(sum1[67]));
    full_adder inst68(.a(a[68]), .b(b[68]), .cin(carry[67]), .carry(carry[68]), .sum1(sum1[68]));
    full_adder inst69(.a(a[69]), .b(b[69]), .cin(carry[68]), .carry(carry[69]), .sum1(sum1[69]));
    full_adder inst70(.a(a[70]), .b(b[70]), .cin(carry[69]), .carry(carry[70]), .sum1(sum1[70]));
    full_adder inst71(.a(a[71]), .b(b[71]), .cin(carry[70]), .carry(carry[71]), .sum1(sum1[71]));
    full_adder inst72(.a(a[72]), .b(b[72]), .cin(carry[71]), .carry(carry[72]), .sum1(sum1[72]));
    full_adder inst73(.a(a[73]), .b(b[73]), .cin(carry[72]), .carry(carry[73]), .sum1(sum1[73]));
    full_adder inst74(.a(a[74]), .b(b[74]), .cin(carry[73]), .carry(carry[74]), .sum1(sum1[74]));
    full_adder inst75(.a(a[75]), .b(b[75]), .cin(carry[74]), .carry(carry[75]), .sum1(sum1[75]));
    full_adder inst76(.a(a[76]), .b(b[76]), .cin(carry[75]), .carry(carry[76]), .sum1(sum1[76]));
    full_adder inst77(.a(a[77]), .b(b[77]), .cin(carry[76]), .carry(carry[77]), .sum1(sum1[77]));
    full_adder inst78(.a(a[78]), .b(b[78]), .cin(carry[77]), .carry(carry[78]), .sum1(sum1[78]));
    full_adder inst79(.a(a[79]), .b(b[79]), .cin(carry[78]), .carry(carry[79]), .sum1(sum1[79]));
    full_adder inst80(.a(a[80]), .b(b[80]), .cin(carry[79]), .carry(carry[80]), .sum1(sum1[80]));
    full_adder inst81(.a(a[81]), .b(b[81]), .cin(carry[80]), .carry(carry[81]), .sum1(sum1[81]));
    full_adder inst82(.a(a[82]), .b(b[82]), .cin(carry[81]), .carry(carry[82]), .sum1(sum1[82]));
    full_adder inst83(.a(a[83]), .b(b[83]), .cin(carry[82]), .carry(carry[83]), .sum1(sum1[83]));
    full_adder inst84(.a(a[84]), .b(b[84]), .cin(carry[83]), .carry(carry[84]), .sum1(sum1[84]));
    full_adder inst85(.a(a[85]), .b(b[85]), .cin(carry[84]), .carry(carry[85]), .sum1(sum1[85]));
    full_adder inst86(.a(a[86]), .b(b[86]), .cin(carry[85]), .carry(carry[86]), .sum1(sum1[86]));
    full_adder inst87(.a(a[87]), .b(b[87]), .cin(carry[86]), .carry(carry[87]), .sum1(sum1[87]));
    full_adder inst88(.a(a[88]), .b(b[88]), .cin(carry[87]), .carry(carry[88]), .sum1(sum1[88]));
    full_adder inst89(.a(a[89]), .b(b[89]), .cin(carry[88]), .carry(carry[89]), .sum1(sum1[89]));
    full_adder inst90(.a(a[90]), .b(b[90]), .cin(carry[89]), .carry(carry[90]), .sum1(sum1[90]));
    full_adder inst91(.a(a[91]), .b(b[91]), .cin(carry[90]), .carry(carry[91]), .sum1(sum1[91]));
    full_adder inst92(.a(a[92]), .b(b[92]), .cin(carry[91]), .carry(carry[92]), .sum1(sum1[92]));
    full_adder inst93(.a(a[93]), .b(b[93]), .cin(carry[92]), .carry(carry[93]), .sum1(sum1[93]));
    full_adder inst94(.a(a[94]), .b(b[94]), .cin(carry[93]), .carry(carry[94]), .sum1(sum1[94]));
    full_adder inst95(.a(a[95]), .b(b[95]), .cin(carry[94]), .carry(carry[95]), .sum1(sum1[95]));
    full_adder inst96(.a(a[96]), .b(b[96]), .cin(carry[95]), .carry(carry[96]), .sum1(sum1[96]));
    full_adder inst97(.a(a[97]), .b(b[97]), .cin(carry[96]), .carry(carry[97]), .sum1(sum1[97]));
    full_adder inst98(.a(a[98]), .b(b[98]), .cin(carry[97]), .carry(carry[98]), .sum1(sum1[98]));
    full_adder inst99(.a(a[99]), .b(b[99]), .cin(carry[98]), .carry(carry[99]), .sum1(sum1[99]));
            
endmodule

module full_adder(a, b, cin, carry, sum1);
    
    input a, b, cin;
    output carry, sum1;
    
    assign sum1 = a ^ b ^ cin; // 计算和
    assign carry = (a & b) | (a & cin) | (b & cin); // 计算进位

endmodule

