#!/bin/bash
#SPDX-FileCopyrightText:2024 Takeru Yoshida
#SPDX-License-Identifier: BSD-3-Clause

function check_output {
	expected="$1"
	actual="$2"
	if [[ "$actual" == *"expected"* ]];then
            echo "PASS: Found '$expected'"
	else
	    echo "FAIL: Expected '$expected', but got '$actual'"
	    exit 1
	fi
}

SCRIPT="./kazuate"

#テストケース１：正常な入力で数が当たる
output=$(echo -e "25\n" | python3 $SCRIPT)
check_output "正解です！" "$output"

#テストケース２：入力した値が外れる
output=$(echo -e "10\n30\n20\n" | python3 $SCRIPT)
check_out "もうちょい大きい！" "$output"
check_out "もうちょい小さい！" "$output"

#テストケース３：違う文字を入力
output=$(echo -e "a\n25\n" | python3 $SCRIPT)
check_output "エラー：数字を入力してください" "$output"

#テストケース４：最初の文字で正解
output=$(echo -e "25\n" | python3 $SCRIPT)
check_output "正解です！" "$output"

echo "すべてのテストが成功しました。"
