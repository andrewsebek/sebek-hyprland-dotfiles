#!/bin/bash

# ----------------------------------------------------- 
# Seleccionar fondo de pantalla aleatorio y crear esquema de colores
# Modifica la ruta de la carpeta a tu gusto
# ----------------------------------------------------- 
wal -q -i ~/Imágenes/Wallpapers/Anime/

# ----------------------------------------------------- 
# Carga el esquema de colores elegido a un script
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copia el fondo de pantalla seleccionado a la carpeta "cache"
# ----------------------------------------------------- 
cp $wallpaper ~/.cache/current_wallpaper.jpg

# ----------------------------------------------------- 
# Extrae el nombre del fondo de pantalla para mandarlo como notificación
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|~/Imágenes/Wallpapers/||g")

# ----------------------------------------------------- 
# Cambia el fondo de pantalla cargado a la carpeta "cache"
# ----------------------------------------------------- 
swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type="simple" \
    --transition-duration=0.1 \
    --transition-pos "$( hyprctl cursorpos )"

/home/sebek/.config/waybar/killnc.sh
/home/sebek/.config/waybar/reloadnc.sh
/home/sebek/.config/waybar/killbar.sh
/home/sebek/.config/waybar/reload.sh
sleep 1

# ----------------------------------------------------- 
# Envía la notificación
# ----------------------------------------------------- 
notify-send "Colores y Fondo de Pantalla" "con imagen $newwall"

echo "DONE!"
