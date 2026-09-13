#import "misc.typ": *
#import "@preview/cetz:0.5.2": canvas, draw


#cell(
  "Problem 2.1.1",[
    A body is subjected to the displacement field
    $
      bold(u = (X_1^2 + X_2^2)hat(e)_1 + X_1 X_2 hat(e)_2)
    $
    Determine the Green–Lagrange strain tensor $E$, the infinitesimal strain tensor $epsilon$, and the infinitesimal rotation tensor $omega$.
  ],[
    In terms of displacement gradient, the Green–Lagrange tensor is 

    $
      bold(E) = 1/2 (bold(nabla_X u + nabla_X u^T + nabla_X u^T nabla_X u))
    $

    The displacement gradient is

    $
    bold(nabla_X u)

    =
    mat(
    2 bold(X)_1, 2 bold(X)_2;
    bold(X)_2, bold(X)_1
    ).
    $

    Its transpose is
$
  bold(nabla_X u)^T
  =
  mat(
    2 bold(X)_1, bold(X)_2;
    2 bold(X)_2, bold(X)_1
  ).
$
  Therefore, the Green--Lagrange strain tensor is
$
  bold(E)
  =
  1/2
  mat(
    4 bold(X)_1 + 4 bold(X)_1^2 + bold(X)_2^2,
    3 bold(X)_2 + 5 bold(X)_1 bold(X)_2;
    3 bold(X)_2 + 5 bold(X)_1 bold(X)_2,
    2 bold(X)_1 + bold(X)_1^2 + 4 bold(X)_2^2
  ).
$

Equivalently,
$
  bold(E)
  =
  mat(
    2 bold(X)_1 + 2 bold(X)_1^2 + 1/2 bold(X)_2^2,
    3/2 bold(X)_2 + 5/2 bold(X)_1 bold(X)_2;
    3/2 bold(X)_2 + 5/2 bold(X)_1 bold(X)_2,
    bold(X)_1 + 1/2 bold(X)_1^2 + 2 bold(X)_2^2
  ).
$

The infinitesimal strain tensor is obtained by neglecting the
quadratic term:
$
  bold(epsilon)
  =
  1/2 (
    bold(nabla_X u) + bold(nabla_X u)^T
  )
  =
  1/2
  mat(
    4 bold(X)_1, 3 bold(X)_2;
    3 bold(X)_2, 2 bold(X)_1
  ).
$

Hence,
$
  bold(epsilon)
  =
  mat(
    2 bold(X)_1, 3/2 bold(X)_2;
    3/2 bold(X)_2, bold(X)_1
  ).
$

Finally, the infinitesimal rotation tensor is the antisymmetric
part of the displacement gradient:
$
  bold(omega)
  =
  1/2 (
    bold(nabla_X u) - bold(nabla_X u)^T
  )
  =
  1/2
  mat(
    0, bold(X)_2;
    -bold(X)_2, 0
  ).
$

Therefore,
$
  bold(omega)
  =
  mat(
    0, 1/2 bold(X)_2;
    -1/2 bold(X)_2, 0
  ).
$


  ],
  base-color: blue
)

#cell(
  "Problem 2.2.1",[
    Determine whether the following tensor field is a compatible infinitesimal strain field:

    $
      epsilon = mat(
        k X_2^2, k X_1, 0;
        k X_1, k X_2, 0;
        0,0, k X_2^2
      )
    $
  ],[
    Firstly, assuming $k != 0$:

    $
      (partial^2 epsilon_(11)) / (partial bold(X)_2^2) + 
      (partial^2 epsilon_(22)) / (partial bold(X)_1^2) -
      2 (partial^2 epsilon_(12)) / (partial bold(X)_1 bold(X)_2)
      =
      2k + 0 + 0 != 0 
    $

    Thus, with the first test, de tensor field is incompatible.
  ],
  base-color: blue
)

#cell(
  "Problem 2.2.2",[
    Show that the tensor field below is compatible:

    

  ],[
    $
      epsilon = mat(
        k X_2^2, k X_1, 0;
        k X_1, k X_2, 0;
        0,0, k X_2^2
      )
    $
  ],
  base-color: blue
)





#cell(
  "Problem ",[

  ],[

  ],
  base-color: blue
)





#cell(
  "Problem ",[

  ],[

  ],
  base-color: blue
)



#let sigma_var = (
  (1, 0, 1.732),
  range(3).map(s => 0),
  (1.732, 0, 3)
)

#let rotation_var = (
  (.5, -.866, 0),
  (0,0,-1),
  (.866,.5, 0)
)

#cell(
  "Problem 3.3.1",[

  ],[

  ],
  base-color: blue
)

