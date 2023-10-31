Program ponteiros;
uses crt;

var x: integer; 
    p,q: ^integer;
  

begin
 	x := 10;
    p := @x;

    q := p;
    q^ := p^ + 10;
    writeln('Resultado do ponteiro p^ ', p^);
    writeln('Resultado do ponteiro q^ ', q^);
    writeln('Resultado do variavel x ', x);
End.