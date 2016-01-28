class Solution {
    func convert(s: String, _ numRows: Int) -> String {
        var characters = Array(s.characters)
		let len = characters.count, step = numRows * 2 - 2
		if numRows == 1 {
			return s
		}
		var ans = ""
		for var i = 0; i < numRows; i++ {
			if i == 0 || i == numRows - 1 {
				for var j = i; j < len; j += step {
					ans.append(characters[j])
				}
			} else {
				for var j = i; j < len; j += step {
					ans.append(characters[j])
					if j + step - 2 * i < len {
						ans.append(characters[j+step-2*i])
					}
				}
			}
		}
		
		return ans
    }
}