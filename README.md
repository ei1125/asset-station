![asset-station構成図](https://user-images.githubusercontent.com/58078710/81828040-53a09800-9574-11ea-8a0e-76ea086c5038.png)


##ASSET STATION
資産形成のために損益計算書、貸借対照表を簡単に入力することが出来るアプリです。
#機能
・ユーザーログイン機能により、ユーザーごとにデータ管理できる
・年、月ごとに分類して収入・支出を記録。月ごとに表示
・年、月ごとに資産、負債を記録。合計の資産、負債を表示
・グラフにより資産推移を表示

##開発環境

#言語
Ruby
Javascript(jQuery)
haml
scss

#フレームワーク
Ruby on rails

#サーバー環境
docker/docker-compose
Nginx/Puma
Mysql

#クラウド
AWS(EC2/RDS/Codedeploy/Route53/VPC/Internet gateway/Elastic IP)
Github
circle ci

#開発経緯
資産運用が騒がれる時代、手軽に自分の資産を調整できるアプリを作ってみたいと思いこのアプリを作りました。
アプリ部分はruby on rails、jQueryを使用し、
開発インフラ環境をDocker,AWS,Circle ciを用いて
仮想コンテナでの開発、Githubのpushによる自動デプロイの環境を構築しました。
