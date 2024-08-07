class TimeMap {
    var keyMap: [String : [(value: String, timestamp: Int)]] 

    init() {
        self.keyMap = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        keyMap[key, default: []].append((value, timestamp))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if let valAndTimes = keyMap[key] {
            var left: Int = 0
            var right: Int = valAndTimes.count - 1
            var mid: Int = 0
            
            while left <= right {
                mid = (left + right) / 2
                
                if valAndTimes[mid].timestamp == timestamp {
                    return valAndTimes[mid].value
                } else if valAndTimes[mid].timestamp > timestamp {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            
            return left != 0 ? valAndTimes[left-1].value : ""
        } else {
            return ""
        }
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */

