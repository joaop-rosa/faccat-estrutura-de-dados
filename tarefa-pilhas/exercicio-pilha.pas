program PilhaReversa;

const
  MAX_TAMANHO = 25;

type
  NODO = Char;
  PILHA = record
    topo: Integer;
    conteudo: array[1..MAX_TAMANHO] of NODO;
  end;

procedure criaPilha(var pilha: PILHA);
begin
  pilha.topo := 0;
end;

function pop(var pilha: PILHA): NODO;
begin
  pop := pilha.conteudo[pilha.topo];
  pilha.topo := pilha.topo - 1;
end;

procedure push(var pilha: PILHA; caracter: NODO);
begin
  pilha.topo := pilha.topo + 1;
  pilha.conteudo[pilha.topo] := caracter;
end;

function isVazio(var pilha: PILHA): Boolean;
begin
  isVazio := pilha.topo = 0;
end;

var
  pilha: PILHA;
  palavra: array[1..MAX_TAMANHO] of Char;
  i, tamanho_palavra: Integer;

begin
  criaPilha(pilha);

  Write('Informe uma palavra: ');
  ReadLn(palavra);

  // Enche a pilha a partir de cada caracter
  tamanho_palavra := Length(palavra);
  for i := 1 to tamanho_palavra do
  begin
    push(pilha, palavra[i]);
  end;

  // Enquanto a pilha não estiver vazia realiza o pop
  Write('Palavra invertida: ');
  while not isVazio(pilha) do
  begin
    Write(pop(pilha));
  end;
end.
