class RecentCounter {

  var queue: [Int]
  let timeFrame: Int = 3000

  init() {
    self.queue = []
  }

  func ping(_ t: Int) -> Int {
    while !queue.isEmpty {
      let peekVal: Int = queue[0]

      if t - peekVal > timeFrame {
        queue.removeFirst()
      } else {
        break
      }
    }

    queue.append(t)

    return queue.count
  }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
