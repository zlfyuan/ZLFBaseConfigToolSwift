//
//  ZLFDispatch.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/5/7.
//  Copyright © 2018年 zluof. All rights reserved.
//

import UIKit

extension DispatchQueue {
    
    /// GCD 延时
    ///
    /// - Parameters:
    ///   - delayTime: 秒
    ///   - execute: 回调
    public static func mainAsyncAfter(delayTime:Int,execute:@escaping ()->Void){
        let aftertime = DispatchTime.init(floatLiteral: Double(2 * delayTime))
        DispatchQueue.main.asyncAfter(deadline: aftertime, execute: execute)
    }
    
    /// GCD定时器倒计时
    /// - Parameters:
    ///   - timeInterval: 循环间隔时间
    ///   - repeatCount: 重复次数
    ///   - handler: 循环事件, 闭包参数： 1. timer， 2. 剩余执行次数
    public static func dispatchTimer(timeInterval: Double, repeatCount:Int, handler:@escaping (DispatchSourceTimer?, Int)->())
    {
        if repeatCount <= 0 {
            return
        }
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        var count = repeatCount
        timer.schedule(wallDeadline: .now(), repeating: timeInterval)
        timer.setEventHandler(handler: {
            count -= 1
            DispatchQueue.main.async {
                handler(timer, count)
            }
            if count == 0 {
                timer.cancel()
            }
        })
        timer.resume()
    }
    
}

//MARK: - DispatchTime
extension DispatchTime: ExpressibleByIntegerLiteral {
    
    /// 秒
    ///
    /// - Parameter value: 秒
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}
extension DispatchTime: ExpressibleByFloatLiteral {
    
    /// 毫秒
    ///
    /// - Parameter value: 毫秒
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}
