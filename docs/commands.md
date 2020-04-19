Comandos e Informações Úteis
============================

## Instalando o slidy
```
pub global activate slidy
```
## Criando a estrutura com o slidy
```
slidy start
```
## Instalando depedencias com o slidy
* firebase_core
* google_sign_in
* image_picker
* firebase_auth
* firebase_storage
* cloud_firestore
* font_awesome_flutter
* geolocator
* google_maps_flutter
* rxdart
* dio
* flutter_mobx
* mobx
* flutter_modular
* package_info
* url_launcher

```
slidy install <nome da depedencia>
```
## Simplificando comandos com o slidy
Camando
```
flutter pub run build_runner watch --delete-conflicting-outputs
```
Simplificado
```
slidy run mobx
```
## Crindo Modules com o slidy
* home
* information
* login
* marcador
* register
* settings

Caminho padrão para modulos
```
modules/<nome do modulo>
```
Comando para criar modulo
```
slidy generate module <caminho>/<nome do modulo>
```
Comando para criar modulo com controller e page
```
slidy generate module <caminho>/<nome do modulo> -c
```
## Criando Pages com o slidy
* splash_screen
* about

Caminho padrão para pages
```
pages/<nome da page>
```
Comando para criar paginas
```
slidy generate page <caminho>/<nome da pagina>
```
## Criando Controller com o slidy
Comando para criar controller
```
slidy generate controller <caminho>/<nome do controller>
```
## Criando Repository com o slidy
* marker
* type_marker
* user
Caminho padrão para pages
```
repositories/<nome do repository>/repository/<nome do repository>
```
Comando para criar repository
```
slidy generate repository <caminho>/<nome da repository>
```
## Criando Widgets com o slidy
Caminho padrão para widgets
```
modules/<nome do modulo>/components/<nome do widget>
```
Comando para criar widget
```
slidy generate widget <caminho>/<nome do widget> 
```


