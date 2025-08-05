#import "@preview/glossarium:0.5.8": gls, glspl, make-glossary, print-glossary, register-glossary
#show: make-glossary
#let entry-list = (
  (
    key: "kuleuven",
    short: "KU Leuven",
    long: "Katholieke Universiteit Leuven",
    description: "A university in Belgium.",
  ),
  // Add more terms
)
#register-glossary(entry-list)

= Hello world

#gls("kuleuven")
// Your document body
#print-glossary(
  entry-list,
)
