//
//  DatabaseManager.swift
//  UrbanfitStudio
//
//  Created by Mac on 31/10/22.
//

import Foundation
import CoreData

//MARK: - Get Query
typealias CompletionHandler = (_ success:Bool) -> Void

func stringFromAny(_ value:Any?) -> String {
    if let nonNil = value, !(nonNil is NSNull) {
        return String(describing: nonNil)
    }
    return ""
}

func createUserData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("UrbanUser")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "UrbanUser", in: managedContext)!
        
        for userDict in userArray {
            if let fulldata = userDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                Singleton.userDefaults.defaults.setValue(stringFromAny(fulldata["id"]), forKey: Singleton.userDefaults.userIDDefaults)
                user.setValue(stringFromAny(fulldata["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(fulldata["name"]), forKeyPath: "name")
                user.setValue(stringFromAny(fulldata["email"]), forKeyPath: "email")
                user.setValue(stringFromAny(fulldata["mobile"]), forKeyPath: "mobile")
                user.setValue(stringFromAny(fulldata["password"]), forKeyPath: "password")
                user.setValue(stringFromAny(fulldata["profilepic"]), forKeyPath: "profilepic")
                user.setValue(stringFromAny(fulldata["dob"]), forKeyPath: "dob")
                user.setValue(stringFromAny(fulldata["height"]), forKeyPath: "height")
                user.setValue(stringFromAny(fulldata["weight"]), forKeyPath: "weight")
                user.setValue(stringFromAny(fulldata["gender"]), forKeyPath: "gender")
                user.setValue(stringFromAny(fulldata["goal"]), forKeyPath: "goal")
                user.setValue(stringFromAny(fulldata["targetweight"]), forKeyPath: "targetweight")
                user.setValue(stringFromAny(fulldata["traininglevel"]), forKeyPath: "traininglevel")
                user.setValue(stringFromAny(fulldata["activitylevel1"]), forKeyPath: "activitylevel1")
                user.setValue(stringFromAny(fulldata["activitylevel2"]), forKeyPath: "activitylevel2")
                user.setValue(stringFromAny(fulldata["activitylevel3"]), forKeyPath: "activitylevel3")
                user.setValue(stringFromAny(fulldata["activitylevel4"]), forKeyPath: "activitylevel4")
                user.setValue(stringFromAny(fulldata["activitylevel5"]), forKeyPath: "activitylevel5")
                user.setValue(stringFromAny(fulldata["bmi"]), forKeyPath: "bmi")
                user.setValue(stringFromAny(fulldata["devicetype"]), forKeyPath: "devicetype")
                user.setValue(stringFromAny(fulldata["deviceid"]), forKeyPath: "deviceid")
                user.setValue(stringFromAny(fulldata["socialmedialogin"]), forKeyPath: "socialmedialogin")
                user.setValue(stringFromAny(fulldata["googleid"]), forKeyPath: "googleid")
                user.setValue(stringFromAny(fulldata["facebookid"]), forKeyPath: "facebookid")
                user.setValue(stringFromAny(fulldata["allownotification"]), forKeyPath: "allownotification")
                user.setValue(stringFromAny(fulldata["calories"]), forKeyPath: "calories")
                user.setValue(stringFromAny(fulldata["walletamount"]), forKeyPath: "walletamount")
                user.setValue(stringFromAny(fulldata["appversion"]), forKeyPath: "appversion")
                user.setValue(stringFromAny(fulldata["usertype"]), forKeyPath: "usertype")
                user.setValue(stringFromAny(fulldata["status"]), forKeyPath: "status")
                user.setValue(stringFromAny(fulldata["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(fulldata["entrytime"]), forKeyPath: "entrytime")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            // print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
}

func createDIProfileData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("DIProfile")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "DIProfile", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["Fullname"]), forKeyPath: "fullname")
                user.setValue(stringFromAny(userDict["Email"]), forKeyPath: "email")
                user.setValue(stringFromAny(userDict["Mobileno"]), forKeyPath: "mobileno")
                user.setValue(stringFromAny(userDict["Password"]), forKeyPath: "password")
                user.setValue(stringFromAny(userDict["Fk_RoleID"]), forKeyPath: "fk_RoleID")
                user.setValue(stringFromAny(userDict["IsActive"]), forKeyPath: "isActive")
                user.setValue(stringFromAny(userDict["ProfileImage"]), forKeyPath: "profileImage")
                user.setValue(stringFromAny(userDict["DOB"]), forKeyPath: "dOB")
                user.setValue(stringFromAny(userDict["Experience"]), forKeyPath: "experience")
                user.setValue(stringFromAny(userDict["Education"]), forKeyPath: "education")
                user.setValue(stringFromAny(userDict["Description"]), forKeyPath: "deescription")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createTIProfileData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("TIProfile")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "TIProfile", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["Fullname"]), forKeyPath: "fullname")
                user.setValue(stringFromAny(userDict["Email"]), forKeyPath: "email")
                user.setValue(stringFromAny(userDict["Mobileno"]), forKeyPath: "mobileno")
                user.setValue(stringFromAny(userDict["Password"]), forKeyPath: "password")
                user.setValue(stringFromAny(userDict["Fk_RoleID"]), forKeyPath: "fk_RoleID")
                user.setValue(stringFromAny(userDict["IsActive"]), forKeyPath: "isActive")
                user.setValue(stringFromAny(userDict["ProfileImage"]), forKeyPath: "profileImage")
                user.setValue(stringFromAny(userDict["DOB"]), forKeyPath: "dOB")
                user.setValue(stringFromAny(userDict["Experience"]), forKeyPath: "experience")
                user.setValue(stringFromAny(userDict["Education"]), forKeyPath: "education")
                user.setValue(stringFromAny(userDict["Description"]), forKeyPath: "deescription")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createPlanMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("PlanMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "PlanMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["planname"]), forKeyPath: "planname")
                user.setValue(stringFromAny(userDict["amount"]), forKeyPath: "amount")
                user.setValue(stringFromAny(userDict["descountamount"]), forKeyPath: "descountamount")
                user.setValue(stringFromAny(userDict["savepercentage"]), forKeyPath: "savepercentage")
                user.setValue(stringFromAny(userDict["permonthamount"]), forKeyPath: "permonthamount")
                user.setValue(stringFromAny(userDict["planvalidity"]), forKeyPath: "planvalidity")
                user.setValue(stringFromAny(userDict["planstatus"]), forKeyPath: "planstatus")
                user.setValue(stringFromAny(userDict["createddate"]), forKeyPath: "createddate")
                user.setValue(stringFromAny(userDict["stamuser"]), forKeyPath: "stamuser")
                user.setValue(stringFromAny(userDict["stamuserid"]), forKeyPath: "stamuserid")
                user.setValue(stringFromAny(userDict["savepercentageamount"]), forKeyPath: "savepercentageamount")
                user.setValue(stringFromAny(userDict["plantype"]), forKeyPath: "plantype")
                user.setValue(stringFromAny(userDict["plandesc"]), forKeyPath: "plandesc")
                user.setValue(stringFromAny(userDict["orderid"]), forKeyPath: "orderid")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createPaymentTransactionData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("PaymentTransaction")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "PaymentTransaction", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["PK_TransactionId"]), forKeyPath: "pK_TransactionId")
                user.setValue(stringFromAny(userDict["FK_UrbanUserId"]), forKeyPath: "fK_UrbanUserId")
                user.setValue(stringFromAny(userDict["Amount"]), forKeyPath: "amount")
                user.setValue(stringFromAny(userDict["FK_PurchasePlanId"]), forKeyPath: "fK_PurchasePlanId")
                user.setValue(stringFromAny(userDict["plantype"]), forKeyPath: "plantype")
                user.setValue(stringFromAny(userDict["planmember"]), forKeyPath: "planmember")
                user.setValue(stringFromAny(userDict["Payment_Id"]), forKeyPath: "payment_Id")
                user.setValue(stringFromAny(userDict["Payment_Type"]), forKeyPath: "payment_Type")
                user.setValue(stringFromAny(userDict["Status"]), forKeyPath: "status")
                user.setValue(stringFromAny(userDict["IsPaid"]), forKeyPath: "isPaid")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
                user.setValue(stringFromAny(userDict["ModifiedBy"]), forKeyPath: "modifiedBy")
                user.setValue(stringFromAny(userDict["ModificationDate"]), forKeyPath: "modificationDate")
                user.setValue(stringFromAny(userDict["CreatedDate"]), forKeyPath: "createdDate")
                user.setValue(stringFromAny(userDict["walletamount"]), forKeyPath: "walletamount")
                user.setValue(stringFromAny(userDict["couponcode"]), forKeyPath: "couponcode")
                user.setValue(stringFromAny(userDict["couponamount"]), forKeyPath: "couponamount")
                user.setValue(stringFromAny(userDict["orderfrom"]), forKeyPath: "orderfrom")
                user.setValue(stringFromAny(userDict["planstatus"]), forKeyPath: "planstatus")
                user.setValue(stringFromAny(userDict["mrp"]), forKeyPath: "mrp")
                user.setValue(stringFromAny(userDict["paidamount"]), forKeyPath: "paidamount")
                user.setValue(stringFromAny(userDict["cashpay"]), forKeyPath: "cashpay")
                user.setValue(stringFromAny(userDict["paytmpay"]), forKeyPath: "paytmpay")
                user.setValue(stringFromAny(userDict["razorpay"]), forKeyPath: "razorpay")
                user.setValue(stringFromAny(userDict["creditpay"]), forKeyPath: "creditpay")
                user.setValue(stringFromAny(userDict["otherpay"]), forKeyPath: "otherpay")
                user.setValue(stringFromAny(userDict["otherpaymodetype"]), forKeyPath: "otherpaymodetype")
                let remaingday = Singleton.shared.calculateDifferenceBetweenDate(plandate: stringFromAny(userDict["CreatedDate"]))
                user.setValue("\(remaingday)", forKeyPath: "remainigsDays")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

//MARK: - Validate_App.php
func createWaterCounterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WaterCounter", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["waterglass"]), forKeyPath: "waterglass")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWorkoutCounterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WorkoutCounter")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WorkoutCounter", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["workoutid"]), forKeyPath: "workoutid")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["setval"]), forKeyPath: "setval")
                user.setValue(stringFromAny(userDict["reps"]), forKeyPath: "reps")
                user.setValue(stringFromAny(userDict["timeval"]), forKeyPath: "timeval")
                user.setValue(stringFromAny(userDict["timeunit"]), forKeyPath: "timeunit")
                user.setValue(stringFromAny(userDict["schedulecode"]), forKeyPath: "schedulecode")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCaloriesCounterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("CaloriesCounter")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CaloriesCounter", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["schedulecode"]), forKeyPath: "schedulecode")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["itemcode"]), forKeyPath: "itemcode")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["unit"]), forKeyPath: "unit")
                user.setValue(stringFromAny(userDict["category"]), forKeyPath: "category")
                user.setValue(stringFromAny(userDict["calories"]), forKeyPath: "calories")
                user.setValue(stringFromAny(userDict["itemval"]), forKeyPath: "itemval")
                user.setValue(stringFromAny(userDict["itemname"]), forKeyPath: "itemname")
                user.setValue(stringFromAny(userDict["itemunit"]), forKeyPath: "itemunit")
                user.setValue(stringFromAny(userDict["protein"]), forKeyPath: "protein")
                user.setValue(stringFromAny(userDict["carbs"]), forKeyPath: "carbs")
                user.setValue(stringFromAny(userDict["fats"]), forKeyPath: "fats")
                user.setValue(stringFromAny(userDict["fiber"]), forKeyPath: "fiber")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createSleepCounterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "SleepCounter", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["sleeptime"]), forKeyPath: "sleeptime")
                user.setValue(stringFromAny(userDict["wakeuptime"]), forKeyPath: "wakeuptime")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}




func createDietPlanMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("DietPlanMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "DietPlanMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["PK_PersonID"]), forKeyPath: "pK_PersonID")
                user.setValue(stringFromAny(userDict["schedulecode"]), forKeyPath: "schedulecode")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["itemcode"]), forKeyPath: "itemcode")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["unit"]), forKeyPath: "unit")
                user.setValue(stringFromAny(userDict["category"]), forKeyPath: "category")
                user.setValue(stringFromAny(userDict["calories"]), forKeyPath: "calories")
                user.setValue(stringFromAny(userDict["itemval"]), forKeyPath: "itemval")
                user.setValue(stringFromAny(userDict["itemname"]), forKeyPath: "itemname")
                user.setValue(stringFromAny(userDict["itemunit"]), forKeyPath: "itemunit")
                user.setValue(stringFromAny(userDict["protein"]), forKeyPath: "protein")
                user.setValue(stringFromAny(userDict["carbs"]), forKeyPath: "carbs")
                user.setValue(stringFromAny(userDict["fats"]), forKeyPath: "fats")
                user.setValue(stringFromAny(userDict["settimeval"]), forKeyPath: "settimeval")
                user.setValue(stringFromAny(userDict["fiber"]), forKeyPath: "fiber")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["entrytime"]), forKeyPath: "entrytime")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWorkoutPlanMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WorkoutPlanMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WorkoutPlanMaster", in: managedContext)!
        
        for userDict in userArray {
            if let fulldata = userDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(fulldata["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(fulldata["schedulecode"]), forKeyPath: "schedulecode")
                user.setValue(stringFromAny(fulldata["PK_PersonID"]), forKeyPath: "pK_PersonID")
                user.setValue(stringFromAny(fulldata["workoutid"]), forKeyPath: "workoutid")
                user.setValue(stringFromAny(fulldata["woroutname"]), forKeyPath: "woroutname")
                user.setValue(stringFromAny(fulldata["maincatid"]), forKeyPath: "maincatid")
                user.setValue(stringFromAny(fulldata["extype"]), forKeyPath: "extype")
                user.setValue(stringFromAny(fulldata["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(fulldata["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(fulldata["setval"]), forKeyPath: "setval")
                user.setValue(stringFromAny(fulldata["reps"]), forKeyPath: "reps")
                user.setValue(stringFromAny(fulldata["itemval"]), forKeyPath: "itemval")
                user.setValue(stringFromAny(fulldata["timeunit"]), forKeyPath: "timeunit")
                user.setValue(stringFromAny(fulldata["settimeval"]), forKeyPath: "settimeval")
                user.setValue(stringFromAny(fulldata["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(fulldata["entrytime"]), forKeyPath: "entrytime")
            }
        }
        
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createDieticianMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("DieticianMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "DieticianMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["Fullname"]), forKeyPath: "fullname")
                user.setValue(stringFromAny(userDict["Email"]), forKeyPath: "email")
                user.setValue(stringFromAny(userDict["Mobileno"]), forKeyPath: "mobileno")
                user.setValue(stringFromAny(userDict["Password"]), forKeyPath: "password")
                user.setValue(stringFromAny(userDict["Fk_RoleID"]), forKeyPath: "fk_RoleID")
                user.setValue(stringFromAny(userDict["IsActive"]), forKeyPath: "isActive")
                user.setValue(stringFromAny(userDict["ProfileImage"]), forKeyPath: "profileImage")
                user.setValue(stringFromAny(userDict["DOB"]), forKeyPath: "dOB")
                user.setValue(stringFromAny(userDict["Experience"]), forKeyPath: "experience")
                user.setValue(stringFromAny(userDict["Education"]), forKeyPath: "education")
                user.setValue(stringFromAny(userDict["Description"]), forKeyPath: "deescription")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createFitnessTrainerData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("TrainnerMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "TrainnerMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["Fullname"]), forKeyPath: "fullname")
                user.setValue(stringFromAny(userDict["Email"]), forKeyPath: "email")
                user.setValue(stringFromAny(userDict["Mobileno"]), forKeyPath: "mobileno")
                user.setValue(stringFromAny(userDict["Password"]), forKeyPath: "password")
                user.setValue(stringFromAny(userDict["Fk_RoleID"]), forKeyPath: "fk_RoleID")
                user.setValue(stringFromAny(userDict["IsActive"]), forKeyPath: "isActive")
                user.setValue(stringFromAny(userDict["ProfileImage"]), forKeyPath: "profileImage")
                user.setValue(stringFromAny(userDict["DOB"]), forKeyPath: "dOB")
                user.setValue(stringFromAny(userDict["Experience"]), forKeyPath: "experience")
                user.setValue(stringFromAny(userDict["Education"]), forKeyPath: "education")
                user.setValue(stringFromAny(userDict["Description"]), forKeyPath: "deescription")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createExercisesMainMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("ExercisesMainMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "ExercisesMainMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["name"]), forKeyPath: "name")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createItemMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("ItemMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "ItemMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["calcium"]), forKeyPath: "calcium")
                user.setValue(stringFromAny(userDict["calories"]), forKeyPath: "calories")
                user.setValue(stringFromAny(userDict["carbs"]), forKeyPath: "carbs")
                user.setValue(stringFromAny(userDict["category"]), forKeyPath: "category")
                user.setValue(stringFromAny(userDict["fats"]), forKeyPath: "fats")
                user.setValue(stringFromAny(userDict["fiber"]), forKeyPath: "fiber")
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["iron"]), forKeyPath: "iron")
                user.setValue(stringFromAny(userDict["itemcode"]), forKeyPath: "itemcode")
                user.setValue(stringFromAny(userDict["itemname"]), forKeyPath: "itemname")
                user.setValue(stringFromAny(userDict["itemunit"]), forKeyPath: "itemunit")
                user.setValue(stringFromAny(userDict["itemurl"]), forKeyPath: "itemurl")
                user.setValue(stringFromAny(userDict["itemval"]), forKeyPath: "itemval")
                user.setValue(stringFromAny(userDict["phosphorous"]), forKeyPath: "phosphorous")
                user.setValue(stringFromAny(userDict["protein"]), forKeyPath: "protein")
                user.setValue(stringFromAny(userDict["unit"]), forKeyPath: "unit")
                user.setValue(stringFromAny(userDict["vitaminA"]), forKeyPath: "vitaminA")
                user.setValue(stringFromAny(userDict["vitaminB1"]), forKeyPath: "vitaminB1")
                user.setValue(stringFromAny(userDict["vitaminB2"]), forKeyPath: "vitaminB2")
                user.setValue(stringFromAny(userDict["vitaminB3"]), forKeyPath: "vitaminB3")
                user.setValue(stringFromAny(userDict["vitaminB5"]), forKeyPath: "vitaminB5")
                user.setValue(stringFromAny(userDict["vitaminB6"]), forKeyPath: "vitaminB6")
                user.setValue(stringFromAny(userDict["vitaminB7"]), forKeyPath: "vitaminB7")
                user.setValue(stringFromAny(userDict["vitaminB9"]), forKeyPath: "vitaminB9")
                user.setValue(stringFromAny(userDict["vitaminB12"]), forKeyPath: "vitaminB12")
                user.setValue(stringFromAny(userDict["vitaminC"]), forKeyPath: "vitaminC")
                user.setValue(stringFromAny(userDict["vitaminD"]), forKeyPath: "vitaminD")
                user.setValue(stringFromAny(userDict["vitaminE"]), forKeyPath: "vitaminE")
                user.setValue(stringFromAny(userDict["vitaminK"]), forKeyPath: "vitaminK")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
func createExercisesMasterData(_ userArray:NSArray) {
    deleteAllRecords("ExercisesMaster")
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let userEntity = NSEntityDescription.entity(forEntityName: "ExercisesMaster", in: managedContext)!
    
    for Dict in userArray {
        if let eachDataItem = Dict as? [String : Any] {
            let userDict  = eachDataItem
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(stringFromAny(userDict["benefit1"]), forKeyPath: "benefit1")
            user.setValue(stringFromAny(userDict["benefit2"]), forKeyPath: "benefit2")
            user.setValue(stringFromAny(userDict["benefit3"]), forKeyPath: "benefit3")
            user.setValue(stringFromAny(userDict["benefit4"]), forKeyPath: "benefit4")
            user.setValue(stringFromAny(userDict["descr"]), forKeyPath: "descr")
            user.setValue(stringFromAny(userDict["difficulty"]), forKeyPath: "difficulty")
            user.setValue(stringFromAny(userDict["duration"]), forKeyPath: "duration")
            user.setValue(stringFromAny(userDict["excode"]), forKeyPath: "excode")
            user.setValue(stringFromAny(userDict["extype"]), forKeyPath: "extype")
            user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
            user.setValue(stringFromAny(userDict["name"]), forKeyPath: "name")
            user.setValue(stringFromAny(userDict["maincatid"]), forKeyPath: "maincatid")
            user.setValue(stringFromAny(userDict["targetmuscles"]), forKeyPath: "targetmuscles")
            user.setValue(stringFromAny(userDict["targetmuscles2"]), forKeyPath: "targetmuscles2")
            user.setValue(stringFromAny(userDict["targetmuscles3"]), forKeyPath: "targetmuscles3")
            user.setValue(stringFromAny(userDict["targetmuscles4"]), forKeyPath: "targetmuscles4")
            user.setValue(stringFromAny(userDict["targetmuscles5"]), forKeyPath: "targetmuscles5")
            user.setValue(stringFromAny(userDict["targetmuscles6"]), forKeyPath: "targetmuscles6")
            user.setValue(stringFromAny(userDict["targetmuscles7"]), forKeyPath: "targetmuscles7")
            user.setValue(stringFromAny(userDict["targetmuscles8"]), forKeyPath: "targetmuscles8")
            user.setValue(stringFromAny(userDict["targetmuscles9"]), forKeyPath: "targetmuscles9")
            user.setValue(stringFromAny(userDict["targetmuscles10"]), forKeyPath: "targetmuscles10")
            user.setValue(stringFromAny(userDict["videourl"]), forKeyPath: "videourl")
        }
    }
    
    do {
        try managedContext.save()
        print("Saved SUccesfully")
        
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
    
}

func createPlanDescrMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("PlanDescrMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "PlanDescrMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["planid"]), forKeyPath: "planid")
                user.setValue(stringFromAny(userDict["title"]), forKeyPath: "title")
                user.setValue(stringFromAny(userDict["descr"]), forKeyPath: "descr")
                user.setValue(stringFromAny(userDict["descr_url"]), forKeyPath: "descr_url")
                user.setValue(stringFromAny(userDict["descr_status"]), forKeyPath: "descr_status")
                user.setValue(stringFromAny(userDict["createddate"]), forKeyPath: "createddate")
                user.setValue(stringFromAny(userDict["stamuser"]), forKeyPath: "stamuser")
                user.setValue(stringFromAny(userDict["stamuserid"]), forKeyPath: "stamuserid")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createPlanCouponMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "PlanCouponMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["planid"]), forKeyPath: "planid")
                user.setValue(stringFromAny(userDict["couponcode"]), forKeyPath: "couponcode")
                user.setValue(stringFromAny(userDict["descountpercentage"]), forKeyPath: "descountpercentage")
                user.setValue(stringFromAny(userDict["coupon_status"]), forKeyPath: "coupon_status")
                user.setValue(stringFromAny(userDict["createddate"]), forKeyPath: "createddate")
                user.setValue(stringFromAny(userDict["stamuser"]), forKeyPath: "stamuser")
                user.setValue(stringFromAny(userDict["stamuserid"]), forKeyPath: "stamuserid")
                user.setValue(stringFromAny(userDict["CouponVisible"]), forKeyPath: "couponVisible")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCallSlotMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CallSlotMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["PK_PersonID"]), forKeyPath: "pK_PersonID")
                user.setValue(stringFromAny(userDict["slotid"]), forKeyPath: "slotid")
                user.setValue(stringFromAny(userDict["fromtime"]), forKeyPath: "fromtime")
                user.setValue(stringFromAny(userDict["totime"]), forKeyPath: "totime")
                user.setValue(stringFromAny(userDict["slotstatus"]), forKeyPath: "slotstatus")
                user.setValue(stringFromAny(userDict["typeval"]), forKeyPath: "typeval")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCoachMessageDieticianData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CoachMessageDietician", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["msg"]), forKeyPath: "msg")
                user.setValue(stringFromAny(userDict["dietitiaId"]), forKeyPath: "dietitiaId")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["frommsg"]), forKeyPath: "frommsg")
                user.setValue(stringFromAny(userDict["msgtime"]), forKeyPath: "msgtime")
                user.setValue(stringFromAny(userDict["msgdate"]), forKeyPath: "msgdate")
                user.setValue(stringFromAny(userDict["msgstatus"]), forKeyPath: "msgstatus")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCoachMessageTrainnerData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CoachMessageTrainner", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["msg"]), forKeyPath: "msg")
                user.setValue(stringFromAny(userDict["dietitiaId"]), forKeyPath: "dietitiaId")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["frommsg"]), forKeyPath: "frommsg")
                user.setValue(stringFromAny(userDict["msgtime"]), forKeyPath: "msgtime")
                user.setValue(stringFromAny(userDict["msgdate"]), forKeyPath: "msgdate")
                user.setValue(stringFromAny(userDict["msgstatus"]), forKeyPath: "msgstatus")
            }
        }
        
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCoachBookedTrainnerData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CoachBookedTrainner", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["fromtime"]), forKeyPath: "fromtime")
                user.setValue(stringFromAny(userDict["totime"]), forKeyPath: "totime")
                user.setValue(stringFromAny(userDict["trainerId"]), forKeyPath: "trainerId")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["trsctime"]), forKeyPath: "trsctime")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createCoachBookedDieticianData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CoachBookedDietician", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["fromtime"]), forKeyPath: "fromtime")
                user.setValue(stringFromAny(userDict["totime"]), forKeyPath: "totime")
                user.setValue(stringFromAny(userDict["trainerId"]), forKeyPath: "trainerId")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["trscdate"]), forKeyPath: "trscdate")
                user.setValue(stringFromAny(userDict["trsctime"]), forKeyPath: "trsctime")
            }
        }
        
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createBlogData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("BlogMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "BlogMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["BlogImage"]), forKeyPath: "blogImage")
                user.setValue(stringFromAny(userDict["BlogType"]), forKeyPath: "blogType")
                user.setValue(stringFromAny(userDict["CreatedBy"]), forKeyPath: "createdBy")
                user.setValue(stringFromAny(userDict["CreationDate"]), forKeyPath: "creationDate")
                user.setValue(stringFromAny(userDict["IsActive"]), forKeyPath: "isActive")
                user.setValue(stringFromAny(userDict["Title"]), forKeyPath: "title")
                user.setValue(stringFromAny(userDict["VideoURL"]), forKeyPath: "videoURL")
                user.setValue(stringFromAny(userDict["WebURL"]), forKeyPath: "webURL")
                user.setValue(stringFromAny(userDict["blogfor"]), forKeyPath: "blogfor")
                user.setValue(stringFromAny(userDict["section"]), forKeyPath: "section")
                user.setValue(stringFromAny(userDict["shortdesc"]), forKeyPath: "shortdesc")
                user.setValue(stringFromAny(userDict["slug"]), forKeyPath: "slug")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

// MARK: - Create Remainder tables
func createCallReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("CalReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "CalReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userId"]), forKeyPath: "userId")
                user.setValue(stringFromAny(userDict["mon"]), forKeyPath: "mon")
                user.setValue(stringFromAny(userDict["Tue"]), forKeyPath: "tue")
                user.setValue(stringFromAny(userDict["Wed"]), forKeyPath: "wed")
                user.setValue(stringFromAny(userDict["Thu"]), forKeyPath: "thu")
                user.setValue(stringFromAny(userDict["Fri"]), forKeyPath: "fri")
                user.setValue(stringFromAny(userDict["Sat"]), forKeyPath: "sat")
                user.setValue(stringFromAny(userDict["Sun"]), forKeyPath: "sun")
                user.setValue(stringFromAny(userDict["BKTimeSelected"]), forKeyPath: "bKTimeSelected")
                user.setValue(stringFromAny(userDict["MKTimeSelected"]), forKeyPath: "mKTimeSelected")
                user.setValue(stringFromAny(userDict["LunchTimeSelected"]), forKeyPath: "lunchTimeSelected")
                user.setValue(stringFromAny(userDict["ESTimeSelected"]), forKeyPath: "eSTimeSelected")
                user.setValue(stringFromAny(userDict["DinnerTimeSelected"]), forKeyPath: "dinnerTimeSelected")
                user.setValue(stringFromAny(userDict["stampdate"]), forKeyPath: "stampdate")
                user.setValue(stringFromAny(userDict["sch_code"]), forKeyPath: "sch_code")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWaterReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WaterReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WaterReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userId"]), forKeyPath: "userId")
                user.setValue(stringFromAny(userDict["mon"]), forKeyPath: "mon")
                user.setValue(stringFromAny(userDict["Tue"]), forKeyPath: "tue")
                user.setValue(stringFromAny(userDict["Wed"]), forKeyPath: "wed")
                user.setValue(stringFromAny(userDict["Thu"]), forKeyPath: "thu")
                user.setValue(stringFromAny(userDict["Fri"]), forKeyPath: "fri")
                user.setValue(stringFromAny(userDict["Sat"]), forKeyPath: "sat")
                user.setValue(stringFromAny(userDict["Sun"]), forKeyPath: "sun")
                user.setValue(stringFromAny(userDict["fromTime"]), forKeyPath: "fromTime")
                user.setValue(stringFromAny(userDict["remindme"]), forKeyPath: "remindme")
                user.setValue(stringFromAny(userDict["toTime"]), forKeyPath: "toTime")
                user.setValue(stringFromAny(userDict["stampdate"]), forKeyPath: "stampdate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWorkoutReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WorkoutReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WorkoutReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userId"]), forKeyPath: "userId")
                user.setValue(stringFromAny(userDict["mon"]), forKeyPath: "mon")
                user.setValue(stringFromAny(userDict["Tue"]), forKeyPath: "tue")
                user.setValue(stringFromAny(userDict["Wed"]), forKeyPath: "wed")
                user.setValue(stringFromAny(userDict["Thu"]), forKeyPath: "thu")
                user.setValue(stringFromAny(userDict["Fri"]), forKeyPath: "fri")
                user.setValue(stringFromAny(userDict["Sat"]), forKeyPath: "sat")
                user.setValue(stringFromAny(userDict["Sun"]), forKeyPath: "sun")
                user.setValue(stringFromAny(userDict["fromTime"]), forKeyPath: "fromTime")
                user.setValue(stringFromAny(userDict["remindme"]), forKeyPath: "remindme")
                user.setValue(stringFromAny(userDict["toTime"]), forKeyPath: "toTime")
                user.setValue(stringFromAny(userDict["stampdate"]), forKeyPath: "stampdate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWalkReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WalkReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WalkReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userId"]), forKeyPath: "userId")
                user.setValue(stringFromAny(userDict["mon"]), forKeyPath: "mon")
                user.setValue(stringFromAny(userDict["Tue"]), forKeyPath: "tue")
                user.setValue(stringFromAny(userDict["Wed"]), forKeyPath: "wed")
                user.setValue(stringFromAny(userDict["Thu"]), forKeyPath: "thu")
                user.setValue(stringFromAny(userDict["Fri"]), forKeyPath: "fri")
                user.setValue(stringFromAny(userDict["Sat"]), forKeyPath: "sat")
                user.setValue(stringFromAny(userDict["Sun"]), forKeyPath: "sun")
                user.setValue(stringFromAny(userDict["fromTime"]), forKeyPath: "fromTime")
                user.setValue(stringFromAny(userDict["remindme"]), forKeyPath: "remindme")
                user.setValue(stringFromAny(userDict["toTime"]), forKeyPath: "toTime")
                user.setValue(stringFromAny(userDict["stampdate"]), forKeyPath: "stampdate")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createWeightReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("WeightReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WeightReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["onceweek"]), forKeyPath: "onceweek")
                user.setValue(stringFromAny(userDict["remindtime"]), forKeyPath: "remindtime")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

func createMedicineReminderMasterData(_ userArray:NSArray) {
    DispatchQueue.main.async {
        deleteAllRecords("MedicineReminderMaster")
        let managedContext = Singleton.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "MedicineReminderMaster", in: managedContext)!
        
        for itemDict in userArray {
            if let userDict = itemDict as? [String : Any] {
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                user.setValue(stringFromAny(userDict["id"]), forKeyPath: "id")
                user.setValue(stringFromAny(userDict["userid"]), forKeyPath: "userid")
                user.setValue(stringFromAny(userDict["mon"]), forKeyPath: "mon")
                user.setValue(stringFromAny(userDict["Tue"]), forKeyPath: "tue")
                user.setValue(stringFromAny(userDict["Wed"]), forKeyPath: "wed")
                user.setValue(stringFromAny(userDict["Thu"]), forKeyPath: "thu")
                user.setValue(stringFromAny(userDict["Fri"]), forKeyPath: "fri")
                user.setValue(stringFromAny(userDict["Sat"]), forKeyPath: "sat")
                user.setValue(stringFromAny(userDict["Sun"]), forKeyPath: "sun")
                user.setValue(stringFromAny(userDict["entrydate"]), forKeyPath: "entrydate")
                user.setValue(stringFromAny(userDict["intime"]), forKeyPath: "intime")
                user.setValue(stringFromAny(userDict["medicinename"]), forKeyPath: "medicinename")
            }
        }
        do {
            try managedContext.save()
            // print("Saved SUccesfully")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

//MARK: - Retrieve Query
func retrieveUserData() -> [UrbanUser] {
    var item_data : [UrbanUser] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UrbanUser")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let  name  = data.value(forKey: "name") as! String
            let  email  = data.value(forKey: "email") as! String
            let  mobile  = data.value(forKey: "mobile") as! String
            let  password  = data.value(forKey: "password") as! String
            let  profilepic  = data.value(forKey: "profilepic") as! String
            let  dob  = data.value(forKey: "dob") as! String
            let  height  = data.value(forKey: "height") as! String
            let  weight  = data.value(forKey: "weight") as! String
            let  gender  = data.value(forKey: "gender") as! String
            let  goal  = data.value(forKey: "goal") as! String
            let  targetweight  = data.value(forKey: "targetweight") as! String
            let  traininglevel  = data.value(forKey: "traininglevel") as! String
            let  activitylevel1  = data.value(forKey: "activitylevel1") as! String
            let  activitylevel2  = data.value(forKey: "activitylevel2") as! String
            let  activitylevel3  = data.value(forKey: "activitylevel3") as! String
            let  activitylevel4  = data.value(forKey: "activitylevel4") as! String
            let  activitylevel5  = data.value(forKey: "activitylevel5") as! String
            let  bmi  = data.value(forKey: "bmi") as! String
            let  devicetype  = data.value(forKey: "devicetype") as! String
            let  deviceid  = data.value(forKey: "deviceid") as! String
            let  socialmedialogin  = data.value(forKey: "socialmedialogin") as! String
            let  googleid  = data.value(forKey: "googleid") as! String
            let  facebookid  = data.value(forKey: "facebookid") as! String
            let  allownotification  = data.value(forKey: "allownotification") as! String
            let  calories  = data.value(forKey: "calories") as! String
            let  walletamount  = data.value(forKey: "walletamount") as! String
            let  appversion  = data.value(forKey: "appversion") as! String
            let  usertype  = data.value(forKey: "usertype") as! String
            let  status  = data.value(forKey: "status") as! String
            let  entrydate  = data.value(forKey: "entrydate") as! String
            let  entrytime  = data.value(forKey: "entrytime") as! String
            
            let resultData = UrbanUser(id: id, name: name, email: email, mobile: mobile, password: password, profilepic: profilepic, dob: dob, height: height, weight: weight, gender: gender, goal: goal, targetweight: targetweight, traininglevel: traininglevel, activitylevel1: activitylevel1, activitylevel2: activitylevel2, activitylevel3: activitylevel3, activitylevel4: activitylevel4, activitylevel5: activitylevel5, bmi: bmi, devicetype: devicetype, deviceid: deviceid, socialmedialogin: socialmedialogin, googleid: googleid, facebookid: facebookid, allownotification: allownotification, calories: calories, walletamount: walletamount, appversion: appversion, usertype: usertype, status: status, entrydate: entrydate, entrytime: entrytime)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveDiProfileData() -> [DIProfile] {
    var item_data : [DIProfile] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DIProfile")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let fullname = data.value(forKey: "fullname") as! String
            let email = data.value(forKey: "email") as! String
            let mobileno = data.value(forKey: "mobileno") as! String
            let password = data.value(forKey: "password") as! String
            let fk_RoleID = data.value(forKey: "fk_RoleID") as! String
            let isActive = data.value(forKey: "isActive") as! String
            let profileImage = data.value(forKey: "profileImage") as! String
            let dOB = data.value(forKey: "dOB") as! String
            let experience = data.value(forKey: "experience") as! String
            let education = data.value(forKey: "education") as! String
            let deescription = data.value(forKey: "deescription") as! String
            let createdBy = data.value(forKey: "createdBy") as! String
            let creationDate = data.value(forKey: "creationDate") as! String
            
            let resultData = DIProfile(id: id, Fullname: fullname, Email: email, Mobileno: mobileno, Password: password, Fk_RoleID: fk_RoleID, IsActive: isActive, ProfileImage: profileImage, DOB: dOB, Experience: experience, Education: education, Description: deescription, CreatedBy: createdBy, CreationDate: creationDate)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}


func retrieveTiProfileData() -> [TIProfile] {
    var item_data : [TIProfile] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TIProfile")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let fullname = data.value(forKey: "fullname") as! String
            let email = data.value(forKey: "email") as! String
            let mobileno = data.value(forKey: "mobileno") as! String
            let password = data.value(forKey: "password") as! String
            let fk_RoleID = data.value(forKey: "fk_RoleID") as! String
            let isActive = data.value(forKey: "isActive") as! String
            let profileImage = data.value(forKey: "profileImage") as! String
            let dOB = data.value(forKey: "dOB") as! String
            let experience = data.value(forKey: "experience") as! String
            let education = data.value(forKey: "education") as! String
            let deescription = data.value(forKey: "deescription") as! String
            let createdBy = data.value(forKey: "createdBy") as! String
            let creationDate = data.value(forKey: "creationDate") as! String
            
            let resultData = TIProfile(id: id, Fullname: fullname, Email: email, Mobileno: mobileno, Password: password, Fk_RoleID: fk_RoleID, IsActive: isActive, ProfileImage: profileImage, DOB: dOB, Experience: experience, Education: education, Description: deescription, CreatedBy: createdBy, CreationDate: creationDate)
            
            item_data.append(resultData)
            
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveDieticianMasterData() -> [DIProfile] {
    var item_data : [DIProfile] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DieticianMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let fullname = data.value(forKey: "fullname") as! String
            let email = data.value(forKey: "email") as! String
            let mobileno = data.value(forKey: "mobileno") as! String
            let password = data.value(forKey: "password") as! String
            let fk_RoleID = data.value(forKey: "fk_RoleID") as! String
            let isActive = data.value(forKey: "isActive") as! String
            let profileImage = data.value(forKey: "profileImage") as! String
            let dOB = data.value(forKey: "dOB") as! String
            let experience = data.value(forKey: "experience") as! String
            let education = data.value(forKey: "education") as! String
            let deescription = data.value(forKey: "deescription") as! String
            let createdBy = data.value(forKey: "createdBy") as! String
            let creationDate = data.value(forKey: "creationDate") as! String
            
            let resultData = DIProfile(id: id, Fullname: fullname, Email: email, Mobileno: mobileno, Password: password, Fk_RoleID: fk_RoleID, IsActive: isActive, ProfileImage: profileImage, DOB: dOB, Experience: experience, Education: education, Description: deescription, CreatedBy: createdBy, CreationDate: creationDate)
            
            item_data.append(resultData)
            
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveTrainnerMasterData() -> [TIProfile] {
    var item_data : [TIProfile] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TrainnerMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let fullname = data.value(forKey: "fullname") as! String
            let email = data.value(forKey: "email") as! String
            let mobileno = data.value(forKey: "mobileno") as! String
            let password = data.value(forKey: "password") as! String
            let fk_RoleID = data.value(forKey: "fk_RoleID") as! String
            let isActive = data.value(forKey: "isActive") as! String
            let profileImage = data.value(forKey: "profileImage") as! String
            let dOB = data.value(forKey: "dOB") as! String
            let experience = data.value(forKey: "experience") as! String
            let education = data.value(forKey: "education") as! String
            let deescription = data.value(forKey: "deescription") as! String
            let createdBy = data.value(forKey: "createdBy") as! String
            let creationDate = data.value(forKey: "creationDate") as! String
            
            let resultData = TIProfile(id: id, Fullname: fullname, Email: email, Mobileno: mobileno, Password: password, Fk_RoleID: fk_RoleID, IsActive: isActive, ProfileImage: profileImage, DOB: dOB, Experience: experience, Education: education, Description: deescription, CreatedBy: createdBy, CreationDate: creationDate)
            
            item_data.append(resultData)
            
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrievePlanMasterData() -> [PlanMaster] {
    var item_data : [PlanMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlanMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let planname = data.value(forKey: "planname") as! String
            let amount = data.value(forKey: "amount") as! String
            let descountamount = data.value(forKey: "descountamount") as! String
            let savepercentage = data.value(forKey: "savepercentage") as! String
            let permonthamount = data.value(forKey: "permonthamount") as! String
            let planvalidity = data.value(forKey: "planvalidity") as! String
            let planstatus = data.value(forKey: "planstatus") as! String
            let createddate = data.value(forKey: "createddate") as! String
            let stamuser = data.value(forKey: "stamuser") as! String
            let stamuserid = data.value(forKey: "stamuserid") as! String
            let savepercentageamount = data.value(forKey: "savepercentageamount") as! String
            let plantype = data.value(forKey: "plantype") as! String
            let plandesc = data.value(forKey: "plandesc") as! String
            let orderid = data.value(forKey: "orderid") as! String
            
            let resultData = PlanMaster(id: id, planname: planname, amount: amount, descountamount: descountamount, savepercentage: savepercentage, permonthamount: permonthamount, planvalidity: planvalidity, planstatus: planstatus, createddate: createddate, stamuser: stamuser, stamuserid: stamuserid, savepercentageamount: savepercentageamount, plantype: plantype, plandesc: plandesc, orderid: orderid)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrievePaymentTransactionData() -> [PaymentTransaction] {
    var item_data : [PaymentTransaction] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaymentTransaction")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let PK_TransactionId = data.value(forKey: "pK_TransactionId") as! String
            let FK_UrbanUserId = data.value(forKey: "fK_UrbanUserId") as! String
            let Amount = data.value(forKey: "amount") as! String
            let FK_PurchasePlanId = data.value(forKey: "fK_PurchasePlanId") as! String
            let plantype = data.value(forKey: "plantype") as! String
            let planmember = data.value(forKey: "planmember") as! String
            let Payment_Id = data.value(forKey: "payment_Id") as! String
            let Payment_Type = data.value(forKey: "payment_Type") as! String
            let Status = data.value(forKey: "status") as! String
            let IsPaid = data.value(forKey: "isPaid") as! String
            let CreatedBy = data.value(forKey: "createdBy") as! String
            let CreationDate = data.value(forKey: "creationDate") as! String
            let ModifiedBy = data.value(forKey: "modifiedBy") as! String
            let ModificationDate = data.value(forKey: "modificationDate") as! String
            let CreatedDate = data.value(forKey: "createdDate") as! String
            let walletamount = data.value(forKey: "walletamount") as! String
            let couponcode = data.value(forKey: "couponcode") as! String
            let couponamount = data.value(forKey: "couponamount") as! String
            let orderfrom = data.value(forKey: "orderfrom") as! String
            let planstatus = data.value(forKey: "planstatus") as! String
            let mrp = data.value(forKey: "mrp") as! String
            let paidamount = data.value(forKey: "paidamount") as! String
            let cashpay = data.value(forKey: "cashpay") as! String
            let paytmpay = data.value(forKey: "paytmpay") as! String
            let razorpay = data.value(forKey: "razorpay") as! String
            let creditpay = data.value(forKey: "creditpay") as! String
            let otherpay = data.value(forKey: "otherpay") as! String
            let otherpaymodetype = data.value(forKey: "otherpaymodetype") as! String
            
            let remaingday = data.value(forKey: "remainigsDays") as! String
            let resultData = PaymentTransaction(PK_TransactionId: PK_TransactionId, FK_UrbanUserId: FK_UrbanUserId, Amount: Amount, FK_PurchasePlanId: FK_PurchasePlanId, plantype: plantype, planmember: planmember, Payment_Id: Payment_Id, Payment_Type: Payment_Type, Status: Status, IsPaid: IsPaid, CreatedBy: CreatedBy, CreationDate: CreationDate, ModifiedBy: ModifiedBy, ModificationDate: ModificationDate, CreatedDate: CreatedDate, walletamount: walletamount, couponcode: couponcode, couponamount: couponamount, orderfrom: orderfrom, planstatus: planstatus, mrp: mrp, paidamount: paidamount, cashpay: cashpay, paytmpay: paytmpay, razorpay: razorpay, creditpay: creditpay, otherpay: otherpay, otherpaymodetype: otherpaymodetype,remainigsDays: "\(remaingday)")
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveExerciseMaster() -> [ExercisesMaster] {
    var item_data : [ExercisesMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExercisesMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let benefit1 = data.value(forKey: "benefit1") as! String
            let benefit2 = data.value(forKey: "benefit2") as! String
            let benefit3 = data.value(forKey: "benefit3") as! String
            let benefit4 = data.value(forKey: "benefit4") as! String
            let descr = data.value(forKey: "descr") as! String
            let difficulty = data.value(forKey: "difficulty") as! String
            let duration = data.value(forKey: "duration") as! String
            let excode = data.value(forKey: "excode") as! String
            let extype = data.value(forKey: "extype") as! String
            let id = data.value(forKey: "id") as! String
            let maincatid = data.value(forKey: "maincatid") as! String
            let name = data.value(forKey: "name") as! String
            let targetmuscles = data.value(forKey: "targetmuscles") as! String
            let targetmuscles2 = data.value(forKey: "targetmuscles2") as! String
            let targetmuscles3 = data.value(forKey: "targetmuscles3") as! String
            let targetmuscles4 = data.value(forKey: "targetmuscles4") as! String
            let targetmuscles5 = data.value(forKey: "targetmuscles5") as! String
            let targetmuscles6 = data.value(forKey: "targetmuscles6") as! String
            let targetmuscles7 = data.value(forKey: "targetmuscles7") as! String
            let targetmuscles8 = data.value(forKey: "targetmuscles8") as! String
            let targetmuscles9 = data.value(forKey: "targetmuscles9") as! String
            let targetmuscles10 = data.value(forKey: "targetmuscles10") as! String
            let videourl = data.value(forKey: "videourl") as! String
            
            let resultData = ExercisesMaster(benefit1: benefit1, benefit2: benefit2, benefit3: benefit3, benefit4: benefit4, descr: descr, difficulty: difficulty, duration: duration, excode: excode, extype: extype, id: id, maincatid: maincatid, name: name, targetmuscles: targetmuscles, targetmuscles2: targetmuscles2, targetmuscles3: targetmuscles3, targetmuscles4: targetmuscles4, targetmuscles5: targetmuscles5, targetmuscles6: targetmuscles6, targetmuscles7: targetmuscles7, targetmuscles8: targetmuscles8, targetmuscles9: targetmuscles9, targetmuscles10: targetmuscles10, videourl: videourl)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveItemMaster() -> [ItemMaster] {
    var item_data : [ItemMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let calcium = data.value(forKey: "calcium") as! String
            let calories = data.value(forKey: "calories") as! String
            let carbs = data.value(forKey: "carbs") as! String
            let category = data.value(forKey: "category") as! String
            let fats = data.value(forKey: "fats") as! String
            let fiber = data.value(forKey: "fiber") as! String
            let id = data.value(forKey: "id") as! String
            let iron = data.value(forKey: "iron") as! String
            let itemcode = data.value(forKey: "itemcode") as! String
            let itemname = data.value(forKey: "itemname") as! String
            let itemunit = data.value(forKey: "itemunit") as! String
            let itemurl = data.value(forKey: "itemurl") as! String
            let itemval = data.value(forKey: "itemval") as! String
            let phosphorous = data.value(forKey: "phosphorous") as! String
            let protein = data.value(forKey: "protein") as! String
            let unit = data.value(forKey: "unit") as! String
            let vitaminA = data.value(forKey: "vitaminA") as! String
            let vitaminB1 = data.value(forKey: "vitaminB1") as! String
            let vitaminB2 = data.value(forKey: "vitaminB2") as! String
            let vitaminB3 = data.value(forKey: "vitaminB3") as! String
            let vitaminB5 = data.value(forKey: "vitaminB5") as! String
            let vitaminB6 = data.value(forKey: "vitaminB6") as! String
            let vitaminB7 = data.value(forKey: "vitaminB7") as! String
            let vitaminB9 = data.value(forKey: "vitaminB9") as! String
            let vitaminB12 = data.value(forKey: "vitaminB12") as! String
            let vitaminC = data.value(forKey: "vitaminC") as! String
            let vitaminD = data.value(forKey: "vitaminD") as! String
            let vitaminE = data.value(forKey: "vitaminE") as! String
            let vitaminK = data.value(forKey: "vitaminK") as! String
            
            let resultData = ItemMaster(calcium: calcium, calories: calories, carbs: carbs, category: category, fats: fats, fiber: fiber, id: id, iron: iron, itemcode: itemcode, itemname: itemname, itemunit: itemunit, itemurl: itemurl, itemval: itemval, phosphorous: phosphorous, protein: protein, unit: unit, vitaminA: vitaminA, vitaminB1: vitaminB1, vitaminB2: vitaminB2, vitaminB3: vitaminB3, vitaminB5: vitaminB5, vitaminB6: vitaminB6, vitaminB7: vitaminB7, vitaminB9: vitaminB9, vitaminB12: vitaminB12, vitaminC: vitaminC, vitaminD: vitaminD, vitaminE: vitaminE, vitaminK: vitaminK)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveCaloriesData() -> [CaloriesCounter] {
    var item_data : [CaloriesCounter] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CaloriesCounter")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let schedulecode = data.value(forKey: "schedulecode") as! String
            let userid = data.value(forKey: "userid") as! String
            let itemcode = data.value(forKey: "itemcode") as! String
            let trscdate = data.value(forKey: "trscdate") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let unit = data.value(forKey: "unit") as! String
            let category = data.value(forKey: "category") as! String
            let calories = data.value(forKey: "calories") as! String
            let itemval = data.value(forKey: "itemval") as! String
            let itemname = data.value(forKey: "itemname") as! String
            let itemunit = data.value(forKey: "itemunit") as! String
            let protein = data.value(forKey: "protein") as! String
            let carbs = data.value(forKey: "carbs") as! String
            let fats = data.value(forKey: "fats") as! String
            let fiber = data.value(forKey: "fiber") as! String
            
            let resultData = CaloriesCounter(id: id, schedulecode: schedulecode, userid: userid, itemcode: itemcode, trscdate: trscdate, entrydate: entrydate, unit: unit, category: category, calories: calories, itemval: itemval, itemname: itemname, itemunit: itemunit, protein: protein, carbs: carbs, fats: fats, fiber: fiber)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveFtinessTrainnerData() -> [FitnessTrainer] {
    var item_data : [FitnessTrainer] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TIProfile")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let CreatedBy = data.value(forKey: "createdBy") as! String
            let CreationDate = data.value(forKey: "creationDate") as! String
            let DOB = data.value(forKey: "dOB") as! String
            let Description = data.value(forKey: "deescription") as! String
            let Education = data.value(forKey: "education") as! String
            let Email = data.value(forKey: "email") as! String
            let Experience = data.value(forKey: "experience") as! String
            let Fk_RoleID = data.value(forKey: "fk_RoleID") as! String
            let Fullname = data.value(forKey: "fullname") as! String
            let IsActive = data.value(forKey: "isActive") as! String
            let Mobileno = data.value(forKey: "mobileno") as! String
            let Password = data.value(forKey: "password") as! String
            let ProfileImage = data.value(forKey: "profileImage") as! String
            
            let resultData = FitnessTrainer(id: id, Fullname: Fullname, Email: Email, Mobileno: Mobileno, Password: Password, Fk_RoleID: Fk_RoleID, IsActive: IsActive, ProfileImage: ProfileImage, DOB: DOB, Experience: Experience, Education: Education, Description: Description, CreatedBy: CreatedBy, CreationDate: CreationDate)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveExercisesMainMasterData() -> [ExercisesMainMaster] {
    var item_data : [ExercisesMainMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExercisesMainMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let name = data.value(forKey: "name") as! String
            
            let resultData = ExercisesMainMaster(id: id, name: name)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveFavouriteVideoData() -> [FavouriteVideos] {
    var item_data : [FavouriteVideos] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteVideos")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "exerciseId") as! String
            
            let resultData = FavouriteVideos(exrciseId: id)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}
func retrieveWorkoutData() -> [WorkoutCounter] {
    var item_data : [WorkoutCounter] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WorkoutCounter")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let workoutid = data.value(forKey: "workoutid") as! String
            let userid = data.value(forKey: "userid") as! String
            let trscdate = data.value(forKey: "trscdate") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let setval = data.value(forKey: "setval") as! String
            let reps = data.value(forKey: "reps") as! String
            let timeval = data.value(forKey: "timeval") as! String
            let timeunit = data.value(forKey: "timeunit") as! String
            let schedulecode = data.value(forKey: "schedulecode") as! String
            let resultData = WorkoutCounter(id: id, workoutid: workoutid, schedulecode: schedulecode, userid: userid, trscdate: trscdate, entrydate: entrydate, setval: setval, reps: reps, timeval: timeval, timeunit: timeunit)
            
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrievePlanDiscriptionMasterData() -> [PlanDescrMaster] {
    var item_data : [PlanDescrMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlanDescrMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  createddate = data.value(forKey: "createddate") as! String
            let descr = data.value(forKey: "descr") as! String
            let descr_status = data.value(forKey: "descr_status") as! String
            let descr_url = data.value(forKey: "descr_url") as! String
            let id = data.value(forKey: "id") as! String
            let planid = data.value(forKey: "planid") as! String
            let stamuser = data.value(forKey: "stamuser") as! String
            let stamuserid = data.value(forKey: "stamuserid") as! String
            let title = data.value(forKey: "title") as! String
            
            let resultData = PlanDescrMaster(id: id, planid: planid, title: title, descr: descr, descr_url: descr_url, descr_status: descr_status, createddate: createddate, stamuser: stamuser, stamuserid: stamuserid)
            
            item_data.append(resultData)
            
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveWorkOutPlanMasterData() -> [WorkoutPlanMaster] {
    var item_data : [WorkoutPlanMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WorkoutPlanMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let schedulecode = data.value(forKey: "schedulecode") as! String
            let PK_PersonID = data.value(forKey: "pK_PersonID") as! String
            let workoutid = data.value(forKey: "workoutid") as! String
            let woroutname = data.value(forKey: "woroutname") as! String
            let extype = data.value(forKey: "extype") as! String
            let userid = data.value(forKey: "userid") as! String
            let trscdate = data.value(forKey: "trscdate") as! String
            let setval = data.value(forKey: "setval") as! String
            let reps = data.value(forKey: "reps") as! String
            let itemval = data.value(forKey: "itemval") as! String
            let timeunit = data.value(forKey: "timeunit") as! String
            let settimeval = data.value(forKey: "settimeval") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let entrytime = data.value(forKey: "entrytime") as! String
            let maincatid = data.value(forKey: "maincatid") as! String
            
            let resultData = WorkoutPlanMaster.init(id: id, schedulecode: schedulecode, PK_PersonID: PK_PersonID, workoutid: workoutid, woroutname: woroutname, maincatid: maincatid, extype: extype, userid: userid, trscdate: trscdate, setval: setval, reps: reps, itemval: itemval, timeunit: timeunit, settimeval: settimeval, entrydate: entrydate, entrytime: entrytime)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrievePlanCouponMasterData() -> [PlanCouponMaster] {
    var item_data : [PlanCouponMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlanCouponMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let  id = data.value(forKey: "id") as! String
            let planid = data.value(forKey: "planid") as! String
            let couponcode = data.value(forKey: "couponcode") as! String
            let descountpercentage = data.value(forKey: "descountpercentage") as! String
            let coupon_status = data.value(forKey: "coupon_status") as! String
            let createddate = data.value(forKey: "createddate") as! String
            let stamuser = data.value(forKey: "stamuser") as! String
            let stamuserid = data.value(forKey: "stamuserid") as! String
            let couponVisible = data.value(forKey: "couponVisible") as! String
            
            let resultData = PlanCouponMaster(id: id, planid: planid, couponcode: couponcode, descountpercentage: descountpercentage, coupon_status: coupon_status, createddate: createddate, stamuser: stamuser, stamuserid: stamuserid, CouponVisible: couponcode)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveBlogMasterData() -> [BlogDataModel] {
    var item_data : [BlogDataModel] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BlogMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let blogImage = data.value(forKey: "blogImage") as! String
            let blogType = data.value(forKey: "blogType") as! String
            let createdBy = data.value(forKey: "createdBy") as! String
            let creationDate = data.value(forKey: "creationDate") as! String
            let isActive = data.value(forKey: "isActive") as! String
            let title = data.value(forKey: "title") as! String
            let videoURL = data.value(forKey: "videoURL") as! String
            let webURL = data.value(forKey: "webURL") as! String
            let blogfor = data.value(forKey: "blogfor") as! String
            let section = data.value(forKey: "section") as! String
            let shortdesc = data.value(forKey: "shortdesc") as! String
            let slug = data.value(forKey: "slug") as! String
            
            let resultData =   BlogDataModel(id: id, blogImage: blogImage, blogType: blogType, createdBy: createdBy, creationDate: creationDate, isActive: isActive, title: title, videoURL: videoURL, webURL: webURL, blogfor: blogfor, section: section, shortdesc: shortdesc, slug: slug)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveDietPlanMasterData() -> [DietPlanMaster] {
    var item_data : [DietPlanMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DietPlanMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let pK_PersonID = data.value(forKey: "pK_PersonID") as! String
            let schedulecode = data.value(forKey: "schedulecode") as! String
            let userid = data.value(forKey: "userid") as! String
            let itemcode = data.value(forKey: "itemcode") as! String
            let trscdate = data.value(forKey: "trscdate") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let unit = data.value(forKey: "unit") as! String
            let category = data.value(forKey: "category") as! String
            let calories = data.value(forKey: "calories") as! String
            let itemval = data.value(forKey: "itemval") as! String
            let itemname = data.value(forKey: "itemname") as! String
            let itemunit = data.value(forKey: "itemunit") as! String
            let protein = data.value(forKey: "protein") as! String
            let carbs = data.value(forKey: "carbs") as! String
            let fats = data.value(forKey: "fats") as! String
            let fiber = data.value(forKey: "fiber") as! String
            let settimeval = data.value(forKey: "settimeval") as! String
            let entrytime = data.value(forKey: "entrytime") as! String
            
            let resultData = DietPlanMaster(id: id, PK_PersonID: pK_PersonID, schedulecode: schedulecode, userid: userid, itemcode: itemcode, trscdate: trscdate, unit: unit, category: category, calories: calories, itemval: itemval, itemname: itemname, itemunit: itemunit, protein: protein, carbs: carbs, fats: fats, settimeval: settimeval, fiber: fiber, entrydate: entrydate, entrytime: entrytime)
            
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveCallorieReminderData() -> [CalReminderMaster] {
    var item_data : [CalReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CalReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userId") as! String
            let mon = data.value(forKey: "mon") as! String
            let tue = data.value(forKey: "tue") as! String
            let wed = data.value(forKey: "wed") as! String
            let thu = data.value(forKey: "thu") as! String
            let fri = data.value(forKey: "fri") as! String
            let sat = data.value(forKey: "sat") as! String
            let sun = data.value(forKey: "sun") as! String
            let bKTimeSelected = data.value(forKey: "bKTimeSelected") as! String
            let mKTimeSelected = data.value(forKey: "mKTimeSelected") as! String
            let lunchTimeSelected = data.value(forKey: "lunchTimeSelected") as! String
            let eSTimeSelected = data.value(forKey: "eSTimeSelected") as! String
            let dinnerTimeSelected = data.value(forKey: "dinnerTimeSelected") as! String
            let stampdate = data.value(forKey: "stampdate") as! String
            let sch_code = data.value(forKey: "sch_code") as! String
            
            let resultData = CalReminderMaster(id: id, userId: userId, mon: mon, Tue: tue, Wed: wed, Thu: thu, Fri: fri, Sat: sat, Sun: sun, BKTimeSelected: bKTimeSelected, MKTimeSelected: mKTimeSelected, LunchTimeSelected: lunchTimeSelected, ESTimeSelected: eSTimeSelected, DinnerTimeSelected: dinnerTimeSelected, stampdate: stampdate, sch_code: sch_code)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveWaterReminderData() -> [WaterWalkWorkoutReminderMaster] {
    var item_data : [WaterWalkWorkoutReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WaterReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userId") as! String
            let mon = data.value(forKey: "mon") as! String
            let tue = data.value(forKey: "tue") as! String
            let wed = data.value(forKey: "wed") as! String
            let thu = data.value(forKey: "thu") as! String
            let fri = data.value(forKey: "fri") as! String
            let sat = data.value(forKey: "sat") as! String
            let sun = data.value(forKey: "sun") as! String
            let fromTime = data.value(forKey: "fromTime") as! String
            let remindme = data.value(forKey: "remindme") as! String
            let toTime = data.value(forKey: "toTime") as! String
            let stampdate = data.value(forKey: "stampdate") as! String
            
            let resultData = WaterWalkWorkoutReminderMaster(id: id, userId: userId, mon: mon, Tue: tue, Wed: wed, Thu: thu, Fri: fri, Sat: sat, Sun: sun, fromTime: fromTime, remindme: remindme, toTime: toTime, stampdate: stampdate)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveWorkoutReminderData() -> [WaterWalkWorkoutReminderMaster] {
    var item_data : [WaterWalkWorkoutReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WorkoutReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userId") as! String
            let mon = data.value(forKey: "mon") as! String
            let tue = data.value(forKey: "tue") as! String
            let wed = data.value(forKey: "wed") as! String
            let thu = data.value(forKey: "thu") as! String
            let fri = data.value(forKey: "fri") as! String
            let sat = data.value(forKey: "sat") as! String
            let sun = data.value(forKey: "sun") as! String
            let fromTime = data.value(forKey: "fromTime") as! String
            let remindme = data.value(forKey: "remindme") as! String
            let toTime = data.value(forKey: "toTime") as! String
            let stampdate = data.value(forKey: "stampdate") as! String
            
            let resultData = WaterWalkWorkoutReminderMaster(id: id, userId: userId, mon: mon, Tue: tue, Wed: wed, Thu: thu, Fri: fri, Sat: sat, Sun: sun, fromTime: fromTime, remindme: remindme, toTime: toTime, stampdate: stampdate)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveWalkReminderData() -> [WaterWalkWorkoutReminderMaster] {
    var item_data : [WaterWalkWorkoutReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WalkReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userId") as! String
            let mon = data.value(forKey: "mon") as! String
            let tue = data.value(forKey: "tue") as! String
            let wed = data.value(forKey: "wed") as! String
            let thu = data.value(forKey: "thu") as! String
            let fri = data.value(forKey: "fri") as! String
            let sat = data.value(forKey: "sat") as! String
            let sun = data.value(forKey: "sun") as! String
            let fromTime = data.value(forKey: "fromTime") as! String
            let remindme = data.value(forKey: "remindme") as! String
            let toTime = data.value(forKey: "toTime") as! String
            let stampdate = data.value(forKey: "stampdate") as! String
            
            let resultData = WaterWalkWorkoutReminderMaster(id: id, userId: userId, mon: mon, Tue: tue, Wed: wed, Thu: thu, Fri: fri, Sat: sat, Sun: sun, fromTime: fromTime, remindme: remindme, toTime: toTime, stampdate: stampdate)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveWeightReminderData() -> [WeightReminderMaster] {
    var item_data : [WeightReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeightReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userid") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let onceweek = data.value(forKey: "onceweek") as! String
            let remindtime = data.value(forKey: "remindtime") as! String
            
            let resultData = WeightReminderMaster(id: id, userid: userId, entrydate: entrydate, onceweek: onceweek, remindtime: remindtime)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

func retrieveMedicineReminderData() -> [MedicineReminderMaster] {
    var item_data : [MedicineReminderMaster] = []
    let managedContext = Singleton.shared.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MedicineReminderMaster")
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as! String
            let userId = data.value(forKey: "userid") as! String
            let mon = data.value(forKey: "mon") as! String
            let tue = data.value(forKey: "tue") as! String
            let wed = data.value(forKey: "wed") as! String
            let thu = data.value(forKey: "thu") as! String
            let fri = data.value(forKey: "fri") as! String
            let sat = data.value(forKey: "sat") as! String
            let sun = data.value(forKey: "sun") as! String
            let entrydate = data.value(forKey: "entrydate") as! String
            let intime = data.value(forKey: "intime") as! String
            let medicinename = data.value(forKey: "medicinename") as! String
            
            let resultData = MedicineReminderMaster(id: id, userId: userId, mon: mon, Tue: tue, Wed: wed, Thu: thu, Fri: fri, Sat: sat, Sun: sun, entrydate: entrydate, intime: intime, medicinename: medicinename)
            item_data.append(resultData)
        }
    } catch {
        print("Failed")
    }
    return item_data
}

//MARK: - Delet Record from tabel
func deleteAllRecords(_ entityName:String) {
    let context = Singleton.shared.persistentContainer.viewContext
    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
    
    do {
        try context.execute(deleteRequest)
        try context.save()
    } catch {
        print ("There was an error")
    }
    
}

func deletFavouriteVideoData(id: String) {
    let context = Singleton.shared.persistentContainer.viewContext
    let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "FavouriteVideos")
    let predicate = NSPredicate(format: "exerciseId = '\(id)'")
    fetchRequest.predicate = predicate
    do {
        let object = try context.fetch(fetchRequest)
        if object.count == 1 {
            let objectDelete = object.first as! NSManagedObject
            
            context.delete(objectDelete)
        }
    } catch {
        print(error)
    }
}

func openDatabse(userId : String) {
    let  context = Singleton.shared.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "FavouriteVideos", in: context)
    let newUser = NSManagedObject(entity: entity!, insertInto: context)
    
    newUser.setValue(userId, forKey: "exerciseId")
    print("Storing Data..")
    do {
        try context.save()
    } catch {
        print("Storing data Failed")
    }
}

func fetchData()  -> [FavouriteVideos] {
    var item: [FavouriteVideos] = []
    
    let  context = Singleton.shared.persistentContainer.viewContext
    print("Fetching Data..")
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteVideos")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            let userName = data.value(forKey: "exerciseId") as! String
            let resultData = FavouriteVideos(exrciseId: userName)
            item.append(resultData)
        }
    } catch {
        print("Fetching data Failed")
    }
    return item
}



