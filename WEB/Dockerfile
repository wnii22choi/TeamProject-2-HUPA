FROM nginx:1.14-alpine
  
COPY index.html /usr/share/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx","-g","daemon off;"] 
