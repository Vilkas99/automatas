Definitions.

D = [0-9]

Rules.

\s|\n          : skip_token.
{D}+        : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
[\+\-\*\/]  : {token, {list_to_atom(TokenChars), TokenLine, TokenChars}}.
[\(\)]      : {token, {list_to_atom(TokenChars), TokenLine, TokenChars}}.

Erlang code.


