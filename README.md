# Flujo de automatización ensamblaje de genoma completo *de-novo* para Plantas y Microorganismos

## Pre requisitos

### Instalación conda


### Instalación Ambiente conda 
1. Instalar [Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) o [Mamba](https://github.com/conda-forge/miniforge), seguir las instrucciones seg[un sea de su preferencia.
2. Crear los ambientes a partir del archivo `plantASM.yml` o `conda env create -f plantASM.yml`:
```
conda env create -f plantASM.yml
conda env create -f conda env create -f plantASM.yml
```

## Plantas
Este flujo automatiza casi en su totalidad el ensamblaje * *de novo* * de plantas a partir de lecturas Illumina Paired End, sin tener en cuenta detalles propios de cada especie. En la carpeta Plantas se registran varios script que permiten ejecutar herramientas de uso común en el proceso de ensamblaje de genomas de plantas y la depuracion y eliminación de archivos no necesarios.

1. Activar el ambiente:
```
conda activate plantASM
```
2. Acorde al nombre de los archivos FASTQ, la muestra o nommbre final, considere editar cada script, estos deben ser ejecutados en orden secuencial depenciendo del prefijo de cada uno, ejemplo: `1 -> 1A -> 2 -> 2A -> 2B -> 3 ...`

## Microorganismos
Este flujo automatiza casi en su totalidad el ensamblaje * *de novo* * de plantas a partir de lecturas Illumina Paired End, sin tener en cuenta detalles propios de cada especie.
1. Activar el ambiente
```
conda activate bactASM
```
2. Editar el script `bacteria-denovo-assembly.sh` acorde al prefijo de las librerías o archivos Illumina de entrada, si estos conservan una secuencia númerica, considere editar la linea correspondiente a los límites del Loop for.

## Contacto
Cualquier inquietud o consulta por favor remitirla a [ddelgadillo@agrosavia.co](mailto:ddelgadillo@agrosavia.co?subject=[GitHub]%20Repo%20Genome%20Assembly) o [diegodelgadilloduran@gmail.com](mailto:diegodelgadilloduran@gmail.com?subject=[GitHub]%20Repo%20Genome%20Assembly)


 
