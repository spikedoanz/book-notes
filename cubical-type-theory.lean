/-
https://arxiv.org/pdf/1611.02108

# 2. basic type theory
----------------------

## basic types
Γ,Δ     ::= () | Γ,x:A                  Context
t,u,A,B ::= x | λx:A.t | t u | (x:A)→B  Π-types
        |   (t,u) | t.1 | t.2 | (x:A)×B Σ-types
        |   0 | s u | natrec t u | ℕ    Nats

## reductions
a reduction -- variable renaming (λx.M x) → (λz.M z)
β reduction -- lambda application (λx.x)y → y
η reduction -- λx.M x → M if x is not free in M

A→B   -- non-dependent function space
A×B   -- non-depdendent pairs

* terms and types are equivalent up to α-reduction

σ = (x₁/u₁,...xₙ/uₙ) -- substitutions, replacing
  xᵢ with uᵢ and renaming bound variables when
  necessary.

Δ ⊢ σ : Γ     -- defined via induction on Γ
Δ ⊢ () : ()   -- empty substitution
Δ ⊢ (σ,x/u) : Γ, x : A ← (Δ ⊢ σ ⋀ Δ ⊢ u : Aσ)

__Lemma 1__ : substitution (weakening) is allowed

Γ ⊢ J   Δ ⊢ σ : Γ
-----------------
    Δ ⊢ Jσ

# 3. path types
---------------

<< no clue what this means >>

- de morgan algebra
- distributive lattice
- "involution"

#############################
## well formed contexts, Γ ⊢
#############################
(the condition x ∉ dom(Γ) means that x is not
declared in Γ)

  ----
  () ⊢

  Γ ⊢ A
  ------- (x ∉ dom(Γ))
  Γ,x:A ⊢

####################
## well formed types
####################

###################
## well-typed terms
###################

################
## type equality
################

################
## term equality
################

## 3.1 syntax and inference rules

## 3.2 examples


# 4 systems, composition and transport
--------------------------------------

## 4.1 the face latice

## 4.2 syntax and inference rules for systems

## 4.3 composition operation

## 4.4 kan filling operation

## 4.5 equality judgements for composition

## 4.6 transport


# 5 derived notions and operations
----------------------------------

## 5.1 contractible types

## 5.2 the __pres__ operation

## 5.3 the __equiv__ operation


# 6 glueing
-----------

## 6.1 syntax and inference rules for glueing

## 6.2 composition for glueing


# 7 universe and the univalence axiom
-------------------------------------

## 7.1 composition of the universe

## 7.2 univalence axiom


# 8 semantics
-------------

## 8.1 the category of cubes and cubical sets

## 8.2 presheaf semantics

## 8.3 interpretation of the syntax

# 9 extensions: identity types and HITs
---------------------------------------

## 9.1 identity types

## 9.2 higher inductive types







-/
