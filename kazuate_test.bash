#!/bin/bash
# SPDX-FileCopyrightText: 2024 Takeru Yoshida
# SPDX-License-Identifier: BSD-3-Clause

function check_output {
    expected="$1"
    actual="$2"
    if [[ "$actual" == *"$expected"* ]]; then
        echo "PASS: Found '$expected'"
    else
        echo "FAIL: Expected '$expected', but got '$actual'"
        exit 1
    fi
}

SCRIPT="./kazuate"

# ランダム値をモック化するための環境変数設定
export TEST_RANDOM="1"

# テストケース1: 正解が続く
output=$(echo -e "1\n1\n2\n" | python3 $SCRIPT)
check_output "正解！現在の連続回数：2" "$output"

