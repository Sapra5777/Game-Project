//
//  Singleton.swift
//  POSHMERA
//
//  Created by Mac on 26/05/22.
//

import Foundation
import UIKit
import CoreData

final class Singleton {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    static let shared = Singleton()
    static let selectedClass = selecteddataBegin()
    static let validationClass =  validation()
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    static let DeviceType = "I"
    var systemVal = ""
    
    // MARK: Local Variable
    var emptyStringArray = [String]()
    var userID =  Singleton.userDefaults.defaults.value(forKey: Singleton.userDefaults.userIDDefaults)
    var deviceID = ""
    var activityIndicator : UIView = UIView()
    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet:Bool {
            return self.sharedInstance.isReachable
        }
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UrbanfitStudio")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    struct userDefaults {
        static let defaults = UserDefaults.standard
        static let userIDDefaults = "UserID"
        static let waterGoalKey = "waterGoal"
        static let sleepGoalKey = "sleepGoal"
        static let goalCalKey    = "goalCal"
    }
    
    //MARK: Alert
    func alertCall(_ title: String, _ alertMessage: String, action: [String], _ vc: UIViewController, compilationHandler: @escaping(String)-> Void) {
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        
        for name in action {
            alert.addAction(UIAlertAction(title: name, style: .default, handler: { action in
                compilationHandler(action.title!)
            }))
        }
        vc.present(alert, animated: true)
    }
    
    class selecteddataBegin {
        var planType = ""  // Which plan type
        var percentage = 0.0
        var gender = "M"//Male
        var Goal = ""//Lose weight
        var selectedHeight = ""//5.5
        var selectedHeightUnit = ""//FT
        var selectedWeight = ""//72
        var selectedWeightUnit = ""//LB
        var selectedGoalWeight = ""//52
        var selectedGoalWeightUnit = ""//LB
        var selectedTrainigLevel = ""//"Beginner"
        var selectedActivityOne = ""//"Stretch"
        var selectedActivityTwo = ""//"Cardio"
        var selectedActivityThree = ""//"Yoga"
        var selectedActivityFour = ""//"Power Training"
        var selectedActivityFive = ""//"Dancing"
    }
    
    class validation {
        var phoneNumber = ""
        var otp = ""
        var name = ""
        var emailID = ""
        var password = ""
        var bmiKey = "0"
        var caloriesKey  = "0"
        var socialmedialoginKey  =  "N"
        var googleidKey =  "0"
        var facebookidKey  =  "0"
    }
    
    //MARK: text field validation
    func textValidation(_ txt: UITextField) -> Bool {
        if (txt.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            return true
        } else {
            return false
        }
    }
    
    //MARK: text view validation
    func textviewValidation(_ txt: UITextView) -> Bool {
        if (txt.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            return true
        } else {
            return false
        }
    }
    
    //MARK: email id validation
    func textEmailValidation(_ txt: UITextField) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: txt.text)
    }
    
    func validPhoneNum(_ txt: UITextField) -> Bool {
        if  (txt.text != nil) && txt.text?.count == 10 {
            return true
        } else {
            return false
        }
    }
    
    func actualInput(for textField: UITextField, defaultText: String) -> String {
        let text = textField.text ?? ""
        if text == defaultText {
            return ""
        } else {
            return text.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func convertDateFormaterFromMMM_ddTO_YYYY_MM_dd(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let _date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if (_date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: _date!);
        }
    }
    
    func convert24to12AMPM(_ time: String) -> String {
        let dateAsString = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "h:mm a"
        
        if (date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: date!)
        }
    }
    
    func convert12to24AMPM(_ time: String) -> (String, String) {
        let dateAsString = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "HH:m"
        
        if (date == nil) {
            return ("0", "0")
        } else {
            let date = dateFormatter.string(from: date!)
            let hourAndMin = date.components(separatedBy: ":")
            return (hourAndMin[0], hourAndMin[1])
        }
    }
    
    func convertDateFormater_orderInDDMMYYYY(_ date: String) -> String {
        let dateFormatter = DateFormatter()//E, d MMM yyyy HH:mm:ss Z
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let _date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if (_date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: _date!)
        }
    }
    
    func convertDateFormater_inDDMMMYYYYFromHHMMSSZ(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let _date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "d MMM yyyy"
        if (_date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: _date!)
        }
    }
    
    func convertDateFormatertoddmmyyyy(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let _date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if (_date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: _date!)
        }
    }
    
    func convertDateFormaterintoddMMMyyyy(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let _date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        if (_date == nil) {
            return ""
        } else {
            return dateFormatter.string(from: _date!)
        }
    }
    
    func convertNextDatetheerDays(_ dateString : String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let myDate = dateFormatter.date(from: dateString)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: 3, to: myDate)
        
        if (tomorrow == nil) {
            return ""
        } else {
            return dateFormatter.string(from: tomorrow!)
        }
    }
    
    func convertDateFormaterFromdd_MM_YYYYTO_YYYY_MM_dd(_ date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        let _date = inputFormatter.date(from: date)
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if (_date == nil) {
            return ""
            
        } else {
            return inputFormatter.string(from: _date!);
            
        }
    }
    
    func convertDateinMMMDD() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        
        return formatter.string(from: date)
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.string(from: date)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
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
    
    func feetToInches(feet: Int) -> Int {
        let inch = feet / 12
        let cm = (feet) % 12
        return (inch + cm)
    }
    
    func bMICalculator(weight:String,height:String)-> String{
        let weight = Float(weight)
        
        if ((weight != nil) && (height.count > 0)){
            let heightinmeter = (Float(height) ?? 0.0) * (0.0254)
            let totalMeter = (Float(heightinmeter) * Float(heightinmeter))
            let result = ((weight ?? 0.0) / totalMeter)
            var BMIStatus = ""
            let bmi =  (Float(String(format: "%.1f", (result * 100)).dropLast(2))!/100)
            if bmi < 18.5{
                BMIStatus = "\(bmi)"//"\(bmi) (UNDERWEIGHT)"
            }else if ((bmi > 18.5) && (bmi <= 24.9)){
                BMIStatus = "\(bmi)"//"\(bmi) (NORMAL)"
            }else if ((bmi > 24.9) && (bmi <= 30.0)){
                BMIStatus = "\(bmi)"//"\(bmi) (OVERWEIGHT)"
            }else{
                BMIStatus = "\(bmi)"//"\(bmi) (OBESE)"
            }
            return BMIStatus
        }
        return "0"
    }
    
    func timeValidation(_ _startTime:String,_ _endTime:String,_ datecrt:String) -> (Int,Int){
        let formatter = DateFormatter()
        formatter.timeStyle = DateFormatter.Style.short
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        // let date1 = formatter.date(from: _startTime)!
        let end_date  = "\(datecrt) \(_endTime)"
        
        if let date1 = formatter.date(from: _startTime){
            if let date2 = formatter.date(from: end_date){
                let elapsedTime = date2.timeIntervalSince(date1)
                let hours = floor(elapsedTime / 60 / 60)
                let minutes = floor((elapsedTime - (hours * 60 * 60)) / 60)
                let H = Int(hours)
                let M = Int(minutes)
                if (Int(hours) >= 0) {
                    
                    return (H,M)
                }else{
                    let _endDate  = convertNextDate(datecrt)
                    return timeValidation(_startTime, _endTime, _endDate)
                }
            }
        }
        return (0,0)
    }
    
    func convertNextDate(_ dateString : String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let myDate = dateFormatter.date(from: dateString)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: myDate)
        let somedateString = dateFormatter.string(from: tomorrow!)
        return somedateString
    }
    
    func addOneHourToTime(_ dateString : String, count: Int)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let myDate = dateFormatter.date(from: dateString)!
        let time = Calendar.current.date(byAdding: .hour, value: count, to: myDate)
        dateFormatter.dateFormat = "h:mm a"
        let someTimeString = dateFormatter.string(from: time!)
        return someTimeString
    }
    
    func ForwardDate(_ dateString : String, count: Int)-> (String, String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let myDate = dateFormatter.date(from: dateString)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: count, to: myDate)
        let somedateString = dateFormatter.string(from: tomorrow!)
        
        var selectedDate = ""
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let myDate2 = dateFormatter.date(from: getCurrentDate())!
        let tomorrow2 = Calendar.current.date(byAdding: .day, value: count, to: myDate2)
        let somedateString2 = dateFormatter.string(from: tomorrow2!)
        
        let _date = dateFormatter.date(from: somedateString2)
        if (_date == nil) {
            selectedDate = getCurrentDate()
        } else {
            selectedDate = dateFormatter.string(from: _date!);
        }
        return (somedateString,selectedDate)
    }
    
    func calculateDifferenceBetweenDate(plandate:String) ->Int {
        var dayRemainings = 0
        if plandate.count > 0{
            let dateFormatter = DateFormatter()
            let date = Date()
            let calendar = Calendar.current
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let result = dateFormatter.string(from: date)
            let date1 = dateFormatter.date(from: String(plandate))!
            let date2 = dateFormatter.date(from: result)!
            let components = calendar.dateComponents([.day], from: date2, to: date1)
            dayRemainings =  components.day ?? 0
        }
        return dayRemainings
    }
    
    func setNotification(_ message:String, _ title:String, _ weekDay:Int, _ hour:Int, _ minute:Int, Repeat:Bool, allDay:Bool, _ Identifire:String, _ typeValue:Int) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.categoryIdentifier = Identifire
        content.userInfo = ["value": "Data with local notification"]
        content.sound = .default
        switch typeValue {
        case 1:
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Water.mp3"))
        case 2:
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Water.mp3"))
        case 3:
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Water.mp3"))
        case 4:
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Water.mp3"))
        default:
            break
        }
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        if (allDay) {
            
        } else {
            dateComponents.weekday = weekDay
            dateComponents.weekdayOrdinal = 10
            dateComponents.timeZone = .current
        }
        
        dateComponents.hour = hour
        dateComponents.minute = minute
        // Create the trigger as a repeating event.
        
        let triggerDaily = Calendar.current.dateComponents([.weekday,.hour,.minute,.second,], from: dateComponents.date ?? Date())
        let trigger = UNCalendarNotificationTrigger( dateMatching: triggerDaily, repeats: Repeat)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if (error != nil){
                print(error)
            }
        }
    }
    
    class ImageCache {
        static func getImage(urlString: String) -> UIImage? {
            if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String:String] {
                if let path = dict[urlString] {
                    if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                        let img = UIImage(data: data)
                        return img
                    }
                }
            }
            return nil
        }
    }
}

class CalCount {
    var totalCalorie :Float = 0.0
    public  func calCounter(userGender:String,userAge:Int,Uweight:String,UHeight:String) -> Float {
        let userWeight = Float(Uweight)
        var ht = 0.0
        
        if (UHeight.contains(".")) {
            let stringAraay = UHeight.components(separatedBy: ".")
            let feet = stringAraay[0]
            let cm = stringAraay[1]
            
            ht = ((Double(feet) ?? 0) * 12) + (Double(cm) ?? 0)
        }
        
        let totalCm =  Float(ht)  * 2.54
        
        if (userGender == "M")  {
            let userW = 13.75 * (userWeight ?? 0.0)
            let userH = 5 * (totalCm)
            let userA = 6.75 * Float(userAge)
            totalCalorie = (66.47 + (userW) + (userH) - (userA))
            return totalCalorie
        } else {
            let userW = 9.56 * (userWeight ?? 0.0)
            let userH = 1.85 * (totalCm)
            let userA = 4.67 *  Float(userAge)
            totalCalorie =  (665.1 +  (userW) +  (userH) - (userA))
            return totalCalorie
        }
    }
    
    func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
}
