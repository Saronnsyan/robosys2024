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

# テストケース1: 正常な入力で数が当たる
# 入力をシミュレーションして、正しい出力が得られるか確認
output=$(echo -e "25\n" | python3 $SCRIPT)
check_output "正解です！" "$output"

# テストケース2: 無効な入力を与えたときにエラーメッセージが出るか確認
output=$(echo -e "abc\n25\n" | python3 $SCRIPT)
check_output "エラー：数字を入力してください" "$output"

# テストケース3: 「もうちょい大きい！」または「もうちょい小さい！」の確認
output=$(echo -e "10\n30\n20\n" | python3 $SCRIPT)
check_output "もうちょい大きい！" "$output"
check_output "もうちょい小さい！" "$output"

# テストケース4: 最初の入力で正解が出る場合の確認
output=$(echo -e "25\n" | python3 $SCRIPT)
check_output "正解です！" "$output"


echo "すべてのテストが成功しました。"
