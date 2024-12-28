# Usa una imagen de Node.js para construir la aplicación
FROM node:16 as build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de tu proyecto al contenedor
COPY package*.json ./
COPY .env.production .env
COPY . ./

# Instala las dependencias y construye la aplicación
RUN npm install
RUN npm run build

# Usa una imagen de Nginx para servir los archivos estáticos
FROM nginx:stable-alpine

# Copia los archivos estáticos generados por Vue al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto por defecto de Nginx
EXPOSE 80

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
