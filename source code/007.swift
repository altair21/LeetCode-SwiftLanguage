class Solution {
	func reverse(x: Int) -> Int {
		let str = String(x)
		var res = ""
		let str2 = String(str.characters.reverse())
		let arr = Array(str2.characters)
		for char in arr {
			if char != "-" {
				res.append(char)
			}
		}
		
		if x < 0 {
			let ans = -1 * Int(res)!
			if ans < Int(Int32.min) {
				return 0
			} else {
				return ans
			}
		} else {
			let ans = Int(res)!
			if ans > Int(Int32.max) {
				return 0
			} else {
				return ans
			}
		}
	}
}