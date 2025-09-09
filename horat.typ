#let day_names_es = ([Lunes], [Martes], [Miércoles], [Jueves], [Viernes])
#let day_names_en = ([Monday], [Tuesday], [Wednesday], [Thursday], [Friday])

#let time(time) = {
  let times = time.split(":").map(x => float(x))
  times.at(0) + times.at(1)/60
}

#let make_event(day_start, day, start, end, color, content, hour_divs: 4) = {
  table.cell(
    fill: color,
    x: day,
    y: int((time(start) - time(day_start)) * hour_divs) + 1,
    rowspan: int((time(end) - time(start)) * hour_divs),
    content
  )
}

#let schedule(weekdays: day_names_en, color: green, hour_divs: 4, events) = {
  let times = events.map(x => (x.at(1), x.at(2)))
                    .flatten()
                    .dedup()
                    .sorted(key: x => time(x))
  let start = times.first()
  let end   = times.last()
  let columns = weekdays.len()
  let rows = hour_divs * int(time(end) - time(start))

  table(
    columns: (auto, ..array.range(columns).map(_ => 1fr)),
    rows: (auto, ..array.range(rows).map(_ => 1fr)),
    align: center + horizon,
    fill: (x, y) => {
      if x == 0 or y == 0 {
        color
      }
    },
    stroke: 2pt + white,
    table.header([], ..weekdays),
    ..events.map(x => make_event(start, ..x)),
    ..times.windows(2).map(x => { make_event(start, 0, ..x, color, align(top)[#x.at(0)]) })
  )
}
