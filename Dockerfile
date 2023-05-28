# ベースイメージの作成
ARG FROM_IMAGE=python:3.10.10-bullseye
FROM ${FROM_IMAGE}

ARG LOCAL_DIR=working
ENV PROJECT_DIR working
# # コンテナ内の作業ディレクトリを指定
WORKDIR /${PROJECT_DIR}
COPY ${LOCAL_DIR}/ /${PROJECT_DIR}/


ENV PATH /root/.local/bin:$PATH
# poetryのインストール
RUN curl -sSL https://install.python-poetry.org | python3 -
# poetry経由でライブラリをインストール
RUN poetry config virtualenvs.create false && poetry install