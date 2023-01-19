FROM node:lts-alpine3.14

WORKDIR /app

ARG TZ=Asia/Taipei

COPY . .

RUN apk add --no-cache --virtual .build-deps tzdata && \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && \
    apk del .build-deps && \
    # yarn run once && \
    # yarn run rw:devPkg && \
    # if you want to ignore lifecycle scripts, you must run `yarn run prisma:generate`.
    # see: https://www.prisma.io/docs/concepts/components/prisma-client/working-with-prismaclient/generating-prisma-client#generating-prisma-client-in-the-postinstall-hook-of-prismaclient
    yarn install && \
    # yarn run prisma:generate && \
    # yarn run build && \
    # yarn run rm:devPkg && \
    yarn cache clean



# RUN set -eux; \
#     chown -R 1001:1001 "/.npm"

# RUN set -eux; \
#     npm install fastify;

CMD [ "yarn", "local" ]