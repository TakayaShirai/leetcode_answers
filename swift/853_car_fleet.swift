class Solution {
  func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let array = zip(position, speed).sorted { $0.0 < $1.0 }
    var stack: [Double] = []

    for (position, speed) in array {
      let time = Double(target - position) / Double(speed)

      while !stack.isEmpty && time >= stack.last! {
        stack.removeLast()
      }

      stack.append(time)
    }

    return stack.count
  }
}
