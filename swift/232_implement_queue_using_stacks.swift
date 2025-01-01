class MyQueue {
  var pushStack: [Int]
  var popStack: [Int]

  init() {
    self.pushStack = []
    self.popStack = []
  }

  func push(_ x: Int) {
    if !popStack.isEmpty {
      movePopToPush()
    }

    pushStack.append(x)
  }

  func pop() -> Int {
    guard !empty() else { return -1 }

    if !pushStack.isEmpty {
      movePushToPop()
    }

    return popStack.removeLast()
  }

  func peek() -> Int {
    guard !empty() else { return -1 }

    if !popStack.isEmpty {
      return popStack[popStack.count - 1]
    } else {
      return pushStack[0]
    }
  }

  func empty() -> Bool {
    return pushStack.isEmpty && popStack.isEmpty
  }

  private func movePopToPush() {
    while !popStack.isEmpty {
      let poppedNum = popStack.removeLast()
      pushStack.append(poppedNum)
    }
  }

  private func movePushToPop() {
    while !pushStack.isEmpty {
      let poppedNum = pushStack.removeLast()
      popStack.append(poppedNum)
    }
  }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
