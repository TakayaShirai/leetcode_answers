class Solution {
  func constructRectangle(_ area: Int) -> [Int] {
    var width = Int(sqrt(Double(area)))

    while area % width != 0 {
      width -= 1
    }

    let length = area / width
    return [length, width]

    // var length: Int = area
    // var width: Int = 1
    // var minDiff: Int = area
    // var resLenWid: [Int] = []

    // while length >= width {
    //     let curArea: Int = length * width

    //     if curArea == area {
    //         if (length - width) < minDiff {
    //             resLenWid = [length, width]
    //             minDiff = length - width
    //         }

    //         width += 1
    //     } else if curArea > area {
    //         length -= 1
    //     } else {
    //         width += 1
    //     }
    // }

    // return resLenWid
  }
}
