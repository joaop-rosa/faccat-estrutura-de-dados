#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TAMANHO 25

typedef char NODO;
typedef struct
{
    int topo;
    NODO conteudo[MAX_TAMANHO];
} PILHA;

void criaPilha(PILHA *pilha)
{
    pilha->topo = -1;
}

char pop(PILHA *pilha)
{
    char item = pilha->conteudo[pilha->topo];
    pilha->topo--;
    return item;
}

void push(PILHA *pilha, NODO caracter)
{
    pilha->topo++;
    pilha->conteudo[pilha->topo] = caracter;
}

int isVazio(PILHA *pilha)
{
    return pilha->topo == -1;
}

int main()
{
    PILHA pilha;
    criaPilha(&pilha);
    char palavra[MAX_TAMANHO];

    printf("Informe uma palavra: ");
    scanf("%s", palavra);
    getchar();

    // Enche a pilha a partir de cada caracter
    int tamanho_palavra = strlen(palavra);
    for (int i = 0; i < tamanho_palavra; i++)
    {
        push(&pilha, palavra[i]);
    }

    // Enquanto a pilha não estiver vazia realiza o pop
    printf("Palavra invertida: ");
    while (!isVazio(&pilha))
    {
        printf("%c", pop(&pilha));
    }
}