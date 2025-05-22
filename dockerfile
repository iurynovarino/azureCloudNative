# Usa a imagem base oficial do Nginx com Alpine Linux (leve)
FROM nginx:alpine

# Copia os arquivos HTML estáticos para o diretório padrão do Nginx
COPY Blog/html/ /usr/share/nginx/html/

# Exponha a porta 80 (HTTP)
EXPOSE 80

