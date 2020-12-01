//
//  ZLFUIView.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 16/12/5.
//  Copyright © 2016年 zluof. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
   public var x : CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frameView = self.frame
            frameView.origin.x = newValue
            self.frame = frameView
        }
    }
    
    public var y : CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var frameView = self.frame
            frameView.origin.y = newValue
            self.frame = frameView
        }
    }
    
    public var width : CGFloat!{
        get{
            return self.frame.size.width
        }
        set{
            var frameView = self.frame
            frameView.size.width = newValue
            self.frame = frameView
        }
    }
    public var height : CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frameView = self.frame
            frameView.size.height = newValue
            self.frame = frameView
        }
    }

    public var centerX : CGFloat{
        get{
            return self.center.x
        }
        set{
            var frameView = self.center
            frameView.x = newValue
             self.center = frameView
        }
    }
    public var centerY : CGFloat{
        get{
            return self.center.y
        }
        set{
            var frameView = self.center
            frameView.y = newValue
            self.center = frameView
        }
    }


}


extension UIView{
    
    
    /// 裁剪 view 的圆角
    ///
    /// - Parameters:
    ///   - direction: 裁剪方向
    ///   - cornerRadius: 圆角大小
    public func clipRectCorner(direction: UIRectCorner = [UIRectCorner.topRight,
                                                          UIRectCorner.topLeft,
                                                          UIRectCorner.bottomLeft,
                                                          UIRectCorner.bottomRight], cornerRadius: CGFloat) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    /// 添加单击手势
    public var tapEvent: UITapGestureRecognizer {
        get{
            let tap = UITapGestureRecognizer.init()
            self.addGestureRecognizer(tap)
            self.isUserInteractionEnabled = true
            return tap
        }
        set{
            
        }
    }
}

//MARK: - loadNib

protocol ZLFNibloadProtocol {}
extension ZLFNibloadProtocol {
    /// 返回xib——>View对象
    ///
    /// - Returns: xib 对象
    static func loadFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}
