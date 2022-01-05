//
//  WW_SearchHistoryWordsManager.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchHistoryWordsManager: NSObject {

    let history_key = "history_key"
   
    var hasWords : Bool{
        if UserDefaults.standard.object(forKey: history_key) != nil{
            return true
        }else{
            return false
        }
    }

    func wordsData() -> [String]{
        if UserDefaults.standard.object(forKey: history_key) != nil{
            let array : [String] = UserDefaults.standard.object(forKey: history_key) as! [String]
            return array
        }else{
            return [String]()
        }
    }
    
    func saveWord(word : String) -> [String]{
        
        let mutArray : NSMutableArray = NSMutableArray()
        if (UserDefaults.standard.object(forKey: history_key) != nil){
            let array : [String] = UserDefaults.standard.object(forKey: history_key) as! [String]
            if word.isEmpty || word.isBlank{return array}
            mutArray.addObjects(from: array)
        }else{
            var array = [String]()
            if word.isEmpty || word.isBlank{return array}
            array = [word]
            UserDefaults.standard.set(array, forKey: history_key)
            mutArray.addObjects(from: array)
        }
        var hasText = false
        
        for index in 0..<mutArray.count{
            if mutArray[index] as! String == word{
                let temp : String = mutArray[0] as! String
                mutArray[0] = mutArray[index]
                mutArray[index] = temp
                hasText = true
            }
        }
        
        if (!hasText){
            mutArray.insert(word, at: 0)
        }
        
        if (mutArray.count > 8){
            mutArray.removeLastObject()
        }
        
        UserDefaults.standard.set(mutArray, forKey: history_key)
        return mutArray as! [String]
    }
    
    func deleteAllWord(){
        let mutArray : NSMutableArray = [String]() as! NSMutableArray
        UserDefaults.standard.set(mutArray, forKey: history_key)
    }
    
    func deleteWordItem(index:Int)->[String]{
        if UserDefaults.standard.object(forKey: history_key) != nil {
            var array : [String] = UserDefaults.standard.object(forKey: history_key) as! [String]
            array.remove(at: index)
            return array
        }
        return [String]()
    }
}
