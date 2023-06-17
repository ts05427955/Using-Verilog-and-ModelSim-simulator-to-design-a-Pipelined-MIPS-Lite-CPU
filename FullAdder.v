
module FullAdder( Sum, CarryOut, Carryin, dataA, dataB ) ;

input dataA ;
input dataB ;
input Carryin ;

output Sum ;
output CarryOut ;

wire temp_Sum ;
wire temp_CarryOut ;

assign temp_Sum = (( dataA ^ dataB ) ^ Carryin) ;
assign temp_CarryOut =  ( ( ( dataA | dataB ) & Carryin ) | ( dataA & dataB ) )  ;

assign Sum = temp_Sum ;
assign CarryOut = temp_CarryOut ;

endmodule




