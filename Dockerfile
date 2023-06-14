FROM ubuntu:latest

WORKDIR /telegrambotapi

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-dev libc++abi-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git \
    && cd telegram-bot-api \
    && rm -rf build \
    && mkdir build \
    && cd build \
    && CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-14 CXX=/usr/bin/clang++-14 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. \
    && cmake --build . --target install \
    && cd /telegrambotapi

#COPY ./telegram-bot-api /telegrambotapi/telegram-bot-api

#RUN chmod +x /telegram-bot-api

#CMD ["telegram-bot-api", ""
