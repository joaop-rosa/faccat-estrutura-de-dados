#include <stdio.h>

int main()
{
    int tamanho;
    do
    {
        printf("Digite o tamanho do vetor (entre 5 e 10): ");
        scanf("%d", &tamanho);

        if (tamanho < 5 || tamanho > 10)
        {
            printf("Tamanho inválido. O tamanho deve estar entre 5 e 10.\n");
        }
    } while (tamanho < 5 || tamanho > 10);

    int vetor[tamanho];
    double soma = 0.0;

    for (int i = 0; i < tamanho; i++)
    {
        printf("Digite o elemento %d: ", i + 1);
        scanf("%d", &vetor[i]);
        soma += vetor[i];
    }

    double media = soma / tamanho;
    printf("A media dos elementos do vetor e: %.2f\n", media);

    return 0;
}