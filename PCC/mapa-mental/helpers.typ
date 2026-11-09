#let ternary(a, b, c) = if (a) {b} else {c}
#let tint(fill, body) = text(fill: fill)[#body]
#let bolden(weight: 3pt, body) = text(weight: "bold")[#body]

#let tup-sum(t1, t2) = range(2).map(v => t1.at(v) + t2.at(v))
#let rel(x, y) = (rel: (x, y))