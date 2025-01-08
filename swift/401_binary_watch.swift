class Solution {
  func readBinaryWatch(_ turnedOn: Int) -> [String] {
    // Count Bits
    var possibleTimes: [String] = []

    for hour in 0..<12 {
      for min in 0..<60 {
        let hourBitCount: Int = countBits(hour)
        let minBitCount: Int = countBits(min)

        if hourBitCount + minBitCount != turnedOn {
          continue
        }

        let possibleTime = formatHourAndMin(hour, min)
        possibleTimes.append(possibleTime)
      }
    }

    return possibleTimes

    // Backtrack
    // var possibleTimes: [String] = []

    // for hoursTurnedOnNum in 0...turnedOn {
    //     let possibleHours: [Int] = calcAllPossibleHours(hoursTurnedOnNum)
    //     let possibleMins: [Int] = calcAllPossibleMins(turnedOn - hoursTurnedOnNum)

    //     for hour in possibleHours {
    //         for min in possibleMins {
    //             let formattedTime: String = formatHourAndMin(hour, min)
    //             possibleTimes.append(formattedTime)
    //         }
    //     }
    // }

    // return possibleTimes
  }

  private func countBits(_ num: Int) -> Int {
    guard num != 0 else { return 0 }

    var count: Int = 0
    var curNum: Int = num

    while curNum > 0 {
      count += curNum % 2
      curNum /= 2
    }

    return count
  }

  private func calcAllPossibleHours(_ turnedOn: Int) -> [Int] {
    var possibleHours: [Int] = []
    hourBacktrack(0, 0, turnedOn, &possibleHours)
    return possibleHours
  }

  private func hourBacktrack(
    _ idx: Int,
    _ curHour: Int,
    _ remainTurnedOn: Int,
    _ possibleHours: inout [Int]
  ) {
    let hours: [Int] = [8, 4, 2, 1]

    if remainTurnedOn == 0 && curHour <= 11 {
      possibleHours.append(curHour)
      return
    }

    guard idx < hours.count else { return }

    hourBacktrack(idx + 1, curHour + hours[idx], remainTurnedOn - 1, &possibleHours)
    hourBacktrack(idx + 1, curHour, remainTurnedOn, &possibleHours)
  }

  private func calcAllPossibleMins(_ turnedOn: Int) -> [Int] {
    var possibleMins: [Int] = []
    minBacktrack(0, 0, turnedOn, &possibleMins)
    return possibleMins
  }

  private func minBacktrack(
    _ idx: Int,
    _ curMin: Int,
    _ remainTurnedOn: Int,
    _ possibleMins: inout [Int]
  ) {
    let mins: [Int] = [32, 16, 8, 4, 2, 1]

    if remainTurnedOn == 0 && curMin <= 59 {
      possibleMins.append(curMin)
      return
    }

    guard idx < mins.count else { return }

    minBacktrack(idx + 1, curMin + mins[idx], remainTurnedOn - 1, &possibleMins)
    minBacktrack(idx + 1, curMin, remainTurnedOn, &possibleMins)
  }

  private func formatHourAndMin(_ hour: Int, _ min: Int) -> String {
    if min < 10 {
      return String(hour) + ":" + "0" + String(min)
    } else {
      return String(hour) + ":" + String(min)
    }
  }
}
