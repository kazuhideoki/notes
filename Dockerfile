# コマンド
# docker build -t docker_for_note .
# docker run -it -v "$(pwd):/workspace" --user $(id -u):$(id -g) docker_for_note

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
    && rm -rf /var/lib/apt/lists/*

# Node.jsの最新LTSバージョンをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Claude Code CLI をグローバルにインストール
RUN npm install -g @anthropic-ai/claude-code

# 非 root ユーザーを作成（例：user）
RUN useradd -ms /bin/bash user

# 非 root ユーザーに切り替え
USER user

# HOME を明示的に設定（user のホームディレクトリに）
ENV HOME=/home/user

WORKDIR /workspace

CMD ["/bin/bash"]
