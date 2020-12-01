//
//  ZLFDevice.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/2/25.
//  Copyright © 2018年 zluof. All rights reserved.
//

import UIKit

open class ZLFDevice {
    
    func devicePrint(length:Int)->Bool{
        return length > 10
    }
    
    init() {}
    
    open class var currentDevice: ZLFDevice{
        return ZLFDevice.init()
    }
    
    open var systemName : String{
        return UIDevice.current.systemName
    }
    open var systemVersion : String{
        return "iOS " + UIDevice.current.systemVersion
    }
    open var isIPhone:Bool{
        let device = UIDevice.current.model
        if device == "iPhone" {
            return true
        }
        return false
    }
    open var isIPad:Bool{
        let device = UIDevice.current.model
        if device == "iPad" {
            return true
        }
        return false
    }
    open var isIPod:Bool{
        let device = UIDevice.current.model
        if device == "iPod touch" {
            return true
        }
        return false
    }
    
    open var deviceType : String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
            return String(cString: ptr)
        }
        if platform == "iPhone1,1" { return "iPhone 2G"}
        if platform == "iPhone1,2" { return "iPhone 3G"}
        if platform == "iPhone2,1" { return "iPhone 3GS"}
        if platform == "iPhone3,1" { return "iPhone 4"}
        if platform == "iPhone3,2" { return "iPhone 4"}
        if platform == "iPhone3,3" { return "iPhone 4"}
        if platform == "iPhone4,1" { return "iPhone 4S"}
        if platform == "iPhone5,1" { return "iPhone 5"}
        if platform == "iPhone5,2" { return "iPhone 5"}
        if platform == "iPhone5,3" { return "iPhone 5C"}
        if platform == "iPhone5,4" { return "iPhone 5C"}
        if platform == "iPhone6,1" { return "iPhone 5S"}
        if platform == "iPhone6,2" { return "iPhone 5S"}
        if platform == "iPhone7,1" { return "iPhone 6 Plus"}
        if platform == "iPhone7,2" { return "iPhone 6"}
        if platform == "iPhone8,1" { return "iPhone 6S"}
        if platform == "iPhone8,2" { return "iPhone 6S Plus"}
        if platform == "iPhone8,4" { return "iPhone SE"}
        if platform == "iPhone9,1" { return "iPhone 7"}
        if platform == "iPhone9,2" { return "iPhone 7 Plus"}
        if platform == "iPhone10,1" { return "iPhone 8"}
        if platform == "iPhone10,2" { return "iPhone 8 Plus"}
        if platform == "iPhone10,3" { return "iPhone X"}
        if platform == "iPhone10,4" { return "iPhone 8"}
        if platform == "iPhone10,5" { return "iPhone 8 Plus"}
        if platform == "iPhone10,6" { return "iPhone X"}
        
        if platform == "iPod1,1" { return "iPod Touch 1G"}
        if platform == "iPod2,1" { return "iPod Touch 2G"}
        if platform == "iPod3,1" { return "iPod Touch 3G"}
        if platform == "iPod4,1" { return "iPod Touch 4G"}
        if platform == "iPod5,1" { return "iPod Touch 5G"}
        
        if platform == "iPad1,1" { return "iPad 1"}
        if platform == "iPad2,1" { return "iPad 2"}
        if platform == "iPad2,2" { return "iPad 2"}
        if platform == "iPad2,3" { return "iPad 2"}
        if platform == "iPad2,4" { return "iPad 2"}
        if platform == "iPad2,5" { return "iPad Mini 1"}
        if platform == "iPad2,6" { return "iPad Mini 1"}
        if platform == "iPad2,7" { return "iPad Mini 1"}
        if platform == "iPad3,1" { return "iPad 3"}
        if platform == "iPad3,2" { return "iPad 3"}
        if platform == "iPad3,3" { return "iPad 3"}
        if platform == "iPad3,4" { return "iPad 4"}
        if platform == "iPad3,5" { return "iPad 4"}
        if platform == "iPad3,6" { return "iPad 4"}
        if platform == "iPad4,1" { return "iPad Air"}
        if platform == "iPad4,2" { return "iPad Air"}
        if platform == "iPad4,3" { return "iPad Air"}
        if platform == "iPad4,4" { return "iPad Mini 2"}
        if platform == "iPad4,5" { return "iPad Mini 2"}
        if platform == "iPad4,6" { return "iPad Mini 2"}
        if platform == "iPad4,7" { return "iPad Mini 3"}
        if platform == "iPad4,8" { return "iPad Mini 3"}
        if platform == "iPad4,9" { return "iPad Mini 3"}
        if platform == "iPad5,1" { return "iPad Mini 4"}
        if platform == "iPad5,2" { return "iPad Mini 4"}
        if platform == "iPad5,3" { return "iPad Air 2"}
        if platform == "iPad5,4" { return "iPad Air 2"}
        if platform == "iPad6,3" { return "iPad Pro 9.7"}
        if platform == "iPad6,4" { return "iPad Pro 9.7"}
        if platform == "iPad6,7" { return "iPad Pro 12.9"}
        if platform == "iPad6,8" { return "iPad Pro 12.9"}
        
        if platform == "i386"   { return "iPhone Simulator"}
        if platform == "x86_64" { return "iPhone Simulator"}
        
        return platform
    }

    ///navgationBar的高度
    public static let navgationBarHeight : CGFloat = {
        if iphoneX == true {
            return CGFloat(88)
        }
        return CGFloat(64)
    }()

    /// tabBar的高度
    public static let tabBarHeight : CGFloat = {
        if iphoneX == true {
            return CGFloat(49.0+34.0)
        }
        return CGFloat(49)
    }()


    /// IphoneX底部控制区域的高度
    public static let iPhoneXBottomHeight : CGFloat = {
        if ZLFDevice.iphoneX == true {
            return CGFloat(34.0)
        }
        return CGFloat(0)
    }()

    /// 刘海屏
    public static let iphoneX: Bool = {
        if statusBarHeight == 20 {
            return false
        }
        return true
    }()

    public static let SCREEN = UIScreen.main.bounds
    public static let SWIDTH = UIScreen.main.bounds.size.width
    public static let SHEIGHT = UIScreen.main.bounds.size.height


    /// 适配iPhoneX
    public static let NavibarH: CGFloat = is_iPhoneX ? 88.0 : 64.0
    public static let TabbarH: CGFloat = is_iPhoneX ? 49.0+34.0 : 49.0
    public static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    public let iPhoneXBottomH: CGFloat = 34.0
    public let iPhoneXTopH: CGFloat = 24.0

    /// 判断机型
    public static let IS_IPHONE_5 = (SWIDTH == 320.0 && SHEIGHT == 568.0 ?true:false)
    public static let IS_IPHONE_6 = (SWIDTH == 375.0 && SHEIGHT == 667.0 ?true:false)
    public static let IS_IPHONE_6P = (SWIDTH == 414.0 && SHEIGHT == 736.0 ?true:false)
    public static let is_iPhoneX = (SWIDTH == 375.0 && SHEIGHT == 812.0 ?true:false)
    public static let is_iPhoneXR_XSMax = (SWIDTH == 414.0 && SHEIGHT == 896.0 ?true:false)

    /// 是否为ipad
    public static let is_iPad = (UIDevice.current.model == "iPad" ? true : false)
    
}
