//
//  ZLFMacro.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2017/12/4.
//  Copyright © 2017年 zluof. All rights reserved.
//

import UIKit

func ZLFLog<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")

    #endif
}

func DeInitDebug(_ file : String = #file) {
    let classname = (file as NSString).lastPathComponent.components(separatedBy: ".").first
    ZLFLog(message: "\(classname!)销毁")
}


