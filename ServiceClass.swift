//
//  ServiceClass.swift
//  POSHMERA
//
//  Created by Mac on 26/05/22.
//

import Foundation
import UIKit

func getServicesCallEC(_ urlString : String, compilationHandler: @escaping(Data) -> Void) {
    if  !(Singleton.Connectivity.isConnectedToInternet) {
        Singleton.shared.alertCall(appTitle, internateError, action: ["OK"], (appDelegate.window?.rootViewController)!) {(str) in}
        return
    }
    
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    let authData = ("rzp_test_4YuhNTpl6WS9KB" + ":" ).data(using: .utf8)!.base64EncodedString()
    request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
              let response = response as? HTTPURLResponse,
              error == nil else {
            return
        }
        
        guard (200 ... 299) ~= response.statusCode  else {
            compilationHandler(Data.init())// check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            
            return
        }
        compilationHandler(data)
    }
    task.resume()
}

func postServicesCallEC(_ urlString : String, _ parameter: [String:Any], compilationHandler: @escaping(Data) -> Void) {
    if !(Singleton.Connectivity.isConnectedToInternet) {
        Singleton.shared.alertCall(appTitle, internateError, action: ["OK"], (appDelegate.window?.rootViewController)!) {(str) in}
        return
    }
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "POST"
    request.httpBody = parameter.percentEncoded()
    URLSession.shared.configuration.shouldUseExtendedBackgroundIdleMode = true
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
              let response = response as? HTTPURLResponse,
              error == nil else {
            print("error", error ?? "Unknown error")
            return
        }
        
        guard (200 ... 299) ~= response.statusCode  else {
            compilationHandler(Data.init())// check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            
            return
        }
        compilationHandler(data)
    }
    task.resume()
}

func postServicesCallShipRocket(_ urlString : String, _ perameter: [String:Any], compilationHandler: @escaping(Data) -> Void) {
    if !(Singleton.Connectivity.isConnectedToInternet) {
        Singleton.shared.alertCall(appTitle, internateError, action: ["OK"], (appDelegate.window?.rootViewController)!) {(str) in}
        return
    }
    
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.setValue("Content-Type", forHTTPHeaderField:"application/json" )
    request.httpMethod = "POST"
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
              let response = response as? HTTPURLResponse,
              error == nil else {
            print("error", error ?? "Unknown error")
            return
        }
        
        guard (200 ... 299) ~= response.statusCode  else {
            compilationHandler(Data.init())// check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            return
        }
        
        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(responseString ?? "")")
        compilationHandler(data)
    }
    task.resume()
}

func postServicesCallShipRocketAuthentication(_ urlString : String, _ perameter: [String:Any], compilationHandler: @escaping(Data) -> Void) {
    if !(Singleton.Connectivity.isConnectedToInternet) {
        Singleton.shared.alertCall(appTitle, internateError, action: ["OK"], (appDelegate.window?.rootViewController)!) {(str) in}
        return
    }
    
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
              let response = response as? HTTPURLResponse,
              error == nil else {
            print("error", error ?? "Unknown error")
            return
        }
        
        guard (200 ... 299) ~= response.statusCode  else {
            compilationHandler(Data.init())// check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            return
        }
        
        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(responseString ?? "")")
        compilationHandler(data)
    }
    task.resume()
}

extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

//func callDeleteWorkOut() {
//    let userID = Singleton.userDefaults.defaults.value(forKey: Singleton.userDefaults.userIDDefaults)
//    let param : [String:Any] =   [userid : userID ?? "0",
//                             trscdateKey : Singleton.shared.getCurrentDate(),
//                            workoutidKey : self.selectedWorkID,
//                                DeviceId : Singleton.shared.deviceID,
//                              DeviceType : Singleton.DeviceType,
//                              AppVersion : Singleton.appVersion]
//    
//    postServicesCallEC(Delete_Workout_Tracker, param) { data in
//        //print(String(decoding: data, as:  UTF8.self))
//        do {
//            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
//                if let jsonResult = json["U_WorkoutCounter"] as? NSArray {
//                    createWorkoutCounterData(jsonResult)
//                    
//                    DispatchQueue.main.async {
//                        self.workoutData = retrieveWorkoutData()
//                        self.tblCal.reloadData()
//                    }
//                }
//            } else {
//                Singleton.shared.alertCall(appTitle, invalidpaUser, action: ["OK"],(appDelegate.window?.rootViewController)!) { (str) in }
//            }
//        }
//        catch (let error) {
//            print(error.localizedDescription)
//        }
//    }
//}



