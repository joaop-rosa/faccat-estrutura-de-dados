Program fila_estatica ;
uses crt;
const MAX=5; //até 5 elementos

var opcao,valorFila:integer;
    primeiro:integer; //primeiro a ser atentido
    ultimo:integer; //ultimo a ser atendido
    fila: array[1..MAX] of integer;
    n:integer;//número de integrantes da fila    




{* Cria a fila *}
procedure criaFila();
begin
  primeiro:=0;
  ultimo:=0;
  n:=0;
end;

{* zerar fila *}
procedure zerarFila();
begin  
  criaFila();//cham o metodo novamente
end;

(*adiciona um elemento na fila*)
procedure queue(valor:integer);
begin
  //implementar aqui
end;

(*remove o primeiro elemento da fila*)
procedure dequeue();
begin
  //implementar aqui
   
end;                                                

(*imprime a fila*)
procedure imprimeFila();

begin
   //implementar aqui 
   
end;





(*Programa Principal*)
begin
 //primeiro cria a fila, passado o f com o parâmetro
 criaFila();
 
 
 repeat
      clrscr; //limpa a tela
		writeln('1-Queue    2-Dequeue  3-Imprimir  4 Zerar Fila 5- SAIR');
		write('Digite uma opcao: ');
		readln(opcao);
		
		
	
		
		case opcao of
			1:begin
			     write('Digite um valor para enfileirar: ');
			     readln(valorFila);
			     
			     queue(valorFila); 
					       
			   
        end;
      2:begin
             dequeue();
           	 readln;
        
				end;                           
		    3:begin
			      imprimeFila();
            readln;
			     end;						
			4:begin
			    zerarFila();
          
			  end;			
		end;
		
    until (opcao=5); //se a opocao=5 sai do programa
  
End.