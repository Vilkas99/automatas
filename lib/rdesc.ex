defmodule RDesc do

  #E -> T E'
  def expresion({tokens, pila})  do
    {tokens, pila} = temino({tokens, pila})
    {tokens, pila} = expresionP({tokens, pila})
    {tokens, pila}

  end


  #E' -> +T E'

  def expresionP({[{:+, _, _ | tokens}], pila})  do
    {tokens, pila} = temino({tokens, pila})
    {tokens, pila} = expresionP({tokens, pila})
    {tokens, pila}

  end


  #E' = epsilon

  def expresionp({tokens, pila}), do: {tokens, pila}

  #T -> F T'

  def termino({tokens, pila}) do
    {tokens, pila} = factor({tokens, pila})
    {tokens, pila} = terminop({tokens, pila})
    {tokens, pila}
  end


  #T' -> *FT '

  def terminop({[{:*, _, _| tokens}], pila}) do
    {tokens, pila} = factor({tokens, pila})
    {tokens, pila} = terminop({tokens, pila})
    {tokens, pila}
  end

  #T' ->epsilon
  def terminop({tokens, pila}), do: {tokens, pila}


  def factor({[{:"(", _, _} | tail], pila}}) do
    expresion({tail, pila})
    |> fn [{:")",_,_} | rest] -> {rest, p} end.()
  end

  def factor({[{:int, _, value} | tail],pila}) do
    IO.puts(value)
    {tail, [value | pila]}
  end

  end
