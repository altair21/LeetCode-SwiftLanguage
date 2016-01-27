//Manacher's algorithm
class Solution {
	func longestPalindrome(s: String) -> String {
		let characters = Array(s.characters)
		var newArr = [Character]()
		var pArr = [Int](count: 2010, repeatedValue: 0)
		newArr.append("$")
		for char in characters {
			newArr.append("#")
			newArr.append(char)
		}
		newArr.append("#")
		newArr.append("~")
		
		var cnt = newArr.count
		var mx = 0, id = 0, maxP = 0, maxPIndex = 0
		for (index, char) in newArr.enumerate() {
			if index == 0 || index == cnt - 1 {
				continue
			}
			pArr[index] = mx > index ? min(pArr[2*id-index], mx-index) : 1
			while (index + pArr[index] < cnt - 1 && index - pArr[index] > 0 && newArr[index + pArr[index]] == newArr[index - pArr[index]]) {
				pArr[index]++
			}
			if (index + pArr[index] > mx) {
				mx = index + pArr[index]
				id = index
			}
			if maxP < pArr[index] {
				maxP = pArr[index]
				maxPIndex = index
			}
		}
		
		let startPos = maxPIndex / 2 - maxP / 2
		let endPos = startPos + maxP - 2
		return String(characters[startPos...endPos])
	}
}