
# Instalar Programas
~~~bash
sudo dpkg -i nombre_programa
~~~
* [VSCode](https://code.visualstudio.com/download)
* [lsd](https://github.com/lsd-rs/lsd/releases)
* [Dbeaber](https://dbeaver.io/download/)

## [VLC](https://community.linuxmint.com/software/view/vlc)
~~~bash
sudo apt install vlc
~~~

## GPick
~~~bash
sudo apt install gpick
~~~

## [Postman](https://www.postman.com/downloads/)
1. Descromprimir: `tar -xvf postman`
2. Mover a: `/opt/`
3. Crear el icono de lanzamiento `postman.desktop` en: `/usr/share/applications/`
~~~bash
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman %U
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
~~~

## [Git](https://git-scm.com/)
~~~bash
sudo apt install git

# Configuración
git config --global user.email email_github
git config --global user.name name
~~~

- Clonar el repositorio en ~: `git clone --depth=1 https://github.com/luisjairm/dotfiles.git`
- Cofigurar SSH en github: `https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent`

## [Kitty](https://sw.kovidgoyal.net/kitty/conf/)
~~~bash

sudo apt install kitty

# Enlaces simbolicos a mi configuración
ln -s ~/dotfiles/kitty/themes/Floraverse.conf ~/.config/kitty/theme.conf
ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
~~~

## ZSH
### 1. [Nerdfonts](https://www.nerdfonts.com/font-downloads)
* CaskaydiaMono NF - VSCode
* ComicShannsMono Nerd Font - Terminal

Descromprimir en: `/usr/local/share/fonts/nonbre_carpeta_fuentes`

### 1. [Powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#manual)
~~~bash
# Instalar en ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
~~~


### 2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone)
~~~bash
# Clonar en la carpeta ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
~~~

### 3. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
~~~bash
# Clonar en la carpeta ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
~~~

### 4. [sudo](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh)
~~~bash
# Descargar en la carpeta ~/.zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh
~~~

### 5. ZSH
~~~bash
sudo apt install zsh

## Definir por defecto para un usuario
sudo usermod --shell /usr/bin/zsh user_name

# Enlace a mi configuración
ln -s ~/dotfiles/zsh/.zshrc
~~~


## [Node](https://nodejs.org/en)
### 1. [NVM](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
~~~bash
# Instalamos desde el repositorio
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Listar versiones disponibles
nvm ls-remote

# Instalar versión especifica
nvm install 20.18.0
~~~


## [React Native](https://reactnative.dev/)
### [Eas CLI](https://expo.dev/eas)
~~~bash
npm install --global eas-cli
~~~


## Latex
### 1. TextLive 
~~~bash
sudo apt install texlive-full
~~~

### Visor de PDF
~~~bash
# Previsualizador de pdf
sudo apt install zathura

# Configuramos zathura por defecto 
xdg-mime default zathura.desktop application/pdf
~~~

## [Inkscape](https://inkscape.app/es/)
~~~bash
sudo apt install inkscape
~~~

### SVG a PNG
~~~bash
inkscape --export-type=png --export-filename=archivo.png --export-dpi=300 archivo.svg
~~~
### SVG a PDf
~~~bash
inkscape -z -D --file=archivo.svg --export-pdf=archivo.pdf
~~~

## MySQL

### Instalación
Instalamos primero el servidor 
```bash
sudo apt install mysql-server
```
Verificamos la instalación con `mysql --version`

### Configuramos el componente "VALIDAR CONTRASEÑA"


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

## Postgressql

### Instalación
~~~bash
sudo apt install postgresql
~~~

### Configurar por primera vez (Linux Mint)
1. Conectamos con el usuario por defecto `postgres`
~~~bash
sudo -u postgres psql template1
~~~
2. Establecemos una contraseña para el usuario postgres
~~~bash
ALTER USER postgres with encrypted password 'xxxxxxx'; 
~~~
3. Editamos el archivo `pg_hba.conf`, el `14` depende de la versión instalada
~~~bash
sudo nano /etc/postgresql/14/main/pg_hba.conf
~~~
cambiamos `peer` a `md5`
~~~conf
local      all     postgres     md5
~~~
4. Reiniciamos la base de datos
~~~bash
sudo /etc/init.d/postgresql restart
~~~
5. Conectamos, con la contraseña agregada en el paso 2.
~~~bash
psql -U postgres
~~~
### Crear backup de base de datos
~~~bash
pg_dump -U username -d db_name --data-only --column-inserts > filename.sql
~~~

## Samba
### Instalación
~~~bash
sudo apt install samba
~~~

### Configuración

Agregar un nuevo usuario al sistema linux
~~~bash
sudo useradd nombre_usuario
sudo passwd nombre_usuario
~~~


Agregamos el usuario a samba, el usuario debe estar previamente creado en el sistema

~~~bash
sudo smbpasswd -a one
sudo service smbd restart # Reiniciamos el servicio
~~~

Editamos el archivo de configuración
~~~bash
sudo nano /etc/samba/smb.conf
~~~
Agregamos la siguiente al final del archivo, esto es para cada carpeta que se quiera compartir
~~~conf
[SharedFolderName]
path = "/path/to/folder"  
read only = no
browseable = yes
writeable = yes
valid users = one, two
create mask = 0640
directory mask = 0750
~~~

## Staruml 
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

# Apariencia
### Iconos
Descomprimir y mover a: `/usr/share/icons`
- [Candy Icons](https://www.xfce-look.org/p/1305251/)

### Tema
Descomprimir y mover a: `/usr/share/themes`
- [Tokyo Nigth Dark BL](https://www.xfce-look.org/p/1681315/)