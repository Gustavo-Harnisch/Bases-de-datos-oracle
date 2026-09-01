// taller.c
// Taller 1 - Sistemas Operativos
// Dr. Felipe Tirado - 29-10-2025

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int es_primo(int n) {
    int i;
    if (n < 2) return 0;
    for (i = 2; i <= n/2; i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}

int main() {
    int cantidad, i, nums[100];
    int pipe1[2], pipe2[2], pipe3[2];
    int resp1[2], resp2[2], resp3[2];
    pid_t hijo1, hijo2, hijo3;

    printf("Cuantos numeros quieres? (min 5): ");
    scanf("%d", &cantidad);
    if (cantidad < 5) {
        printf("Error: minimo 5\n");
        return 1;
    }

    printf("Escribe los %d numeros: ", cantidad);
    for (i = 0; i < cantidad; i++) {
        scanf("%d", &nums[i]);
    }

    // pipes de ida
    pipe(pipe1); pipe(pipe2); pipe(pipe3);
    // pipes de vuelta
    pipe(resp1); pipe(resp2); pipe(resp3);

    // hijo 1 - cuadrado
    hijo1 = fork();
    if (hijo1 == 0) {
        close(pipe1[1]); close(resp1[0]);
        int x; long long res;
        while (read(pipe1[0], &x, sizeof(int)) > 0) {
            res = x * x;
            write(resp1[1], &res, sizeof(long long));
        }
        close(pipe1[0]); close(resp1[1]);
        return 0;
    }

    // hijo 2 - cubo
    hijo2 = fork();
    if (hijo2 == 0) {
        close(pipe2[1]); close(resp2[0]);
        int x; long long res;
        while (read(pipe2[0], &x, sizeof(int)) > 0) {
            res = x * x * x;
            write(resp2[1], &res, sizeof(long long));
        }
        close(pipe2[0]); close(resp2[1]);
        return 0;
    }

    // hijo 3 - primo
    hijo3 = fork();
    if (hijo3 == 0) {
        close(pipe3[1]); close(resp3[0]);
        int x, res;
        while (read(pipe3[0], &x, sizeof(int)) > 0) {
            res = es_primo(x);
            write(resp3[1], &res, sizeof(int));
        }
        close(pipe3[0]); close(resp3[1]);
        return 0;
    }

    // padre: cerrar lo que no usa
    close(pipe1[0]); close(pipe2[0]); close(pipe3[0]);
    close(resp1[1]); close(resp2[1]); close(resp3[1]);

    // enviar numeros
    for (i = 0; i < cantidad; i++) {
        write(pipe1[1], &nums[i], sizeof(int));
        write(pipe2[1], &nums[i], sizeof(int));
        write(pipe3[1], &nums[i], sizeof(int));
    }
    close(pipe1[1]); close(pipe2[1]); close(pipe3[1]);

    // mostrar resultados
    printf("\nPID1  PID2  PID3  Num  Cuad   Cubo  Primo\n");
    printf("----------------------------------------\n");

    for (i = 0; i < cantidad; i++) {
        long long a, b;
        int c;
        read(resp1[0], &a, sizeof(long long));
        read(resp2[0], &b, sizeof(long long));
        read(resp3[0], &c, sizeof(int));
        printf("%4d  %4d  %4d  %3d  %4lld  %4lld  %s\n",
               hijo1, hijo2, hijo3, nums[i], a, b, c ? "Si" : "No");
    }

    // cerrar pipes de lectura
    close(resp1[0]); close(resp2[0]); close(resp3[0]);

    // esperar a los hijos
    wait(NULL);
    wait(NULL);
    wait(NULL);

    return 0;
}