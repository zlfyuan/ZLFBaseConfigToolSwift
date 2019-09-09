//
//  ZLFBasicDataType.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2019/1/3.
//  Copyright © 2019 zluof. All rights reserved.
//

import UIKit

extension Int{
    
    var mapIntPriceString : String {
        if self < 1 {
            return String.init(format: "￥%@",self)
        }
        let p = String.init(format: "￥%d",self)
        return p
    }
    
    var mapString : String {
        let mapstring = String.init(format: "%d", self)
        return mapstring
    }
    var mapPriceString : String {
        if self < 1 {
            return String.init(format: "￥%",self)
        }
        let p = String.init(format: "￥%.2f",CGFloat(self))
        return p
    }
    
    var priceString : String {
        let p = String.init(format: "%.2f",CGFloat(self))
        return p
    }
}

extension Double{
    var mapString : String {
        let mapstring = String.init(format: "%.f", self)
        return mapstring
    }
    var mapPriceString : String {
        let p = String.init(format: "￥%.2f",CGFloat(self))
        return p
    }
    
    var priceString : String {
        let p = String.init(format: "%.2f",CGFloat(self))
        return p
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
    var mapIntPriceString : String {
        if self < 1 {
            return String.init(format: "￥%.2f",self)
        }
        let p = String.init(format: "￥%.f",self)
        return p
    }
}
