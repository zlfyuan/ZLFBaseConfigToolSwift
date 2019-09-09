//
//  ZLFNSAttributedString.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2019/1/7.
//  Copyright © 2019 zluof. All rights reserved.
//

import UIKit

extension NSAttributedString {
    static func attributenStringColorFont(str:String,allTextFont:CGFloat,selectTextFont:CGFloat) -> NSAttributedString {
        
        let attStr = NSMutableAttributedString.init(string: str, attributes: [.foregroundColor:UIColor.black])
        attStr.addAttributes([.font:UIFont.systemScaleFont(ofSize: allTextFont)], range: NSRange.init(location: 0, length: str.count))
        attStr.addAttributes([.font:UIFont.systemScaleFont(ofSize: selectTextFont)], range: NSRange.init(location: str.count - 3, length: 3))
        return attStr
    }
    static func attributenStringColorWithFont(str:String,allTextFont:CGFloat,allTextColor:UIColor,selectTextFont:CGFloat,selectTextColor:UIColor,range:NSRange) -> NSAttributedString {
        
        let attStr = NSMutableAttributedString.init(string: str, attributes: [.foregroundColor:allTextColor])
        attStr.addAttributes([.font:UIFont.systemScaleFont(ofSize: allTextFont)], range: NSRange.init(location: 0, length: str.count))
        //选中
        attStr.addAttributes([.font:UIFont.systemScaleFont(ofSize: selectTextFont)], range: range)
        attStr.addAttributes([.foregroundColor:selectTextColor], range: range)
        return attStr
    }
    /// - Parameters: 选中字体颜色变红
    /// - text: 所有字符串
    /// - selectedText: 需要变颜色的字符串
    /// - allColor: 字符串本来颜色
    /// - selectedColor: 选中字符串颜色
    /// - fone: 字符串字体大小
    /// - Returns: 返回一个NSMutableAttributedString
    func attributenStringColor(text:String,
                               selectedText: String,
                               allColor: UIColor,
                               selectedColor: UIColor,
                               fone: CGFloat)->NSAttributedString{
        var rangeArray: [NSRange] = [NSRange]()
        var lastLength: Int = 0
        let attStr = NSMutableAttributedString.init(string: text, attributes: [.foregroundColor:UIColor.blue])
        var text = text as NSString
        while text.contains(selectedText) {
            let rang: NSRange = text.range(of: selectedText)
            let rang2 = NSMakeRange(rang.location + lastLength, rang.length)
            rangeArray.append(rang2)
            lastLength += (rang.length + rang.location )
            text = text.substring(from: rang.length + rang.location) as NSString
        }
        for range1 in rangeArray {
            attStr.setAttributes([.foregroundColor:selectedColor], range: range1)
        }
        return attStr as NSAttributedString
        
    }
}



