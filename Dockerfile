# 元にするイメージ
FROM ruby:2.6.2
# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /asset-station
WORKDIR /asset-station

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /asset-station/Gemfile
ADD Gemfile.lock /asset-station/Gemfile.lock

# bundle installの実行
RUN gem install bundler
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /asset-station

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets