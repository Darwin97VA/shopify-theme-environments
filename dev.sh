# obteniendo las variables de entorno desde .env
source '.env';


# ejecutando comando theme
if [ "$1" = "watch" ]; then
    theme watch --env=development

elif [ "$1" = "deploy" ]; then
    theme deploy --env=development

elif [ "$1" = "deploy:test" ]; then
    theme deploy --env=testing --allow-live

elif [ "$1" = "deploy:beta" ]; then
    theme deploy --env=production_beta

elif [ "$1" = "deploy:production" ]; then
    theme deploy --env=production_stable --allow-live
    
else
   echo "
   Falta un parámetro:
   - watch
   - deploy
   - deploy:test
   - deploy:beta
   - deploy:production
   "
fi


# Esperando que se presione algo para terminar
read -n1 -r -p "Press space to finish..." key