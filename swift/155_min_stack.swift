class MinStack {
    private var head: Node?

    init() {
        self.head = nil
    }
    
    func push(_ val: Int) {
        head = Node(val, min(val, head?.min ?? val), head)
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        return head!.value
    }
    
    func getMin() -> Int {
        return head!.min
    }
    
    private class Node {
        var value: Int
        var min: Int
        var next: Node?
        
        init(_ value: Int, _ min: Int, _ next: Node?) {
            self.value = value
            self.min = min
            self.next = next
        }
    }
    
//     private var stack: [Int] = []
//     private var minStack: [Int] = []
    
//     init() {
//         self.stack = []
//         self.minStack = []
//     }

//     func push(_ val: Int) {
//         stack.append(val)
//         minStack.append(min(minStack.last ?? val, val))
//     }
    
//     func pop() {
//         stack.popLast()
//         minStack.popLast()
//     }
    
//     func top() -> Int {
//         return stack.last!
//     }
    
//     func getMin() -> Int {
//         return minStack.last!
//     }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

