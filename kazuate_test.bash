#!/bin/bash
#SPDX-FileCopyrigtText: 2024 Takeru Yoshida
#SPDX-License-Identifier: BSD-3-Clause
function check_output {
	expected="$1"
	actual="$2"
	if [[ "$actual" == *"$expected"* ]]; then
	    echo "PASS: Found '$expected'"
	else
	    echo "FAIL: Expected '$expected',but got '$actual'"
	    exit 1
	fi
}

SCRIPT="./kazuate"

#連続で正解(ランダム値をモック化)
export TEST_RANDOM=1
output=$(echo -e "1\n1\n2\n" | python3 $SCRIPT)
check_output "正解！現在の連続回数：2" "$output"

#1回目で不正解
export TEST_RANDOM=2
output=$(echo -e "1\n" | python3 $SCRIPT)
check_output "不正解！ランダム数は2でした" "$output"
