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

SCRIPT="./number_guessing_game.py"

#テストケース１：正解に到達
output=$(echo -e "25\n30\n20" | python3 $SCRIPT)
check_output "正解です！" "$output"

#テストケース２：数値以外を入力した場合のエラーメッセージ
output=$(echo -e "hello\n50" | python3 $SCRIPT)
check_out "エラー：数字を入力してください" "$output"

#テストケース３：数字が小さい場合のヒント
output=$(echo -e "10\n15\n" | python3 $SCRIPT)
check_output "もうちょい大きい！" "$output"

#テストケース４：数字が大きい場合のヒント
output=$(echo -e "50\n40\n" | python3 $SCRIPT)
check_output "もうちょい小さい！" "$output"

echo "すべてのテストが成功しました。"
