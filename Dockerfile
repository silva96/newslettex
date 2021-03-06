FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 5000

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install

COPY . .

CMD ["mix", "phx.server"]
