class MyQueue {

  var popStack: [Int]
  var pushStack: [Int]

  init() {
    self.popStack = []
    self.pushStack = []
  }

  func push(_ x: Int) {
    pushStack.append(x)
  }

  func pop() -> Int {
    if popStack.isEmpty {
      moveVals(from: &pushStack, to: &popStack)
    }

    return popStack.removeLast()
  }

  func peek() -> Int {
    if popStack.isEmpty {
      moveVals(from: &pushStack, to: &popStack)
    }

    return popStack.last!
  }

  func empty() -> Bool {
    return popStack.isEmpty && pushStack.isEmpty
  }

  private func moveVals(from stack1: inout [Int], to stack2: inout [Int]) {
    while !stack1.isEmpty {
      let poppedVal: Int = stack1.removeLast()
      stack2.append(poppedVal)
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
