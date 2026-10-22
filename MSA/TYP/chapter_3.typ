#import "misc.typ": *

#cell(
  "Exercise 3.1.1", [
    Given the traction vector $bold(t) = 2 hat(e)_1 + 3 hat(e)_2 + 2 hat(e)_3$ and the normal vector $bold(n) = (2/7, 3/7, 6/7)$, calculate the normal and shear components.
  ],[

  ]
)

#cell(
  "Exercise 3.2.1", [
    Show that the stress tensor below corresponds to a state of plane stress.
    $
      sigma = mat(
        18, -24, 60;
        -24, 32, -80;
        60, -80, 25
      )
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.3.1", [
    For the stress tensor below, find its components in the basis
    $
      hat(e)_1' = (1/2, 0, sqrt(3)/2), quad
      hat(e)_2' = (-sqrt(3)/2, 0, 1/2), quad
      hat(e)_3' = (0, -1, 0).
    $
    
    $
      bold(sigma)
      =
      mat(
        1, 0, sqrt(3);
        0, 0, 0;
        sqrt(3), 0, 3
      )
    $

  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.4.1", [
    Find the principal stresses and directions for the stress tensor below:
    $
      bold(sigma)
      =
      mat(
        44.74, 59.88, -13.76;
        59.88, 4.96, 26.48;
        −13.76, 26.48, 84.30;
      ) "MPa"
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.4.2", [
    Find the maximum shear stress and the corresponding plane for the stress tensor given in the previous exercise.
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.5.1", [
    Find the spherical and deviatoric components of the stress tensor. What can you say about the deviatoric tensor?
    [Stress tensor omitted in the provided text.]
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.5.2", [
    Considering that
    $
      s_(i j) = sigma_(i j) - 1/3 sigma_(k k) delta_(i j),
    $
    show that $(s_(i i) = 0$.
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.5.3", [
    Show that
    $
      (partial p) / (partial sigma) = 1/3 I.
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.5.4", [
    Treating (sigma) and its admissible variations as symmetric, verify that
    $
      (partial s) / (partial sigma)
      =
      bb(I)^"sym" - 1/3 I times I.
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.6.1", [
    Show that
    $
      J_2 = 3/2 tau_"oct"^2.
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.6.2", [
    With the aid of index notation, show
    [expression omitted in the provided text].
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.6.3", [
    Find the von Mises stress, $sigma_"vm"$, for the following stress tensors:
    [stress tensors omitted in the provided text].
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.6.4", [
    Show that
    $
      P^"dev" : I = 0.
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.7.1", [
    Find the spherical coordinate, deviatoric radius, and Lode angle of the tensor
    [tensor omitted in the provided text].
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.7.2", [
    The Drucker--Prager yield criterion is defined as
    $
      f(sigma) = sqrt(J_2) - c + m I_1 = 0,
    $
    where (c) and (m) are material parameters. Find the yield criterion in terms of the spherical coordinate and deviatoric radius.
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.7.3", [
    The yield function of the modified Cam-Clay model is defined in terms of the Cambridge invariants, (p) and (q), as
    $
      f(sigma) = q^2 + M^2 p (p + p_c) = 0,
    $
    where (p = I_1 / 3) is the signed mean stress (negative in compression under the tension-positive convention), (M) is a material parameter, and (p_c > 0) is the magnitude of the preconsolidation pressure. Find the yield criterion in terms of (I_1) and (J_2).
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.7.4", [
    For (J_2 > 0) and (0° < theta < 60°), find the derivative of the Lode angle (theta) with respect to trace-free, symmetric variations of (s). Why are the hydrostatic state and the sector endpoints excluded?
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.8.1", [
    Show that the hydrostatic stress condition
    $
      sigma_(i j) = p delta_(i j),
    $
    where (p = p(x_1, x_2, x_3)) is the signed mean stress, satisfies the equilibrium equations provided its gradient balances the body force, i.e.
    $
      nabla p = -b.
    $
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.8.2", [
    Let (x_3) point upward from a traction-free surface at (x_3 = 0), let gravity produce $b = -gamma hat(e)_3$, and assume all shear stresses vanish. Verify that the geostatic stress distribution defined for (x_3 <= 0) as
    $
      sigma_(3 3) = gamma x_3, quad
      sigma_(1 1) = k sigma_(3 3), quad
      sigma_(2 2) = k sigma_(3 3),
    $
    where (gamma) is the unit weight and (k) is constant, satisfies the equilibrium equations.
  ], [],
  base-color: purple
)

#cell(
  "Exercise 3.8.3", [
    Consider a stress field on a radial interval with (r > 0) in an axisymmetric problem, expressed in cylindrical coordinates ((r, theta, z)) as
    $
      sigma_(r r) = C_1 r, quad
      sigma_(theta theta) = C_2 / r, quad
      sigma_(r theta) = sigma_(r z) = sigma_(z r) = sigma_(theta z) = sigma_(z theta) = 0, quad
      sigma_(z z) = sigma_(z z)(z).
    $
    Here (C_1) and (C_2) are constants, the field is independent of (theta), and the body force is (b = -gamma e_z). Determine the conditions on (C_1), (C_2), and ($sigma_(z z)$) required for the stress field to satisfy equilibrium throughout the radial interval.
  ], [],
  base-color: purple
)