#数字を入力してくダサい
decimal_number = int(input("数字の入力をしてください: "))

#16進数に変換
hexadecimal_number = hex(decimal_number)

#結果表示
print(f"{decimal_number}) を16進数に変換すると：{hexadecimal_number[2:].upper()}")
