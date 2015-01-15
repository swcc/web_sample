FROM swcc/docker-nginx:nginx-extras
MAINTAINER Paul B. <paul+swcc@bonaud.fr>


# WARNING This should be included in the baseimage?
RUN chown -R www-data:www-data /var/www

# WARNING This should be included in the baseimage?
# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Add conf for nginx
COPY ./ /etc/nginx
