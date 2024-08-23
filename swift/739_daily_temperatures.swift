class Solution {
  func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var monDecStack: [(Int, Int)] = []
    var res: [Int] = Array(repeating: 0, count: temperatures.count)

    for (i, temperature) in temperatures.enumerated() {
      while !monDecStack.isEmpty && monDecStack.last!.0 < temperature {
        let cur = monDecStack.popLast()!
        res[cur.1] = i - cur.1
      }

      monDecStack.append((temperature, i))
    }

    return res
  }
}
