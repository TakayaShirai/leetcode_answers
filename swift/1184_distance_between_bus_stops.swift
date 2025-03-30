class Solution {
  func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
    let clockwiseCost: Int = calcClockwiseCost(distance, start, destination)
    let counterclockwiseCost: Int = calcCounterclockwiseCost(distance, start, destination)
    return min(clockwiseCost, counterclockwiseCost)
  }

  private func calcClockwiseCost(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
    var curCost: Int = 0
    var curPos: Int = start

    while curPos != destination {
      curCost += distance[curPos]
      curPos = curPos == (distance.count - 1) ? 0 : curPos + 1
    }

    return curCost
  }

  private func calcCounterclockwiseCost(_ distance: [Int], _ start: Int, _ destination: Int) -> Int
  {
    var curCost: Int = 0
    var curPos: Int = start

    while curPos != destination {
      let prevPos = curPos == 0 ? distance.count - 1 : curPos - 1
      curCost += distance[prevPos]
      curPos = curPos == 0 ? distance.count - 1 : curPos - 1
    }

    return curCost
  }
}
