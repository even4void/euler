IsPalindrome[x_] :=
  IntegerDigits[x] == Reverse[IntegerDigits[x]]

Max[Select[Flatten[Table[i * j, {i, 100, 999}, {j, 100, 999}]], IsPalindrome
  ]]
