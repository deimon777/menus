# Muestra el menu general
_menu(){
  # clear
  echo "------------------------------------"
  echo " FFMPEG "
  echo "------------------------------------"
  echo "Selecciona una opcion:"
  echo "1) Recortar"
  echo "2) Redimencionar a 1920x1080"
  echo "3) Redimencionar a 1920x1080 por lote"
  echo "4) Bajar de youtube y cortar"
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

# bucle mientas la opcion indicada sea diferente de 9 (salir)
until [ "$opc" -eq "9" ];
do
  case $opc in
    1)
    clear;
    _mostrarResultado $opc;
        read -p "Posición X: " x;
        read -p "Posición Y: " y;
        read -p "Ancho: " w;
        read -p "Alto: " h;
        read -p "Nombre del archivo (con formato): " in;
        ffmpeg -i $in -filter:v "crop=$w:$h:$x:$y" out.mp4 
    _menu;;
    2)
    clear;
    _mostrarResultado $opc;
        read -p "Nombre del archivo (con formato): " in;
        ffmpeg -i $in -vcodec h264 -acodec mp3 "$i" "${i%.*}.mp4";
    _menu;;
    3)
    clear;
    _mostrarResultado $opc;
        read -p "Ingresar el formato de entrada: " in;
        read -p "Ingresar el formato de salida: " out;
        for f in *.$in; do ffmpeg -i "${f}" -vf scale=1920:1080 "${f%%.*}.$out"; done
    _menu;;
    4)
    clear;
    _mostrarResultado $opc;
        read -p "Ingresar la url: " URL;
        read -p "Ingresar el incio (HH:MM:SS): " START;
        read -p "Ingresar la duración (segundos): " DURN;
        read -p "Ingresar el nombre de salida: " OUTFILE;
        ffmpeg -i $(youtube-dl --get-url $URL) -ss $START -t $DURN $OUTFILE;
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
