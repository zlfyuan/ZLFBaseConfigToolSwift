//
//  UIViewController+tool.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 17/2/20.
//  Copyright © 2017年 zluof. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    public func showAlertViewController(title:String,
                                          message:String,
                                          actionLeftTitle: String,
                                          actionRightTitle: String,
                                          actionLeftEvent:@escaping (_ actionLeft:Any)->(),
                                          actionRightEvent:@escaping(_ actionRight:Any)->()) -> () {
        let alertController =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let alertAcitonLeft = UIAlertAction.init(title: actionLeftTitle, style: .default) { (action) in
            actionLeftEvent(action)
        }
        alertController.addAction(alertAcitonLeft)
        let alertAcitonRight = UIAlertAction.init(title:actionRightTitle , style: .destructive) { (action) in
            actionRightEvent(action)
        }
        alertController.addAction(alertAcitonRight)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    public func alertViewControllerAction(title:String,message:String,actionRightTitle: String,actionLeftTitle: String, actionLeftEvent:@escaping (_ actionLeft:Any)->(), actionRightEvent:@escaping(_ actionRight:Any)->()) -> () {
        let alertController =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAcitonComfirm = UIAlertAction.init(title: actionLeftTitle, style: .default) { (action) in
            
            actionLeftEvent(action)
        }
        alertController.addAction(alertAcitonComfirm)
        let alertAcitonCalcel = UIAlertAction.init(title:actionRightTitle , style: .default) { (action) in
            actionRightEvent(action)
        }
        alertController.addAction(alertAcitonCalcel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alertViewHint(title: String,message: String) -> () {
        let alertController =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAcitonComfirm = UIAlertAction.init(title: "确定", style: .default) { (action) in}
        alertController.addAction(alertAcitonComfirm)

        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alertViewHint(title: String,message: String,alertAcitonComfirmEvent:@escaping (_ title:String)->()) -> () {
        let alertController =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAcitonComfirm = UIAlertAction.init(title: "确定", style: .default) { (action) in
            alertAcitonComfirmEvent(action.title!)
        }
        alertController.addAction(alertAcitonComfirm)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alertSheetViewTitle(_title:String, titles:[String],canceltitle:String,titlebtnEvent:@escaping (_ title:String)->(),cancelEvent:@escaping(_ cancelAction:Any)->()){
        
        let alertController =  UIAlertController.init(title: _title, message: nil, preferredStyle:.actionSheet)
        for titl in titles {
            let alertAcitonComfirm = UIAlertAction.init(title: titl, style: .default) { (action) in
                titlebtnEvent(action.title!)
            }
            alertController.addAction(alertAcitonComfirm)
            alertAcitonComfirm.setValue(UIColor.black, forKey: "titleTextColor")
        }
        
        let alertAcitonCancel = UIAlertAction.init(title: canceltitle, style: .cancel) { (action) in
            cancelEvent(action)
        }
        alertController.addAction(alertAcitonCancel)
        self.present(alertController, animated: true, completion: nil)

    }
    
    public func alertSheetView(titles:[String],titleColor:UIColor,canceltitle:String, titlebtnEvent:@escaping (_ title:String)->(),cancelEvent:@escaping(_ cancelAction:Any)->()){
        
        let alertController =  UIAlertController.init(title: nil, message: nil, preferredStyle:.actionSheet)
        for titl in titles {
            let alertAcitonComfirm = UIAlertAction.init(title: titl, style: .default) { (action) in
                titlebtnEvent(action.title!)
            }
            alertController.addAction(alertAcitonComfirm)
            alertAcitonComfirm.setValue(titleColor, forKey: "titleTextColor")
        }
        
        let alertAcitonCancel = UIAlertAction.init(title: canceltitle, style: .cancel) { (action) in
            cancelEvent(action)
        }
        alertAcitonCancel.setValue(titleColor, forKey: "titleTextColor")
        alertController.addAction(alertAcitonCancel)
        self.present(alertController, animated: true, completion: nil)
        
    }
}


    
    
    
    
    
    
    
//监听系统a返回按钮事件（注意是系统）
@objc public protocol BackButtonHandlerProtocol:NSObjectProtocol{
    @objc optional func navigationShouldPopOnBackButton() ->Bool
}
    
extension UIViewController:BackButtonHandlerProtocol{}
    
extension UINavigationController:UINavigationBarDelegate {

  
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        
        if self.viewControllers.count < (navigationBar.items?.count)! {
            return true
        }

        let shouldPop = true
        let _:UIViewController! = self.topViewController!
//        if vc.responds(to: #selector(navigationShouldPopOnBackButton)){
//            shouldPop = vc.navigationShouldPopOnBackButton()
//        }
        if shouldPop == false {
            
//            self.popToRootViewController(animated: true)

        }else{
            self.popViewController(animated: true)
            for subView in navigationBar.subviews {
                if 0 < subView.alpha && subView.alpha < 1 {
                    UIView.animate(withDuration: 0.25, animations: { 
                        subView.alpha = 1
                    })
                }
            }
        }
        
        return false;
    }
}
