#!/bin/sh
# Codigo que muestra como gestionar un menu desde consola.

# Muestra el menu general
_menu(){
  clear
  echo "------------------------------------"
  echo ""
  echo "------------------------------------"
  echo "Selecciona una opcion:"
  echo "1) Clonar repositorio"
  echo "2) Status"
  echo "3) Agregar todos los cambios"
  echo "4) Comentar los cambios"
  echo "5) Ver rama"
  echo "6) Crear ramas"
  echo "7) Mover a rama"
  echo "8) Merge"
  echo ""
  echo "9) Salir"
  echo ""
  echo -n "Indica una opcion: "
}

# Muestra la opcion seleccionada del menu
_mostrarResultado(){
  clear
  echo ""
  echo "------------------------------------"
  echo "Has seleccionado la opcion $1"
  echo "------------------------------------"
  echo ""
}

# opcion por defecto
opc="0"

function pause(){
   read -p "$*"
}

# bucle mientas la opcion indicada sea diferente de 9 (salir)
until [ "$opc" -eq "9" ];
do
  case $opc in
    1)
    clear;
    _mostrarResultado $opc;
        read -p "URL del repositorio: " repo;
        read -p "Nombre de la carpeta (opcional): " directorio;
        git clone $repo $directorio
    _menu;;
    2)
    clear;
    _mostrarResultado $opc;
        git status
        pause "ENTER para continuar";
    _menu;;
    3)
    clear;
    _mostrarResultado $opc;
        git add .
    _menu;;
    4)
    clear;
    _mostrarResultado $opc;
        read -p "Comentario: " comentario;
        git commit -m $comentario
    ls;
    _menu;;
    5)
    clear;
    _mostrarResultado $opc;
        git branch
        pause "ENTER para continuar";
    _menu;;
    6)
    clear;
    _mostrarResultado $opc;
        read -p "Nombre de la rama: " rama;
        git branch $rama
    _menu;;
    7)
    clear;
    _mostrarResultado $opc;
        echo "Ramas creadas:"
        git branch
        echo "-----------";
        read -p "Nombre de la rama: " rama;
        git checkout $rama
    _menu;;
    8)
    clear;
    _mostrarResultado $opc;
        echo "falta"
        pause "ENTER para continuar";
        _menu;;

    *)
    # Esta opcion se ejecuta si no es ninguna de las anteriores
    clear;
    _menu;;
  esac
  read opc
done
