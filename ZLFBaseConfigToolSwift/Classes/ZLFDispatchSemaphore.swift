//
//  ZLFDispatchSemaphore.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2020/7/17.
//  Copyright © 2020 zluof. All rights reserved.
//

import UIKit

extension DispatchSemaphore{
    
    /// 添加信号量任务
    ///
    ///     let semaphoreSignal = DispatchSemaphore(value: 1)
    ///
    ///     semaphoreSignal.add {
    ///         // do something
    ///     }.add {
    ///         // do something
    ///     }
    ///
    ///
    /// - Parameter action: 任务
    /// - Returns: 返回信号量对象
    @discardableResult
    func add(_ action:()->()) -> Self {
        self.wait()
        action()
        self.signal()
        return self
    }
}
