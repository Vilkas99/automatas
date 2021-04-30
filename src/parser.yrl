Terminals '+' '*' '(' ')' int .


Nonterminals E T F .

Rootsymbol E. 

E -> E '+' T. 
E -> T.
T -> T '*' F.
T -> F.
F -> '('E')'.
F -> int.

