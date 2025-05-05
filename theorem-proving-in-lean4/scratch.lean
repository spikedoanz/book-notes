theorem and_commutative (p q : Prop)
  : p ∧ q → q ∧ p :=
  fun hpq : p ∧ q =>
  have hp : p := And.left hpq
  have hq : q := And.right hpq
  show q ∧ p from And.intro hq hp

#check Nat → Nat

universe u

def F (α : Type u) : Type u := Prod α α

#check F

#check fun (x : Nat) => x + 5

#check (λ x => x + 5) 10
#eval (λ x => x + 5) 10

def double := λ x => x * 2

#eval double 10

def compose {α β γ : Type}
  (f : α → β) (g : β → γ) (a : α)
  := g (f a)

#eval (λ x => x * 2) ((λ x => x / 2) 10)

section useful
-- this lets me do scoped nonense
variable (α : Type) -- this is some global namespace
--            nonsense, but implicit, somehow
end useful

namespace useful
-- hmm i wonder how these nest
end useful

section useful
  namespace useful
-- wow holy shit that just works
-- lean has a batshit insane parser
  end useful
end useful

#check 1
#check Prop
#check And
variable (p q : Prop)
#check p -> q

axiom Prop' : Type
axiom And'  : Prop' -> Prop' -> Prop'
axiom Or'   : Prop' -> Prop' -> Prop'
axiom Not'  : Prop' -> Prop' -> Prop'
axiom Implies': Prop' -> Prop' -> Prop'
axiom Proof': Prop' -> Type

#check Proof'

axiom modus_ponens : (p q : Prop')
  -> Proof' (Implies' p q)
  -> Proof' p -> Proof' q

axiom implies_intro : (p q : Prop')
  -> (Proof' p -> Proof' q)
  -> (Proof' (Implies' p q))

-- prop is sugar for Sort 0
-- prop is closed under implication
-- implication is called the "arrow
--  constructor" for some reason.

variable {p q : Prop}

theorem t1 : p → q → p :=
  fun hp : p => fun _ : q => hp

theorem t2 : ∀ {p q : Prop}, p → q → p :=
  λ p' => (λ _ => p')

theorem t3 : p → q → p :=
  fun hp : p =>
  fun _  : q =>
  show p from hp


#print t1

#print And.intro

open Classical

variable (p : Prop)
#check em p

theorem dne {p : Prop} (h : ¬¬p) : p :=
  Or.elim (em p)
    (fun hp : p => hp)
    (fun hnp : ¬p => absurd hnp h)

#check dne
#check em


-- Chapter 4: Quantifiers and equality

-- x : α, p x means "p holds for x" (?)
-- ∀ x : α, p x means "for all x, p holds"

-- x y : α, r x y means "x is related to y"


-- given a proof of p x, in a context where x : α is arbitrary, we
-- obtain a proof for ∀ x : α, p x

-- elimination rule:
-- given ∀ x : α, p x and any term t : α, we can obtain p t

example (α : Type) (p q : α → Prop) :
  (∀ x : α , p x ∧ q x) → ∀ y : α, p y :=
  fun h : ∀ x : α, p x ∧ q x =>
  fun y : α =>
  show p y from (h y).left



variable (α : Type) (p q : α → Prop)

example (α : Type) (p q : α → Prop) : (∀ x : α , p x ∧ q x) → ∀ y : α, p y := by
  intro h
  intro y
  exact (h y).left


example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := by
  apply Iff.intro
  -- →
  · intro h
    apply And.intro
    · intro y
      exact (h y).left
    · intro y
      exact (h y).right
  -- ←
  · intro h
    intro z
    apply And.intro
    · exact h.left z
    · exact h.right z

example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := by
  apply Iff.intro
  · intro h
    apply And.intro
    · intro x
      have h1 : p x := (h x).left
      exact h1
    · intro x
      have h2 : q x := (h x).right
      exact h2
  · intro h
    intro x
    apply And.intro
    · exact h.left x
    · exact h.right x

example : (∀ x, p x → q x) → (∀ x, p x) → (∀ x, q x) := by
  intro h1 h2 x
  have h3 : p x := h2 x
  have h4 : p x → q x := h1 x
  exact h4 h3

#check Or

example : (∀ x, p x) ∨ (∀ x, q x) → ∀ x, p x ∨ q x := by
  intro h x
  cases h with
  | inl h1 => exact Or.inl (h1 x)
  | inr h1 => exact Or.inr (h1 x)

example : ((∀ x, p x) ∧ (x = y)) → p y := by
  intro h
  have h1 : ∀ x, p x := h.1
  have h2 : x = y := h.2
  exact h1 y

example : ((∀ x, p x) ∧ (x = y)) → p y := by
  intro h
  exact h.1 y

variable (α : Type) (p q : α → Prop)
variable (r : Prop)

example : α → ((∀ x : α, r) ↔ r) := by
  intro a
  apply Iff.intro
  · intro h -- forward
    exact h a
  · intro h -- backward
    intro x
    exact h



example : (∀ x, p x ∨ r) ↔ (∀ x, p x) ∨ r := sorry
example : (∀ x, r → p x) ↔ (r → ∀ x, p x) := by
  apply Iff.intro
  -- (∀ x, r → p x) → (r → ∀ x, p x)
  · intro h
    intro hr
    intro x
    have h1 : r → p x :=  h x
    have h2 : p x := h1 hr
    exact h2
  -- (r → ∀ x, p x) → (∀ x, r → p x)
  · intro h
    intro x
    intro hr
    have h1 : ∀ x, p x := h hr
    have h2 : p x := h1 x
    exact h2


-- Chapter 5

theorem test (p q : Prop) (hp : p) (hq : q) : p ∧ q ∧ p := by
  apply And.intro
  · exact hp
  · apply And.intro
    exact hq
    exact hp

#print test


-- intro pulls a variable from the implicit proof state into the explicit proof state
-- exact is an "exact" match case, where one of the introduced variables is the (sub)proof goal
-- apply is the introduction of a tactic, which may eliminate subgoals or introduce subgoals


-- Deepseek correction:
-- intro pulls a hypothesis OR a universal quantifier into local context
--  example : goal : P → Q; intro h adds h : P into context and turns goal into Q
--  example : goal : ∀ x : α, p x ; intro x adds x : α and turns goal into p x

-- exact closes a goal by providing a term which exactly matches the goal's type
--  example: goal : P → Q; h : P → Q ; exact h will solve the goal
--  can also be a previously proven lemma or constructed term

theorem test2 (p q : Prop) (hp : p) (hq : q) : p ∧ q ∧ p := by
  apply And.intro hp
  exact And.intro hq hp


-- reflexivity : is a stronger form of equality that has:
--  alpha equivalence (renames)   : λ x => x  = λ y => y
--  beta reduction (application)  : λ (+ 1) 1 = 2
--  delta reduction (definition)  : def n := 2 => n = 2
--  iota reduction (recursive def) : Nat.add a b := a + b → Nat.add a b = a + b
--  eta reduction (free variables) : if x is not free in f, (λ x => f x) = f
--  proof irrelevance             : h1 -> p, h2 -> p => h1 = h2

example (x : α) : x = x := by rfl

example : 1 + 1 = 2 := by rfl
