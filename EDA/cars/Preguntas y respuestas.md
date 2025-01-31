

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

## ¿Cuantos registros hay en el fichero?

```bash

head -n 1 Electric_Vehicle_Population_Data.csv |tr -cd ';'| wc -c
```

## ¿De cuantos estados hay vehículos registrados?

```bash
tail -n +2 Electric_Vehicle_Population_Data.csv | cut -d';' -f4 | sort | uniq | wc -l
```

## En que posición se encuentra la columna con el año de fabricación

```bash
 head -n 1 Electric_Vehicle_Population_Data.csv | tr ';' '\n' | nl | grep -i "MODEL YEAR"
```

## En que año se fabricó el vehículo matriculado en Texas (TX)

```bash
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '$4 ~ /TX/ {print $1}'
```


## Cual es el modelo de vehículo matriculado en Californía (CA)
```bash
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '$4 ~ /CA/ {print $1, $7}'
```
## De cuantas ciudades del estado de Washigthon hay datos en el fichero
```bash
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '$4 ~ /WA/ {print $4}' | wc -l
```
## De los vehículos registrados en la ciudad de Shelton, el que tiene el mayor rango electrico, cuantas millas puede recorrer?
```
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '$3 ~ /Shelton/ {if ($11 > max) {max=$11; line=$7}} END {print line}'
```

## Cual es el DOL vehicle ID de ese vehículo que alcanza esa distancia máxima?

```
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '$3 ~ /Shelton/ {if ($11 > max) {max=$11; line=$14}} END {print line}
'
```

## Cuales son los fabricantes que tienen más de 4000 vehiculos registrados

```
tail -n +2 Electric_Vehicle_Population_Data.csv | awk -F';' '{print $7}' | sort | uniq -c | awk '$1 > 4000 {print $2, $1}'
```
