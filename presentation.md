
# Control de versiones con git

--------------------------------------------------------------------------------

# Información del curso

## Nivel de especialización

Intermedio

## Objetivo

El alumno conocerá el sistema de control de versiones git y aprenderá el uso de esta herramienta tanto desde línea de comandos, como desde un cliente de escritorio y vía web a través de Github.

--------------------------------------------------------------------------------

# Perfil del asistente

Estudiantes, pasantes o egresados de carreras afines a computación, desarrolladores y entusiastas de la programación.

## Conocimientos previos

+ Conocimientos básicos de GNU/Linux y Windows a nivel usuario
+ Uso de internet
+ Cuenta de correo electrónico
+ Conocimientos básicos de inglés a nivel técnico

--------------------------------------------------------------------------------

# Temario

1. Introducción a los sistemas de control de versiones
   1. Local
   2. Centralizado
   3. Distribuido

2. Introducción a git
   1. Inicializar un repositorio
   2. Agregar archivos
   3. Guardar cambios en el repositorio
   4. Borrar archivos
   5. Mover archivos
   6. Enviar cambios al servidor

--------------------------------------------------------------------------------

# Temario (cont)

3. Configuración del cliente git
   1. Datos del usuario
   2. Reparar fin de línea en los archivos
   3. Ignorar espacios en blanco

4. Trabajando con repositorios existentes
   1. Clonar un repositorio existente
   2. Resolución de conflictos
   3. Corregir el commit anterior

--------------------------------------------------------------------------------

# Temario (cont 2)

5. Introducción a Github
   1. Crear una cuenta en Github
   2. Administración de repositorios via web
   3. Cliente gráfico de git para Mac y Windows
   4. Documentación en Markdown

6. Trabajo colaborativo en Github
   1. Fork
   2. Pull requests
   3. gist
   4. Github Pages
   5. Wikis

--------------------------------------------------------------------------------

# 1. Introducción a los sistemas de control de versiones

## Sistema de control de versiones

+ Guarda las versiones del código fuente de un programa
+ Permite mostrar los cambios en el código
+ Trabaja principalmente con archivos de texto
+ Asocia el cambio con el autor
+ Tiene la capacidad de regresar a versiones anteriores

--------------------------------------------------------------------------------

## 1.1. Local

### Guardar cambios en archivos separados

```
	prog.c prog1.c prog2.c ... prog<n>.c
```

### Guardar cambios en carpetas separadas

```
  tarea/prog.c
  version_inicial/prog.c
  modificado2/prog.c
  vers-28sep/prog.c
  ProyectoFinal_2017-1_completo(Andres)/prog1.c
```

--------------------------------------------------------------------------------

#### Desventajas del control de versiones local

+ Se tienen muchos archivos bastante similares
+ No se conoce cual es la última versión
+ Es necesario copiar el archivo de trabajo constantemente
+ Al modificar el archivo de trabajo se pierde la versión anterior
+ Cuando se borra el archivo de trabajo se pierde esa revisión

--------------------------------------------------------------------------------

### Enviar cambios por correo electrónico

+ Se genera un correo por cada versión enviada
+ Puede ser tedioso encontrar una versión anterior

  <img alt="Thunderbird" src="img/1_1-thunderbird.png" style="width: auto; height: 50px;" />
  <img alt="Gmail" src="img/1_1-gmail.svg" style="width: auto; height: 50px;" />
  <img alt="Apple Mail" src="img/1_1-apple-mail.png" style="width: auto; height: 50px;" />
  <img alt="Outlook" src="img/1_1-outlook.svg" style="width: auto; height: 50px;" />

--------------------------------------------------------------------------------

### Utilizar almacenamiento en la nube

+ Algunos servicios de almacenamiento en la nube permiten regresar a versiones anteriores
+ Muchos de los servicios gratuitos únicamente permiten un número finito de versiones anteriores
+ Algunas veces los servicios de almacenamiento quitan las versiones anteriores más antiguas

  <img alt="Dropbox" src="img/1_1-dropbox.svg" style="width: auto; height: 50px;" />
  <img alt="GoogleDrive" src="img/1_1-google_drive.png" style="width: auto; height: 50px;" />
  <img alt="Evernote" src="img/1_1-evernote.svg" style="width: auto; height: 50px;" />
  <img alt="box.net" src="img/1_1-box.svg" style="width: auto; height: 50px;" />
  <img alt="OneDrive" src="img/1_1-onedrive.svg" style="width: auto; height: 50px;" />
  <img alt="ownCloud" src="img/1_1-owncloud.svg" style="width: auto; height: 50px;" />

--------------------------------------------------------------------------------

## 1.2. Centralizado - CVCS

+ Se basa en un modelo *cliente-servidor*
+ El servidor tiene una copia de todas las versiones del código
+ Los clientes *clonan* el repositorio y tienen una *copia de trabajo* que pueden modificar
+ Cuando los cambios están listos, los clientes los envían al servidor
+ Si el servidor falla, se pierden todas las versiones del proyecto

  <img alt="SVN" src="img/1_2-svn.svg" style="width: auto; height: 50px;" />
  <br />
  <img alt="svn-actions" src="img/1_2-svn_actions.svg" style="width: auto; height: auto;" />

--------------------------------------------------------------------------------

## 1.3. Distribuido - DVCS

+ Cada cliente tiene una copia de todas las versiones del proyecto
+ Si el servidor falla es posible copiar todas las versiones desde un cliente
+ Es posible establecer estructuras jerárquicas

  <img alt="git" src="img/1_3-git.svg" style="width: auto; height: 50px;" />
  <img alt="hg" src="img/1_3-hg.svg" style="width: auto; height: 50px;" />
  <img alt="bzr" src="img/1_3-bzr.svg" style="width: auto; height: 50px;" />
  <img alt="arch" src="img/1_3-arch.png" style="width: auto; height: 50px;" />
  <img alt="BitKeeper" src="img/1_3-bitkeeper.png" style="width: auto; height: 50px;" />

--------------------------------------------------------------------------------

# 2. Introducción a git

+ El desarrollo del kernel Linux entre los años 1991 - 2002 no utilizaba un control de versiones *per-se*
+ En 2002 se utilizó un DVCS propietario llamado BitKeeper, que se ofrecía sin costo a los miembros del proyecto
+ En 2005 la compañía quiso cobrar el uso del software
+ La comunidad de desarrolladores, incluyendo a Linus Torvalds, optó por desarrollar su propia herramienta

  <img alt="BitKeeper" src="img/2-bitkeeper.png" style="width: auto; height: 50px;" />
  <span style="font-size: 5em;">⇒<!--⇨--></span>
  <img alt="git" src="img/2-git.svg" style="width: auto; height: 50px;" />

--------------------------------------------------------------------------------

### Características de git

+ Velocidad
+ Diseño simple
+ Soporte para múltiples ramas
+ Enfoque distribuido
+ Capacidad de alojar grandes proyectos
+ Varios desarrolladores pueden trabajar en el mismo proyecto
+ Incluye verificación de integridad en los archivos

--------------------------------------------------------------------------------

### Áreas de trabajo

+ `git` presenta tres áreas de trabajo, asociadas con los estados que puede tener un archivo
+ <span style="color: OrangeRed;">**Working Directory**</span> es el directorio de trabajo.
  * En el se cr y borran los archivos del proyecto.
+ <span style="color: DarkCyan;">**Staging Area**</span> es el área donde se preparan los cambios que serán versionados
+ <span style="color: DimGrey;">**El directorio `.git`**</span> guarda todas las versiones de los archivos del proyecto

<img alt="" src="img/book/2_0-areas.png" longdesc="https://git-scm.com/book/en/v2/Getting-Started-Git-Basics#The-Three-States" />

--------------------------------------------------------------------------------

#### Estados de un archivo

Estado    | Descripción                                                | Comando
---------:| ---------------------------------------------------------- |:-----------------------------------:
<span style="color: OrangeRed;">**Modified**</span> | El archivo fue editado en el *directorio de trabajo*              | `editor archivo`
<span style="color: DarkCyan;">**Staged**</span>    | El archivo (nuevo o modificado) fue agregado al *área de staging* | `git add archivo`
<span style="color: DarkCyan;">**Staged**</span>    | El archivo se movió o renombró utilizando `git`                   | `git mv archivo1 archivo2`
<span style="color: DarkCyan;">**Staged**</span>    | El archivo se borró del *área de staging* utilizando `git`        | `git rm archivo`
<span style="color: DimGrey;">**Committed**</span>  | Los cambios del archivo fueron guardados en el repositorio        | `git commit archivo`

--------------------------------------------------------------------------------

### Instalar git en GNU/Linux

+ En [Debian GNU/Linux](https://www.debian.org/ "Debian GNU/Linux") utilizando [`apt-get`](http://linux.die.net/man/8/apt-get "man 8 apt-get") o [`aptitude`](http://linux.die.net/man/8/aptitude "man 8 aptitude")

```sh
root@debian:~# aptitude install git
```

+ En [Red Hat ](https://www.redhat.com/ "Red Hat Linux"), [CentOS](https://www.centos.org/ "CentOS") y [Oracle Linux](https://linux.oracle.com/ "Oracle Enterprise Linux") se utiliza [`yum`](http://linux.die.net/man/8/yum "man 8 yum")

```sh
[root@centos ~]# yum install git
```

Para instalar en otras variantes de UNIX ver la [documentación oficial](https://git-scm.com/download/linux)

--------------------------------------------------------------------------------

## 2.1. Inicializar un nuevo repositorio

+ Para crear un repositorio se utiliza el comando [`git init`](https://git-scm.com/docs/git-init "git-init(1)")

```man
$ man git-init

git-init - Create an empty Git repository or reinitialize an existing one

git init [-q | --quiet] [--bare] [--template=<template_directory>]
         [--separate-git-dir <git dir>] [--shared[=<permissions>]] [directory]
```

+ Es posible crear el directorio antes de inicializar

```sh
tonejito@linux:~$ mkdir repositorio
tonejito@linux:~$ cd repositorio
tonejito@linux:~/repositorio$ git init
Initialized empty Git repository in /home/tonejito/repositorio/.git/
tonejito@linux:~/repositorio$ ls -lA
total 0
drwxr-xr-x 7 tonejito users 147 Jun  3 17:16 .git
```
--------------------------------------------------------------------------------

+ También se puede especificar el directorio de destino en el comando [`git init`](https://git-scm.com/docs/git-init "git-init(1)")

```sh
tonejito@linux:~$ git init otro-repo
Initialized empty Git repository in /home/tonejito/otro-repo/.git/
tonejito@linux:~$ ls -lA otro-repo/
total 0
drwxr-xr-x 7 tonejito users 147 Jun  3 17:19 .git
```

+ Si el repositorio será compartido en un servidor, utilizar la opción `--shared`
+ No olvides ajustar los permisos del directorio

```sh
tonejito@linux:~$ git init --shared=group repo-compartido
Initialized empty shared Git repository in /home/tonejito/repo-compartido/.git/
tonejito@linux:~$ chmod -R g+rw repo-compartido/
tonejito@linux:~$ ls -la repo-compartido/
total 4
drwxrwsr-x  3 tonejito users   17 Jun  6 09:50 .
drwxr-xr-x 57 tonejito users 4096 Jun  6 09:50 ..
drwxrwsr-x  7 tonejito users  147 Jun  6 09:50 .git
```

+ Si tienes dudas, [RTFM](https://git-scm.com/docs/ "git Documentation")

--------------------------------------------------------------------------------

## 2.2. Agregar archivos

+ El comando [`git add`](https://git-scm.com/docs/git-add "git-add(1)") se utiliza para especificar qué archivos incluirá git en el control de versiones
+ Los cambios del <span style="color: OrangeRed;">**Directorio de trabajo**</span> se incluyen en el <span style="color: DarkCyan;">**Área de Staging**</span>, es decir, se marcan para ser enviados en un *commit*
+ El <span style="color: DarkCyan;">**Área de Staging**</span> también es conocida como **index**
+ La página de `man` de `git add` muestra las opciones de línea de comandos

```
git-add - Add file contents to the index

git add [-n]  [-v]  [--force | -f]  [--interactive | -i]  [--patch | -p]
        [--edit | -e]  [--[no-]all | --[no-]ignore-removal | [--update | -u]]
        [--intent-to-add | -N] [--refresh] [--ignore-errors] [--ignore-missing]
        [--]  [<pathspec>...]
```

--------------------------------------------------------------------------------

+ Crear un archivo de texto con el nombre `README.md` y escribir algún mensaje simple en el
+ Muchos repositorios utilizan [Markdown](http://daringfireball.net/projects/markdown/ "Markdown") para el archivo **README** de sus repositorios
+ Github tiene una [versión especial de Markdown](https://help.github.com/categories/writing-on-github/ "GitHub Flavored Markdown")
+ Existen varios editores en línea como [Dillinger](http://dillinger.io/ "Dillinger") y [StackEdit](https://stackedit.io/editor "StackEdit")

```sh
tonejito@linux:~/repositorio$ editor README.md
```

	# Mi repositorio de git
	
	Andrés Hernández

--------------------------------------------------------------------------------

+ Ejecutar el comando [`git status`](https://git-scm.com/docs/git-status "git-status(1)") para revisar si hay cambios

```
tonejito@linux:~/repositorio$ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	README.md

nothing added to commit but untracked files present (use "git add" to track)
```

--------------------------------------------------------------------------------

+ Agregar el archivo `README.md` al repositorio con el comando [`git add`](https://git-scm.com/docs/git-add "git-add(1)")

```sh
tonejito@linux:~/repositorio$ git add README.md
```

+ Ejecutar una vez mas [`git status`](https://git-scm.com/docs/git-status "git-status(1)") para revisar si hay cambios

```
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   README.md
```

+ Desapareció el mensaje que sugería utilizar `git add` (comparar con la lámina anterior)

+ El cambio **aún no está guardado**, ver siguiente sección

--------------------------------------------------------------------------------

## 2.3. Guardar cambios en el repositorio

+ Para enviar un cambio del <span style="color: DarkCyan;">**Área de Staging**</span> al <span style="color: DimGrey;">**directorio `.git`**</span> se utiliza el comando [`git commit`](https://git-scm.com/docs/git-commit "git-commit(1)")
+ Cada revisión generada guarda una entrada en la [bitácora del repositorio](https://git-scm.com/docs/git-log "git-log(1)")
+ La página de `man` de `git commit` muestra las opciones de línea de comandos

```
git-commit - Record changes to the repository

git commit [-a | --interactive | --patch]  [-s]  [-v]  [-u<mode>]  [--amend]
           [--dry-run]  [(-c | -C | --fixup | --squash) <commit>]
           [-F <file> | -m <msg>]  [--reset-author]  [--allow-empty]
           [--allow-empty-message]  [--no-verify]  [-e]  [--author=<author>]
           [--date=<date>]  [--cleanup=<mode>]  [--[no-]status]
           [-i | -o]  [-S[<key-id>]]  [--]  [<file>...]
```

--------------------------------------------------------------------------------

+ Para guardar el archivo recién creado en la sección anterior se ejecuta [`git commit`](https://git-scm.com/docs/git-commit "git-commit(1)")

```sh
tonejito@VF-117D:~/repositorio$ git commit README.md
```

+ Se abre un editor de texto donde debe escribirse *el título* y *la descripción* del commit
+ Todas las líneas que inicien con el símbolo `#` serán ignoradas
+ Si se guarda un mensaje vacío, se cancela el proceso de `commit`

	# Please enter the commit message for your changes. Lines starting
	# with '#' will be ignored, and an empty message aborts the commit.
	# Explicit paths specified without -i or -o; assuming --only paths...
	# On branch master
	#
	# Initial commit
	#
	# Changes to be committed:
	#       new file:   README.md
	#

--------------------------------------------------------------------------------

### Estructura del mensaje de un *commit*

+ Se recomienda que la estructura del mensaje de un *commit* tenga los siguientes elementos
+ El único elemento requerido es el **título**

Línea | Elemento               | Contenido
:----:| :--------------------: |:-----------------------------------------------
  1   | Título del commit      | Descripción **breve** y **concreta** del cambio aplicado, menos de 50 caracteres
  2   | Línea en blanco        | Se utiliza para separar el título del cuerpo
  3   | Descripción del commit | Mensaje que explica el cambio aplicado a profundidad
  …   | ✓                      | Puede abarcar varias líneas de texto
  …   | ✓                      | Es posible insertar elementos de sintáxis de Markdown
  …   | ✓                      | Se pueden utilizar listas para enumerar elementos de manera vertical


--------------------------------------------------------------------------------

## 2.4. Borrar archivos

## 2.5. Mover archivos

## 2.6. Enviar cambios al servidor

--------------------------------------------------------------------------------

# 3. Configuración del cliente git

## 3.1. Datos del usuario

## 3.2. Reparar fin de línea en los archivos

## 3.3. Ignorar espacios en blanco

--------------------------------------------------------------------------------

# 4. Trabajando con repositorios existentes

## 4.1. Clonar un repositorio existente

## 4.2. Resolución de conflictos

## 4.3. Corregir el commit anterior

--------------------------------------------------------------------------------

# 5. Introducción a Github

## 5.1. Crear una cuenta en Github

## 5.2. Administración de repositorios via web

## 5.3. Cliente gráfico de git para Mac y Windows

## 5.4. Documentación en Markdown

--------------------------------------------------------------------------------

# 6. Trabajo colaborativo en Github

## 6.1. Fork

## 6.2. Pull requests

## 6.3. gist

## 6.4. Github Pages

## 6.5. Wikis

--------------------------------------------------------------------------------

# Referencias

+ https://git-scm.com/docs
+ https://git-scm.com/book/en/v2
+ https://github.com/papadako/git-a-little-tale/
+ https://wiki.openstack.org/wiki/GitCommitMessages
+ https://git-scm.com/book/ch5-2.html#Commit-Guidelines
+ http://chris.beams.io/posts/git-commit/


--------------------------------------------------------------------------------
<!-- zoom-out slide -->

