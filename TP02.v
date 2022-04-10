module TP02(
    input clk,
    input in1,
    input in2,
    input controle,
    input start,

    output  out1,
    output  out2

);

parameter zero = 4'b0000;
parameter cinco = 4'b0001;
parameter dez = 4'b0010;
parameter quinze = 4'b0011;
parameter vinte = 4'b0100;
parameter vinte_cinco = 4'b0101;
parameter trinta = 4'b0110;
parameter trinta_mais = 4'b0111;
parameter s2 = 4'b1000;

reg out1;
reg out2;
reg [4:1] estado;
reg [4:1] proximo_estado;

always @(posedge clk) begin
    if (start == 1'b1) estado = zero;
    else estado = proximo_estado;
end


always @(posedge controle or estado) begin
    case (estado)
        zero: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = zero;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = cinco;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = dez;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = vinte_cinco;
        end
        cinco: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = s2;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = dez;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = quinze;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = trinta;
        end
        dez: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = s2;
            else if (in1 ==1'b0 && in2 == 1'b1) proximo_estado = quinze;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = vinte;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = trinta_mais;
        end
        quinze: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = s2;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = vinte;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = vinte_cinco;  
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = trinta_mais;
        end
        vinte: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = s2;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = vinte_cinco;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = trinta;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = trinta_mais;
        end
        vinte_cinco: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = s2;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = trinta;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = trinta_mais;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = trinta_mais;
        end
        trinta: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = zero;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = cinco;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = dez;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = vinte_cinco;
        end
        trinta_mais: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = zero;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = cinco;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = dez;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado = vinte_cinco;
        end
        s2: begin
            if (in1 == 1'b0 && in2 == 1'b0 ) proximo_estado = zero;
            else if (in1 ==1'b0 && in2 == 1'b1 ) proximo_estado = cinco;
            else if (in1 == 1'b1 && in2 == 1'b0 ) proximo_estado = dez;
            else if (in1 == 1'b1 && in2 == 1'b1 ) proximo_estado  = vinte_cinco;
        end
    endcase
end

always @(estado) begin
    case (estado)
        zero: begin
            out1 = 1'b0; out2 = 1'b0; end
        cinco: begin
            out1 = 1'b0; out2 = 1'b0; end
        dez: begin
            out1 = 1'b0; out2 = 1'b0; end
        quinze: begin
            out1 = 1'b0; out2 = 1'b0; end
        vinte: begin
            out1 = 1'b0; out2 = 1'b0; end
        vinte_cinco: begin
            out1 = 1'b0; out2 = 1'b0; end
        trinta: begin
            out1 = 1'b1; out2 = 1'b0; end
        trinta_mais: begin
            out1 = 1'b1; out2 = 1'b1; end
        s2: begin
            out1 = 1'b0; out2 = 1'b1; end
    endcase
end
endmodule