# 元にするイメージ
FROM ruby:2.6.2
# コンテナを機能させるまでの準備のコマンドを実行する
RUN apt update -qq && \
    apt install -y build-essential nodejs
RUN mkdir /asset-station
# 環境変数を設定する
ENV APP_ROOT /asset-station
# コマンドを実行するディレクトリを設定する
WORKDIR $APP_ROOT
# ホストのファイルをコンテナにコピーする
ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock
# 既出
RUN gem install bundler
RUN bundle install
ADD . $APP_ROOT
RUN mkdir -p tmp/sockets
# コンテナ起動時のポートを設定する
EXPOSE 3000