Program busca_comparacao;
uses crt, sysutils,DateUtils;

const MIN=100000;
const MED=500000;
const MAX=1000000;

var dataArrayMin: array[1..MIN] of Longint; 
    dataArrayMed: array[1..MED] of Longint; 
    dataArrayMax: array[1..MAX] of Longint; 
    inicio, metade, fim, indice, Result, i, j, valorBuscado : Longint;
	searchTypeOption: integer;
    TempoFinal, TempoInicial, Duracao: TDateTime;
    iHours, iMinutes, iSeconds, iMilliseconds: Word;  // Time components

function binarySearch(arr: array of Longint; alvo: Longint) : Longint;
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

function sequencialSearch(arr: array of Longint; valor: Longint) : Longint;
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
 	for i := 1 to MIN do
        dataArrayMin[i] := i;

    for i := 1 to MED do
        dataArrayMed[i] := i;
        
    for i := 1 to MAX do
        dataArrayMax[i] := i;

    WriteLn('Digite tamanho do array que deseja utilizar: ');
    WriteLn('1: Busca binaria');
    WriteLn('2: Busca sequencial');
    readLn(searchTypeOption);

    Write('Digite o elemento que você deseja procurar: ');
    readLn(valorBuscado);

    TempoInicial := Now;
    case searchTypeOption  of
        1:
            begin
                WriteLn('Busca binária selecionada ');
                indice := binarySearch(dataArrayMin, valorBuscado);
            end;
        2:
            begin
                WriteLn('Busca sequêcial selecionada ');
                indice := sequencialSearch(dataArrayMin, valorBuscado);
            end;
    end;
    TempoFinal := Now;

    if indice <> -1 then
        WriteLn('Elemento encontrado no indice ', indice)
    else
        WriteLn('Elemento não encontrado.');
    
    // Calcule a diferença em segundos entre o tempo final e o tempo inicial
    Duracao := MilliSecondsBetween(TempoInicial, TempoFinal);
    // To be read by a human
    Writeln( ' Started: ', DateTimeToStr( TempoInicial ) );
    Writeln( ' Finished: ', DateTimeToStr( TempoFinal ) );
    Duracao:= TempoFinal - TempoInicial;  // Subtract higher from lower value
    DecodeTime( Duracao, iHours, iMinutes, iSeconds, iMilliseconds );  // Does not account for day changes when executing around midnight
    Writeln( '    taken: ', iHours, ' h, ', iMinutes, ' min, ', iSeconds, ' sec, ', iMilliseconds, ' msec' );

    readLn();

End.