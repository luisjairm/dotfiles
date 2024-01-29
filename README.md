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





