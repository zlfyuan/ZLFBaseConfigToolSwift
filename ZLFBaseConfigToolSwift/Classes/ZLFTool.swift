//
//  ZLFTool.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2017/12/4.
//  Copyright © 2017年 zluof. All rights reserved.
//

import UIKit

class ZLFTool: NSObject {
    
    static let singleton: ZLFTool = {
        let tool = ZLFTool()
        return tool
    }()
    
}

func backgroundOpacity(control:UIViewController,boolValue:Bool) {
    if #available(iOS 11.0, *) { control.navigationController?.navigationBar.setValue(NSNumber.init(value: boolValue), forKey: "_backgroundOpacity")
    }
}

func adjustsScrollViewInsets(scrollView:UIScrollView,controller:UIViewController) {
    if #available(iOS 11.0, *) {
        scrollView.contentInsetAdjustmentBehavior = .automatic
    } else {
        controller.automaticallyAdjustsScrollViewInsets = false
    }
}

func CallPhone(phone:String){
    DispatchQueue.global().async {
        if let url = NSURL(string: "tel://\(phone)") {
            UIApplication.shared.openURL(url as URL)
        }
    }
}

