FROM ubuntu:14.04.4 AS builder
LABEL maintainer="taichunmin@gmail.com"
WORKDIR /opt
ARG VERSION=1353

RUN set -eux; \
  apt-get update -qq; \
  apt-get install -y \
    curl \
    unzip \
  ; \
  if ! curl -fL -o terraria-server.zip "http://terraria.org/server/terraria-server-${VERSION}.zip"; then \
    echo >&2 "error: failed to download 'http://terraria.org/server/terraria-server-${VERSION}.zip'"; \
    exit 1; \
  fi; \
  unzip terraria-server.zip -d "/opt"; \
  mv ${VERSION}/Linux /opt/terraria; \
  chown -R root:root /opt/terraria; \
  chmod +x /opt/terraria/TerrariaServer.bin.x86_64

# Stage 2
FROM ubuntu:14.04.4
LABEL maintainer="taichunmin@gmail.com"
WORKDIR /opt/terraria

COPY --from=builder /opt/terraria /opt/terraria
VOLUME ["/world"]
EXPOSE 7777
CMD ["/opt/terraria/TerrariaServer.bin.x86_64", "-config", "/opt/terraria/serverconfig.txt"]