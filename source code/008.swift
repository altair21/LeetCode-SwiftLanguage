class Solution {
	func myAtoi(str: String) -> Int {
		let newStr = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
		if newStr.characters.count == 0 {
			return 0
		}
		let arr = Array(newStr.characters)
		var res = ""
		var neg = false
		var hasVal = false
		var index = 0
		for char in arr {
			if index == 0 {
				if char == "-" {
					neg = true
					index++
					continue
				} else if char == "+" {
					index++
					continue
				}
			}
			if isDigit(char) {
				hasVal = true
				res.append(char)
			} else {
				break
			}
			index++
		}
		
		while (res.characters.count > 1 && res[res.startIndex] == "0") {
			res.removeAtIndex(res.startIndex)
		}
		if !hasVal {
			return 0
		} else if res.characters.count > 10 {
			if neg {
				return Int(Int32.min)
			} else {
				return Int(Int32.max)
			}
		} else {
			if neg {
				if Int(res)! * -1 < Int(Int32.min) {
					return Int(Int32.min)
				} else {
					return Int(res)! * -1
				}
			} else {
				if Int(res)! > Int(Int32.max) {
					return Int(Int32.max)
				} else {
					return Int(res)!
				}
			}
		}
		
	}
	
	func isDigit(char: Character) -> Bool {
		for code in String(char).utf8 {
			if code >= 48 && code <= 57 {
				return true
			} else {
				return false
			}
		}
		return false
	}
}