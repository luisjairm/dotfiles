# Kitty


```bash

sudo apt install kitty
sudo apt install image

ln -s ~/dev/dotfiles/kitty/kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf
ln -s ~/dev/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```


# ZSH

Definir zsh por defecto

```bash
sudo apt install zsh
sudo usermod --shell /usr/bin/zsh user_name
```

## Plugins
Link Plugins: `https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins`

### zsh-autosuggestions
Link: `https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#packages`
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

## Agregamos la siguiente linea al .zshrc
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

### zsh-syntax-highlighting
Link: `https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md`
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Agregamos a .zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### Sudo 
Link: `https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh`

Para manejar los plugis de manera mas comoda, creamos una carpeta especifica
```bash
mkdir /usr/share/zsh-plugins
```
Dentro de la carpeta, descargamos el codigo del plugin con `wget`
```bash
# Agregamos el source al .zshrc

```

# Instalar Powelevel10k

link: `https://github.com/romkatv/powerlevel10k`
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```


# Node
Instalar `nvm` para manejar las versiones de `Node`:

Link: `https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating`

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
```

# React Native
Entorno para `React Native`

## Expo
Link Expo: `https://docs.expo.dev/get-started/installation/`

* Node LTS
* git
* Watchman (Linux, MacOS)

### Watchman
Para watchman instalamos `homebrew`, verificar que ya hemos agregado el email a git
Link: `https://brew.sh/` 
```bash
# Verificar en la pagina
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

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