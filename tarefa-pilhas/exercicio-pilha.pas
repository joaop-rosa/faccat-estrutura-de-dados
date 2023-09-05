////////////////////////////////////////////
// JOÃO PAULO DA ROSA E NATÃ DOS SANTOS ////
////////////////////////////////////////////

program PilhaPalabra;
Uses Crt;
const
  MAX_TAMANHO = 25;

type
  NODO = Char;
  PILHA = record
    topo: Integer;
    conteudo: array[1..MAX_TAMANHO] of NODO;
  end;

var
  p: PILHA;
  palavra: string;
  i, tamanho_palavra: Integer;

procedure criaPilha(var arg_pilha: PILHA);
begin
  arg_pilha.topo := 0;
end;

function pop(var arg_pilha: PILHA): NODO;
begin
  pop := arg_pilha.conteudo[arg_pilha.topo];
  arg_pilha.topo := arg_pilha.topo - 1;
end;

procedure push(var arg_pilha: PILHA; caracter: NODO);
begin
  arg_pilha.topo := arg_pilha.topo + 1;
  arg_pilha.conteudo[arg_pilha.topo] := caracter;
end;

function isVazio(var arg_pilha: PILHA): Boolean;
begin
  isVazio := arg_pilha.topo = 0;
end;


begin
  criaPilha(p);

  Write('Informe uma palavra: ');
  ReadLn(palavra);
  
  // Enche a pilha a partir de cada caracter
  tamanho_palavra := Length(palavra);
  for i := 1 to tamanho_palavra do
  begin
    push(p, palavra[i]);
  end;

  // Enquanto a pilha não estiver vazia realiza o pop
  Write('Palavra invertida: ');
  while not isVazio(p) do
  begin
    Write(pop(p));
  end;
  
  ReadLn();
end.
