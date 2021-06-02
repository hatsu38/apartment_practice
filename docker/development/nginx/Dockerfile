FROM nginx:1.17.5

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    locales &&\
    rm -f /etc/localtime &&\
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    echo 'Asia/Tokyo' > /etc/timezone &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/
