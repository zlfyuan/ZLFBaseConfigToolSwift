//
//  ZLFApplication.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/12/24.
//  Copyright © 2018 zluof. All rights reserved.
//

import UIKit

protocol ZLFApplicationProtocol{
    var version : String {get}
    var name : String {get}
}

open class ZLFApplication : ZLFApplicationProtocol{
  
    open class var currentApp: ZLFApplication{
        return ZLFApplication.init()
    }
    open var version: String{
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "0.0"
    }
    open var name: String{
        if let name = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String {
            return name
        }
        return "iOSApplication"
    }
}

// MARK: - 应用内存储 -UserDefaults
extension ZLFApplication {
    /**
     * by 'key' save info in the  UserDefaults
     */
    public class func saveInfo(info: Any, infoKey:String){
        let userDefault = UserDefaults.standard
        userDefault.set(info, forKey: infoKey)
        userDefault.synchronize()
    }
    /**
     * by 'key' get info in the  UserDefaults
     */
    public class func getInfo(info: String) -> Any{
        let userDefault = UserDefaults.standard
        let info : Any = userDefault.object(forKey: info) as Any
        return info
    }
    /**
     * by 'key' remove info in the  UserDefaults
     */
    public class func removeInfo(key: String){
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: key)
        userDefault.synchronize()
    }
    /**
     * delete All info in the  UserDefaults
     */
    public class func deleteAllInfo(){
        let userDefault = UserDefaults.standard
        userDefault.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
}

// MARK: - 应用更新
extension ZLFApplication{
    

    /// 展示控制器
    fileprivate var viewController : UIViewController{
        return (UIApplication.shared.keyWindow?.rootViewController)!
    }
    
    /// 跳转到AppStore
    fileprivate func openAppStore(_ urlString:String) {
        let url = NSURL.init(string: urlString)
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.openURL(url! as URL)
        }
    }
    
    /// 更新方法
    ///
    /// - Parameters:
    ///   - appid: appid 应用商店的唯一id 必填
   func updata(_ appId: String) {
        #if DEBUG
        #else
        self.updateApp(appId: appId)
        #endif
    }
   fileprivate func updateApp(appId: String) {
        guard !(appId.isEmpty) else {
            fatalError("appid can't empty")
        }
        guard let infoDict = Bundle.main.infoDictionary else { return }
        guard var currentVersion = infoDict["CFBundleShortVersionString"] as? String else { return }
        guard let url = URL(string: "http://itunes.apple.com/cn/lookup?id=\(appId)") else { return }
        let request = URLRequest(url: url)
        ZLFLog(message: "【1】当前为APPID检测，您设置的APPID为:\(appId) 当前版本号为:\(currentVersion)")
        
        let session = URLSession.shared
        //开始检测...
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                ZLFLog(message: "【2】检测失败，原因：\(error!)")
                return
            }
            DispatchQueue.main.async {
                guard let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) else { return }
                guard let appInfoDict = dict  as? [String: Any] else { return }
                guard let resultCount = appInfoDict["resultCount"] as? Int else { return }
                if resultCount == 0 {
                    // 检测出未上架的APP或者查询不到
                    return
                }
                /*
                 appInfoDict["results"]
                 1.appId = artistId
                 2.bundleId = bundleId
                 3.开发账号名字 = artistName
                 4.商店版本号 = version
                 5.应用名称 = trackName
                 6.打开连接 = trackViewUrl
                 */
                //苹果服务器返回的检测结果：
                guard let resultsArray = appInfoDict["results"] as? [[String: Any]] else { return }
                guard let resultsDict = resultsArray.first else { return }
                guard var appStoreVersion = resultsDict["version"] as? String else { return }
                guard let releaseNotes = resultsDict["releaseNotes"] as? String else { return }
                guard (resultsDict["trackViewUrl"] as? String) != nil else { return }
//                print(resultsDict["trackViewUrl"] as Any)
                
                currentVersion = currentVersion.replacingOccurrences(of: ".", with: "")
                if (currentVersion.count == 2) {
                    currentVersion = currentVersion.appending("0")
                }else if (currentVersion.count == 1){
                    currentVersion = currentVersion.appending("00")
                }
                appStoreVersion = appStoreVersion.replacingOccurrences(of: ".", with: "")
                if (appStoreVersion.count == 2) {
                    appStoreVersion = appStoreVersion.appending("0")
                }else if (appStoreVersion.count == 1){
                    appStoreVersion = appStoreVersion.appending("00")
                }
                ZLFLog(message: "当前版本号\(currentVersion) 商店版本号\(appStoreVersion)")
                if currentVersion.floatValue < appStoreVersion.floatValue {
                    // 需要更新
                    self.alertViewControllerAction(title: "新版本来了，快去更新吧~", message: releaseNotes, actionRightTitle: "立即更新", actionLeftTitle: "以后再说", actionLeftEvent: { (ta) in
                    }, actionRightEvent: { (tap) in
                        let urlstring = resultsDict["trackViewUrl"] as! String
                        self.openAppStore(urlstring)
                    })
                } else {
                    //不需要更新
                }
            }
        }
        task.resume()
    }
   
    /**
     * 弹窗
     */
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
        viewController.present(alertController, animated: true, completion: nil)
    }
}

