//
//  Model.swift
//  UrbanfitStudio
//
//  Created by APPLE on 10/17/22.
//

import Foundation

//MARK: - Login_With_Pass.php
struct UrbanUser {
    var id: String = String()
    var name: String = String()
    var email: String = String()
    var mobile: String = String()
    var password: String = String()
    var profilepic: String = String()
    var dob: String = String()
    var height: String = String()
    var weight: String = String()
    var gender: String = String()
    var goal: String = String()
    var targetweight: String = String()
    var traininglevel: String = String()
    var activitylevel1: String = String()
    var activitylevel2: String = String()
    var activitylevel3: String = String()
    var activitylevel4: String = String()
    var activitylevel5: String = String()
    var bmi: String = String()
    var devicetype: String = String()
    var deviceid: String = String()
    var socialmedialogin: String = String()
    var googleid: String = String()
    var facebookid: String = String()
    var allownotification: String = String()
    var calories: String = String()
    var walletamount: String = String()
    var appversion: String = String()
    var usertype: String = String()
    var status: String = String()
    var entrydate: String = String()
    var entrytime: String = String()
}

struct DIProfile {
    var id: String = String()
    var Fullname: String = String()
    var Email: String = String()
    var Mobileno: String = String()
    var Password: String = String()
    var Fk_RoleID: String = String()
    var IsActive: String = String()
    var ProfileImage: String = String()
    var DOB: String = String()
    var Experience: String = String()
    var Education: String = String()
    var Description: String = String()
    var CreatedBy: String = String()
    var CreationDate: String = String()
}

struct TIProfile {
    var id: String = String()
    var Fullname: String = String()
    var Email: String = String()
    var Mobileno: String = String()
    var Password: String = String()
    var Fk_RoleID: String = String()
    var IsActive: String = String()
    var ProfileImage: String = String()
    var DOB: String = String()
    var Experience: String = String()
    var Education: String = String()
    var Description: String = String()
    var CreatedBy: String = String()
    var CreationDate: String = String()
}

struct PlanMaster {
    var id: String = String()
    var planname: String = String()
    var amount: String = String()
    var descountamount: String = String()
    var savepercentage: String = String()
    var permonthamount: String = String()
    var planvalidity: String = String()
    var planstatus: String = String()
    var createddate: String = String()
    var stamuser: String = String()
    var stamuserid: String = String()
    var savepercentageamount: String = String()
    var plantype: String = String()
    var plandesc: String = String()
    var orderid: String = String()
}

struct PaymentTransaction {
    var PK_TransactionId: String = String()
    var FK_UrbanUserId: String = String()
    var Amount: String = String()
    var FK_PurchasePlanId: String = String()
    var plantype: String = String()
    var planmember: String = String()
    var Payment_Id: String = String()
    var Payment_Type: String = String()
    var Status: String = String()
    var IsPaid: String = String()
    var CreatedBy: String = String()
    var CreationDate: String = String()
    var ModifiedBy: String = String()
    var ModificationDate: String = String()
    var CreatedDate: String = String()
    var walletamount: String = String()
    var couponcode: String = String()
    var couponamount: String = String()
    var orderfrom: String = String()
    var planstatus: String = String()
    var mrp: String = String()
    var paidamount: String = String()
    var cashpay: String = String()
    var paytmpay: String = String()
    var razorpay: String = String()
    var creditpay: String = String()
    var otherpay: String = String()
    var otherpaymodetype: String = String()
    var remainigsDays: String = String()
}


//MARK: - Validate_App.php
struct WaterCounter {
    var id: String = String()
    var trscdate: String = String()
    var entrydate: String = String()
    var userid: String = String()
    var waterglass: String = String()
}

struct WorkoutCounter {
    var id: String = String()
    var workoutid: String = String()
    var schedulecode: String = String()
    var userid: String = String()
    var trscdate: String = String()
    var entrydate: String = String()
    var setval: String = String()
    var reps: String = String()
    var timeval: String = String()
    var timeunit: String = String()
}

struct CaloriesCounter {
    var id: String = String()
    var schedulecode: String = String()
    var userid: String = String()
    var itemcode: String = String()
    var trscdate: String = String()
    var entrydate: String = String()
    var unit: String = String()
    var category: String = String()
    var calories: String = String()
    var itemval: String = String()
    var itemname: String = String()
    var itemunit: String = String()
    var protein: String = String()
    var carbs: String = String()
    var fats: String = String()
    var fiber: String = String()
}

struct SleepCounter {
    var id: String = String()
    var trscdate: String = String()
    var entrydate: String = String()
    var userid: String = String()
    var sleeptime: String = String()
    var wakeuptime: String = String()
}

struct CalReminderMaster {
    var id: String = String()
    var userId: String = String()
    var mon: String = String()
    var Tue: String = String()
    var Wed: String = String()
    var Thu: String = String()
    var Fri: String = String()
    var Sat: String = String()
    var Sun: String = String()
    var BKTimeSelected: String = String()
    var MKTimeSelected: String = String()
    var LunchTimeSelected: String = String()
    var ESTimeSelected: String = String()
    var DinnerTimeSelected: String = String()
    var stampdate: String = String()
    var sch_code:String  = String()
}

struct WaterWalkWorkoutReminderMaster {

    var id: String = String()

    var userId: String = String()

    var mon: String = String()

    var Tue: String = String()

    var Wed: String = String()

    var Thu: String = String()

    var Fri: String = String()

    var Sat: String = String()

    var Sun: String = String()

    var fromTime: String = String()

    var remindme: String = String()

    var toTime: String = String()

    var stampdate: String = String()

}

struct SleepReminderMaster {
    var id: String = String()
    var userId: String = String()
    var mon: String = String()
    var Tue: String = String()
    var Wed: String = String()
    var Thu: String = String()
    var Fri: String = String()
    var Sat: String = String()
    var Sun: String = String()
    var BKTimeSelected: String = String()
    var MKTimeSelected: String = String()
    var LunchTimeSelected: String = String()
    var ESTimeSelected: String = String()
    var DinnerTimeSelected: String = String()
    var stampdate: String = String()
}

struct DietPlanMaster {
    var id: String = String()
    var PK_PersonID: String = String()
    var schedulecode: String = String()
    var userid: String = String()
    var itemcode: String = String()
    var trscdate: String = String()
    var unit: String = String()
    var category: String = String()
    var calories: String = String()
    var itemval: String = String()
    var itemname: String = String()
    var itemunit: String = String()
    var protein: String = String()
    var carbs: String = String()
    var fats: String = String()
    var settimeval: String = String()
    var fiber: String = String()
    var entrydate: String = String()
    var entrytime: String = String()
}

struct WorkoutPlanMaster {
    var id: String = String()
    var schedulecode: String = String()
    var PK_PersonID: String = String()
    var workoutid: String = String()
    var woroutname: String = String()
    var maincatid: String = String()
    var extype: String = String()
    var userid: String = String()
    var trscdate: String = String()
    var setval: String = String()
    var reps: String = String()
    var itemval: String = String()
    var timeunit: String = String()
    var settimeval: String = String()
    var entrydate: String = String()
    var entrytime: String = String()
}

struct DieticianMaster {
    var id: String = String()
    var Fullname: String = String()
    var Email: String = String()
    var Mobileno: String = String()
    var Password: String = String()
    var Fk_RoleID: String = String()
    var IsActive: String = String()
    var ProfileImage: String = String()
    var DOB: String = String()
    var Experience: String = String()
    var Education: String = String()
    var Description: String = String()
    var CreatedBy: String = String()
    var CreationDate: String = String()
}

struct FitnessTrainer {
    var id: String = String()
    var Fullname: String = String()
    var Email: String = String()
    var Mobileno: String = String()
    var Password: String = String()
    var Fk_RoleID: String = String()
    var IsActive: String = String()
    var ProfileImage: String = String()
    var DOB: String = String()
    var Experience: String = String()
    var Education: String = String()
    var Description: String = String()
    var CreatedBy: String = String()
    var CreationDate: String = String()
}

//MARK: - Sync_Master.php
struct ExercisesMainMaster {
    var id: String = String()
    var name: String = String()
}

struct ItemMaster {
    var calcium: String = String()
    var calories: String = String()
    var carbs: String = String()
    var category: String = String()
    var fats: String = String()
    var fiber: String = String()
    var id: String = String()
    var iron: String = String()
    var itemcode: String = String()
    var itemname: String = String()
    var itemunit: String = String()
    var itemurl: String = String()
    var itemval: String = String()
    var phosphorous: String = String()
    var protein: String = String()
    var unit: String = String()
    var vitaminA: String = String()
    var vitaminB1: String = String()
    var vitaminB2: String = String()
    var vitaminB3: String = String()
    var vitaminB5: String = String()
    var vitaminB6: String = String()
    var vitaminB7: String = String()
    var vitaminB9: String = String()
    var vitaminB12: String = String()
    var vitaminC: String = String()
    var vitaminD: String = String()
    var vitaminE: String = String()
    var vitaminK: String = String()
}

struct ExercisesMaster {
      var benefit1: String = String()
      var benefit2: String = String()
      var benefit3: String = String()
      var benefit4: String = String()
      var descr: String = String()
      var difficulty: String = String()
      var duration: String = String()
      var excode: String = String()
      var extype: String = String()
      var id: String = String()
      var maincatid: String = String()
      var name: String = String()
      var targetmuscles: String = String()
      var targetmuscles2: String = String()
      var targetmuscles3: String = String()
      var targetmuscles4: String = String()
      var targetmuscles5: String = String()
      var targetmuscles6: String = String()
      var targetmuscles7: String = String()
      var targetmuscles8: String = String()
      var targetmuscles9: String = String()
      var targetmuscles10: String = String()
      var videourl: String = String()
}

//MARK: - Get_Plan_Master.php
struct PlanDescrMaster {
    var id: String = String()
    var planid: String = String()
    var title: String = String()
    var descr: String = String()
    var descr_url: String = String()
    var descr_status: String = String()
    var createddate: String = String()
    var stamuser: String = String()
    var stamuserid: String = String()
}

struct PlanCouponMaster {
    var id: String = String()
    var planid: String = String()
    var couponcode: String = String()
    var descountpercentage: String = String()
    var coupon_status: String = String()
    var createddate: String = String()
    var stamuser: String = String()
    var stamuserid: String = String()
    var CouponVisible: String = String()
}

//MARK: - Get_Call_Slot_Master.php
struct CallSlotMaster {
    var id: String = String()
    var PK_PersonID: String = String()
    var slotid: String = String()
    var fromtime: String = String()
    var totime: String = String()
    var slotstatus: String = String()
    var typeval: String = String()
    var trscdate: String = String()
}

//MARK: - Get_Coach_Message.php
struct DietitiaSMS {
    var id: String = String()
    var msg: String = String()
    var dietitiaId: String = String()
    var userid: String = String()
    var frommsg: String = String()
    var msgtime: String = String()
    var msgdate: String = String()
    var msgstatus: String = String()
}
struct BlogDataModel {
    var id: String = String()
    var blogImage: String = String()
    var blogType: String = String()
    var createdBy: String = String()
    var creationDate: String = String()
    var isActive: String = String()
    var title: String = String()
    var videoURL: String = String()
    var webURL: String = String()
    var blogfor: String = String()
    var section: String = String()
    var shortdesc: String = String()
    var slug: String = String()
 }

struct CoachBooked {
    var id: String = String()
    var fromtime: String = String()
    var totime: String = String()
    var trainerId: String = String()
    var userid: String = String()
    var trscdate: String = String()
    var trsctime: String = String()
}

struct FavouriteVideos {
    var exrciseId: String = String()
}

struct WeightReminderMaster {

    var id: String = String()

    var userid: String = String()

    var entrydate: String = String()

    var onceweek: String = String()

    var remindtime: String = String()

}


 

struct MedicineReminderMaster {

    var id: String = String()

    var userId: String = String()

    var mon: String = String()

    var Tue: String = String()

    var Wed: String = String()

    var Thu: String = String()

    var Fri: String = String()

    var Sat: String = String()

    var Sun: String = String()

    var entrydate: String = String()

    var intime: String = String()

    var medicinename: String = String()

}
