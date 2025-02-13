FROM ubuntu:22

WORKDIR /telegrambotapi

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-14-dev libc++abi-14-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git \
    && cd telegram-bot-api \
    && rm -rf build \
    && mkdir build \
    && cd build \
    && CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-14 CXX=/usr/bin/clang++-14 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. \
    && cmake --build . --target install \
    && cd ../..

RUN ls -l telegram-bot-api/bin/telegram-bot-api*

CMD ["/telegrambotapi/telegram-bot-api/bin/telegram-bot-api"]
