" les digraphes en hexadécimal, ou directement avec le caractère unicode
function! Digraph (...)
  let v = a:000
  while len(v) > 1
    let [ name, char] = v[0:1]
    if match(char, '^\x*$') >= 0
      let char = eval('0x'.char)
    else
      let char = char2nr(char)
    endif
    let name = substitute(name, '|', '\\|', 'g')
    execute 'dig '.name.' '.char
    let v = v[2:]
  endwhile
endf
command! -nargs=* Dig call Digraph(<f-args>)

" various
Dig <| ↤ |> ↦
Dig ._ … .- ⋯ ./ ⋰
" .\ ⋱  ⋮
digraph .\ 8945
" digraph .| 8942
Dig o+ ⊕ ox ⊗
Dig O+ ⨁ Ox ⨂
Dig .+ ∔
Dig ~- ≃ =- ≡ ~~ ≈
Dig s- ſ

" l: math letters
Dig ld ⅆ ll ℓ
Dig lC ℂ lN ℕ lQ ℚ lR ℝ lZ ℤ

" m: math symbols
Dig m. ⋅
Dig mA ∀ mC ∁ md ∂ mE ∃ m0 ∅
Dig mV ⋁ mW ⋀ mH ∐ mX ⨉ mN ⋂ mU ⋃ mP ∏ mS ∑
Dig mv ∨ mw ∧ mh ⨿ mx × mn ∩ mu ∪
Dig mc ⊂ mo ∘ m@ ⋆ me ∈ m\ ∖

" ne pas utiliser les caractères qui ne sont pas définis par les fontes
" Unicode standard, du genre ⨶ (dommage)

" On échange chi et xi, c'est plus intuitif d'avoir x -> xi, c -> chi
Dig x* ξ c* χ v* ϖ j* ς
Dig T* Θ
