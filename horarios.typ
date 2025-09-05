#import "horat.typ" : *

#set page(paper: "a5", margin: 2pt)

#let col2 = rgb("#90BE6D")
#let col1 = rgb("#FCF6B1")
#let col3 = rgb("#E7636B")
#let col4 = rgb("#9999EE")
#let col5 = gray
#let green = col2

#let horas = (
 "7:30",
 "9:30",
 "10:30",
 "12:30",
 "15:45",
 "18:00",
 "19:00",
 "20:00",
 "21:00",
 "22:00",
 "23:00"
)

#schedule(day_names: day_names_es, color: col2, (
  event(1, "7:30", "10:30", col1)[Activity One],
  event(1, "10:30", "12:30", col3)[Funnn!!],
  event(1, "20:00", "22:00", col3)[Ñ],

  //       Start     End
  //         v        v
  event(2, "7:30", "11:30", col4)[Work],
  event(2, "11:30", "12:15", col3)[Lunch],
  event(2, "12:30", "14:30", col4)[More Work],

  // Use any color you want
  //                            v
  event(3, "7:30", "9:30", rgb("#FF00FF"))[Color party],
  event(3, "9:30", "12:30", col5)[Boring time],
  event(3, "20:00", "21:00", col2)[Surf],
  event(3, "21:00", "21:30", col2)[Ski some more],

  event(4, "7:30", "23:00", rgb("#F0F0F0"))[Free day],

  event(5, "12:30", "15:00", col1)[Not at all Study],
  event(5, "18:00", "18:30", col2)[Study],
  event(5, "7:30", "9:30", col5)[Not Study],

  // Order is not mandatory
  //    v
  event(3, "18:00", "20:00", col2)[Ski],

  // You can mark the hours using this handy function
  ..mark_hours(horas, col2)
))
