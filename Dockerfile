# Dockerfile.rails
FROM ruby:3.1.2

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
#RUN chown -R user:user /opt/app
WORKDIR /opt/app

# Run a server
CMD ["rails", "server"]