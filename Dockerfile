FROM node:latest
RUN mkdir /scripts
RUN apt update && apt install -y unzip curl
COPY bun.sh /bun.sh
RUN chmod +x /bun.sh
RUN bash -c /bun.sh
COPY ./load_tester/* /scripts/
WORKDIR /scripts
RUN cp /root/.bun/bin/bun /usr/local/bin
RUN bun install
RUN bun run build
RUN mkdir /connection_files
RUN cp /scripts/connections /usr/local/bin/connections
RUN chmod +x /usr/local/bin/connections
ENTRYPOINT [ "connections", "loadtest" ]