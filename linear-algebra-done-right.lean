/-
# Chapter 1
-----------

  ## Chapter 1A: Numbers:
  -----------------------

__complex numbers__:
* := ordered pair (a,b); a,b ∈ ℝ, written a+bi
* ℂ := {a+bi : a,b ∈ ℝ}
* (a+bi) + (c+di) = (a+c) + (b+d)i
* (a+bi)(c+di) = (ac-bd)+(ad+bc)i

Properties of complex arithmetic:
* commutativity: (α + β = β + α) & (αβ = βα) ∀ α,β ∈ ℂ
* associativity: (α + (β + γ) = (α + β) + γ) & (aβ)γ = a(βγ) ∀ α,β,γ ∈ ℂ  
* identities: λ + 0 = λ & λ1 = λ
* additive inverse: ∀ a ∈ ℂ, ∃ β ∈ ℂ s.t α + β = 0
* multiplicative inverse: ∀ a ∈ ℂ, ∃ β ∈ ℂ s.t αβ = 1
* distributive property: λ(a+b) = λα + λβ ∀ α,β,λ ∈ ℂ

[!notation] 𝔽 stands for either ℂ or ℝ

Elements of 𝔽 are __scalars__.

Def: list, length:
* list of length n is an ordered collection of n elements
* two lists are equal <=> they have same length and same elements and order

Def: 𝔽ⁿ, coordinate
* 𝔽ⁿ is the set of all lists of length n of elements of 𝔽
* 𝔽ⁿ := {(x[1..n] : xk ∈ 𝔽 for k ∈ [0..n]}
* xk is the kth __coordinate__ of x[1..n]

Def: addition in 𝔽ⁿ
* is done by adding corresponding coordinates.
* this is commutative

[!notation] 0 is the list of length n of all zeros

Def: __additive inverse__ in 𝔽ⁿ, -x
* x + (-x) = 0

Def: scalar multiplication in 𝔽ⁿ
* element wise multiply the scalar


[!digression] fields
fields are a set equipped with add and mul s.t it has commutativity,
associativity, identity and inverses.
* many theorems in this book can have 𝔽 replaced with an arbitrary field.


[!exercises] chapter 1A
skipped


  ## Chapter 1B: Vector spaces
  ----------------------------


1.19 def: addition, scalar multiplication
* addition on set V is a function that assigns u + v ∈ V to each pair of 
elements u,v ∈ V
* scalar multiplcation on a set V is a function that assigns an element
λv ∈ V to each λ ∈ 𝔽 and each ∨ ∈ V

1.20 def: __vector space__
is a set V alongside adition and multiplication s.t these hold:
* commutativity, associativity, additive identity, additive inverse, 
multiplicative identity, distributativity.

1.21 def: vector, point
1.22 def: real/complex vector space

1.24 notation: 𝔽ˢ
* denotes set of functions from a set S to 𝔽
* for f,g ∈ 𝔽ˢ, the sum of f+g ∈ 𝔽ˢ is a function defined:
  (f+g)(x) = f(x) + g(x) ∀ x ∈ S
* for λ ∈ F and f ∈ Fˢ, the product λf ∈ Fˢ is defined:
  (λf)(x) = λf(x) ∀ x ∈ S

1.26: __unique additive identity__: vector spaces only have one of these
1.27: __unique additive inverse__: every element only has one of these
1.28 notation: -v, w-v.
let v, w ∈ V then,
* -v is the additive inverse of v
* w-v is defined to be w + (-v)

1.29: notation: V: denotes a vector space over F

1.30: 0v = 0 ∀ v ∈ V

1.31: a0 = 0 ∀ a ∈ F

1.32: (-1)v = -v ∀ v ∈ V


  ## Chapter 1C: Subspaces
  ------------------------

1.33 def: __subspace__ a subset U of V is called a subspace of V if U is
also a vector space with the same algebraic properties as V

1.34: conditions for a subspace
* additive identity
* closed under addition
* closed under scalar multiplication 

1.36 def: sum of subspaces
let V[1..m] := subspaces of V. the sum V[1..m] is the set of all possible
elements of V[1..m], more precisely

V[1..m] := {v[1..m] : v1 ∈ V1,...vm ∈ Vm



-/
