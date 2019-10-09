//
//  ZLFFont.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/10/24.
//  Copyright © 2018 zluof. All rights reserved.
//

import UIKit

public let scale_device = UIScreen.main.bounds.size.width / 750
extension UIFont {
    /// 普通字体
    ///
    /// - Parameter ofSize: 字号
    /// - Returns: UIFont
    @objc open class func systemScaleFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: scale_device * ofSize)
    }
    
    ///  加粗字体
    ///
    /// - Parameter ofSize: 字号
    /// - Returns: UIFont
    @objc open class func systemblodScaleFont(ofSize: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize:scale_device * ofSize)
        
    }
}
