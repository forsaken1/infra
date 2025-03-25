# Base image for Elixir
FROM elixir:1.18.0-alpine

# Install dependencies
RUN apk add --no-cache \
  git \
  build-base \
  postgresql-client \
  openssl \
  ncurses-libs

# Set environment variables
ENV MIX_ENV=prod \
    LANG=C.UTF-8

# Create and set the working directory
WORKDIR /app

# Copy the project files
COPY mix.exs mix.lock ./
COPY config ./config
COPY lib ./lib
COPY priv ./priv

# Install Hex and Rebar (Elixir build tools)
RUN mix local.hex --force && \
    mix local.rebar --force

# Install dependencies and compile the application
RUN mix deps.get --only prod
RUN mix deps.compile
RUN mix compile

# Build the release
RUN mix release

# Expose the application port
EXPOSE 4000

# Run the application
CMD mix ecto.setup && ./_build/prod/rel/sessions/bin/sessions start
