//
//  ZLFString.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/11/28.
//  Copyright © 2018 zluof. All rights reserved.
//

import Foundation

extension String: ZLFBaseConfigStructInterface{}

//MARK: - 常用正则
public enum availableType {
    case phone(String? = "^1[0-9]{10}$")
    case email(String? = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$")
    case password(String? = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}")
    case userIdCard(String? = "(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)")
    case chinases
}

extension ZLFBaseConfigToolStructWrapper where Base == String {
    
    struct RegularExpression {
        let regex: NSRegularExpression?
        init(_ pattern: String) {
            regex = try? NSRegularExpression(pattern: pattern,
                                             options: .caseInsensitive)
        }
        
        func match(input: String) -> Bool {
            if let matches = regex?.matches(in: input,
                                            options: [],
                                            range: NSMakeRange(0, (input as NSString).length)) {
                return matches.count > 0
            } else {
                return false
            }
        }
    }
    
    func available(_ type:availableType) -> Bool {
        var regular : String
        switch type {
        case .phone(let _regular):
            regular = _regular!
            break
        case .email(let _regular):
            regular = _regular!
            break
        case .password(let _regular):
            regular = _regular!
            break
        case .userIdCard(let _regular):
            regular = _regular!
        case .chinases:
            regular = "[\u{4e00}-\u{9fa5}]+"
        }
        let regual = RegularExpression(regular)
        guard regual.match(input: base) else {
            return false
        }
        return true
    }
}

extension String{
    
    var is_empty: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
    /**
     * transform value
     */
    var stringValue : String { return self                }
    var integerValue: Int    { return Int(stringValue)    ?? 0  }
    var doubleValue : Double { return Double(stringValue) ?? 0  }
    var floatValue  : Float  { return Float(stringValue)  ?? 0  }
    
}

extension String {
    
    /**
     * cut out string to index  return new string
     */
    public func subString_to(index:Int) -> String {
        guard self.count != 0 else {
            return ""
        }
        let values = self
        let startSlicingIndex = values.index(values.startIndex, offsetBy: index)
        let subvalues = values[...startSlicingIndex]
        return String(subvalues)
    }
    /**
     * cut out string from index  return new string
     */
    public func subString_from(index:Int) -> String {
        guard self.count != 0 else {
            return ""
        }
        let values = self
        let startSlicingIndex = values.index(values.startIndex, offsetBy: index)
        let subvalues = values[startSlicingIndex...]
        return String(subvalues)
    }
    
}

extension String{
   
    /// 从String中截取出参数
    var urlParameters: [String: AnyObject]? {
        // 判断是否有参数
        
        guard self.range(of: "?") != nil else {
            return nil
        }
        
        var params = [String: AnyObject]()
        // 截取参数
        
        let greeting = self
        let endOfSentence = greeting.firstIndex(of: "?")!
        let strig = greeting[endOfSentence...]
        let paramsString = strig.appending("!")
        
        // 判断参数是单个参数还是多个参数
        if paramsString.contains("&") {
            
            // 多个参数，分割参数
            let urlComponents = paramsString.components(separatedBy:"&")
            
            // 遍历参数
            for keyValuePair in urlComponents {
                // 生成Key/Value
                let pairComponents = keyValuePair.components(separatedBy:"=")
                let key = pairComponents.first?.removingPercentEncoding
                let value = pairComponents.last?.removingPercentEncoding
                // 判断参数是否是数组
                if let key = key, let value = value {
                    // 已存在的值，生成数组
                    if let existValue = params[key] {
                        if var existValue = existValue as? [AnyObject] {
                            
                            existValue.append(value as AnyObject)
                        } else {
                            
                            //                            params[key] = [existValue, value]
                        }
                        
                    } else {
                        
                        params[key] = value as AnyObject
                    }
                    
                }
            }
            
        } else {
            
            // 单个参数
            let pairComponents = paramsString.components(separatedBy:"=")
            
            // 判断是否有值
            if pairComponents.count == 1 {
                return nil
            }
            
            let key = pairComponents.first?.removingPercentEncoding
            let value = pairComponents.last?.removingPercentEncoding
            if let key = key, let value = value {
                params[key] = value as AnyObject
            }
            
        }
        
        
        return params
    }
}


