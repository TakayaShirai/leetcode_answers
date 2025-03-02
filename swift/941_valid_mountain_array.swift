class Solution {
  func validMountainArray(_ arr: [Int]) -> Bool {
    guard arr.count >= 3 else { return false }

    var leftPeak: Int = 0
    var rightPeak: Int = arr.count - 1

    while leftPeak < (arr.count - 1) {
      guard arr[leftPeak] < arr[leftPeak + 1] else { break }
      leftPeak += 1
    }

    while rightPeak > 0 {
      guard arr[rightPeak - 1] > arr[rightPeak] else { break }
      rightPeak -= 1
    }

    return leftPeak > 0 && rightPeak < arr.count - 1 && leftPeak == rightPeak
  }
}
