FROM elixir:1.9.1-alpine AS builder

ENV MIX_ENV=prod

WORKDIR /usr/local/lil_kube

RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache \
  nodejs-npm \
  alpine-sdk \
  openssl-dev \
  && mix local.rebar --force \
  && mix local.hex --force

COPY . .

RUN mix do deps.get, deps.compile, compile

RUN cd assets \
  && npm install \
  && ./node_modules/webpack/bin/webpack.js --mode production \
  && cd .. \
  && mix phx.digest

RUN mkdir -p /opt/release \
  && mix release \
  && mv _build/${MIX_ENV}/rel/lil_kube /opt/release

FROM erlang:22-alpine AS runtime

RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache gcc

WORKDIR /usr/local/lil_kube

COPY --from=builder /opt/release/lil_kube .

CMD ["bin/lil_kube", "start"]

