//Testbench
//Mason Doherty
//1/30/2024
//Updated 2/8/2024
//Written using iVerilog on GNU Emacs

module Breadboard(w,x,y,z,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9);
   input  w,x,y,z;
   output f0,f1,f2,f3,f4,f5,f6,f7,f8,f9;
   reg	  f0,f1,f2,f3,f4,f5,f6,f7,f8,f9;
   wire   w,x,y,z;
   
   always @ ( w,x,y,z,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9) begin


   f0 = (w || x || y || ~z)&(w || x || ~y || ~z)&(w || ~x || y || z)&(w || ~x || ~y || z)&(w || ~x || ~y || ~z)&(~w || x || y || ~z)&(~w || x || ~y || z)&(~w || ~x || y || z)&(~w || ~x || ~y || z)&(~w || ~x || ~y || ~z );
   //f1 = pi(5,6,A)
   f1 = (w || ~x || y || ~z)&(w || ~x || ~y || z)&(~w || x || ~y || z);
   //f2= pi(0,1,3,4,6,7,8,a,b,c,e,f)
   f2 = (w || x || y || z)&(w || x || y || ~z)&(w || x || ~y || ~z)&(w || ~x || y || z)&(w || ~x || ~y || z)&(w || ~x || ~y || ~z)&(~w || x || y || z)&(~w || x || ~y || z)&(~w || x || ~y || ~z)&(~w || ~x || y || z)&(~w || ~x || ~y || z)&(~w || ~x || ~y || ~z);
   // f3 = pi(0,3,4,7,9,a,b,e,f)
   f3 = (w || x || y || z)&(w || x || ~y || ~z)&(w || ~x || y || z)&(w || ~x || ~y || ~z)&(~w || x || y || ~z)&(~w || x || ~y || z)&(~w || x || ~y || ~z)&(~w || ~x || ~y || z)&(~w || ~x || ~y || ~z);
   //f4 = pi(0,4,5,8,9,a,b,f)
   f4 = (w || x || y || z)&(w || ~x || y || z)&(w || ~x || y || ~z)&(~w || x || y || z)&(~w || x || y || ~z)&(~w || x || ~y || z)&(~w || x ||~y || ~z)&(~w || ~x || ~y || ~z);
   //f5 = pi(4,8,f) 
   f5 = (w || ~x || y || z)&(~w || x || y || z)&(~w || ~x || ~y || ~z);
   //f6 = pi()
   f6 = (w || x || y || ~z)&(w || x || ~y || ~z)&(w || ~x || y || ~z)&(w || ~x || ~y || z)&(~w || x || y || z)&(~w || ~x || y || z)&(~w || ~x || ~y || z);
   //f7 = pi(0,2,3,8,9,,b,d,e)
   f7 = (w || x || y || z)&(w || x || ~y || z)&(w || x || ~y || ~z)&(~w || x || y || z)&(~w || x || y || ~z)&(~w || x || ~y || ~z)&(~w || ~x || y || ~z)&(~w || ~x || ~y || z);
   //f8 = pi(1,2,3,4,,6,7,9,c,d,e,f)
   f8 = (w || x || y || ~z)&(w || x || ~y || z)&(w || x || ~y || ~z)&(w || ~x || y || z)&(w || ~x || ~y || z)&(w || ~x || ~y || ~z)&(~w || x || y || ~z)&(~w || ~x || y || z)&(~w || ~x || y || ~z)&(~w || ~x || ~y || z)&(~w || ~x|| ~y || ~z);
   //f9 = pi(0,2,6,7,9,A,B,D)
   f9 = (w || x || y || z)&(w || x || ~y || z)&(w || ~x || ~y || z)&(w || ~x || ~y || ~z)&(~w || x || y || ~z)&(~w || x || ~y || z)&(~w || x || ~y || ~z)&(~w || ~x || y || ~z);
	    
   end; // always @ ( j,k,l,m,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9)
   


endmodule; // Breadboard



module Testbench();
   reg [4:0] i;
   reg w,x,y,z;
   wire	f0,f1,f2,f3,f4,f5,f6,f7,f8,f9;
   Breadboard b1(w,x,y,z,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9);
   initial begin
      $display ("| w | x | y | z | f0 | f1 | f2 | f3 | f4 | f5 | f6 | f7 | f8 | f9 |");
	for (i = 0; i < 16; i = i + 1)
	  begin;
           w=(i/8)%2;
           x=(i/4)%2;
           y=(i/2)%2;
           z=(i/1)%2;
	     #10;
       
	   $display ("| %1d | %1d | %1d | %1d | %2d | %2d | %2d | %2d | %2d | %2d | %2d | %2d | %2d | %2d |", w,x,y,z, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);
	   
      end
      #10;
      $finish;
      
        end
endmodule; // Testbench

