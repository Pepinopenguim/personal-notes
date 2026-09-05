#import "misc.typ": *
#import "@preview/cetz:0.5.2": canvas, draw

#let A_var = (
    (1, 2, 0),
    (2, 4, 1),
    (0, 1, 3),
  )

#let b_var = (1, 0, 2)

#let problem_a = [
  
  #let a_solution = 0

  #for i in range(3) {
    a_solution += A_var.at(i).at(i)
  }

  *a)* $bold(A)_(i i)$

    $
      bold(A)_(i i) -> sum_i^3 bold(A)_(i i) = #(
        for i in range(1,4) {
        [$A_(#i #i)$]
        if (i != 3) {
          [$+$]
        }
      }) = "trace"(A) = #a_solution
    $
]

#let problem_b = [
  #let b_solution = (0, 0, 0)
  #for i in range(0,3) {
    let v = 0
    for j in range(0, 3) {
      v += A_var.at(i).at(j) * b_var.at(j)
    }
    b_solution.at(i) = v
  }

  *b)* $bold(A)_(i j) bold(b)_j$

    $
      c_i =
      A_(i j) b_j
      ->
      sum_j^3
      A_(i j) b_j
      =
      #(
        for j in range(1,4) {
        [$A_(i #j) b_(#j)$]
        if (j != 3) {
          [$+$]
        }
      })
      =
    $

    $
      =
      #(
        vec2mat(
          (
            $A_(1 1) b_1 + A_(1 2) b_2 + A_(1 3) b_3$ ,
            $A_(2 1) b_1 + A_(2 2) b_2 + A_(2 3) b_3$ ,
            $A_(3 1) b_1 + A_(3 2) b_2 + A_(3 3) b_3$ ,
          )
        )
      )
      = #vec2mat(b_solution)
    $
]

#let problem_c = [
  #let c_solution = (0, 0, 0)

  #for i in range(0,3) {
    let v = 0
    for j in range(0, 3) {
      v += A_var.at(j).at(i) * b_var.at(j)
    }
    c_solution.at(i) = v
  }

  *c)* $A_(j i) b_j$

    $
      c_i =
      A_(j i) b_j
      ->
      sum_j^3
      A_(j i) b_j
      =
      #(
        for j in range(1,4) {
        [$A_(#j i) b_(#j)$]
        if (j != 3) {
          [$+$]
        }
      })
      =
    $

    $
      =
      #(
        vec2mat(
          (
            $A_(1 1) b_1 + A_(2 1) b_2 + A_(3 1) b_3$ ,
            $A_(1 2) b_1 + A_(2 2) b_2 + A_(3 2) b_3$ ,
            $A_(1 3) b_1 + A_(2 3) b_2 + A_(3 3) b_3$ ,
          )
        )
      )
      = #vec2mat(c_solution)
    $

    #text(fill: red.darken(65%))[Note: results for $(b)$ and $(c)$ are the same by coincidence]
]

#let problem_d = [
  #let d_literal = ()
  #let d_solution = (
    (0,0,0),
    (0,0,0),
    (0,0,0),
  )
  #for i in range(0,3) {
    let ar = ()
    for j in range(0, 3) {
      let v = b_var.at(i) * b_var.at(j)
      d_solution.at(i).at(j) = v
      ar.push($b_#(i+1) b_#(j+1)$)
    }
    d_literal.push(ar)
  }


  *d)* $b_i b_j$

    $
      A_(i j) = b_i b_j
      = 
      #array2mat(d_literal)
      =
      #array2mat(d_solution)
    $
]

#let problem_e = [
  #let e_literal = ()
  #let e_solution = 0

  #for i in range(1,4) {
    let line = ()
    for j in range(1, 4) {
      line.push([$A_(#i #j) A_(#j #i)$])
      e_solution += A_var.at(i - 1).at(j - 1) * A_var.at(j - 1).at(i - 1)
    }
    e_literal.push(line.join(" + "))
  }

  #let e_literal = e_literal.join("+\n")

  *e)* $A_(i j) A_(j i)$
      
      $
        alpha = sum_i^3 sum_j^3
        A_(i j) A_(j i)
        =
      $
      #align(center)[#e_literal]
      $
        = #e_solution
      $
]

#cell(
  "Problem 1.1.1",
  [
    Given the tensors

    $
      bold(A) = #(array2mat(A_var))
      "and"
      bold(b) = #(vec2mat(b_var))
    $

    Solve:
  ],
  [
    #problem_a
    #problem_b
    #problem_c
    #problem_d
    #problem_e
    
  ]
)

#let problem_a = [
  *a)* $a_i b_i$

  $
  alpha = a_i b_i
  =
  sum_i^3 a_i b_i
  =
  bold(a) dot bold(b)
  $
]

#let problem_b = [
  *b)* $a_i b_k c_k$

  $
    c_i = a_i sum_k^3 b_k c_k
    ->
    bold(c) = bold(a) dot (bold(b) dot bold(c))
  $
]

#let problem_c = [
  *c)* $A_(i k) B_(k j)$

  #let c_literal = (
    (),
    (),
    (),
  )

  #for i in range(0, 3) {
    for j in range(0, 3) {
      let cur_str = ()
      for k in range(1, 4) {
        cur_str.push([$A_(#(i+1) #k) B_(#k #(j+1))$])
      }
      c_literal.at(i).push(cur_str.join(" + "))
    }
  }

  $
    C_(i j) = A_(i k) B_(k j) =
  $
  $
    sum_k^3 A_(i k) B_(k j) -> 
  $
  $
    #array2mat(c_literal)
  $
  $
    = bold(A) dot bold(B)
  $
]

#let problem_d = [
  *d)* $A_(k i) B_(k l) A_(l j)$

  Assuming the answer as $D_(i j)$, since only i and j are non repeating, assume
  $
  C_(i l) = A_(k i) B_(k l) -> bold(C) = bold(A)^T dot bold(B)
  $
  Then
  $
    D_(i j) = C_(i l) A_(l j) -> bold(D) = bold(C) dot bold(A)
  $
  Finally
  $
    bold(D) = bold(A)^T dot bold(B) dot bold(A)
  $

  Another approach is:

  Assume

  $
    E_(k j) = B_(k l) A_(l j) -> bold(E) = bold(B) dot bold(A)
  $

  Then

  $
    D_(i j) = A_(k i) E_(k j) -> bold(D) = bold(A)^T dot bold(E)
  $

  Which, of course, results in the same value!

  $
    bold(D) = bold(A)^T dot bold(B) dot bold(A)
  $
  
]

#let problem_e = [
  *e)* $a_i A_(j k) b_k$

  #let e_literal_1 = ()

  #for k in range(1,4) {
    e_literal_1.push($A_(j #k) b_#k$)
  }

  #let e_literal_2 = (
    (),
    (),
    (),
  )

  #for i in range(3) {
    for j in range(3) {
      e_literal_2.at(i).push($a_#(i+1) c_#(j+1)$)
    }
  }

  Let the answer be a matrix $D_(i j)$.

  Let $c_j = A_(j k) b_k$

  $
    c_j = #(e_literal_1.join("+")) -> bold(c) = bold(A) dot bold(b)
  $

  then, 

  $
    D_(i j) = a_i c_j -> array2mat(#e_literal_2) = bold(a) dot bold(c)^T
  $

  Thus

  $
    bold(D) = bold(a) dot (bold(A) dot bold(b))^T 
  $

  


]

#let problem_f = [
  *f)* $a_i A_(i k) b_k$

  From the previous question, we know that

  $
    c_i = A_(i k) b_k -> bold(c) = bold(A) dot bold(b)
  $

  And, simply

  $
    alpha = a_i c_i = bold(a) dot bold(c) 
  $

  The answer is

  $
    alpha = bold(a) dot bold(A) dot bold(b)
  $
]

#cell(
  "Problem 1.1.2",
  [
    Given the expressions in index notation, write the corresponding expressions in abstract tensor notation.
  ],
  [
    #problem_a
    #problem_b
    #problem_c
    #problem_d
    #problem_e
    #problem_f
  ]
)


#cell(
  "Problem 1.2.1",
  [
    Show that $delta_(i j) delta_(j i) = 3$.
  ],
  [
    #let I = (
      (1,0,0),
      (0,1,0),
      (0,0,1),
    )
    #let literal = ()
    #let result = 0

    #for i in range(3) {

      for j in range(3) {
        result += I.at(i).at(j) * I.at(j).at(i)
      }

    }


    $
      delta_(i j) delta_(j i)
      =
      array2mat(#I)
      dot
      array2mat(#I)^T
      =
      1 dot 1 + 1 dot 1 + 1 dot 1
      =
      #result
    $

  ]
)

#cell(
  "Problem 1.2.2",
  [
    Find the expression in index notation for

    $
      #partial_frac(
        $bold(v)$,
        $bold(v)$
      )
    $

    where $bold(v)$ is a vector.
  ],
  [
    #let literal = ()

    #for i in range(1,4) {
      let arr = ()
      for j in range(1,4) {
        arr.push(
          partial_frac(
            $v_#i$,
            $v_#j$,
          )
        )
      }
      literal.push(arr)
    }
    $
      bold(A)
      =
      #partial_frac(
        $bold(v)$,
        $bold(v)$
      )
      =
      #array2mat(
        literal
      )
      ->
      A_(i j)
      =
      #partial_frac(
        $v_i$,
        $v_j$
      )
    $

    It is known that

    $
      #partial_frac(
        $v_l$,
        $v_m$
      )
      =
      cases(
        1 "if" l = m,
        0 "else"
      )
    $
    Then it is safe to assume that

    $
      #partial_frac(
        $v_i$,
        $v_j$
      )
      =
      delta_(i j)
    $
  ]
)

#cell(
  "Problem 1.2.3",
  [
    With the aid of the Kronecker delta, find the expression in index notation for the trace of $bold(a) bold(b)^T$  where $bold(a)$ and $bold(b)$ are vectors.
  ],
  [
    $
      alpha
      =
      "trace"(bold(a) bold(b)^T)
      =
      a_i b_j delta_(i j)
    $

    With the contraction property

    $
      b_j delta_(i j) = b_i
    $

    $
      alpha = a_i dot b_i = bold(a) dot bold(b)
    $
  ]
)

#cell(
  "Problem 1.2.4",
  [
    Simplify the expression 

    $
      (partial ^2) / (partial x_i partial x_j) (x_i x_j)
    $
  ],
  [
    $
      (partial ^2) / (partial x_i partial x_j) (x_i x_j)
      =
      #partial_frac(
        $$,
        $x_i$,
      ) (
        #partial_frac(
          $x_i$,
          $x_j$
        ) x_j
        +
        #partial_frac(
          $x_j$,
          $x_j$
        ) x_i
      )
      =
    $

    $
      =
      #partial_frac(
        $$,
        $x_i$,
      ) (
        0 + delta_(j j) x_i
      )
      =
      3
      #partial_frac(
        $$,
        $x_i$,
      ) (
        x_i
      )
      =
      3 delta_(i i)
      =
      9
    $
  ]
)

#let levi-civita-arr = range(1,4).map(
  i => range(1,4).map(
    j => range(1,4).map(
      k => levi-civita((i, j, k))
    )
  )
)


#cell(
  "Problem 1.3.1",
  [
    Show that

    $
      epsilon.alt_(i j k) a_i a_j = 0
    $
  ],
  [
    #let literal_a = range(1,4).map(
      i => range(1,4).map(
        j => $a_#i a_#j$
      )
    )

    #let literal_b = range(1, 4).map(k => {
      let terms = ()
      // Sum over dummy indices i and j
      for i in range(1, 4) {
        for j in range(1, 4) {
          let val = levi-civita((i, j, k))
          if val != 0 {
            // Format the sign and the variables
            let sign = if val == 1 { $+$ } else { $-$ }
            terms.push($#sign a_#i a_#j$)
          }
        }
      }
      terms.join() 
    })

    *By brute force...*

    Let $A_(i j) = a_i a_j$

    $
      #array3mat(levi-civita-arr)
      dot
      #array2mat(literal_a)
      =
      #vec2mat(literal_b)
      =
      #vec2mat((0,0,0))
    $

    *By triviality*

    Multiplying both sides by the cartesian basis vector:

    $
      epsilon.alt_(i j k) a_i a_j dot bold(hat(e))_i = 0 dot bold(hat(e))_i = 0
    $

    The expression above is the cross product of the vector $bold(a)$.

    $
      epsilon.alt_(i j k) a_i a_j dot bold(hat(e))_i 
      =
      bold(a)
      times
      bold(a)
    $
    By definition, the cross product of a vector by itself is 0, since they are colinear.
  ]
)

#cell(
  "Problem 1.3.2",
  [
    Prove de identity

    $
      epsilon.alt_(i j k) epsilon.alt_(m n k) = delta_(i m)delta_(j n) - delta_(i n) delta_(j m)
    $
  ],
  [
    $
      epsilon.alt_(i j k) epsilon.alt_(m n k)
    $
    
    The product of two Levi-Civita tensors can be written as the determinant of a $3 times 3$ matrix of Kronecker deltas:

    $
      epsilon.alt_(i j k) epsilon.alt_(m n p) = det mat(
        delta_(i m), delta_(i n), delta_(i p);
        delta_(j m), delta_(j n), delta_(j p);
        delta_(k m), delta_(k n), delta_(k p)
      )
    $

    We aim to solve the specific case where $p = k$:

    $
      epsilon.alt_(i j k) epsilon.alt_(m n k) = det mat(
        delta_(i m), delta_(i n), delta_(i k);
        delta_(j m), delta_(j n), delta_(j k);
        delta_(k m), delta_(k n), delta_(k k)
      )
    $

    Expanding the determinant along the bottom row, and knowing that $delta_(k k) = 3$ and $delta_(i k) delta_(k m) = delta_(i m)$, the matrix simplifies directly to the identity:

    $
      epsilon.alt_(i j k) epsilon.alt_(m n k) 
      &= det mat(
        delta_(i m), delta_(i n);
        delta_(j m), delta_(j n)
      ) \
      &= delta_(i m) delta_(j n) - delta_(i n) delta_(j m)
    $

  ]
)

#cell(
  "Problem 1.3.3",
  [
    Using the permutation operator, prove the vector triple product identity

    $
      bold(a) times (bold(b) times bold(c)) = bold(b)(bold(a) dot bold(c)) - bold(c)(bold(a) dot bold(b))
    $
  ],
  [
    Let $bold(r)$ be the result vector.
    $
      bold(r) = bold(a) times (bold(b) times bold(c))
      ->
      r_i = epsilon.alt_(i j k) a_j d_k  
    $

    For $d_k = epsilon.alt_(k m n) b_m c_n$

    Therefore
    $
      r_i = epsilon.alt_(i j k) a_j epsilon.alt_(k m n) b_m c_n 
    $

    From the property obtained from the last problem, and the fact that $epsilon.alt_(k m n) = epsilon.alt_(m n k)$,we know that:

    $
      epsilon.alt_(i j k) epsilon.alt_(m n k) = delta_(i m)delta_(j n) - delta_(i n) delta_(j m)
    $

    $
      r_i &= (delta_(i m)delta_(j n) - delta_(i n) delta_(j m)) a_j b_m c_n \
          &= a_j b_m c_n delta_(i m)delta_(j n) - a_j b_m c_n delta_(i n) delta_(j m) \
          &= b_i (a_j c_j) - c_i (a_j b_j)
    $
    
    Translating the scalar components back to vector notation, where $(a_j c_j) = (bold(a) dot bold(c))$:

    $
      bold(r) = bold(b)(bold(a) dot bold(c)) - bold(c)(bold(a) dot bold(b))
    $
  ]
)

#cell("Problem 1.4.1", [
  Given two vectors $bold(a)$ and $bold(b)$, show that

  $
  (bold(a) times.o bold(a))
  (bold(b) times.o bold(b))
  =
  (bold(a) dot bold(b))bold(a) times.o bold(b)
  $
], [
  Let the tensor $bold(R)$ be the result.
  $
  bold(R)
  =
  (bold(a) times.o bold(a))
  (bold(b) times.o bold(b))
  ->
  R_(i j)
  &=
  a_i a_k b_k b_j \
  &=
  (a_k b_k) a_i b_j \
  $
  $
  R_(i j) = 
  (a_k b_k) a_i b_j ->
  bold(R) = (bold(a) dot bold(b)) dot bold(a) times.o bold(b)
  $
])
#cell("Problem 1.4.2", [
  Find the abstract expression for 
  $
    #partial_frac($$, $bold(v)$) (bold(v) dot bold(v))
  $
], [
  $
    #partial_frac($$, $bold(v)$) (bold(v) dot bold(v)) -> 
    #partial_frac($$, $bold(v)_j$) (v_i v_i)
    &=
    2 #partial_frac($v_i$, $bold(v)_j$) v_i \
    &=
    2 delta_(i j) v_i \
    &= 2 v_j

  $

  Therefore

  $
    #partial_frac($$, $bold(v)$) (bold(v) dot bold(v))
    =
    2 bold(v)
  $
])
#cell("Problem 1.4.3", [
  Given two second-order tensor $bold(A)$ and $bold(B)$, show that

  $
    #partial_frac($$,$bold(A)$) (bold(A) : bold(B)) = bold(B)
  $
], [
  In index notation:

  $
    #partial_frac($$,$bold(A)$) (bold(A) : bold(B)) -> 
    #partial_frac($$,$A_(i j)$) (A_(m n) B_(m n)) 
  $
  $
    #partial_frac($$,$A_(i j)$) (A_(m n) B_(m n)) 
    &= #partial_frac($A_(m n)$, $A_(i j)$) B_(m n)
    +
    #partial_frac($B_(m n)$, $A_(i j)$) A_(m n) \
    &= delta_(m i) delta_(n j) B_(m n) \
    &= B_(i j) \ &-> bold(B)
  $
  
])
#cell("Problem 1.4.4", [
  Find the expression for 

  $
    #partial_frac(
      $$,
      $bold(a)$,
    )
    (bold(a) times bold(b))
  $
], [
  In index notation,

  $
    #partial_frac(
      $$,
      $bold(a)$,
    )
    (bold(a) times bold(b))
    ->
    #partial_frac(
      $$,
      $a_l$,
    )
    (
      epsilon.alt_(i j k)
      a_j
      b_k
    ) 
    &=
      epsilon.alt_(i j k)
      b_k
      delta_(j l) \
    &=
      epsilon.alt_(i l k)
      b_k
    &=
      - epsilon.alt_(i k j)
      b_k
  $
])
#cell("Problem 1.4.5", [
  Compute the derivative, with respect to $bold(A)$, of 

  $
    bold(A) - 1/3 "trace"(bold(A))bold(I)
  $
], [
  $
    1/3
    #partial_frac(
      $
        
      $,
      $
        A_(m n)
      $
    )
    (A_(i j) - A_(k k) delta_(i j))
    &= delta_(i m) delta_(j n) - 1/3 delta_(i j) delta_(k m) delta_(k n) \
    &= delta_(i m) delta_(j n) -  1/3 delta_(i j) delta_(m n) \
    &= II_(i j m n) - 1/3 delta_(i j) delta_(m n)\
    &-> bold(bb(I)) - 1/3 bold(I) times.o bold(I)
  $
])

#let problem_a = [
  *a)* $bold(I) :bold(I) = 3$

  Since $bold(A):bold(B) -> A_(i j) B_(i j)$, then our solution is:

  $
    alpha &= delta_(i j) delta_(i j) \
    &= delta_(i i)\ &= 3
  $
]

#let problem_b = [
  *b)* $bold(II) : bold(II) = bold(II)$
  
  By definition, $II_(i j k l) = delta_(i k) delta_(j l)$. Thus

  $
    II_(i j k l) II_(k l m n) &=
    (delta_(i k)delta_(j l))(delta_(k m)delta_(l n)) \
    &= delta_(i m) delta_(j n) \
    &= II
  $

]

#let problem_c = [
  *c)* $bold(II)^"sym" : bold(II)^"sym" = bold(II)^"sym"$

  $
    II^"sym"_(i j m n) II^"sym"_(m n k l) 
    &= 1/2(
      delta_(i m)delta_(j n)
      + 
      delta_(i n)delta_(j m)
    ) 
    dot 
    1/2(
      delta_(m k)delta_(n l)
      +
      delta_(m l)delta_(n k)
    )  \
    &= 1/4(
      delta_(i m)delta_(j n)delta_(m k)delta_(n l)
      +
      delta_(i m)delta_(j n)delta_(m l)delta_(n k)
      +
      delta_(i n)delta_(j m)delta_(m k)delta_(n l)
      +
      delta_(i n)delta_(j m)delta_(m l)delta_(n k)
    )  \
    &= 1/4(
      delta_(i k)delta_(j l)
      +
      delta_(i l)delta_(j k)
      +
      delta_(i l)delta_(j k)
      +
      delta_(i k)delta_(j l)
    ) \
    &= 1/2(
      delta_(i k)delta_(j l)
      +
      delta_(i l)delta_(j k)
    ) \
    &=II^"sym"_(i j k l)
  $
]

#cell(
  "Problem 1.5.1",[
    Using index notation, show that
  ],[
    #problem_a
    #problem_b
    #problem_c
  ]
)

#let problem_a = [
  // prove that
  *a)* $(bold(I) times.o bold(I)) : bold(A) = "trace"(bold(A)) bold(I)$
  // solution
  In index notation, the left side is:

  $
    (delta_(i j) delta_(k l)) dot A_(k l) &= delta_(i j) dot A_(k k) 
  $
]

#let problem_b = [
  *b)* $bold(A)^"anti" = 1/2 (bold(A) - bold(A)^T)$

  By definition, $bold(A)^"anti"$ is:

  $
    II^"anti":bold(A) &-> II^"anti"_(i j k l) A_(k l) \
    &= 1/2(delta_(i k) delta_(j l) - delta_(i l) delta_(j k)) A_(k l) \
    &= 1/2(delta_(i k) delta_(j l) A_(k l) - delta_(i l) delta_(j k) A_(k l)) \
    &= 1/2(A_(i j) - A_(j i))
  $
]

#cell(
  "Problem 1.5.2",[
    Considering the second-order tensor $bold(A)$, using index notation, show that
  ],[
    #problem_a
    #problem_b
  ]
)

#let A_var = (
  (3, 0, -1),
  (0, 4, 0),
  (-1, 0, 2),
)



#let problem_a = [
  *a)* Rotated by 36.87° around the y-axis.

  #let rot_ang = 36.61 * 3.14/180
  #let ex = (calc.cos(rot_ang), 0, -calc.sin(rot_ang))
  #let ex_txt = (calc.cos(rot_ang), 0, -calc.sin(rot_ang) + .3)

  #let ez = (calc.sin(rot_ang), 0, calc.cos(rot_ang))
  #let ez_txt = (calc.sin(rot_ang) + .3, 0, calc.cos(rot_ang))

  #grid(
    columns: 2,
    gutter: 20pt,
    canvas({
      import draw: *

      // The projection block is required to tell CeTZ how to render the 3D points
      ortho(x: 45deg, {
        
        on-xz({
          grid((-2,-2), (2,2), stroke: gray + .5pt)
        })

        // Draw 3D Axes
        line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((2.3, 0, 0), $x$)
        
        line((0,0,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 3.3, 0), $y$)
        
        line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 0, 2.3), $z$)

        // original basis vectors
        line((0,0,0), (1,0,0), stroke: red + 1.5pt, mark: (end: ">"))
        content((1.3,0,0), text(red)[$hat(e)_x$])

        line((0,0,0), (0,1,0), stroke: blue + 1.5pt, mark: (end: ">"))
        content((0,1.3,0), text(blue)[$hat(e)_y$])

        line((0,0,0), (0,0,1), stroke: orange + 1.5pt, mark: (end: ">"))
        content((0,0,1.3), text(orange)[$hat(e)_z$])
        
      })
    }),
    canvas({
      import draw: *

      

      // The projection block is required to tell CeTZ how to render the 3D points
      ortho(x: 45deg, {
        
        on-xz({
          grid((-2,-2), (2,2), stroke: gray + .5pt)
        })

        // Draw 3D Axes
        line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((2.3, 0, 0), $x$)
        
        line((0,0,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 3.3, 0), $y$)
        
        line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 0, 2.3), $z$)

        // new basis vectors
        line((0,0,0), ex, stroke: red + 1.5pt, mark: (end: ">"))
        content(ex_txt, text(red)[$hat(e)_x$])

        line((0,0,0), (0,1,0), stroke: blue + 1.5pt, mark: (end: ">"))
        content((0,1.3,0), text(blue)[$hat(e)_y$])

        line((0,0,0), ez, stroke: orange + 1.5pt, mark: (end: ">"))
        content(ez_txt, text(orange)[$hat(e)_z$])
        
      })
    })
  )

  Thus the new basis vector become

  $
    bold(hat(e)_x) = #vec2matround(ex, digits: 3)
    bold(hat(e)_y) = #vec2matround((0,1,0), digits: 3)
    bold(hat(e)_z) = #vec2matround(ez, digits: 3)
  $

  #let R = transpose((
    ex,
    (0,1,0),
    ez
  ))
  Thus 
  $
    bold(R) = #array2mat_round(R)
  $

  By definition, $bold(A)' = bold(R)^T bold(A) bold(R) -> A'_(i j)  = R_(k i) A_(k l) R_(l j)$

  #let A_result = range(3).map(i => {
    range(3).map(j => {
      // ^result indexes
      
      // Calculate the sum for the specific (i, j) cell
      let cell_sum = 0
      // loop through dummies
      for k in range(3) {
        for l in range(3) {
          cell_sum += R.at(k).at(i) * A_var.at(k).at(l) * R.at(l).at(j)  
        }
      }
      
      return cell_sum // This value gets placed at (i, j)
      
    })
  })
  
  $
    bold(A)' = #array2mat_round(A_result, digits: 5)
  $

]

#let problem_b = [
  *b)* Rotated by 45° around the z-axis.

  #let rot_ang = 45 * calc.pi / 180
  
  #let ex = (calc.cos(rot_ang), calc.sin(rot_ang), 0)
  #let ex_txt = (calc.cos(rot_ang) + 0.3, calc.sin(rot_ang), 0)

  #let ey = (-calc.sin(rot_ang), calc.cos(rot_ang), 0)
  #let ey_txt = (-calc.sin(rot_ang), calc.cos(rot_ang) + 0.3, 0)

  #grid(
    columns: 2,
    gutter: 20pt,
    canvas({
      import draw: *

      ortho(x: 45deg, {
        
        on-xy({
          grid((-2,-2), (2,2), stroke: gray + .5pt)
        })

        // Draw 3D Axes
        line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((2.3, 0, 0), $x$)
        
        line((0,-2,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 3.3, 0), $y$)
        
        line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 0, 2.3), $z$)

        // original basis vectors
        line((0,0,0), (1,0,0), stroke: red + 1.5pt, mark: (end: ">"))
        content((1.3,0,0), text(red)[$hat(e)_x$])

        line((0,0,0), (0,1,0), stroke: blue + 1.5pt, mark: (end: ">"))
        content((0,1.3,0), text(blue)[$hat(e)_y$])

        line((0,0,0), (0,0,1), stroke: orange + 1.5pt, mark: (end: ">"))
        content((0,0,1.3), text(orange)[$hat(e)_z$])
        
      })
    }),
    canvas({
      import draw: *

      ortho(x: 45deg, {
        
        on-xy({
          grid((-2,-2), (2,2), stroke: gray + .5pt)
        })

        // Draw 3D Axes
        line((-2,0,0), (2,0,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((2.3, 0, 0), $x$)
        
        line((0,-2,0), (0,3,0), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 3.3, 0), $y$)
        
        line((0,0,-2), (0,0,2), stroke: gray.darken(80%), mark: (end: ">"))
        content((0, 0, 2.3), $z$)

        // new basis vectors
        line((0,0,0), ex, stroke: red + 1.5pt, mark: (end: ">"))
        content(ex_txt, text(red)[$hat(e)_x$])

        line((0,0,0), ey, stroke: blue + 1.5pt, mark: (end: ">"))
        content(ey_txt, text(blue)[$hat(e)_y$])

        line((0,0,0), (0,0,1), stroke: orange + 1.5pt, mark: (end: ">"))
        content((0,0,1.3), text(orange)[$hat(e)_z$])
        
      })
    })
  )

  Thus the new basis vectors become:

  $
    bold(hat(e)_x) = #vec2matround(ex, digits: 3)
    bold(hat(e)_y) = #vec2matround(ey, digits: 3)
    bold(hat(e)_z) = #vec2matround((0,0,1), digits: 3)
  $

  #let R = transpose((
    ex,
    ey,
    (0,0,1)
  ))
  
  Thus 
  $
    bold(R) = #array2mat_round(R, digits: 3)
  $

  By definition, $bold(A)' = bold(R)^T bold(A) bold(R) -> A'_(i j)  = R_(k i) A_(k l) R_(l j)$

  #let A_result = range(3).map(i => {
    range(3).map(j => {
      let cell_sum = 0
      for k in range(3) {
        for l in range(3) {
          cell_sum += R.at(k).at(i) * A_var.at(k).at(l) * R.at(l).at(j)  
        }
      }
      return cell_sum
    })
  })

  $
    bold(A)' = #array2mat_round(A_result, digits: 5)
  $
]

#cell(
  "Problem 1.6.1",[
    Given the second-order tensor

    $
      bold(A) = #array2mat(A_var)
    $

    find its components in a new coordinate system obtained by
  ],[
    #problem_a
    #problem_b
  ]
)

#let A_var = (
  (-4.216, 0, -2.688),
  (0, 12.5, 0),
  (-2.688, 0, 4.216),
)

#let A_var_2 = (
  ($-4.216 - lambda$, 0, -2.688),
  (0, $12.5 - lambda$, 0),
  (-2.688, 0, $4.216 - lambda$),
)

#cell(
  "Problem 1.7.1", [
    Given the second-order tensor $bold(A)$

    $
      bold(A) = #array2mat(A_var)
    $

    Evaluate
  ],[

    *a)* The eigenvalues and eigenvectors
    
    To obtain the eigenvalues, we must solve

    $
      det(#array2mat(A_var) - bold(I) lambda) = 0 \
      det(#array2mat(A_var_2)) = 0 \
    $
    Thus
    $
      (lambda^2 - 4.216^2)(12.5-lambda) - (12.5-lambda)(2.688^2) = \
      (12.5 - lambda) (lambda^2  - #calc.round(digits: 3, 4.216*4.216 + 2.688*2.688)) =\
      (12.5 - lambda) (lambda - 5) (lambda + 5) = 0
    $

    Thus

    $
      lambda = mat(12.5; 5; -5)
    $


    #let get_eigen_mat(eigen) = range(3).map(
        i => range(3).map(
          j => {
            let c = A_var.at(i).at(j)

            if (i == j) {
              c -= eigen
            }

            return c
          }
        )
      )

    For $lambda_1 = 12.5$, we must solve

    $
      #array2mat_round(get_eigen_mat(12.5))
      #vec2mat(($v_(1,1)$, $v_(1,2)$, $v_(1,3)$)) =
      #vec2mat((0,0,0))
    $

    The only unit vector that solves the equation above is

    $
      v_1 = #vec2mat((0,1,0))
    $

    For $lambda_2 = 5$, we must solve

    $
      #array2mat_round(get_eigen_mat(5))
      #vec2mat(($v_(2,1)$, $v_(2,2)$, $v_(2,3)$)) =
      #vec2mat((0,0,0))
    $

    It is clear that $v_(2,2)$ must be null for the solution to be achiavable, Thus

    $
      #array2mat((
        (-9.216, -2.688),
        (- 2.688, -0.784),
      ))
      #vec2mat(($v_(2,1)$, $v_(2,3)$)) =
      #vec2mat((0,0))
    $

    Assuming $v_(2,1) = 1 -> v_(2,3) = #calc.round(9.216 / -2.688, digits: 3)$ 

    Thus the second eigenvector is

    $
      v_2 = #vec2mat((1,0,-3.429)) -> v_2 = #vec2mat((
        calc.round(digits: 3, 1 / calc.sqrt(1 + 3.429 * 3.429)),
        0,
        calc.round(digits: 3, -3.429 / calc.sqrt(1 + 3.429 * 3.429))
      ))
    $
  ]
)
