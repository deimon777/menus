# Muestra el menu general
_menu(){
  clear
  echo "------------------------------------"
  echo " MENU"
  echo "------------------------------------"
  echo "Selecciona una opcion:"
  echo "1) Git"
  echo "2) Docker"
  echo "3) FFmpeg"
  echo "4) ..."
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
        #poner la ruta de los menu
        sh $HOME/.deimonScripts/menus/menuGit.sh
    _menu;;
    2)
    clear;
    _mostrarResultado $opc;
        #poner la ruta de los menu
        sh $HOME/.deimonScripts/menus/menuDocker.sh
    _menu;;
    3)
    clear;
    _mostrarResultado $opc;
        #poner la ruta de los menu
        sh $HOME/.deimonScripts/menus/menuFfmpeg.sh
    _menu;;
    4)
    clear;
    _mostrarResultado $opc;
        echo "falta"
        pause "ENTER para continuar";
    _menu;;
    5)
    clear;
    _mostrarResultado $opc;
        echo "falta"
        pause "ENTER para continuar";
      pwd;
    _menu;;
    *)
    # Esta opcion se ejecuta si no es ninguna de las anteriores
    clear;
      _menu;;
  esac
  read opc
done
