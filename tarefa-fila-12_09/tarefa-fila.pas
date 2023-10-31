//////////////////////////////////////////////
//// João Paulo da Rosa e Natã dos Santos ////
//////////////////////////////////////////////

Program tarefa_fila;
uses crt;
const MAX=5;

type
 	PEDIDO = record
		nro_pedido: integer;
		cliente: string;
		qtd: integer;
  	end;

  	FILA = record
		conteudo: array[1..MAX] of PEDIDO;
		tamanho: integer;
		primeiro:integer;
		ultimo:integer;
  	end;

var f: FILA; 
	pd: PEDIDO;
	opcao,i:integer;
  
procedure criaFila(var arg_f: FILA);
begin
	arg_f.primeiro:=0;
	arg_f.ultimo:=0;
	arg_f.tamanho:=0;
end;


function estaCheio( var arg_f: FILA) : boolean;
begin
	if arg_f.tamanho = MAX  then
		begin
			Writeln('Fila cheia');
			estaCheio := true;
			readln();
		end
	else
		estaCheio := false;
end;

procedure queue( var arg_f: FILA; arg_pd: PEDIDO);
begin
	if estaCheio(arg_f) then
		begin
			Writeln('Fila cheia');
			readln();
		end
	else 
		begin
			if (arg_f.tamanho < MAX) and (arg_f.ultimo = MAX ) then
				arg_f.ultimo := 0;
			
			if arg_f.primeiro = 0 then
				arg_f.primeiro := 1;

			arg_f.ultimo := arg_f.ultimo + 1;
			arg_f.tamanho := arg_f.tamanho + 1;
			arg_f.conteudo[arg_f.ultimo] := arg_pd;
		end;
end;

procedure dequeue(var arg_f: FILA);
begin
	if arg_f.tamanho = 0 then
		begin
			Writeln('Não eh possivel realizar a operacao pois a fila esta vazia');
		end
	else
		begin	
			if arg_f.tamanho = 1 then
				arg_f.primeiro := 0;
				
  			arg_f.tamanho := arg_f.tamanho - 1;

			if ( arg_f.tamanho >= 1 ) and ( arg_f.primeiro = MAX ) then
				arg_f.primeiro := 1
			else
				arg_f.primeiro := arg_f.primeiro + 1; 

			readln;
	  	end;
  
end;                                                

procedure imprimeFila(var arg_f: FILA);	
begin
		clrscr;
		Writeln('--- Status da fila ---');
		if arg_f.tamanho = 0  then
			Writeln('Fila vazia')
		else 
			begin
				Writeln('--- Primeiro pedido ---');  
				Writeln('Indice: ', arg_f.primeiro);
				Writeln('Numero do pedido: ', arg_f.conteudo[arg_f.primeiro].nro_pedido);
				Writeln('Cliente: ', arg_f.conteudo[arg_f.primeiro].cliente);
				Writeln('Quantidade: ', arg_f.conteudo[arg_f.primeiro].qtd);
				Writeln('-------------------');
				Writeln('--- Ultimo pedido ---'); 
				Writeln('Indice: ', arg_f.ultimo);
				Writeln('Numero do pedido: ', arg_f.conteudo[arg_f.ultimo].nro_pedido);
				Writeln('Cliente: ', arg_f.conteudo[arg_f.ultimo].cliente);
				Writeln('Quantidade: ', arg_f.conteudo[arg_f.ultimo].qtd);
				Writeln('-------------------'); 
		  	end;
end;

begin
 	criaFila(f);
 
 	repeat
       	clrscr;
		writeln('1-Inserir pedido');
		writeln('2-Atender pedido');
		writeln('3-Status da fila');
		writeln('5-Sair');

		write('Digite uma opcao: ');
		readln(opcao);
	
		case opcao of
			1:begin
				if not estaCheio(f) then
					begin
						writeln('--- Digite um pedido ---');
						writeln('Informe o numero do pedido:  ');
						readln(pd.nro_pedido);
						writeln('Informe o cliente:  ');
						readln(pd.cliente);
						writeln('Informe a quantidade:  ');
						readln(pd.qtd);
						queue(f, pd); 
					end;
			    
        	end;
      		2:begin
             	dequeue(f);
           	 	readln;
			end;                           
		    3:begin
			    imprimeFila(f);
            	readln;
			end;							 		
		end;
    until (opcao=5);
	
End.