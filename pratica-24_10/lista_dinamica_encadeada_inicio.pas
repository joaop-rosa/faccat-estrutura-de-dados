Program lista_dinamica_encadeada_inicio;
uses crt;

type
    prec = ^fred;
    lista = prec;
    fred = record
        info: integer;
        lig: prec;
    end;

var L, p, r: lista; 
    valor, opcao: integer;

procedure insereElemento(var elem: integer);
begin
    new(p);
    p^.info := elem;
    p^.lig := L;
    L := p;   
end;

procedure imprimir();
begin
    writeln('*** Impressao da lista ***');
    r := L;

    while (r <> nil) do
    begin
        writeln('O valor eh: ', r^.info);
        r := r^.lig;
    end;
end;

begin
    L := nil; // Inicialize a lista como vazia no início

    opcao := 1;

    repeat
        writeln('1 - inserir elemento');
        writeln('2 - imprimir');
        writeln('0 - sair');
        readln(opcao);

        if opcao = 1 then
        begin
            writeln('Digite o elemento para inserir');
            readln(valor);
            insereElemento(valor);
        end;

        if opcao = 2 then
            imprimir();
        
    until (opcao = 0);
end.