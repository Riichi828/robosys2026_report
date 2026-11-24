#!/bin/bash
# SPDX-FileCopyrightText:2026 Riichi Yamada
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目のテスト失敗"
    res=1
}

res=0

# --- ./rad のテスト ---
# 正常系: 改行区切り
out=$(printf "0\n90\n180\n" | ./rad)
[ "$?" = 0 ] || ng "$LINENO"
expected="0.0
1.5707963267948966
3.141592653589793"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 異常系: 引数を渡した・数値以外・空入力
out=$(./rad 90 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "hello" | ./rad 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(./rad < /dev/null 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# --- ./deg のテスト ---
# 正常系: スペース区切り・負の値
out=$(echo "0 3.141592653589793 -1.5707963267948966" | ./deg)
[ "$?" = 0 ] || ng "$LINENO"
expected="0.0
180.0
-90.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 異常系: 引数を渡した・数値以外・空入力
out=$(./deg 3.14 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "hello" | ./deg 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(./deg < /dev/null 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# --- パイプ連携のテスト ---
out=$(echo "0 90 180" | ./rad | ./deg)
[ "$?" = 0 ] || ng "$LINENO"
expected="0.0
90.0
180.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
