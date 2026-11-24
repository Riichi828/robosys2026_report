## プログラムについて

標準入力から受け取った角度の数値データについて、度数法（degree）と弧度法（radian）を相互変換して出力するプログラム群である。

- `rad` : 度（deg）をラジアン（rad）に変換して出力する。
- `deg` : ラジアン（rad）を度（deg）に変換して出力する。

## 準備

順番に下記のよう実行してください。

```bash
$ git clone git@github.com:Riichi828/robosys2026_report.git

$ chmod +x deg rad test.bash
```

## 使用方法

例１
ラジアン(rad)から度(deg)へ変換したい場合

```bash
$ echo 180 | ./rad
```

例２
度(deg)からラジアン(red)に変換したい場合

```bash
$ echo 30 | ./rad
```

## 必要なソフトウェア
- Python
 - 3.x

## テスト環境
- Ubuntu 24.04.1 LTS

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの 下、再頒布および使用が許可されます。
- © 2026 Riichi Yamada 
