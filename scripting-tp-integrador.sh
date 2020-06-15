#!/bin/bash

function menu {
			clear
			echo "Bienvenido al trabajo integrador!"
			echo "1° Mostrar la cantidad elementos fibonacci."
			echo "2° Mostrar numero invertido."
			echo "3° Evaluar si una cadena de texto es palindromo."
			echo "4° Mostrar la cantidad de lineas de un archivo de texto."
			echo "5° Ingresar numeros y ordenar."
			echo "6° Ingrese PATH para mostrar la cantidad de archivos de cada tipo"
			echo "7° Salir."
			echo -n "OPCION:"
			read opcion
			}
function salir {
			echo "Hasta luego ${SUDO_USER:-${USER}}!"
			exit
			}

menu
while [ $opcion != 7 ]
do
	case $opcion in
			1) 
				read -p "Ingrese numero: " num;
				a=0
				b=1
				for((i=0;i<num;i++))
				do
					secuencia=$[$a+$b]
					echo $secuencia
					a=$b
					b=$secuencia
				done
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			2)
				read -p "Ingrese numero para invertir: " num;
				echo -n "el numero invertido es: " 
				echo $num | rev
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			3)
				echo "ingrese cadena de texto: "
				read cadena
				if [ $cadena == $(rev<<<$cadena) ]; then
					echo "La cadena ingresada $cadena es palindromo"
				else
					echo "La cadena ingresada $cadena NO es palindromo"
				fi	
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			4)
				echo "Ingrese PATH del arhivo a evaluar: "
				read path
				lineas=`wc -l $path | cut -f1 -d' '`
				echo "El archivo suministrado contiene $lineas lineas" 
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			5)
				vec=()
				for((i=0;i<5;i++))
				do
					echo -n "Ingrese numero $[$i+1]°: "
					read num
					vec[i]=$num
				done
				printf '%s\n' "${vec[@]}" | sort -n	
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			6)
				echo "Ingrese PATH del arhivo a evaluar: "
				read path
				direcotrios=`find $path -type d | wc -l`
				archivos=`find $path -type f | wc -l`
				links=`find $path -type l | wc -l`
				echo "El directorio suministrado contiene:"
				echo "- $direcotrios Direcotorios."
				echo "- $archivos Archivos."
				echo "- $links Links."
				read -p "pulse una tecla para volver al menu" tecla;
				menu
			;;
			*)
				echo "No ha seleccionado una opcion correcta"
				menu
			;;							
	esac
done
salir

	