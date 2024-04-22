FROM mcr.microsoft.com/devcontainers/ruby:${RUBY_VERSION}

# Add vscode user
RUN useradd -ms /bin/bash ${USERNAME}
USER ${USERNAME}

RUN mkdir /container-setup
WORKDIR /container-setup

# Install necessary dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Install NVM, Node and NPM
RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NODE_VERSION_MANAGER}/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    nvm alias default ${NODE_VERSION} && \
    nvm use default && \
    npm install -g npm@${NPM_VERSION}

# Install Rails
RUN gem install Rails

# Create New Rails App
WORKDIR /
RUN rails new ${APP_NAME}