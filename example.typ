#import "horat.typ" : *

#set page(paper: "a5", margin: 2pt)

#let col2 = rgb("#90BE6D")
#let col1 = rgb("#FCF6B1")
#let col3 = rgb("#E7636B")
#let col4 = rgb("#9999EE")
#let col5 = gray
#let green = col2

#schedule(color: col2, (
// The day of the week
// v
  (1, "7:30", "10:30", col1, [Activity One]),
  (1, "10:30", "12:30", col3, [Funnn!!]),

  // The text you want been shown
  //                           v
  (1, "20:00", "22:00", col3, [Ñ]),

  //  Start     End
  //    v        v
  (2, "7:30", "11:30", col4, [Work]),
  (2, "11:30", "12:30", col3, [Lunch]),
  (2, "12:30", "14:30", col4, [More Work]),

  (3, "7:30", "9:30", rgb("#FF00FF"), [Color party]),
  (3, "9:30", "12:30", col5, [Boring time]),
  (3, "20:00", "21:00", col2, [Surf]),
  (3, "21:00", "21:30", col2, [Ski some more]),

  (4, "7:30", "23:00", rgb("#F0F0F0"), [Free day]),

  (5, "12:30", "15:00", col1, [Not at all Study]),
  (5, "18:00", "18:30", col2, [Study]),
  (5, "7:30", "9:30", col5, [Not Study]),

  // Order is not mandatory
  //    v
  (3, "18:00", "20:00", col2, [Ski]),
))
