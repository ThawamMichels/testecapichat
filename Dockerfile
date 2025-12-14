# Build stage
FROM node:20-alpine AS build

WORKDIR /app

# Copia package.json primeiro para aproveitar cache do Docker
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o resto do código
COPY . .

# Faz o build de produção
RUN npm run build

# Production stage - Nginx para servir arquivos estáticos
FROM nginx:alpine

# Copia configuração customizada do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos buildados
COPY --from=build /app/dist /usr/share/nginx/html

# Expõe porta 80
EXPOSE 80

# Comando para rodar o Nginx
CMD ["nginx", "-g", "daemon off;"]
