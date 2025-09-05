#let default_days_in_a_week = 5
#let day_names_es = ([], [Lunes], [Martes], [Miércoles], [Jueves], [Viernes])
#let day_names_en = ([], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday])
#let hour_subdivisions = 4

#let get_time(time) = {
  let times = time.split(":").map(x => float(x))
  times.at(0) + times.at(1)/60
}

#let event(start_time: "7:30", day, start, end, color, content) = {
  table.cell(
    fill: color,
    x: day,
    y: int((get_time(start) - get_time(start_time)) * hour_subdivisions) + 1,
    rowspan: int((get_time(end) - get_time(start)) * hour_subdivisions),
    content
  )
}

#let schedule(days_in_a_week: default_days_in_a_week, day_names: day_names_en, start: "7:30", end: "23:00", color: green, events) = {
  let num_of_rows = hour_subdivisions * int(get_time(end) - get_time(start)) - 1
  place(
    table(
      columns: (auto, ..array.range(days_in_a_week).map(_ => 1fr)),
      rows: (auto, ..array.range(num_of_rows).map(_ => 1fr)),
      align: center + horizon,
      fill: (x, y) => {
        if x == 0 or y == 0 {
          color
        }
      },
      stroke: 2pt + white,
      table.header(..day_names),
      ..events
    )
  )
}

#let mark_hours(start_time: "7:30", hours, color) = {
  hours.windows(2).map(x => {event(start_time: start_time, 0, x.at(0), x.at(1), color)[#align(top)[#x.at(0)]]})
}
