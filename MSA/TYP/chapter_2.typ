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

    $
     epsilon = mat(
        2 k X_1, 3/2 k X_2, 0;
        3/2 k X_2, k X_1, 0;
        0, 0, k X_3
      ) 
    $

  ],[

    It is simple to observe two facts about the tensor $epsilon$:

    + The tensor is *symmetric* ($epsilon_(i j) = epsilon_(j i)$);
    + $epsilon_(i j)$ is, at *most*, a linear equation. 
    
    Thus, all second order derivatives are null, respecting the Saint-Venant compatibility equations.
  ],
  base-color: blue
)





#cell(
  "Problem 2.3.1",[
    Given the displacement field

    $
      bold(u) = k(X_1^2+X_2^2) t hat(e)_1 + k X_1 X_2 hat(e)_2 + k X_1 X_3 hat(e)_3
    $

    where $k = 10^(-4)$, determine the volumetric strain at point $bold(X) = (2,1,1)$ for $t=2$.
  ],[
    To define the relative change in the volume of a material element, we may calculate

    $
      epsilon_v = (Delta (d V)) / (d V) approx "trace"(epsilon) = epsilon_(i i) = (partial u_i) / (partial X_i) = bold(nabla dot u)
    $

    Thus, simply:

    $ 
      epsilon_v =
      (partial (k t(X_1^2+X_2^2))) / (partial X_1) +
      (partial (k X_1 X_2)) / (partial X_2) +
      (partial (k X_1 X_3 )) / (partial X_3) =\
      =
      2 k (t=2) X_1 + k X_1 + k X_1 \
      = 6 k X_1 = 12 dot 10^(-4)
    $
  ],
  base-color: blue
)


#cell(
  "Problem 2.4.1",[
    Given the tensor field

    $
      epsilon =
      mat(
        4 k X_1, 3 k X_2, 0;
        3 k X_2, 2 k X_1, 0;
              0,       0, 2 k X_3;
      )
    $

    where $k = 10^(-4)$, determine the principal strains and directions at $bold(X) = (1,1,1)$. Compare the two in-plane eigenvalues with the values obtained from the 2D formula.
  ],[
    At $bold(X) = (1,1,1)$, the tensor field becomes

    $
      epsilon = mat(
        4,3,0;
        3,2,0;
        0,0,2
      ) dot k
    $

    Thus, to obtain the eigenvalues ($lambda' = lambda / k$):

    $
      lambda &= det mat(
        4 - lambda', 3, 0;
        3,2-lambda',0;
        0,0,2-lambda'
      ) \
      &= (4 - lambda') (2 - lambda')^2 - 9(2 - lambda') = 0
      
    $

    Which equates to

    $
      lambda'^3 - 8 lambda'^2 + 11 lambda' + 2 = 0 
    $

    The solutions are

    $
      lambda = mat(2; 3 - sqrt(10); 3 + sqrt(10)) k
    $

    The first eigenvector can be obtained with

    $
      mat(
        2, 3, 0;
        3, 0, 0;
        0, 0, 0;
      )
      bold(v)_1
      =
      mat(
        0;0;0
      )
    $
    Which the only unitary solution is
    $
      bold(v)_1 = mat(0;0;1)
    $
    For the secont eigenvector:

    $
      mat(
        1 + sqrt(10),3,0;
        3, -1 + sqrt(10), 0;
        0,0,-1 + sqrt(10)
      ) bold(v)_2 = mat(0;0;0)
    $
    
    $
      mat(
        1 + sqrt(10),3;
        3, -1 + sqrt(10);
      ) bold(v)_2 = mat(0;0;0)
    $

    Assuming $v_(2,1) = 1$:
    $
      3 + (-1 + sqrt(10)) v_(2,2) = 0 \
      v_(2,2) = -1.387 \
    $
    Then, the unitary solution is:
    $
      bold(v)_2 = mat(
          0.585;
          -0.811;
          0;
      )
    $

    The third, by obtaining the cross product, is:

    $
      bold(v)_3 = mat(
        0.811; 0.585; 0
      )
    $

    Thus, the eigen vectors can be defined by the tensor $bold(Q)$:
  
    $
      bold(Q) = mat(
        |, |, |;
        bold(v)_1, bold(v)_2, bold(v)_3;
        |, |, |
      ) = mat(
        0, 0.585, 0.811;
        0, -0.811, 0.585;
        1, 0, 0;
      )
    $

    #align(center)[
      #canvas({
      import draw: *

      ortho(z: 90deg, {

        let X = (1,1,1)
        
        // Changed from on-xz to on-xy to match v2 and v3
        on-xy({
          grid((-2,-2), (2,2), stroke: gray + .5pt)
        })

        // Draw 3D Axes
        line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((2.3, 0, 0), $x$)
        
        // Extended the Y axis to the negative side to anchor v2
        line((0,-2,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 3.3, 0), $y$)
        
        line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 0, 2.3), $z$)

        line((0,0,0), (0,0,1), stroke: red + 1.5pt, mark: (end: ">"))
        content((0,0, 1.3), text(red)[$v_1$])

        line((0,0,0), (0.585,-.811,0), stroke: blue + 1.5pt, mark: (end: ">"))
        content((.785,-.911,0), text(blue)[$v_2$])

        line((0,0,0), (0.811,0.585,0), stroke: orange + 1.5pt, mark: (end: ">"))
        content((1.11,0.685,0), text(orange)[$v_3$])
        
        })
      })
    ],

    Using the 2D equation:

    $
      epsilon_(1;2) &= 1/2(4k + 2k) plus.minus sqrt(((4k-2k)/2)^2 + (3k)^2) \
      &= 3k plus.minus sqrt(k^2 + 9k^2) \
      &= (3 plus.minus sqrt(10)) k
    $

    Which reproduces the two in-plane eigenvalues, with an out-of-plane strain of 2k.

    #text(fill: blue.darken(65%))[Note: The eigenvalues should have been placed in the order $lambda_1 > lambda_2 > lambda_3$ but I'm too lazy to change it now it's like 23h15.]

  ],
  base-color: blue
)


#cell(
  "Problem 2.4.2",[
    Given the displacement field 

    $
      bold(u) = k(X_1^2+X_2^2) t hat(e)_1 + k X_1 X_2 hat(e)_2 + k X_1 bold(X)_3 hat(e)_3
    $

    where $k = 10^(-4)$, determine the principal strains and directions at $bold(X) = (2,1,1)$ for $t = 1$ and $t = 2$.
  ],[
    The tensor filed is defined by

    $
      epsilon_(i j) = 1/2(#partial_frac($u_i$, $X_j$) + #partial_frac($u_j$, $X_i$))
    $

    Thus,

    $
      bold(epsilon)(X_1, X_2, X_3, t) = mat(
        2 X_1 t, X_2 + 2 X_2 t, X_3;
        X_2 + 2 X_2 t, X_1 , 0;
        X_3, 0, X_1;
      ) dot k
    $

    Which, for $(2,1,1)$:


    $
      bold(epsilon)(t) = mat(
        4 t, 1 + 2t, 1;
        1 + 2t, 2, 0;
        1, 0, 2;
      )
    $

    For $t = 1$

    $
      epsilon = mat(
        4, 3, 1;
        3, 2, 0;
        1, 0, 2;
      )
    $

    The characteristic polynomial for this tensor field is then

    $
      lambda^3 - 8 lambda^2 + 10 lambda + 4 = 0
    $

    Thus the principal strains are:

    $
      bold(lambda) = mat(
        3 + sqrt(11);
        2;
        3 - sqrt(11);
      ) k
    $

    With eigenvectors:

    $
      bold(Q) = mat(
        |, |, |;
        bold(v)_1, bold(v)_2, bold(v)_3;
        |, |, |
      ) = mat(
         4.31662,   0.0,  -2.31662;
          3.0,      -1.0,   3.0;
          1.0,       3.0,   1.0;
      ) = mat(
        0.8067, 0, -0.5910;
        0.5606, -0.3162, 0.7653;
        0.1868, 0.9487, 0.2551;
      )
    $

    Similarly, for $t = 2$:

    $
      bold(epsilon)
      =
      mat(
        8, 5, 1;
        5, 2, 0;
        1, 0, 2;
      )
    $

    The principal strains are:

    $
      bold(lambda) = mat(
        5 + sqrt(35);
        2;
        5 - sqrt(35);
      ) k
    $

    $
      bold(Q) = mat(
        |, |, |;
        bold(v)_1, bold(v)_2, bold(v)_3;
        |, |, |
      ) = mat(
        8.91608,   0.0,  -2.91608;
        5.0,      -1.0,   5.0;
        1.0,       5.0,   1.0;
      ) = mat(
        0.8685, 0.0, -0.4964;
        0.4870, -0.1961, 0.8511;
        0.0974, 0.9806, 0.1702;
      )
    $

    #let Rot = (-20deg,120deg,80deg)

    #align(center)[
      #grid(
        align: center,
        columns: 4,
        [$t=1$],
        [
          #canvas({
            import draw: *

            ortho(z: Rot.at(2), x:Rot.at(0), y:Rot.at(1), {

              
              // Changed from on-xz to on-xy to match v2 and v3
              on-xy({
                grid((-2,-2), (2,2), stroke: gray + .5pt)
              })

              // Draw 3D Axes
              line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
              content((2.3, 0, 0), $x$)
              
              // Extended the Y axis to the negative side to anchor v2
              line((0,-2,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
              content((0, 3.3, 0), $y$)
              
              line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
              content((0, 0, 2.3), $z$)
              
              let v1 = (0.8067, 0.5606, 0.1868)
              line((0,0,0), v1, stroke: red + 1.5pt, mark: (end: ">"))
              content(v1.map(v => v + .1), text(red)[$v_1$])

              let v2 = (0, -.3162, .9487)
              line((0,0,0), v2, stroke: blue + 1.5pt, mark: (end: ">"))
              content(v2.map(v => v + .1), text(blue)[$v_2$])

              let v3 = (-.591, .7653, .2551)
              line((0,0,0), v3, stroke: orange + 1.5pt, mark: (end: ">"))
              content(v3.map(v => v + .1), text(orange)[$v_3$])
              
              })
            })
        ],
        [$t=2$],
        [
          #canvas({
            import draw: *

            ortho(z: Rot.at(2), x:Rot.at(0), y:Rot.at(1), {

              
              // Changed from on-xz to on-xy to match v2 and v3
              on-xy({
                grid((-2,-2), (2,2), stroke: gray + .5pt)
              })

              // Draw 3D Axes
              line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
              content((2.3, 0, 0), $x$)
              
              // Extended the Y axis to the negative side to anchor v2
              line((0,-2,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
              content((0, 3.3, 0), $y$)
              
              line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
              content((0, 0, 2.3), $z$)
              
              let v1 = (0.8685, .487, .0974)
              line((0,0,0), v1, stroke: red + 1.5pt, mark: (end: ">"))
              content(v1.map(v => v + .1), text(red)[$v_1$])

              let v2 = (0, -.1961, .9806)
              line((0,0,0), v2, stroke: blue + 1.5pt, mark: (end: ">"))
              content(v2.map(v => v + .1), text(blue)[$v_2$])

              let v3 = (-.4964, .8511, .1702)
              line((0,0,0), v3, stroke: orange + 1.5pt, mark: (end: ">"))
              content(v3.map(v => v + .1), text(orange)[$v_3$])
              
              })
            })
        ]
      )
    ]

  ],
  base-color: blue
)


#cell(
  "Problem 2.4.3",[
    Given the infinitesimal strain tensor $bold(epsilon)$, find the principal strains and directions. Consider $𝑘 = 10^(−4)$.

    $
      epsilon = k mat(
        1, 0.5, 0;
        0.5, 1, 0;
        0, 0, 1;
      )
    $
  ],[
    To obtain the eigenvalues, the following expression must be solved:

    $
      det mat(
        1 - lambda', 0.5, 0;
        0.5, 1-lambda', 0;
        0, 0, 1-lambda'
      )
      =
      0
    $

    $
      (1 - lambda')^3 - 0.5^2 (1 - lambda') = 0 \
      lambda'^3 - 3 lambda'^2 + 2.75 lambda' - 0.75 = 0
    $

    For $lambda' = lambda / k$.

    Which solutions are

    $
      bold(lambda) = mat(
        3"/"2;
        1;
        1"/"2
      ) k
    $

    Then:

    $
      bold(Q) = mat(
        |, |, |;
        bold(v)_1, bold(v)_2, bold(v)_3;
        |, |, |
      ) = mat(
          0.707,  0,  -0.707;
          0.707,  0,   0.707;
          0   ,  1,   0;
      )
    $


  ],
  base-color: blue
)

#cell(
  "Problem 2.5.1",[
    The cylindrical components $epsilon '$ were calculated at $(r, theta, z) = (3, pi/6, 0)$. Convert them to Cartesian components.

    $
      epsilon' = mat(
        2, -1, 2;
        -1, 1, 0;
        2, 0, 3
      ) dot 10^(-3)
    $
  ],[
    To change from cylindrical to cartesian components, we must invert the following equation

    $
      bold(epsilon') = bold(R)^T bold(epsilon) bold(R)
    $

    Multiplying on the left by $bold(R)$, and on the right, by $bold(R)^T$:

    $
      bold(R) epsilon' bold(R)^T = bold(R) bold(R)^T epsilon bold(R) bold(R)^T
    $

    Since $bold(R)$ is orthogonal, $bold(R) bold(R)^T = 1$:

    $
      epsilon = bold(R) epsilon' bold(R)^T
    $

    The transformation tensor for cylindrical coordinates becomes:

    $
      bold(R) = mat(
        cos(theta), -sin(theta), 0;
        sin(theta), cos(theta), 0;
        0, 0, 1;
      )
    $

    At $(r, theta, z) = (3, pi/6, 0)$:

    $
      bold(R) = mat(
        0.866, -0.5, 0;
        0.5, 0.866, 0;
        0, 0, 1; 
      )
    $

    Finally

    $
      epsilon
      =
      bold(R)
      epsilon'
      bold(R)^T
      =
      mat(
        0.866, -0.5, 0;
        0.5, 0.866, 0;
        0, 0, 1; 
      )
      mat(
        2, -1, 2;
        -1, 1, 0;
        2, 0, 3
      )
      mat(
        0.866, 0.5, 0;
        -0.5, 0.866, 0;
        0, 0, 1; 
      ) dot 10^(-3) \
      epsilon =
      mat(
        2.61603,    -0.0669873,  1.73205;
      -0.0669873,   0.383975,   1.0;
        1.73205,     1.0,        3.0;
      ) dot 10^(-3)
    $
  ],
  base-color: blue
)