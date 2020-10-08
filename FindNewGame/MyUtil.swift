//
//  Util.swift
//  dr Bob's Clinic
//
//  Created by Irsyad Ashari on 27/07/20.

import Foundation
import UIKit

// For Parsing Determine Time Date
public class MyUtil{
    
    class func checkUserTFInput(inputs: UITextField)->Bool{
        if(inputs.text != ""){
            return true
        }
        return false
    }
    
    
    
    class func popOutVC(navController : UINavigationController){
        navController.popViewController(animated: false)
    }
    
    class func goBack(navController : UINavigationController){
        navController.popViewController(animated: true)
    }
    
    
    
    class func setBorder(view : UIView){
        view.layer.cornerRadius = 10
    }
    

    class func getMonthName(monthOrder: String) -> String{
        switch monthOrder {
            case "1":
                return "Januari"
            case "2":
                return "Februari"
            case "3":
                return "Maret"
            case "4":
                return "April"
            case "5":
                return "Mei"
            case "6":
                return "Juni"
            case "7":
                return "Juli"
            case "8":
                return "Agustus"
            case "9":
                return "September"
            case "10":
                return "Oktober"
            case "11":
                return "November"
            case "12":
                return "Desember"
            default:
                return "-"
        }
    }
    
    class func getMonthNameAPIFormat(monthOrder: String) -> String{
        switch monthOrder {
            case "01":
                return "Januari"
            case "02":
                return "Februari"
            case "03":
                return "Maret"
            case "04":
                return "April"
            case "05":
                return "Mei"
            case "06":
                return "Juni"
            case "07":
                return "Juli"
            case "08":
                return "Agustus"
            case "09":
                return "September"
            case "10":
                return "Oktober"
            case "11":
                return "November"
            case "12":
                return "Desember"
            default:
                return "-"
        }
    }
    
    // GETTING CURRENT DAY NAME
    class func getCurrentDayName()-> String{
        
        let date = Date()
        let currentCalendar = Calendar.current
        
        //day order
        let dayOrder = currentCalendar.component(.weekday, from: date)
        
        let dayName = getDayName(dayOrder : String(dayOrder))
        return dayName
        
    }
    
    // GETTING DAY NAME
    class func getDayName(currentCalendar : Calendar,datePicked : Date)-> String{
        
        //day order
        let dayOrder = currentCalendar.component(.weekday, from: datePicked)
        
        let dayName = getDayName(dayOrder : String(dayOrder))
        return dayName
        
    }
    
    //for DetermineDate DatePickerLabel.text
    class func getDetermineDateFormatted(calendar : Calendar, datePicked : Date)-> String{
        
        let year = calendar.component(.year, from: datePicked)
        let month = calendar.component(.month, from: datePicked)
        let datee = calendar.component(.day, from: datePicked)
        
        let dayOrder = calendar.component(.weekday, from: datePicked)
        
        let dayName = getDayName(dayOrder : String(dayOrder))
        
        return "\(dayName), \(datee) \(getMonthName(monthOrder: String(month))) \(year)"
        
    }
    
    class func getChildBirthDate(calendar : Calendar, datePicked : Date)-> String{
        
        let year = calendar.component(.year, from: datePicked)
        let month = calendar.component(.month, from: datePicked)
        let datee = calendar.component(.day, from: datePicked)
        
        return "\(datee) \(getMonthName(monthOrder: String(month))) \(year)"
        
    }
    
    //for DetermineDate DatePickerLabel.text
    class func getDisplayWithDayNameDateFormatted(dateString: String)-> String{
        
        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateObj = dateFormatter.date(from: dateString)
        
        let year = calendar.component(.year, from: dateObj!)
        
        let month = calendar.component(.month, from: dateObj!)
        let datee = calendar.component(.day, from: dateObj!)
        
        let dayOrder = calendar.component(.weekday, from: dateObj!)
        
        let dayName = getDayName(dayOrder : String(dayOrder))
        
        return "\(dayName), \(datee) \(getMonthName(monthOrder: String(month))) \(year)"
        
    }
    
    //for Display Date Ticket List
    class func getDisplayDateForTicket(dateString: String)-> String{
        
        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateObj = dateFormatter.date(from: dateString)
        
        let month = calendar.component(.month, from: dateObj!)
        let datee = calendar.component(.day, from: dateObj!)
        
        return "\(datee) \(getMonthName(monthOrder: String(month)))"
        
    }
    
    //for Birthdate DatePickerLabel.text
    class func getBirthDateDisplayFormat(calendar : Calendar, datePicked : Date)-> String{
        
        let year = calendar.component(.year, from: datePicked)
        let month = calendar.component(.month, from: datePicked)
        let datee = calendar.component(.day, from: datePicked)
        
        return "\(datee) \(getMonthName(monthOrder: String(month))) \(year)"
    }
    
    //for birthdate Text
    class func getBirthDateFormatted(birthDateString : String)-> String{
        
        let year = birthDateString.substring(with: 0..<4)
        let month = birthDateString.substring(with: 5..<7)
        let datee = birthDateString.substring(with: 8..<10)
        
        return "\(datee) \(getMonthNameAPIFormat(monthOrder: String(month))) \(year)"
        
    }
    
    // GETTING CURRENT TIME
    class func getCurrentTime()-> String{
        let date = Date()
        let currentCalendar = Calendar.current
        
        let hour = currentCalendar.component(.hour, from: date)
        let minute = currentCalendar.component(.minute, from: date)
        let second = currentCalendar.component(.second, from: date)
        
        return "\(hour):\(minute):\(second)"
    }
    
    // GETTING CURRENT DATE IN THE SAME FORMAT AS THE API
    class func getCurrentFormattedDate() -> String{
        let date = Date()
        let currentCalendar = Calendar.current
        
        let year = currentCalendar.component(.year, from: date)
        let month = currentCalendar.component(.month, from: date)
        let datee = currentCalendar.component(.day, from: date)
        
        return "\(year)-\(getFormattedDatee(rawDate: month))-\(getFormattedDatee(rawDate: datee))"
    }
    
    // GETTING CURRENT DATE IN THE DISPLAY FORMAT
    class func getCurrentDisplayDate() -> String{
        let date = Date()
        let currentCalendar = Calendar.current
        
        let year = currentCalendar.component(.year, from: date)
        let month = currentCalendar.component(.month, from: date)
        let datee = currentCalendar.component(.day, from: date)
        
        let dayOrder = currentCalendar.component(.weekday, from: date)
        
        let dayName = getDayName(dayOrder : String(dayOrder))
        
        return "\(dayName), \(datee) \(getMonthName(monthOrder: String(month))) \(year)"
    }
    
    // GETTING DATE IN THE SAME FORMAT AS THE API
    class func getPickedFormattedDate(currentCalendar : Calendar,date : Date) -> String{
        
        let year = currentCalendar.component(.year, from: date)
        let month = currentCalendar.component(.month, from: date)
        let datee = currentCalendar.component(.day, from: date)
        
        return "\(year)-\(getFormattedDatee(rawDate: month))-\(getFormattedDatee(rawDate: datee))"
    }
    
    // SYNC THE DATEPICKER'S DATE FORMAT WITH THE API
    class func getFormattedDatee(rawDate: Int) -> String{
        if(rawDate < 10){
            return "0\(rawDate)"
        }else{
            return "\(rawDate)"
        }
    }
    
    //CHECK IF THE CURRENT HOUR MATCH THE REGISTRATION TIME
    class func checkHourAvailibility(endTimeShift: String) -> Bool{
        // IF TRUE, THEN DEADLINE HAS NOT BEEN PASSED and USER CAN REGISTER
        let date = Date()
        let currentCalendar = Calendar.current
        
        let hourDeadline = Int(endTimeShift.substring(with: 0..<2))!
        let minuteDeadline = Int(endTimeShift.substring(with: 3..<5))!
        
        let currentHour = currentCalendar.component(.hour, from: date)
        let currentMinute = currentCalendar.component(.minute, from: date)
        
        if(currentHour <= hourDeadline){
            if(currentHour == hourDeadline){
                if(currentMinute < minuteDeadline){
                    return true
                }else{
                    return false
                }
            }
            return true
        }
        return false
        
    }
    
    //CHECK IF THE PICKED DATE HAS PASSED THE CURRENT DATE
    class func currentDateCheck(sentCalendar: Calendar, date : Date) -> Bool{
        
        let currentDateObj = Date()
        let currentCalendar = Calendar.current
        
        let currentYear = currentCalendar.component(.year, from: currentDateObj)
        print(currentYear)
        let currentMonth = currentCalendar.component(.month, from: currentDateObj)
        print(currentMonth)
        let currentDate = currentCalendar.component(.day, from: currentDateObj)
        print(currentDate)
        
        let yearPicked = sentCalendar.component(.year, from: date)
        print("")
        print(yearPicked)
        let monthPicked = sentCalendar.component(.month, from: date)
        print(monthPicked)
        let datePicked = sentCalendar.component(.day, from: date)
        print(datePicked)
        
        if(yearPicked >= currentYear){
            if(monthPicked == currentMonth){
                if(datePicked < currentDate){
                    return false
                }else{
                    return true
                }
            }else if(monthPicked < currentMonth){ //bulan telah lewat
                return false
            }else if(monthPicked > currentMonth){ //bulan depannya
                return true
            }
        }
        return false
    }
    
    //CHECK IF THE CURRENT HOUR PASS THE REGISTRATION DEADLINE
    class func checkRegistartionDeadline(regDeadline: String) -> Bool{
        // IF TRUE, THEN DEADLINE HAS NOT BEEN PASSED and USER CAN REGISTER
        let date = Date()
        let currentCalendar = Calendar.current
        
        let hourDeadline = Int(regDeadline.substring(with: 0..<2))!
        let minuteDeadline = Int(regDeadline.substring(with: 3..<5))!
        
        let currentHour = currentCalendar.component(.hour, from: date)
        let currentMinute = currentCalendar.component(.minute, from: date)
        
        print("currentHour :\(currentHour)")
        print("hourDeadline :\(hourDeadline)")
        if(currentHour <= hourDeadline){
            if(currentHour == hourDeadline){
                if(currentMinute < minuteDeadline){
                    return true
                }else{
                    return false
                }
            }
            return true
        }
        return false
    }
    
    class func myDateFormatter(datePickerRegistration : Date)-> String{
        let dateFromDatePicker = datePickerRegistration
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormater.string(from: dateFromDatePicker)
        
        return formattedDate
    }
    
    //CONVERTING COLOR HEXCODE INTO AN RGB BASED COLOR
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

// STRING EXTENSION TO PARSE THE CHARACTERS INSIDE IT
extension String {
    
    func subStringIndexing(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    func subStringFrom(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
}
