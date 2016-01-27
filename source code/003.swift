class Solution {
    func lengthOfLongestSubstring(s: String) -> Int {
        var lastPos = [Int](count: 128, repeatedValue: -1)
		var startPos = 0, res = 0, cnt = 0, index = 0
		for ascii in s.utf8 {
			if (lastPos[Int(ascii)] < startPos) {
				lastPos[Int(ascii)] = index
				cnt++
			} else {
				cnt = index - lastPos[Int(ascii)]
				startPos = lastPos[Int(ascii)]
				lastPos[Int(ascii)] = index
			}
			if cnt > res {
				res = cnt
			}
			index++
		}
		return res
    }
}