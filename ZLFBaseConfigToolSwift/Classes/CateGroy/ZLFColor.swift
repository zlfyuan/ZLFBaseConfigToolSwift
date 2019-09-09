//
//  ZLFColor.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/2/25.
//  Copyright © 2018年 zluof. All rights reserved.
//

import UIKit

class ZLFColor: NSObject {}

let TEXTCOLOR = ZLFColorRGB(r: 153, g: 153, b: 153)

let ZLFTHEMECOLOR = ZLFColorConversion(colorString: "#3F8A38")

let LINECOLOR = ZLFColorRGB(r: 228, g: 227, b: 237)

let placeholderColor = ZLFColorConversion(colorString: "#C7c7ce")

/// 进制转换颜色二
///
/// - Parameter colorString: 字符描述
/// - Returns: UIColor
public func ZLFColorConversion (colorString:NSString)->UIColor{
    return ZLFConversionColor(Color_Value: colorString, alpha: 1.0)
}

/// 进制转换颜色一
///
/// - Parameters:
///   - Color_Value: 字符描述
///   - alpha: 透明度
/// - Returns: UIColor
public func ZLFConversionColor(Color_Value:NSString, alpha: CGFloat)->UIColor{
    var  Str :NSString = Color_Value.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
    if Color_Value.hasPrefix("#"){
        Str=(Color_Value as NSString).substring(from: 1) as NSString
    }
    let redStr = (Str as NSString ).substring(to: 2)
    let greenStr = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
    let blueStr = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string:redStr).scanHexInt32(&r)
    Scanner(string: greenStr).scanHexInt32(&g)
    Scanner(string: blueStr).scanHexInt32(&b)
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
}

/// RGB描述
///
/// - Parameters:
///   - r: 红色
///   - g: 绿色
///   - b: 蓝色
/// - Returns: RGB色
public func ZLFColorRGB(r:CGFloat,
                        g:CGFloat,
                        b:CGFloat) -> UIColor {
    return UIColor.init(red: CGFloat(r/255.0),
                        green:CGFloat(g/255.0),
                        blue:CGFloat(b/255.0),
                        alpha:1.0)
}


/// 随机色
///
/// - Returns: 返回随机色
public func ZLFARCCOLOR() -> UIColor{
    let red   = CGFloat(arc4random()%256)/255.0
    let green = CGFloat(arc4random()%256)/255.0
    let blue  = CGFloat(arc4random()%256)/255.0
    return UIColor(red: red, green: green, blue: blue, alpha: 0.3)
}

