
# Configuraciones de Windows

## Programas
- [Visual Studio Code](https://code.visualstudio.com/download)
- [SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer)
- [7Zip](https://www.7-zip.org/download.html)
- [VLC](https://www.videolan.org/vlc/download-windows.html)

## Eliminar programas por defecto preinstaladas en windows
~~~powershell
Get-AppxPackage -AllUsers | Remove-AppxPackage
~~~

### Reinstalar Microsoft Store
~~~powershell
Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
~~~

## Personalizar terminal de windows
1. Instalamos `Windows Terminal` desde la [*Microsoft Store*](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=es-mx&gl=MX) o desde el [*Instalador*](https://github.com/microsoft/terminal?tab=readme-ov-file#installing-and-running-windows-terminal)
2. Actualizamos [*Powershell*](https://learn.microsoft.com/es-mx/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4#msi) a la version 7
3. Instalamos una [*Nerd Font*](https://www.nerdfonts.com/font-downloads)
4. Procedemos a configurar [*Oh My Posh*](https://ohmyposh.dev/docs/installation/windows)
  - Instalación de forma manual 
~~~powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
~~~
 - Despues de la instalación, abrimos el archivo de perfil de nuestra sesión en powershell
~~~powershell
# Primero creamos el archivo profile de nuestra terminal 
New-Item -Path $PROFILE -Type File -Force

# Procedemos a editar el archivo
notepad $PROFILE

~~~

 - Agregamos la siguiente linea y guaradamos
~~~powershell
oh-my-posh init pwsh | Invoke-Expression
~~~

 - Reiniciamos la terminal
 - Para definir un nuveo [*Tema*](https://ohmyposh.dev/docs/themes), modificamos la linea que agregamos anteriormente en el `$PROFILE`
~~~powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/jandedobbeleer.omp.json" | Invoke-Expression
~~~

- Para agregar iconos de las carpetas y de los diferentes archivos realizamos los siguiente
~~~powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
~~~
- Agregamos al `$PROFILE` la siguiente linea
~~~powershell
Import-Module -Name Terminal-Icons
~~~

## Instalar Node.js
- Descargamos la ultima version de [`nvm`](https://github.com/coreybutler/nvm-windows/releases) e instalamos

```bash
// Lista las versiones disponibles para descargar
nvm list available

// Instalamos una version especifica
nvm install 18.20.2

// Para utilizar la versión descargada (Como administrador)
nvm use 18.20.2

// listamos las versiones descargadas
nvm ls

// Instalamos ultima version LTS
nvm install lts
```