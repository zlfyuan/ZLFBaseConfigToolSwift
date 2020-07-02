//
//  ZLFString.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/11/28.
//  Copyright © 2018 zluof. All rights reserved.
//

import UIKit
extension String {
    func clearCache(path:String?) {
//        let fileManager = FileManager.default
//        var clearCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
//        if let filePath = path {
//            clearCachePath = clearCachePath! + "/\((filePath))"
//        }
//        let enumerator = fileManager.enumerator(atPath: clearCachePath!)
//        enumerator?.forEach({ (subPath) in
//            let sub_path = subPath as! String
//            let path = yypath + "/\(sub_path)"
//            try! fileManager.removeItem(atPath: path)
//        })
        
    }
    // 对象方法
    func getFileSize() -> UInt64  {
        var size: UInt64 = 0
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        let isExists = fileManager.fileExists(atPath: self, isDirectory: &isDir)
        // 判断文件存在
        if isExists {
            // 是否为文件夹
            if isDir.boolValue {
                // 迭代器 存放文件夹下的所有文件名
                let enumerator = fileManager.enumerator(atPath: self)
                for subPath in enumerator! {
                    // 获得全路径
                    let fullPath = self.appending("/\(subPath)")
                    do {
                        let attr = try fileManager.attributesOfItem(atPath: fullPath)
                        size += attr[FileAttributeKey.size] as! UInt64
                    } catch  {
                        print("error :\(error)")
                    }
                }
            } else {    // 单文件
                do {
                    let attr = try fileManager.attributesOfItem(atPath: self)
                    size += attr[FileAttributeKey.size] as! UInt64
                    
                } catch  {
                    print("error :\(error)")
                }
            }
        }
        return size
    }
}

//MARK: - 正则
extension String {
    
    /// 手机号验证
    ///
    /// - Returns: true 正确 false 错误
    func isPhoneNumber() -> Bool {
        let mobileCount = self.count
        guard mobileCount==11 else {
            return false
        }
        let regual = "^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$"
        let emailRegual = RegularExpression(regual)
        guard emailRegual.match(input: self) else {
            return false
        }
        return true
    }
    /// 邮箱验证
    ///
    /// - Returns: true 正确 false 错误
    func isEmail() -> Bool {
        let regual = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let emailRegual = RegularExpression(regual)
        guard emailRegual.match(input: self) else {
            return false
        }
        return true
    }
    
    /// 用户名验证
    ///
    /// - Returns: true 正确 false 错误
    func isUserName() -> Bool{
        //用户名验证（允许使用小写字母、数字、下滑线、横杠，一共3~16个字符）
        let regual =  "^[a-zA-Z0-9_-]{11,13}$"
        let userNameRegual = RegularExpression(regual)
        guard userNameRegual.match(input: self) else {
            return false
        }
        return true
    }
    /// 密码验证
    ///
    /// - Returns: true 正确 false 错误
    func isUserPassword() -> Bool{
        //密码验证（允许使用小写字母、数字，一共6~16个字符）
        let regual =  "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}"
        let userPasswordRegual = RegularExpression(regual)
        guard userPasswordRegual.match(input: self) else {
            return false
        }
        return true
    }
    /// 正则匹配用户身份证号15或18位
    ///
    /// - Returns: true 正确 false 错误
    func checkUserIdCard() ->Bool {
        let pattern = "(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: self)
        return isMatch;
    }
    /// 中文验证
    ///
    /// - Returns: true 正确 false 错误
    func checkChinases() ->Bool {
        let inputString = "[\u{4e00}-\u{9fa5}]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", inputString)
        let Chinese = predicate.evaluate(with: self)
        return Chinese
    }
    
    func checkAlphabet() ->Bool {
        let pattern = "[a-zA-Z /]+";
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: self)
        return isMatch;
    }
    
    
    // MARK: - 正则匹配工具类
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
}
extension String{
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
    /**
     * load html ====> return htmlString
     */
    var html_content : String {
        get{
            let url = self
            let url1 = url.replacingOccurrences(of: "&quot;", with: "\"")
            let url2 = url1.replacingOccurrences(of: "&apos;", with: "'")
            let url3 = url2.replacingOccurrences(of: "&lt;", with: "<")
            let url4 = url3.replacingOccurrences(of: "&gt;", with: ">")
            let url5 = url4.replacingOccurrences(of: "&amp;", with: "&")
            let htmlStr =
                "<html>"
                    + "<head>"
                    + "<style type='text/css'>"
                    + "img,table{width: 100% !important;height: auto !important;}"
                    + "body,div,td,th{font-size: 1em;line-height: 1.3em;}"
                    + "</style>"
                    + "<meta name='viewport' content='width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no'> </head>"
                    + "<body style='padding:0px;margin:10px;'>" + url5
                    + "</body>"
                    + "<html>"
            return htmlStr
            
        }
    }
    
    
    
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


