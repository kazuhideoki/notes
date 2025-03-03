# コマンド
# docker build -t docker_for_note .
# docker run -it -v "$(pwd):/workspace" -e HOME=/tmp/home --user $(id -u):$(id -g) docker_for_note

# TODO
# node の version を親ディレクトリと同じに
# ubuntu 最新バージョンに ほかlinux は？

FROM ubuntu:20.04

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    gnupg \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Node.jsの最新LTSバージョンをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Claude Code CLI をグローバルにインストール
RUN npm install -g @anthropic-ai/claude-code

# 作業ディレクトリを指定
WORKDIR /workspace

# 起動時に実行するスクリプトを作成
RUN echo '#!/bin/bash \n\
    if [ ! -d "$HOME" ]; then \n\
    mkdir -p $HOME \n\
    chmod 777 $HOME \n\
    fi \n\
    exec "$@"' > /entrypoint.sh && chmod +x /entrypoint.sh

# entrypointとして設定
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
