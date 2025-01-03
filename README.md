# 数当てゲーム

[![test](https://github.com/Saronnsyan/robosys2024/actions/workflows/kazuate_test.yml/badge.svg)](https://github.com/Saronnsyan/robosys2024/actions/workflows/kazuate_test.yml)


## 概要
・ランダムに１か２を生成し、連続で何回答えが一致できるかを遊べるゲームです

・ユーザーが正解するたびに連続正解回数が加算されます

・不正解の場合は正解数を表示し、最終的な連続正解回数を表示してゲームを終了します

## インストール手順

・リポジトリをクローン
```bash
git clone git@github.com:Saronnsyan/robosys2024
```
```bash
cd robosys2024
```

## pythonの環境がインストールされているか確認
```bash
python3 --version
```

## 実行権限付与
```bash
chmod +x kazuate
```

## 実行
```bash
./kazuate 
```

## 使用例
ランダム数当てゲーム！１か２を入力してください。連続で当てた回数を計測します！

あなたの予想(１か２)：1

正解！現在の連続回数：1

あなたの予想(１か２)：1

正解！現在の連続回数：2

あなたの予想(１か２)：2

不正解！ランダム数は 1でした。

最終的な連続正解数は2でした。

## 入力エラー処理
無効な入力があった場合、次のエラーコードが表示されます。

エラー：１または２の数字を入力してください

## テスト
テストを実行するには以下のコマンドを使用してください
```bash
bash kazuate_test.bash
```

## ライセンス
このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
BSD-3-Clause

## 著作権
© 2024 Takeru Yoshida
