#!/bin/bash

ng () {
    echo ${1}行目のテスト失敗
    res=1
}

res=0

# 正常系のテスト
out=$(./code 5)
[ "${out}" = 5 ] || ng "$LINENO"

out=$(./code hello)
[ "${out}" = "hello" ] || ng "$LINENO"

# 異常系のテスト
out=$(./code 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
