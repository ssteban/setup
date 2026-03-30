# 🌙 Hyprland Setup Automático - Configuración Completa

Configuración automática y optimizada de **Hyprland** con Waybar, incluyendo todos los elementos esenciales.

## ✨ Características

- 🖥️ **Barra superior (Waybar)** con todos los módulos necesarios
- 📡 **IP de red** mostrada en tiempo real
- 🔊 **Control de volumen** con teclas multimedia
- 🎚️ **Información del sistema** (CPU, RAM, batería)
- 🎯 **Workspaces/Escritorios** visuales e interactivos  
- 🔋 **Botón de apagar** con menú contextual
- 🎨 **Tema visual moderno** con colores y transiciones
- 🖼️ **Fondo de pantalla** automático
- 📁 **Gestor de archivos (Thunar)** integrado
- ⌨️ **Atajos de teclado** óptimos

## 📋 Requisitos del Sistema

- **OS**: Linux (Arch/Manjaro recomendado)
- **Desktop**: Hyprland (no Gnome, KDE, etc)
- **Permiso sudo** para instalación de paquetes

## 🚀 Instalación Rápida

```bash
cd ~/setup
chmod +x setup.sh
./setup.sh
```

El script automáticamente:
1. Instala paquetes necesarios
2. Crea carpetas de configuración
3. Copia archivos de configuración
4. Prepara fondos de pantalla

## ⌨️ Atajos Principales

### Básicos
| Atajo | Acción |
|-------|--------|
| `SUPER` | Abre menú |
| `SUPER + RETURN` | Terminal (kitty) |
| `SUPER + SPACE` | Menú de aplicaciones (Wofi) |
| `SUPER + E` | Thunar (gestor de archivos) |
| `SUPER + Q` | Cerrar ventana activa |
| `SUPER + F` | Pantalla completa |

### Workspaces
| Atajo | Acción |
|-------|--------|
| `SUPER + 1-5` | Ir a workspace |
| `SUPER + SHIFT + 1-5` | Mover ventana a workspace |

### Control del Sistema
| Atajo | Acción |
|-------|--------|
| `SUPER + P` | 🔴 Apagar |
| `SUPER + SHIFT + P` | 😴 Suspender |
| `XF86AudioRaiseVolume` | 🔊 Aumentar volumen |
| `XF86AudioLowerVolume` | 🔉 Bajar volumen |
| `XF86AudioMute` | 🔇 Silenciar |
| `XF86MonBrightnessUp` | ☀️ Aumentar brillo |
| `XF86MonBrightnessDown` | 🌙 Bajar brillo |

### Navegación entre Ventanas
| Atajo | Acción |
|-------|--------|
| `SUPER + H` | Ventana a la izquierda |
| `SUPER + J` | Ventana abajo |
| `SUPER + K` | Ventana arriba |
| `SUPER + L` | Ventana a la derecha |

## 📁 Estructura del Proyecto

```
setup/
├── install.sh              # Script de instalación de paquetes
├── setup.sh                # Script de configuración principal
├── config/
│   ├── hyprland.conf       # Configuración de Hyprland (WM)
│   └── hyprpaper.conf      # Configuración de fondo de pantalla
├── waybar/
│   ├── config              # Configuración de la barra
│   └── style.css           # Estilos CSS de la barra
├── wallpapers/
│   └── fondo.jpg           # Fondo de pantalla
└── README.md               # Este archivo
```

## 🎨 Módulos de Waybar

La barra superior incluye:

| Módulo | Descripción | Ubicación |
|--------|-------------|-----------|
| **Workspaces** | Espacios de trabajo (1-5) | Izquierda |
| **Reloj** | Hora y fecha actual | Centro |
| **Red** | Conexión WiFi/Ethernet + IP | Derecha |
| **CPU** | Uso de procesador en % | Derecha |
| **RAM** | Memoria utilizada/total | Derecha |
| **Volumen** | Control de audio | Derecha |
| **Batería** | Estado y % de batería | Derecha |
| **Power Menu** | Botón para apagar/suspender | Derecha |

## 🎨 Personalización

### Cambiar Fondo de Pantalla

1. Reemplaza o añade tu imagen en `wallpapers/`
2. Edita `config/hyprpaper.conf`:
```
preload = ~/Pictures/tu_imagen.jpg
wallpaper = ,~/Pictures/tu_imagen.jpg
```
3. Recopia el archivo: `./setup.sh`

### Cambiar Atajos de Teclado

Edita `config/hyprland.conf` en la sección `bind`:
```
bind = SUPER, RETURN, exec, kitty     # SUPER + Enter ejecuta kitty
bind = SUPER, E, exec, wofi --show drun  # SUPER + E abre menú
```

### Personalizar Tema Visual

Edita `waybar/style.css`:
- Colores: Busca `#6366f1` (indigo principal)
- Transparencia: Edita `rgba(20, 20, 30, 0.95)`
- Fonts: Modifica `font-family` y `font-size`

## 🔧 Configuración Avanzada

### Agregar Más Workspaces

En `config/hyprland.conf`, añade más keybindings:
```bash
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
```

En `waybar/config`, añade números a `"format-icons"`:
```json
"6": "🎯",
"7": "📊",
"8": "🎬"
```

### Aplicaciones Incluidas

El setup incluye automáticamente:
- **kitty**: Terminal emulador rápido y moderno
- **Wofi**: Menú de aplicaciones
- **Thunar**: Gestor de archivos
- **Neovim**: Editor de texto avanzado
- **NetworkManager**: Gestor de conexiones

### Instalar Aplicaciones Adicionales

```bash
# Navegador
sudo pacman -S firefox

# Editor avanzado
sudo pacman -S code
```

## 📊 Información del Sistema en la Barra

El módulo de red muestra automáticamente:
- 🌐 Nombre de WiFi (SSID) y fuerza de señal
- 🔗 IP del router actual
- 📡 Tipo de conexión (WiFi/Ethernet)

Pasa el mouse para ver más detalles.

## 🐛 Solución de Problemas

### Barra no aparece
```bash
# Reinicia Hyprland
SUPER + M
# O reinicia la sesión completa
```

### No hay sonido
```bash
# Instala gestor de audio
sudo pacman -S pipewire pipewire-pulse

# Reinicia
reboot
```

### IP no muestra
```bash
# Verifica NetworkManager
systemctl status NetworkManager

# O habilítalo
sudo systemctl enable --now NetworkManager
```

### Fondo de pantalla no funciona
```bash
# Copia la imagen correctamente
cp tu_imagen.jpg ~/Pictures/fondo.jpg

# Reinicia hyprpaper
pkill hyprpaper
hyprpaper &
```

## 📚 Recursos Útiles

- [Documentación de Hyprland](https://wiki.hyprland.org/)
- [Waybar GitHub](https://github.com/Alexays/Waybar)
- [Arch Wiki - Hyprland](https://wiki.archlinux.org/title/Hyprland)

##  Changelog

### v1.2 (Actual)
- ✅ Módulo de red con IP
- ✅ Control de volumen funcional
- ✅ Botón de apagar mejorado
- ✅ Diseño visual modernizado
- ✅ Atajos de teclado completos
- ✅ Información de CPU/RAM

### v1.1
- Waybar básica funcional
- Hyprland configurado

---

**Mantenedor**: Setup Hyprland  
**Licencia**: MIT  
**Última actualización**: 2024
