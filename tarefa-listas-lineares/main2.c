#include <stdio.h>

#define TAM_MAX 4
#define SUCESSO 1
#define LISTA_CHEIA 2
#define LISTA_VAZIA 3

typedef float NODO;
typedef struct
{
    int tamanho;
    NODO vetor_nodo[TAM_MAX];
} LISTA;

void criaLista(LISTA *lista)
{
    lista->tamanho = 0;
}

int incluiNoFim(LISTA *lista, NODO dado)
{
    if (lista->tamanho == TAM_MAX)
    {
        return LISTA_CHEIA;
    }
    else
    {
        lista->tamanho++;
        lista->vetor_nodo[lista->tamanho - 1] = dado;
        return SUCESSO;
    }
}

int incluiNoInicio(LISTA *lista, NODO dado)
{
    int i;
    if (lista->tamanho == TAM_MAX)
    {
        return LISTA_CHEIA;
    }
    else
    {
        for (i = lista->tamanho - 1; i >= 0; i--)
        {
            lista->vetor_nodo[i + 1] = lista->vetor_nodo[i];
        }
        lista->vetor_nodo[0] = dado;
        lista->tamanho++;
        return SUCESSO;
    }
}

int incluiNoMeio(LISTA *lista, NODO dado)
{
    int i, indice_meio;
    if (lista->tamanho == TAM_MAX)
    {
        return LISTA_CHEIA;
    }
    else
    {
        indice_meio = lista->tamanho / 2;

        if (indice_meio == 0)
        {
            indice_meio = 1;
        }

        printf("O indice do meio e: %d\n", indice_meio);

        for (i = lista->tamanho; i > indice_meio; i--)
        {
            lista->vetor_nodo[i] = lista->vetor_nodo[i - 1];
        }

        lista->vetor_nodo[indice_meio] = dado;
        lista->tamanho++;
        return SUCESSO;
    }
}

void erro(int op)
{
    switch (op)
    {
    case LISTA_CHEIA:
        printf("ERRO: Lista Cheia\n");
        break;
    case LISTA_VAZIA:
        printf("ERRO: Lista Vazia\n");
        break;
    }
    printf("Tecle [ENTER] para Continuar\n");
    getchar();
}

int removeElemento(LISTA *lista, int i)
{
    int j;
    if (i < 1 || i > lista->tamanho)
    {
        return LISTA_VAZIA;
    }
    else
    {
        for (j = i - 1; j < lista->tamanho - 1; j++)
        {
            lista->vetor_nodo[j] = lista->vetor_nodo[j + 1];
        }
        lista->tamanho--;
        return SUCESSO;
    }
}

int main()
{
    LISTA lista;
    NODO valor;
    int opcao_remocao, op, i, posicao_insercao;

    criaLista(&lista);

    printf("1-Inserir no inicio\n");
    printf("2-Inserir no meio\n");
    printf("3-Inserir no fim\n");
    printf("Qual posicao deseja?: ");
    scanf("%d", &posicao_insercao);

    do
    {
        printf("\nDigite um Valor para a matriz: ");
        scanf("%f", &valor);
        getchar();

        if (valor != 0)
        {
            switch (posicao_insercao)
            {
            case 1:
                op = incluiNoInicio(&lista, valor);
                break;
            case 2:
                op = incluiNoMeio(&lista, valor);
                break;
            case 3:
                op = incluiNoFim(&lista, valor);
                break;
            }

            erro(op);
        }
    } while (valor != 0 && op != LISTA_CHEIA);

    if (lista.tamanho != 0)
    {
        for (i = 0; i < lista.tamanho; i++)
        {
            printf("VALOR: %.2f\n", lista.vetor_nodo[i]);
        }

        printf("\nPara remover um elemento digite uma posicao de 1..n, ou digite 0 para sair: ");
        scanf("%d", &opcao_remocao);
        getchar();

        if (opcao_remocao > 0)
        {
            op = removeElemento(&lista, opcao_remocao);
            erro(op);

            for (i = 0; i < lista.tamanho; i++)
            {
                printf("VALOR: %.2f\n", lista.vetor_nodo[i]);
            }
        }
    }
    else
    {
        erro(LISTA_VAZIA);
    }

    return 0;
}
