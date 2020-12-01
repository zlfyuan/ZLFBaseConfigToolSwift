//
//  ZLFBaseConfigTool.swift
//  ZLFBaseConfigToolSwift_Example
//
//  Created by zluof on 2020/12/1.
//  Copyright © 2020 zluof. All rights reserved.
//
import Foundation
import UIKit

/// 类包装器
public class ZLFBaseConfigToolClassWrapper<Base> {
    public let base: Base
    public init(_ base:Base) {
        self.base = base
    }
}

public protocol ZLFBaseConfigClassInterface{
    associatedtype BaseConfigInterface
    var bc : BaseConfigInterface{ get }
}

public extension ZLFBaseConfigClassInterface{
    var bc: ZLFBaseConfigToolClassWrapper<Self>{
        get { return ZLFBaseConfigToolClassWrapper(self) }
    }
}


/// 结构体包装器
public class ZLFBaseConfigToolStructWrapper<Base> {
    public let base: Base
    public init(_ base:Base) {
        self.base = base
    }
}

public protocol ZLFBaseConfigStructInterface{
    associatedtype BaseConfigInterface
    var bc : BaseConfigInterface{ get }
}

public extension ZLFBaseConfigStructInterface{
    var bc: ZLFBaseConfigToolStructWrapper<Self>{
        get { return ZLFBaseConfigToolStructWrapper(self) }
    }
}
