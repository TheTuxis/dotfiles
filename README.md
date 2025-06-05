# dotfiles

Este repositorio contiene configuraciones personales para varias herramientas de desarrollo y terminal. Está pensado para ser gestionado con [GNU Stow](https://www.gnu.org/software/stow/) y así mantener los archivos bajo control de versiones.

## Estructura

Cada directorio corresponde a la configuración de una aplicación específica. Algunos ejemplos son:

- `bash/` y `zsh/` &ndash; scripts y configuraciones de shell.
- `git/` &ndash; archivo de configuración global de Git.
- `nvim/` &ndash; distintas configuraciones de Neovim organizadas por lenguaje o propósito.
- `tmux/` y `wezterm/` &ndash; ajustes de terminal multiplexers y emuladores.
- `alacritty/` y `mc/` &ndash; configuraciones adicionales para terminales y utilidades de archivos.

## Instalación rápida

1. Clona este repositorio en tu directorio de trabajo:
   ```bash
   git clone https://github.com/usuario/dotfiles.git
   cd dotfiles
   ```
2. Usa `stow` para enlazar las configuraciones que necesites. Por ejemplo, para aplicar la configuración de Git y Zsh:
   ```bash
   stow git
   stow zsh
   ```
3. Repite el proceso con los demás módulos según tus preferencias.

### Paquetes adicionales

El script `install_brew_packages.sh` instala herramientas comunes utilizando Homebrew. Ejecuta el script para instalar dependencias útiles como Neovim, fzf, lazygit, entre otras.

```bash
./install_brew_packages.sh
```

## Uso de múltiples configuraciones de Neovim

Dentro de `nvim/.config/` encontrarás varias configuraciones pensadas para distintos entornos (general, Go, Python, Rust, etc.). Puedes iniciarlas exportando la variable `NVIM_APPNAME` antes de lanzar Neovim:

```bash
NVIM_APPNAME=GolangNvim nvim
```

El script `zsh/setup-zsh.sh` también incluye una función llamada `nvims` para seleccionar interactivamente la configuración deseada mediante `fzf`.

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

