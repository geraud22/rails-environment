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

# Install RVM for the VSCode User
USER vscode
RUN gpg gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
    && \curl -sSL https://get.rvm.io | bash -s stable

# Initialize RVM into every new terminal
RUN echo 'source "$HOME/.rvm/scripts/rvm"' >> /home/vscode/.bashrc

# Dummy Process to keep Container Running
CMD ["sleep", "infinity"]