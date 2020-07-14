# アプリ名
ASSET STATION

## 概要
資産形成のために損益計算書、貸借対照表を簡単に入力することが出来るアプリです。
# 機能
・ユーザーログイン機能により、ユーザーごとにデータ管理できる
・年、月ごとに分類して収入・支出を記録。月ごとに表示
・年、月ごとに資産、負債を記録。合計の資産、負債を表示
・グラフにより資産推移を表示

# アーキテクチャ図
![asset-station構成図](https://user-images.githubusercontent.com/58078710/81828040-53a09800-9574-11ea-8a0e-76ea086c5038.png)

# DATABASE図
![DATABASE](https://user-images.githubusercontent.com/58078710/81919127-636eb980-9612-11ea-82e1-88a1f8098e2a.png)

## 開発環境

# 言語
Ruby
JavaScript(jQuery)
Haml
SCSS

# フレームワーク
Ruby on Rails

# サーバー環境
Docker/Docker-compose
Nginx/Puma
MySQL

# クラウド
AWS(EC2/RDS/CodeDeploy/Route53/VPC/Internet Gateway/Elastic IP)
Github
CircleCI

# 開発経緯
資産形成をもっと身近にするために不動産、株、預金などを継続的に記録し簡単に現在の状態を表示できるようにする目的で作成しました。

アプリ部分はRuby on Rails、jQueryを使用し、
開発インフラ環境をDocker,AWS,Circle ciを用いて
仮想コンテナでの開発、Githubのpushによる自動デプロイの環境を構築しました。
