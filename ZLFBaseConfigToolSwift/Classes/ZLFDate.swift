//
//  ZLFDate.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2018/10/24.
//  Copyright © 2018 zluof. All rights reserved.
//

import UIKit

extension Date{
    
    var currentYear : String{
        let current = Date()
        let year = Calendar.current.component(Calendar.Component.year, from: current)
        return "\(year)"
    }
    var currentMonth : String{
        let current = Date()
        let month = Calendar.current.component(Calendar.Component.month, from: current)
        return String.init(format: "%02d", month)
    }
    var currentDay : String{
        let current = Date()
        let day = Calendar.current.component(Calendar.Component.day, from: current)
        return String.init(format: "%02d", day)
    }
    var currentHour : String{
        let current = Date()
        let hour = Calendar.current.component(Calendar.Component.hour, from: current)
        return String.init(format: "%02d", hour)
    }
    var currentSecond : String{
        let current = Date()
        let second = Calendar.current.component(Calendar.Component.second, from: current)
        return String.init(format: "%02d", second)
    }
    var currentMinute : String{
        let current = Date()
        let minute = Calendar.current.component(Calendar.Component.minute, from: current)
        return String.init(format: "%02d", minute)
    }
    /**
     * transform date ---> string
     */
    static func transFormDateToString(date:Date , format:String) -> String {
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = format
        let date = formatter.string(from: date)
        return date.components(separatedBy: " ").first!
    }
    
    /**
     * transform string ---> date
     */
    static func transFormStringToDate(dateString:String, format:String) -> Date {
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = format
        return formatter.date(from: dateString)!
    }
    /**
     * transform TimTestampString ---> string
     */
    static func transformTimTestampToString(TimTestampString:String, dateFormat:String) -> String {
        if TimTestampString.isEmpty {
            return "0000-00-00 00:00"
        }
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(TimTestampString)!
        let date = NSDate(timeIntervalSince1970: timeInterval)
        
        let dformatter = DateFormatter()
        dformatter.dateFormat = dateFormat
        return dformatter.string(from: date as Date)
    }
    
    /**
     * transform date --------> 时间戳
     */
    static func transformDateToTimeStamp(date:Date) ->String {
        let timeInterval:TimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
    static func compare(date1:Date,date2:Date) ->String {
        // date1 < date2 升序排列
        if date1.compare(date2) == .orderedAscending
        {
             return "<"
        }else
        //date1 = date2 相等
        if date1.compare(date2) == .orderedSame
        {
             return "="
        }else
        //降序排列的 date1 > date2 降序排列
        if date1.compare(date2) == .orderedDescending
        {
            return ">"
        }else{
            return ""
        }
    }
    
}


