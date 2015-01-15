FROM swcc/rbenv:2.1.1
MAINTAINER Paul B. <paul+swcc@bonaud.fr>

# Set default ENV variables
ENV ENV staging
ENV PORT 3000

# Application working directory
WORKDIR /home/app

# Copy code
COPY ./ /home/app

# Bundle
RUN bundle install --deployment

# Expose port to outside of container
EXPOSE $PORT
# What to launch on container startup
ENTRYPOINT ["bundle", "exec", "puma", "/home/app/config.ru"]