//
//  ZLFBasicDataType.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2019/1/3.
//  Copyright © 2019 zluof. All rights reserved.
//

import UIKit

extension Int{
    var mapString : String {
        let mapstring = String.init(format: "%d", self)
        return mapstring
    }
}

extension Double{
    var mapString : String {
        let mapstring = String.init(format: "%.f", self)
        return mapstring
    }
}

extension Float{
    var mapString : String {
        let mapstring = String.init(format: "%.f", self)
        return mapstring
    }
}

extension CGFloat{
    var mapString : String {
        let mapstring = String.init(format: "%.f", self)
        return mapstring
    }
}
