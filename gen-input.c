#include <stdio.h>

#define borda 10.0
#define interior 1.0

void main(int argc, char **argv) {
    unsigned int m, n, i, j, t;
    float b = borda;
    float w = interior;

    sscanf(argv[1], "%d", &t);
    sscanf(argv[2], "%d", &m);
    sscanf(argv[3], "%d", &n);

    printf("%d\n", t);
    printf("%d %d\n", m, n);

    for (i = 0; i < m; i++)
        printf("%4.1f ", b);
    printf("\n");

    for (i = 0; i < n - 2; i++) {
        printf("%4.1f ", b);
        for (j = 0; j < n - 2; j++)
            printf("%4.1f ", w);
        printf("%4.1f\n", b);
    }

    for (i = 0; i < m; i++)
        printf("%4.1f ", b);
    printf("\n");
}
