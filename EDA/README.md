+ cabecera head 5 <file>
+ cola tail 7 <file>
+ contar columnas

    substituimos los separadores por un retorno de linea. Contamos las lineas.
    ```bash
    head -1 flags.csv | sed -e s/:/\\n/g | wc -l
    ```

+ extraer datos de una columna


    ```bash
    awk -F: '{print $10}' flags.csv | head -5
    ```


+ extraer un subconjunto de columnas


    ```bash
    cut -d: -f1,10,11 flags.csv
    ```


+ sumar los valores de una columna, la ocho

    ```bash
    awk -F ',' ' {sum += $8} END {print sum}' detalles_banderas.csv 
    ```

+ cual es el máximo valor de los valores de una columna

    ```bash
    sort -k8 -n  detalles_banderas.csv | head -2
    ```

+ cuantos paises hay en Europa
    ```bash
    sort -k8 -n  detalles_banderas.csv | head -2
    ```

+ De cuantos continente hay banderas en el ficheros

    ```bash
    cut -d: -f11 flags.csv | sort | uniq | grep -v Continent | wc -l
    cut -d: -f11 flags.csv | sort -u | grep -v Continent | wc -l
    ```
+ Hay paises repetidos?
    Analizo los valores únicos y los comparo con el total de líneas del fichero
    ```bash
    cut -d: -f10 flags.csv | sort -u | grep -v Name | wc -l
    ```

+ Encontrar las lineas que están vacías. 
    Usamos las capacidades Regex de grep. Bucamos la cadena vacía con el patron '^$'.
    En este caso la columna 17 tiene 187 lineas vacias. queremos contarlas

    ```bash
    cut -d: -f17 flags.csv | sort | grep -v Text | grep '^$'| wc -l
    ```    

+ para saber cuantas veces aparece en la columna 9 cada valor único

    ```bash
    cut -d\; -f9 Electric_Vehicle_Population_Data.csv | sort | uniq -c
    ```

    78828 Battery Electric Vehicle (BEV)
        1 Electric Vehicle Type
    20956 Plug-in Hybrid Electric Vehicle (PHEV)


     

+ para saber valor único que aparece **más** veces en la columna 8
    ```bash
     grep -i Nissan Electric_Vehicle_Population_Data.csv | cut -d';' -f8 | sort | uniq -c | sort -t' ' -k1 -r | head -1
    ```   

+ para saber valor único que aparece **menos** veces en la columna 8
    ```bash
     grep -i Nissan Electric_Vehicle_Population_Data.csv | cut -d';' -f8 | sort | uniq -c | sort -t' ' -k1  | head -1
    ```  

  + Para saber el **valor medio** de un valor en la columna 11 por las categorías que tenemos en la columna 7

    ```bash
    awk -F";" '{count[$7]++; suma[$7]=suma[$7] + $11;} END {for (make in count) print make, suma[make]/count[make]}' datos.csv
    ``` 

  + Que porcentaje de valores diferentes tiene una columna?
  Aprendemos aqui a guardar valores en una variable.
  Vemos como ejecutar varios comandos en uno.
  ```bash
    LINES=$(wc -l Electric_Vehicle_Population_Data.csv | awk '{print $1}');DISTINCT=$(cut -d\; -f1 Electric_Vehicle_Population_Data.csv | uniq | wc -l  )  ;PERCENT=$(bc <<< "scale=2; $DISTINCT / $LINES * 100") ; echo "$(head -1 Electric_Vehicle_Population_Data.csv | cut -d\; -f1) tiene $DISTINCT valores distintos de un total de $LINES registros.Esto representa $PERCENT%"
    ``` 




    ## no repitas consultas. Haz un script!!!!

    puedes crear un sript bash para no repetir preguntas, como la de averiguar en que coluna hay una informacion.

    + Averigua dónde está bash en tu máquina 
    ```bash
    $ which bash
    /usr/bin/bash
    ```
    usa esa ruta como la  de un guion o script de bash. yo lo llamo **columnas.sh**
    $ echo "#\!/usr/bin/bash" > columnas.sh
    $ echo "head -1 flags.csv | sed -e 's/:/:\n/g'| grep -n ':'" >> columnas.sh
    $ chmod +x columnas.sh
    $ ./columnas.sh

    Notad el diferente uso del primer **>** y del segundogit log --oneline **>>**.
    chmod +x le da permisos de ejecuición al guion.

    # Sin miedo a mayúsculas y minusculas en el grep: usa el flag -i



    # Reduce el tamaño del fichero

    A partir de consulta que hemos visto arriba ...
    + para saber cuantas veces aparece en la columna 9 cada valor único

    ```bash
    cut -d\; -f9 Electric_Vehicle_Population_Data.csv | sort | uniq -c
    ```
    con este resultado ..... (el texto con el uno es la cabecera)

    78828 Battery Electric Vehicle (BEV)
        1 Electric Vehicle Type
    20956 Plug-in Hybrid Electric Vehicle (PHEV)
 
    podemos intuir que una **recodificación** nos haría más pequeño el fichero.
    
    Contando los carácteres de la columna ... 3 260 974
    ``` bash
    cut -d\; -f9 Electric_Vehicle_Population_Data.csv | wc
    ```

    Representan un %13.52% sobre los 24 112 773 carácters del fichero. 
    Los 3 260 974 carácteres se pueden convertir en unos 99785 si dejamos solamente la "B" para el totalmente electrico y la "P" para el enchufable. 

    Reduziríamos el tamaño del fichero un 13,11%.

    Editamos el fichero sin abrirlo con la ayuda de sed
    
    ```bash
    sed -i -e 's/Plug-in Hybrid Electric Vehicle (PHEV)/P/g' Electric_reduccion_1.csv 
    ```

    Ahora los valores únicos pasan a tener este aspecto

    78828 B
      1 Electric Vehicle Type
    20956 P
