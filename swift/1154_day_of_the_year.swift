class Solution {
  func dayOfYear(_ date: String) -> Int {
    let dayMap: [Int: Int] = [
      1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30,
      7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31,
    ]

    let yyyymmdd = date.split(separator: "-").compactMap { Int($0) }
    let year = yyyymmdd[0]
    let month = yyyymmdd[1]
    let day = yyyymmdd[2]

    let isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)

    var totalDays = 0

    for curMonth in 1..<month {
      if isLeapYear && curMonth == 2 {
        totalDays += 29
      } else {
        totalDays += dayMap[curMonth]!
      }
    }

    return totalDays + day
  }
}
