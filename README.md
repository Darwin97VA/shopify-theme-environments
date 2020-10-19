# Shopify Theme

El proyecto está configurado para funcionar en 4 entornos que están basadas en 2 tiendas de Shopify y 2 temas en cada una. De esta forma se trata de reducir la brecha de diferencia entre cada el desarrollo de cada requerimiento y su implementación en la tienda de producción en vivo sin romper nada.

_______________________________________________________________________

## Instrucciones

- Antes de desarrollar se debe tener las variables de entorno configuradas en el archivo "```.env```"
- Sólo se deben aplicar comandos desde la ejución del archivo "``` dev.sh```".


### Para el Desarrollador

1 Crear una rama con el nombre del requerimiento.
    Ejemplo: El requerimiento se llama añadir botón "Add to cart":
    ``` git checkout -b btn_add_to_cart ```

2 Desarrollar todo en esa rama corriendo el siguiente comando:
    ``` dev.sh watch ```

3 Cada avance de ese requerimiento hacer un commit con tu ThemeID. 
    Ejemplo: ThemeID: 83123456977
    ``` git add . ```
    ``` git commit -m "83123456977 btnAddToCard" ```

4 Hacer git push de tu rama y luego deploy a tu tema.
    ``` git push origin btn_add_to_cart ```
    ``` dev.sh deploy ```

5 Logearse en AWS IAM y hacer un pull request a la rama development de tu rama.


### Para el Mantenedor del repositorio

6 Revisar el pull request y ver el ThemeID en el nombre del último commit

7 Previsualizar el tema de ese ThemeID y comprobar si se cumplió el requerimiento

8 Si el requerimiento se cumplió entonces hacer aceptar el Pull Request y fusionar a la rama development.

9 Actualizar la rama development de tu repositorio local (git pull)

10 Hacer deploy al tema principal de la tienda de Desarrollo.
    ``` dev.sh deploy:test ```

11 Informar a los encargados de ese requerimiento (¿y al cliente?) para la verificación

12 Si están de acuerdo hacer deploy al tema de prueba de la tienda de Producción
    ``` dev.sh deploy:beta ```

13 Si todo está OK entonces hacer deploy al tema principal de la tienda de Producción
    ``` dev.sh deploy:production ```


_______________________________________________________________________

## About

### Entornos
Hay 4 entornos: 
1 Tema del desarrollador de la Tienda de desarrollo
    Es el tema creado para el desarrollador y sólo lo usará ese desarrollador.
2 Tema principal de la Tienda de desarrollo
    Es el tema estable para el desarrollo. Este siempre será el mismo que el de la rama "development" del repositorio
3 Tema de prueba de la Tienda de producción
    Este es el tema de prueba en la tienda de producción. Acá ya se podrá previsualizar los cambios y es muy fiable.
4 Tema principal de la Tienda de producción
    Este es el tema que los usuarios finales verán.

### Dev.sh
- **dev.sh watch**
    Escucha los cambios del proyecto local y lo sube al Tema del desarrollador de la Tienda de desarrollo.

- **dev.sh deploy**
    Sube el proyecto local al Tema del desarrollador de la Tienda de desarrollo. 
    ``` dev.sh watch ``` ejecuta ``` dev.sh deploy ``` cada vez que hay un cambio.

- **dev.sh deploy:test**
    Sube el proyecto local al Tema de prueba en la tienda de producción.

- **dev.sh deploy:beta**
    Sube el proyecto local al Tema principal de la Tienda de desarrollo. 

- **dev.sh deploy:production**
    Sube el proyecto local al Tema principal de la Tienda de producción.
