Easily create containerized [Ruby on Rails development](https://rubyonrails.org/) environments.

Intended for use in VSCode, with the [Dev Containers](https://code.visualstudio.com/docs/devcontainers/create-dev-container) extension.

Dockerfile is responsible for creating the development environment.

Compose.yml creates a network of containers around the main development environment.

PostGresSQL has been chosen as the database engine.

Clone this repository into a local workspace directory and run the "Dev Extension: Rebuild and Reopen in Container".

At which point the user is ready to run "rails new 'appName'".

Try using this repository to follow: [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)