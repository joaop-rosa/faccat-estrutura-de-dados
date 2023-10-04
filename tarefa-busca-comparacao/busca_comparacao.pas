Program busca_comparacao;
uses crt;

var massMin: array[1..1000] of integer; 
    massMedium: array[1..10000] of integer; 
    massMax: array[1..30000] of integer; 
	i,j, valorBuscado, inicio, fim, metade, Result, indice: integer;

function binarySearch(arr: array of Integer; alvo: Integer):integer;
begin
    inicio := 0;
    fim := length(arr) - 1;

    while inicio <= fim do
    begin
        metade := (inicio + fim) div 2;

        if arr[metade] = alvo then
        begin
        Result := metade; // Elemento encontrado, retorna o índice.
        Exit;
        end
        else if arr[metade] < alvo then
        inicio := metade + 1
        else
        fim := metade - 1;
    end;

    Result := -1; // Elemento não encontrado, retorna -1.
end;

function sequencialSearch(arr: array of integer; valor: integer):integer;
begin
    j:=0;
    i:=1;
    repeat
        if arr[i] = valor then
            j := i;
        i := i + 1;
    until (j <> 0) or (i >= length(arr));

    sequencialSearch := j;
end; 

begin 
 	for i := 1 to 1000 do
        massMin[i] := i;

    for i := 1 to 10000 do
        massMedium[i] := i;
        
    for i := 1 to 30000 do
        massMax[i] := i;

    Write('Digite o elemento que você deseja procurar: ');
    readLn(valorBuscado);

    TempoInicial := Now; // Registrar o tempo inicial
    indice := binarySearch(massMin, valorBuscado);
    TempoFinal := Now; // Registrar o tempo final


    if indice <> -1 then
        WriteLn('Elemento encontrado no indice ', indice)
    else
        WriteLn('Elemento não encontrado.');

    // Calcule a diferença em segundos entre o tempo final e o tempo inicial
    Duracao := SecondsBetween(TempoFinal, TempoInicial);

    WriteLn('Tempo de execução: ', Duracao, ' segundos');


End.