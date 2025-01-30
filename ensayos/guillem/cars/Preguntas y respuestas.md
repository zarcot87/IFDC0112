

# Ejercicio de análisis exploratorio de datos

Haz una copia de la carpeta "cars" a tu area de ensayo.

Vamos a realizar un análisis exploratorio de los datos contenido en el fichero Electric_Vehicle_Population_Data.csv.

El metadata del fichero es:

|Columna | Descripcion|
|----------|-----------|
|VIN (1-10)| Partial vehicle identification number consisting of the first 10 digits.|
|County| The county where the vehicle is registered.|
|City| The city where the vehicle is registered.|
|State| The state where the vehicle is registered.|
|Postal Code| The postal code of the vehicle registration location|
|Model Year| The year the vehicle was manufactured.|
|Make| The manufacturer or brand of the vehicle.|
|Model| The specific model of the vehicle.|
|Electric Vehicle Type| Indicates whether the vehicle is a Battery Electric Vehicle (BEV) or a Plug-in Hybrid Electric Vehicle (PHEV).|
|Clean Alternative Fuel Vehicle (CAFV) Eligibility| Indicates if the vehicle is eligible for Clean Alternative Fuel Vehicle benefits.|
|Electric Range| The range of the vehicle on a full electric charge.|
|Base MSRP| The manufacturer's suggested retail price for the vehicle.|
|Legislative District| The legislative district associated with the vehicle registration location.|
|DOL Vehicle ID| Unique identifier assigned by the Washington State Department of Licensing.|
|Vehicle Location| The precise location of the vehicle.|
|Electric Utility| The electric utility company associated with the vehicle.|
|2020 Census Tract| The census tract where the vehicle is registered.|

## ¿Cuántos registros hay en el fichero?

```bash
wc Electric_Vehicle_Population_Data.csv 
```
S'ha de mirar la primera línea i restar un perquè l'índex no compte. Són 99784.

## ¿De cuántos estados hay vehículos registrados?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n State
```
Con este comando se ve en que número de columna esta la palabra State

```bash 
cut -d";" -f4 Electric_Vehicle_Population_Data.csv | sort -u | grep -v State
```
Aquest segon comando és per tallar la columna 4 (valor ; que és la separació està entre cometes perquè si nó no ho agafava), després el sort és per triar valors únics i que no surti repetit, i per últim li treiem la paraula state ja que no és un valor d'Estat si no la capçalera

## ¿En que posición se encuentra la columna con el año de fabricación?

```bash
head -1 Electric_Vehicle_Population_Data.csv |sed -e "s/;/\n/g" | grep -n "Model Year"
```
Con este comando se ve en que número de columna esta la palabra Model Year

## ¿En que año se fabricó el vehículo matriculado en Texas (TX)?

He trobat dues maneres, primer posem la curta:
```bash
cut -d";" -f4,6 Electric_Vehicle_Population_Data.csv | grep "TX"
```
En aquest cas el que fa és dir que només deixi la columna 4 i la 6, i amb la segona part (el grep) ens mira que hi hagi la paraula TX a la primera columna.

La segona manera que he trobat un pèl més llarga és buscant primer la columna en la que està i després fent que només et deixi el número de la fila 6 que és el que volem.

```bash
cut -d";" -f4 Electric_Vehicle_Population_Data.csv | grep -n "TX"
```

```bash
sed -n "227p" Electric_Vehicle_Population_Data.csv | cut -d";" -f6
```

## ¿Cuál es el modelo de vehículo matriculado en Californía (CA)?

```bash
cut -d";" -f4,6 Electric_Vehicle_Population_Data.csv | grep "CA"
```
Fet amb el mètode més eficient d'abans

## ¿De cuántas ciudades del estado de Washigthon hay datos en el fichero?

```bash
cut -d";" -f3,4 Electric_Vehicle_Population_Data.csv | grep "WA" |sort -u | nl
```
Aquí hem tallat la taula gran a només les taules que sigui de WA (Washington), hem posat el valor unique a sort perqueè no ens surtin els números repetits i després nl peruè ens numeri les líneas.

```bash
cut -d";" -f3,4 Electric_Vehicle_Population_Data.csv | grep "WA" |sort -u | wc -l
```
Aquesta és una altra manera on no et surten quines són les ciutats, si no que directament et diuen el número de ciutats diferents que hi ha.

## De los vehículos registrados en la ciudad de Shelton, el que tiene el mayor rango electrico, ¿cuántas millas puede recorrer?

```bash
cut -d";" -f3,11 Electric_Vehicle_Population_Data.csv | grep "Shelton" | sort -t";" -k2 -n | tail -1
```


## ¿Cuál es el DOL vehicle ID de ese vehículo que alcanza esa distancia máxima?

```bash
Escribe la linea de comandos bash con la  que has obtenido la respuesta
```
## ¿Cuáles son los fabricantes que tienen más de 4000 vehiculos registrados?

```bash
Escribe la linea de comandos bash con la  que has obtenido la respuesta
```

## ¿Cuáles son los fabricantes que tienen más de 4000 vehiculos registrados?

```bash
Escribe la linea de comandos bash con la  que has obtenido la respuesta
```

## ¿Qué modelo de Nissa es lider en ventas?

```bash
Escribe la linea de comandos bash con la  que has obtenido la respuesta
```

## Ordena de mayor a menor autonomía promedio a los fabricantes

```bash
Escribe la linea de comandos bash con la  que has obtenido la respuesta
```