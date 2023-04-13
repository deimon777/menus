#!/bin/sh
# Codigo que muestra como gestionar un menu desde consola.

# Muestra el menu general
_menu(){
  clear
  echo "------------------------------------"
  echo ""
  echo "------------------------------------"
  echo "Selecciona una opcion:"
  echo "1) "
  echo "2) "
  echo "3) "
  echo "4) "
  echo "5) "
  echo "6) "
  echo "7) "
  echo "8) "
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
        pause "ENTER para continuar";
    _menu;;
    2)
    clear;
    _mostrarResultado $opc;
        pause "ENTER para continuar";
    _menu;;
    3)
    clear;
    _mostrarResultado $opc;
        pause "ENTER para continuar";
    _menu;;
    4)
    clear;
    _mostrarResultado $opc;
        pause "ENTER para continuar";
    ls;
    _menu;;
    5)
    clear;
    _mostrarResultado $opc;
    _menu;;
    6)
    clear;
    _mostrarResultado $opc;
    _menu;;
    7)
    clear;
    _mostrarResultado $opc;
    _menu;;
    8)
    clear;
    _mostrarResultado $opc;
    _menu;;

    *)
    # Esta opcion se ejecuta si no es ninguna de las anteriores
    clear;
    _menu;;
  esac
  read opc
done
