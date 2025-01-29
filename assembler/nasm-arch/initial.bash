# Compilar el programa con NASM
nasm -f elf64 -o programa.o programa.asm

# Enlazar el archivo objeto con LD para crear el ejecutable
ld -s -o programa programa.o

# Ejecutar el programa
./programa

# Imprimir el código de salida del programa
echo "Código de salida: $?"