# Compilar el programa con NASM
nasm -f elf64 -o programa.o inital.asm

# Enlazar el archivo objeto con LD para crear el ejecutable
ld -s -o inital inital.o

# Ejecutar el programa
./inital

# Imprimir el código de salida del programa
echo "Código de salida: $?"