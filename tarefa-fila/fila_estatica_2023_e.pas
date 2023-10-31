Program fila_estatica_2023_e ;
const MAX=5; //at� 5 elementos

type
  NODO = integer;
  FILA = record
    conteudo: array[1..MAX] of integer;
    tamanho: integer;
    primeiro:integer;
    ultimo:integer;
  end;

var f: FILA; 
		opcao,valorFila,i:integer;
  
procedure criaFila(var arg_f: FILA);
begin
  arg_f.primeiro:=0;
  arg_f.ultimo:=0;
  arg_f.tamanho:=0;
end;

procedure zerarFila(var arg_f: FILA);
begin  
  criaFila(arg_f);
end;

procedure queue( var arg_f: FILA; valor: NODO);
begin
	if arg_f.primeiro = 0 then
		arg_f.primeiro := 1;
		arg_f.tamanho := arg_f.tamanho + 1;
	if arg_f.ultimo = MAX then
		begin
		 Write('pilha cheia');
		 readln();
		end
	else
		begin	
		  arg_f.ultimo := arg_f.ultimo + 1;
		  arg_f.tamanho := arg_f.tamanho + 1;
		  arg_f.conteudo[arg_f.ultimo] := valor;
	  end;
end;

procedure dequeue(var arg_f: FILA);
begin
	if arg_f.tamanho = 0 then
		begin
		 Write('pilha vazia');
		 readln();
		end
	else
		begin	
		  arg_f.primeiro := arg_f.primeiro + 1; 
  		arg_f.tamanho := arg_f.tamanho - 1;
	  end;
  
end;                                                

procedure imprimeFila(var arg_f: FILA);	
begin
		if arg_f.tamanho = 0  then
			Write('pilha vazia')
		else 
	   	for i := arg_f.primeiro to arg_f.ultimo do
		  begin
		     Write(arg_f.conteudo[i]);
		     Write('-');
		  end;
end;

begin
 criaFila(f);
 
 repeat
		writeln('1-Queue    2-Dequeue  3-Imprimir  4 Zerar Fila 5- SAIR');
		write('Digite uma opcao: ');
		readln(opcao);
	
		case opcao of
			1:begin
			     write('Digite um valor para enfileirar: ');
			     readln(valorFila);
			     queue(f, valorFila); 
        end;
      2:begin
             dequeue(f);
           	 readln;
        
				end;                           
		    3:begin
			      imprimeFila(f);
            readln;
			     end;						
			4:begin
			    zerarFila(f);
          
			  end;			
		end;
		
    until (opcao=5);
  
End.