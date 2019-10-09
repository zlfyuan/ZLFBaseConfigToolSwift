//
//  ZLFError.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/12/26.
//  Copyright © 2018 zluof. All rights reserved.
//

import UIKit

extension NSError {
    open class func errorDes(_ des:String) -> NSError{
        return NSError.init(domain: des, code: 0, userInfo: nil)
    }
}
