# Overview

このプロジェクトは履歴書を中心に、  
就職活動で利用する資料のテンプレートをまとめたものである。

Node.js を利用してHTMLベースの様式を作成し、  
それをPDFに変換することを目標としている。

# Examples

- [履歴書](https://github.com/miyabisun/job-transfer/blob/master/examples/resume.pdf)
- [内定承諾書](https://github.com/miyabisun/job-transfer/blob/master/examples/decision-acceptance.pdf)

# Installation

```Bash
$ node -v
v7.2.1

$ docker -v
Docker version 17.06.0-ce, build 02c1d87

$ git clone https://github.com/miyabisun/job-transfer.git

$ cd job-transfer

$ npm install -D
```

# Usage

手順は以下の通り

1. 個人情報を設定
2. ブラウザでの確認
3. PDFを作成

## 1. 個人情報を設定

まずはdataフォルダをプロジェクトルートに作成する必要がある。  
data-templateというフォルダを準備しているので、これらをコピーすることで簡単に始める事が可能。

```Bash
$ cd job-transfer

$ cp -R data-template data
```

### 履歴書を作成する場合

必要なファイルは下記

- data/photo.jpg: 自身の顔写真
- data/personal.json: 個人情報
  - name: 氏名
  - name_kana: 氏名 (ひらがな)
  - birthday: 誕生日 (YYYY/MM/DD)
  - sex: "男" or "女"
  - zip_code: 郵便番号 (XXX-YYYY)
  - address: 住所 (例: "東京都 A区 1-2-3 Bマンション101号")
  - address_kana: 住所 (ひらがな)
  - phone: 電話番号
  - mail: メールアドレス
- data/histories.json: 学歴・職歴 (オブジェクトの配列)
  - name: "学歴" or "職歴"
  - histories: 履歴 (オブジェクトの配列)
    - year: 年 (YYYY)
    - month: 月 (M)
    - detail: 詳細 (例: "X県立 Y中学校 卒業")
- data/licenses.json: 資格 (オブジェクトの配列)
  - year: 年 (YYYY)
  - month: 月 (M)
  - name: 詳細 (例: 普通自動車免許)
- data/requests.json: 志望動機・自己PR等
  - reasons: 文字列の配列 (例: ["御社のXXXに共感し..."])
  - requests: 文字列の配列 (例: ["特になし"])
  - PR: 文字列の配列 (例: ["高校ではXXX部に所属し..."])
  - commuting_time: 通勤時間 (例: "約 1 時間")

### 内定承諾書を作成する場合

必要なファイルは下記

- data/seasonal_greetings.json: 添え状に使う時候の挨拶 (デフォルトのままで良ければ修正する必要なし)
- data/personal.json: 個人情報
  - name: 氏名
  - zip_code: 郵便番号 (XXX-YYYY)
  - address: 住所 (例: "東京都 A区 1-2-3 Bマンション101号")
  - phone: 電話番号
  - mail: メールアドレス
- data/target.json: 会社情報
  - name: 会社名
  - charge: 担当者名
  - items: 送付物 (文字列の配列)

## 2. ブラウザでの確認

下記のコマンドでNode.jsを利用して簡易的なWebサーバーを構築することが可能。  
3000番ポートにアクセスする事で閲覧出来る。  
`Ctrl + P`等のショートカットキーで直接印刷(PDF)にしてもいい。

```Bash
$ cd job-transfer

$ npm start

> job-transfer@1.0.0 start /Users/miyabi/private/job-transfer
> lsc bin/serve.ls

get ready.
access to http://localhost:3000/
```

## 3. PDFを作成

※現在未実装

下記コマンドでdist配下にPDFを生成する予定。

```Bash
$ cd job-transfer

$ npm run build

$ ls dist
```

# Dependences

- [Node.js](https://nodejs.org/ja/)
- [Express](http://expressjs.com/ja/)
- [Pug](https://pugjs.org/api/getting-started.html)
- [Stylus](http://stylus-lang.com/)
- [LiveScript](http://livescript.net/)

# 参考資料等

## 履歴書

日本では**JIS Z 8303「帳票の設計基準」の附属書A**として定義されている。  
様式は市販のものとWikipediaの記事を参考に用意した。

- 氏名、ふりがな
- 性別
- 生年月日、満年齢
- 郵便番号、現住所
- 電話番号（固定・携帯電話）
- 電子メールアドレス（記入欄のない場合もある）
- 連絡先（現住所以外に連絡を希望する場合のみ記入）
- 学歴、職歴
- 資格、免許（運転免許証など）、検定○級（英検）、TOEIC○点など（資格名以外にも、認定団体の名称を書くことが多い）
- 賞罰（最近の市販履歴書（JIS規格など）では記入欄を設けていない）
- 志望の動機
- 本人の希望（給料、職種、勤務時間、勤務地など）
- 自己PR
- 通勤時間
- 扶養家族（配偶者除く）の人数（最近の市販履歴書には欄を設けていないものもある）
- 配偶者およびその扶養義務の有無（最近の市販履歴書には欄を設けていないものもある）
- 本人が未成年の場合は、保護者の氏名、郵便番号、住所、電話番号（最近の市販履歴書には記入欄を設けていないものもある）

### 参考リンク

- [JIS Z 8303「帳票の設計基準」](http://kikakurui.com/z8/Z8303-2008-01.html)
- [履歴書 - Wikipedia](https://ja.wikipedia.org/wiki/%E5%B1%A5%E6%AD%B4%E6%9B%B8)

## 内定承諾書

内定承諾書は多くの企業に内定すると企業の様式に従った内定承諾書が送付され、署名と押印をして返還というケースが多い。  
しかし、独自フォーマットで良いので作って提出してくれという企業もあり、自ら作成することになったのでHTMLをベースにプロジェクト化することにした。  
様式は参考リンクを元に独自のフォーマットで作成している。

### 参考リンク

- [内定承諾書の書き方 - 看護roo!](https://www.kango-roo.com/career/knowhow/decision/03.php)
- [内定承諾書の添え状はどう書く？ 基本の書き方と例文 - フレッシャーズ マイナビ 学生の窓口](https://gakumado.mynavi.jp/freshers/articles/42187?page=2)
- [内定承諾書の送り方や添え状と封筒の書き方 - 履歴書Do](http://www.rirekisyodo.com/job-hunt/joboffer-writtenconsent.html)
- [時候の挨拶 - 手紙の書き方大事典](http://www.letter110.net/zikounoaisatsu/)

