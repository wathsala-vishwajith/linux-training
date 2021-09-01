server {

        root /var/www/lt-2021-005.ml/html;
        index index.html index.htm index.nginx-debian.html;

        server_name lt-2021-005.ml www.lt-2021-005.ml;

        access_log /var/log/nginx/reverse-access.log;
        error_log /var/log/nginx/reverse-error.log;

        location / {
                proxy_pass http://localhost:8000/;
        }
        
        location /secret {
                root /var/www/lt-2021-005.ml/html;
                auth_basic "No Tresspassing";
                auth_basic_user_file /etc/nginx/.htpasswd;
                index secret.html;
        }

        location /web0005 {
                return 200 "LT-2021-005";
                add_header Content-Type text/plain;
        }

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lt-2021-005.ml/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lt-2021-005.ml/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.lt-2021-005.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = lt-2021-005.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        listen 80;
        listen [::]:80;

        server_name lt-2021-005.ml www.lt-2021-005.ml;
    return 404; # managed by Certbot




}

server {
      	listen 8081;
        listen [::]:8081;

        location / {
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host $host;
        proxy_pass http://localhost:8080/;
        }
        }
