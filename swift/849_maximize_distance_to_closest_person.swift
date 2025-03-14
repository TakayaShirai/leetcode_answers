class Solution {
  func maxDistToClosest(_ seats: [Int]) -> Int {
    var maxDistance = 0
    var prevOccupiedIdx = -1
    let seatCount = seats.count

    for curIdx in 0..<seatCount {
      if seats[curIdx] == 1 {
        if prevOccupiedIdx < 0 {
          maxDistance = max(maxDistance, curIdx)
        } else {
          maxDistance = max(maxDistance, (curIdx - prevOccupiedIdx) / 2)
        }
        prevOccupiedIdx = curIdx
      }
    }

    maxDistance = max(maxDistance, seatCount - prevOccupiedIdx - 1)

    return maxDistance
  }
}
