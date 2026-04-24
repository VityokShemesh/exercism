pub fn is_leap_year(year: Int) -> Bool {
  {{year/100}*100 != year 
  && {year/4}*4 == year}
  || {year/400}*400 == year
}
