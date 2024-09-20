class MyStack {
  var queueOne: [Int]
  var queueTwo: [Int]

  init() {
    self.queueOne = []
    self.queueTwo = []
  }

  func push(_ x: Int) {
    if !queueOne.isEmpty {
      queueOne.append(x)
    } else {
      queueTwo.append(x)
    }
  }

  func pop() -> Int {
    if !queueOne.isEmpty {
      while queueOne.count > 1 {
        queueTwo.append(queueOne.removeFirst())
      }

      return queueOne.removeFirst()
    } else if !queueTwo.isEmpty {
      while queueTwo.count > 1 {
        queueOne.append(queueTwo.removeFirst())
      }

      return queueTwo.removeFirst()
    }

    return -1
  }

  func top() -> Int {
    if !queueOne.isEmpty {
      return queueOne.last!
    } else if !queueTwo.isEmpty {
      return queueTwo.last!
    }

    return -1
  }

  func empty() -> Bool {
    return queueOne.isEmpty && queueTwo.isEmpty
  }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
