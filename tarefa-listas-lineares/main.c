#include <stdio.h>
#include <stdlib.h>
#define tamanhoVetor 10

int vetor[tamanhoVetor] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

void inserir(int posicao, int valor)
{
    system("cls");
    for (int i = tamanhoVetor; i >= posicao; i--)
    {
        vetor[i] = vetor[i - 1];
    }
    vetor[posicao] = valor;
    printf("Inserido o valor %d na posicao %d\n", valor, posicao + 1);
    printf("Precione qualquer tecla para continuar... ");
    getchar();
}

void visualizar()
{
    system("cls");
    for (int i = 0; i < tamanhoVetor; i++)
    {
        if (i == 9)
        {
            printf("%d \n", vetor[i]);
        }
        else
        {
            printf("%d - ", vetor[i]);
        }
    }
    printf("Precione qualquer tecla para continuar... ");
    getchar();
}

void menu()
{
    int selecao = 99;
    do
    {
        system("cls");

        printf("1 - insira 10 na posicao 1 \n");
        printf("2 - insira 40 na posicao 1 \n");
        printf("3 - insira 30 na posicao 3 \n");
        printf("4 - insira 40 na posicao 2 \n");
        printf("5 - insira 40 na posicao 1 \n");
        printf("6 - Ver matriz \n");
        printf("0 - Sair \n");
        printf("Informe a opcao que deseja: ");
        scanf("%d", &selecao);
        getchar();
        switch (selecao)
        {
        case 1:
            inserir(0, 10);
            break;
        case 2:
            inserir(1, 20);
            break;
        case 3:
            inserir(2, 30);
            break;
        case 4:
            inserir(1, 40);
            break;
        case 5:
            inserir(0, 40);
            break;
        case 6:
            visualizar();
            break;
        case 0:
            break;
        default:
            system("cls");
            printf("Valor invalido! \n");
            printf("Precione qualquer tecla para continuar... ");
            getchar();
            break;
        }
    } while (selecao != 0);
}

int main()
{
    menu();
    return 0;
}