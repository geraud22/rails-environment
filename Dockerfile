FROM mcr.microsoft.com/devcontainers/ruby:1-3.3-bullseye

# Install necessary dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Install Node.js and npm
RUN . /usr/local/share/nvm/nvm.sh \
    && nvm install 20.11 \
    && nvm alias default 20.11 \
    && nvm use default \
    && npm install -g npm@latest

# Install Rails
RUN gem install rails

# Dummy Process to keep Container Running
CMD ["sleep", "infinity"]