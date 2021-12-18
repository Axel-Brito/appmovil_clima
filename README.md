# appmovil
 
# AppMovil_clima
Implementación de un AppMovil en flutter, en donde se despliega informacion climatica sobre lugares.

## Clonar repositorio
En primera instancia, se debe clonar el respositorio mediante el uso de GIT. Debe ingresar el siguiente comando por terminarl:

-```git clone https://github.com/Axel-Brito/appmovil_clima.git```

Una vez clonado el repositorio debe ingresar a la carpeta creada con el comando:

-```cd ./appmovil_clima.git```

Ahora debemos instalar los paquetes necesarios para correr el programa. Estas dependencias son añadidas automaticamente en el archivo pubspec.yaml.

-``` flutter pub get```

Ya con los paquetes instalados, debemos ejecutar un emulador android o iOS para ejecutar el programa, para esto usamos AndroidStudio o algun otro emulador.

Cuando el emulador este funcionando correctamente, podemos correr el programa con:

-```flutter run```

## Descarga de Android Studio

Para descargar android studio debemos ingresar a:

-```https://developer.android.com/studio?hl=es-419```

Seleccionamos el sistema operativo para nuestro ordenador y descargamos.

Una vez finalizada la descarga lo iniciamos he ingresamos a la configuración del SDK, puede ser a traves del engranaje o Tools->SDK Manager.

Aca debemos presionar una opción de android, es recomendable escojer la opción que ten un API Level definido, luego instalamos y aplicamos.

Luego ingresamos a la configuracion del AVD Manager, el cual nos proporciona la opción de crear una emulador virtual. Presionamos Create Virtual Device y creamos un emulador virtual, es importante que cuente con acceso a Android Store o Play Store. Recomendamos el Pixel 4 API 30.

## Lanzamiento de emulador y programa

Ya con estas configuraciones realizadas procedemos a iniciar el programa. Para esto debemos ir a Visual Studio Code y presionar Ctrl+Shift+P y escribrimos Launcher Emulator, lo seleccionamos y escogemos la imagen creada Pixel 4 API 30. Esto puede tardar varios minutos.

Cuando el emulador este cargado, iniciamos el programa con el comando flutter run.

