#!/bin/bash
# SPDX-FileCopyrightText: 2026 Riichi Yamada
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目のテスト失敗"
    res=1
}

res=0

# 正常系のテスト（複数データ・スペース区切り）
out=$(echo "10 20 30" | ./code)
[ "$?" = 0 ] || ng "$LINENO"
expected="データ数: 3
合計値  : 60.0
平均値  : 20.0
中央値  : 20.0
最小値  : 10.0
最大値  : 30.0
標準偏差: 10.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 正常系のテスト（改行区切り）
out=$(seq 1 3 | ./code)
[ "$?" = 0 ] || ng "$LINENO"
expected="データ数: 3
合計値  : 6.0
平均値  : 2.0
中央値  : 2.0
最小値  : 1.0
最大値  : 3.0
標準偏差: 1.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 正常系のテスト（データ1件のみ：標準偏差は出力されない）
out=$(echo 5 | ./code)
[ "$?" = 0 ] || ng "$LINENO"
expected="データ数: 1
合計値  : 5.0
平均値  : 5.0
中央値  : 5.0
最小値  : 5.0
最大値  : 5.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 異常系のテスト（数値以外の入力）
out=$(echo hello | ./code 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 異常系のテスト（空入力）
out=$(./code < /dev/null 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
