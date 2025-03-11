/-


Chapter 6 : second order optimization
-------------------------------------

newton's method: second order taylor expansion, jump to analytic minima

secant method: uses finite differencing of two derivatives to approximate hessian

quasi-newton's method: various ways to approximate the inverse hessian
- david fletcher powell
- bfgs


Chapter 7: direct methods
-------------------------
aka: zero-order, black box, derivative-free.
do not use gradients for either steps nor checks.


7.1 cyclic coordinate search: coordinate descent/taxicab search: just alternate directions for line search
* guaranteed to improve or stay same over iterations
* but can fail to find minima

7.2 powell's method: do line search over non orthogonal directions
- so kinda like momentum but like more prone to starting conditions. idk seems like this willl choke and die if the function isn't quadratic
- proven to converge on quadratics

7.3 hooke-jeeves
- evaluate neighoborhood of points in coordinate space
- 2n evals for n dim function
- proven to converge for certain classes of functions

7.4 generalized pattern search
- this idea of "positively spanning"

7.5 nelder mead
probably the most interesting visually, also decent

7.6 divided rectangles
recursive partitioning until convergence



-/
