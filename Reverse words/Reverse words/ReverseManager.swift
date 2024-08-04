import Foundation

struct ReverseManager {
    
    func reverseWithCustomChars(_ fullText: String, _ textToIgnoreIn: String = "", ignoreCustomChars: Bool = false) -> String {
        let textToIgnore: String
        let fullTextArray = fullText.components(separatedBy: " ")
        var posOfChars : [[String:[Int]]] = []
        
        if ignoreCustomChars {
            do {
                textToIgnore = fullText.replacing(try Regex("[a-zA-Z]"), with: "") }
            catch {
                textToIgnore = ""
            }
        }else {
            textToIgnore = textToIgnoreIn
        }
        var textToIgnoreUnic = Set(textToIgnore.split(separator: "").map { String($0) } ).joined()
        
        for (i, comp) in fullTextArray.enumerated() {
            posOfChars.append( [:] )
            for c in textToIgnoreUnic {
                for (pos, charInComp) in comp.enumerated() {
                    if charInComp == c {
                        if posOfChars[i][String(c)] == nil {
                            posOfChars[i][String(c)] = [pos]
                        } else {
                            posOfChars[i][String(c)]?.append(pos)
                        }
                    }
                }
            }
        }
        
        var newTextArray = fullTextArray
        for (i, _) in fullTextArray.enumerated() {
            for char in textToIgnoreUnic {
                newTextArray[i] = newTextArray[i].replacingOccurrences(of: String(char), with: "")
            }
        }
        newTextArray = newTextArray.map() { String($0.reversed()) }
        
        for wordPos in 0..<fullTextArray.count {
            var orderedArray = [(Int, String)] ()
            
            for toRestore in posOfChars[wordPos] {
                for charPos in toRestore.value {
                    orderedArray.append((charPos, toRestore.key))
                }
                orderedArray = orderedArray.sorted() { $0.0 < $1.0 }
                
            }
            for (index, char) in orderedArray {
                var newWord = newTextArray[wordPos]
                let posIndex = newWord.index(newWord.startIndex, offsetBy: index)
                (posIndex)
                newTextArray[wordPos].insert(contentsOf: char, at: posIndex)
            }
        }
        
        return newTextArray.joined(separator: " ")
    }
    
}

