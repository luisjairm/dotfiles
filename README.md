
* [Guía Windows](windows/README-win.md)



# Linux

## Programas requeridos

* [Visual Studio Code](https://code.visualstudio.com/download)
* [LSD](https://github.com/lsd-rs/lsd)
* [Android Studio](https://developer.android.com/studio?hl=es-419)

Para instalar un programa `.deb` se debe ejecutar `sudo dpkg -i nombre_del_programa`

Los programas que tienen un instalador `.deb` como es el caso de Android Studio: 
1. Descargargar el archivo comprimido
2. Descomprimir 
3. Mover la carpeta del programa a `/opt/`
4. Crear un lanzador en la carpeta `/usr/share/applications`,  
~~~bash
# nombre de archivo: nombre_aplicación.desktop
[Desktop Entry]
Name=Nombre_de_tu_aplicación
Comment=Comentario_opcional
Exec=ruta/a/tu/aplicación
Icon=ruta/a/icono.png
Terminal=false
Type=Application
Categories=Categoria1,Categoria2
~~~

## Kitty

```bash

sudo apt install kitty

ln -s ~/dev/dotfiles/kitty/kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf
ln -s ~/dev/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```


## ZSH

Definir zsh por defecto

```bash
sudo apt install zsh
sudo usermod --shell /usr/bin/zsh user_name
```

## Instalar Powelevel10k

[Documentación](`https://github.com/romkatv/powerlevel10k`)
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```


## [Plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)


### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#packages)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

## Agregamos la siguiente linea al .zshrc
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Agregamos a .zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### [Sudo](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh)

Para manejar los plugis de manera mas comoda, creamos una carpeta especifica
```bash
mkdir /usr/share/zsh-plugins
```
Dentro de la carpeta, descargamos el codigo del plugin con `wget`
```bash
# Agregamos el source al .zshrc

```


# Node
Instalar [`nvm`](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
) para manejar las versiones de `Node`:


```bash
# Verificar en el repositorio
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Reiniciamos la terminal
# Listamos las versiones de node disponibles
nvm ls-remote

# Instalamos la versión
nvm install 18.19.0

# Seleccionamos la versión descargada
nvm use 18.19.0

# Verificamos las instalaciones
node --version
npm --version
```

# Git

```bash
sudo apt install git

# Configuración
git config --global user.email email_github
git config --global user.name name


# Actualizar el la url de origin
git remote set-url origin new.git.url/here
```



# Github 
Configurar SSH para realizar acciones desde linux

[* Ver Guia para generar una nueva clave](https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

# React Native
Entorno para `React Native`

## Expo
Link Expo: `https://docs.expo.dev/get-started/installation/`

* Node LTS
* git

### Expo Cli
```bash
npm install -g expo-cli

## Iniciar proyecto
npx create-expo-app --template
```

### Eas CLI
```bash
npm install -g eas-cli
```


# Latex
```bash
# Latex
sudo apt install texlive-full

# Previsualizador de pdf
sudo apt install zathura

# Configuramos zathura por defecto 
xdg-mime default zathura.desktop application/pdf
```

# <a href="https://github.com/neovim/neovim/releases">Nvim</a>

```bash
# Descargamos la ultima version
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# Agregamos los permisos
chmod u+x nvim.appimage

# Movemos a la carpeta /usr/local/bin
sudo mv nvim.appimage /usr/local/bin/nvim
```

## Plugins
* Si no se tiene instalado lua:
  ```bash
  sudo apt install lua5.4  
  ```

* Como primer paso instalamos el manejador de plugins ejecutando el siguiente comando: 
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Creamos el archivo `init.vim` dentro de `~/.config/nvim`
* Aquí podremos agregar configuraiciones como las siguientes:

```bash
set number
set relativenumber
set tabstop=4
set shiftwidth=4
colorscheme desert

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
" Aqui podremos agregar los repositorios de los pluguins que vayamos a instalar

call plug#end()
``` 

* Instalar plugin: `:PlugInstall`
* Actualizar plugin: `:PlugUpdate`
* Para eliminar un plugin tenemos que comentat o eliminar el repositorio y ejecutar: `:PlugClean` 


# Apariencia

## Iconos
Link: <a href='https://www.xfce-look.org/p/1305251/' target='_blank'>Candy Icons</a>

Descomprimir y mover a `/usr/share/icons`

# Tema

Link: <a href='https://www.xfce-look.org/p/1681315/' target='_blank'>Tokyo Nigth Dark BL</a>

Descomprimir y mover a `/usr/share/themes` 

# Staruml 
Solucionar key

`v5.1.0`

Todos los comandos deben hacerse en modo root

1. Instalamos `asar` via `npm`
```bash
npm i asar -g
```

2. Extraemos el codigo
```bash
cd <path_to_staruml>/resources/ # normalmente es /opt/StarUML/resources/
asar extract app.asar app
```

3. Edit `src/engine/license-manager.js`

Cambiamos
```js
  checkLicenseValidity () {
    if (packageJSON.config.setappBuild) {
      setStatus(this, true)
    } else {
      this.validate().then(() => {
        setStatus(this, true)
      }, () => {
        setStatus(this, false)
        UnregisteredDialog.showDialog()
      })
    }
  }
```
a
```js
  checkLicenseValidity () {
      setStatus(this, true)
  }
```

Y tambien
```js
register (licenseKey) {
    return new Promise((resolve, reject) => {
      $.post(app.config.validation_url, {licenseKey: licenseKey})
        .done(data => {
          if (data.product === packageJSON.config.product_id) {
            var file = path.join(app.getUserPath(), '/license.key')
            fs.writeFileSync(file, JSON.stringify(data, 2))
            licenseInfo = data
            setStatus(this, true)
            resolve(data)
          } else {
            setStatus(this, false)
            reject('unmatched') /* License is for old version */
          }
        })
        .fail(err => {
          setStatus(this, false)
          if (err.status === 499) { /* License key not exists */
            reject('invalid')
          } else {
            reject()
          }
        })
    })
  }
```

a

```js
 register (licenseKey) {
    return new Promise(() => { setStatus(this, false) })
  }
```

4. Por ultimo
```bash
asar pack app app.asar
```

# Inkscape
```bash
sudo apt install inkscape
```

## Convertir svg en png

```bash
inkscape --export-type=png --export-filename=archivo.png --export-dpi=300 archivo.svg
```

## Convertir svg to pdf
```bash
inkscape -z -D --file=archivo.svg --export-pdf=archivo.pdf
```

# MySQL

## Instalación
Instalamos primero el servidor 
```bash
sudo apt install mysql-server
```
Verificamos la instalación con `mysql --version`

## Configuramos el componente "VALIDAR CONTRASEÑA"


1. Instalamos mysql-server
```bash
sudo apt install mysql-server
```

2. Verificamos la instalción
```bash
mysql --version
```

3.Pasamos a la configuración 
```bash
sudo mysql_secure_installation
```
Lo ideal es marcar todo con "y"


4. Despues de esto ya podremos utilizar mysql de la siguiente manera
```bash
sudo msyql -u root
```
Mysql por default utilizar el `auth_socket` lo que le permite autenticarse con las credenciales del sistema operativo.
Para pruebas en local puede dar algunos problemaa, asi que procedemos a cambiarlo.

5. Definimos una contraseña para el usuario root

```bash 
# Crea la contraseña
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'contraseña';

# Resetea los privilegios
FLUSH PRIVILEGES;
```

Ya podemos acceder sin la necesidad de sudo y con la contraseña previamente asignada al usuario root
```bash
mysql -u root -p
```

7. Servicio Mysql
```bash
# Iniciar 
sudo systemctl start mysql

# Detener
sudo systemctl stop mysql

# Reiniciar
sudo systemctl restart mysql

# Verificar el estado
sudo systemctl status mysql

```
