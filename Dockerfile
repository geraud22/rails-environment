FROM mcr.microsoft.com/devcontainers/ruby:1-3.3-bullseye

# Install necessary dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Install Node.js and npm
RUN . /usr/local/share/nvm/nvm.sh \
    && nvm install 20.11 \
    && nvm alias default 20.11 \
    && nvm use default \
    && npm install -g npm@latest

# Install Sqlite3
RUN apt-get install -y sqlite3

# Install Rails
RUN gem install rails

# Give VSCode User ownership of relevant directories
RUN sudo chown -R vscode:vscode /usr/local/rvm/gems

# Dummy Process to keep Container Running
CMD ["sleep", "infinity"]