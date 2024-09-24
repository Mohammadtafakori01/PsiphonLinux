FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
COPY ./archive/configs /app/archive/configs
RUN chmod +x /app/archive/psiphon-tunnel-core-x86_64
EXPOSE 8082
EXPOSE 1081
WORKDIR /app/archive
CMD ["./psiphon-tunnel-core-x86_64", "-config", "./configs/psiphon.config"]

