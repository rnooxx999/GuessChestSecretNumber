//
//  ChestGuessViewController.swift
//  try
//
//  Created by Ran Ra on 18/03/1444 AH.
//

import Foundation
import UIKit

import SwiftUI
 
class ChestGuessViewController: UIViewController {
    
    @IBOutlet var customAlert: CustomAlertV!
    
//    let cell = CustomAlertV.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
    @IBOutlet weak var dialog: UIView!
    
    var alertCV : CustomAlertV!

    //from extension
    var random1 = Int.randomNum
    var random2 = Int.randomNum
    var random3 = Int.randomNum
    
    var num = ""
    var count = 0
    var isCheked1 : Bool = true
    var isCheked2 : Bool = true
    var isCheked3 : Bool = true

    
    @IBOutlet weak var lebalNumber1: UILabel!
    
    @IBOutlet weak var upDownImage1: UIImageView!

    
    // MARK: - First button
    
    var number1 = 0
    @IBAction func upButton1(_ sender: Any) {
        if isCheked1 == true {
        upButton(label: lebalNumber1, number: &number1)
        }
    }
    @IBAction func downButton1(_ sender: Any) {
        if isCheked1 == true {
        downButton(label: lebalNumber1, number: &number1)
        }
    }
    
    
    
    // MARK: - second Column

     var number2 = 0
     
     @IBOutlet weak var lebalNumber2: UILabel!
     
     @IBOutlet weak var upDownImage2: UIImageView!

     @IBAction func upButton2(_ sender: Any) {
         if isCheked2 == true {
         upButton(label: lebalNumber2, number: &number2)
         }
     }
    
     @IBAction func downButton2(_ sender: Any) {
         if isCheked2 == true {
         downButton(label: lebalNumber2, number: &number2)
         }
     }
    
    
    // MARK: - Third button

     var number3 = 0
     
     @IBOutlet weak var lebalNumber3: UILabel!
     
     @IBOutlet weak var upDownImage3: UIImageView!

     
     @IBAction func upButton3(_ sender: Any) {
         if isCheked3 == true {
         upButton(label: lebalNumber3, number: &number3)
         }
     }
     
     @IBAction func downButton3(_ sender: Any) {
         if isCheked3 == true {
         downButton(label: lebalNumber3, number: &number3)
         }
     }
    
    // MARK: -  Guess Button

    @IBAction func guessButton(_ sender: Any) {
      //  self.alertCV = CustomAlertV(frame : self.view.frame)
        countCheck()
    checkFunc(number: &number1, random: &random1, image: &upDownImage1 ,isBool: &isCheked1)
    checkFunc(number: &number2, random: &random2, image: &upDownImage2 ,isBool: &isCheked2)
    checkFunc(number: &number3, random: &random3, image: &upDownImage3 ,isBool: &isCheked3)
 }
 
    
    // MARK: - Winning Dialog :
    
    @IBOutlet weak var dialgWinOrLose: UILabel!
    @IBOutlet weak var dialogSecretNumber: UILabel!
    @IBOutlet weak var dialogTrysNumber: UILabel!
    @IBOutlet weak var dialogImageOpenOrClose: UIImageView!
    
    
    @IBAction func replyAction(_ sender: Any) {
        start()
        count = 0
        dialog.isHidden = true
    }
    
    func winingDialog() ->  Void {
        dialog.isHidden = false
        dialgWinOrLose.text = "You Win"
        dialogSecretNumber.text = "\(random1) \(random2) \(random3) "
        dialogTrysNumber.text = "\(count) : عدد المحاولات"
        dialogImageOpenOrClose.image = #imageLiteral(resourceName: "chests3")
    }
    
    func losingDialog() ->  Void {
        dialog.isHidden = false
        dialgWinOrLose.text = "You Lose"
        dialogSecretNumber.text = "\(random1) \(random2) \(random3) "
        dialogTrysNumber.text = "\(count) : عدد المحاولات"
        dialogImageOpenOrClose.image = #imageLiteral(resourceName: "chests1")
    }
    
    //start Appliction
    func start(){
         random1 = Int.random(in: 1...10)
         random2 = Int.random(in: 1...10)
         random3 = Int.random(in: 1...10)
         number3 = 0
        number1 = 0
        number2 = 0
        lebalNumber1.text = String(0)
        lebalNumber2.text = String(0)
        lebalNumber3.text = String(0)
        upDownImage1.image = #imageLiteral(resourceName: "arraw")
        upDownImage2.image = #imageLiteral(resourceName: "arraw")
        upDownImage3.image = #imageLiteral(resourceName: "arraw")
        num = "\(random1) \(random2) \(random3)"
        print(num)
    }
   
    
    override func viewDidLoad() {
        dialog.isHidden = true
        start()
        super.viewDidLoad()
    }
    
    
    // MARK: - Functions :

    func upButton( label : UILabel ,  number: inout Int ) -> Void {
         if number < 10  {
             number += 1
             label.text = String(number)
         print(number)
        }
     }
    
    func downButton( label : UILabel ,  number: inout Int  ) -> Void {
         if number > 0  {
             number -= 1
             label.text = String(number)
         print(number)
        }
     }
    
    
    func checkFunc(number: inout Int ,random : inout Int ,image : inout UIImageView , isBool : inout Bool) -> Void{
        
        if number == random {
            print("Good")
            image.image = #imageLiteral(resourceName: "check")
            isBool = false
        }
        else if number > random {
            print("Down ")
            image.image = #imageLiteral(resourceName: "arrawdown")

        }
        else if number < random {
            print("UP ")
            image.image = #imageLiteral(resourceName: "arraw")

        }
    }
    
    
    func countCheck() -> Void {
        if number1 == random1 && number2 == random2 && number3 == random3 {
        winingDialog()
        }
        else{
            if count < 5 {
                if count == 4 {
                    count += 1
                    shohToast(message: "والاخيرة \(count) : المحاولة رقم ")
                    losingDialog()                   //الخسارة
                }
                else{ count += 1
                    shohToast(message: "\(count) : المحاولة رقم ")}
            }else {
                start()
                count = 0
            }
        }
    }
    
 
    
    //Didload
    
//    func showAlertBtnClick(){
//        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlert") as! CustomAlertCV
//
//
//        //customAlert.deled
//
//    }
    
    
}



//Toast For Count

extension UIViewController{
    
    func shohToast(message : String){
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastTable = UILabel()
        toastTable.text = message
        toastTable.textAlignment = .center
        toastTable.font = UIFont.systemFont(ofSize: 18)
        toastTable.textColor = UIColor.white
        toastTable.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastTable.numberOfLines = 0
        
        let textSize = toastTable.intrinsicContentSize
        let labelHigh = ( textSize.width / window.frame.width ) * 60
        let labelWidth = min( textSize.width, window.frame.width - 20 )
        let adjustHeight = max( labelHigh, textSize.height + 80 )
        
        toastTable.frame = CGRect(x: 20, y: (window.frame.height - 90) - adjustHeight ,width :labelWidth, height: textSize.height)
        toastTable.center.x = window.center.x
        toastTable.layer.cornerRadius = 10
        toastTable.layer.masksToBounds = true
        
        window.addSubview(toastTable)
        
        UIView.animate(withDuration: 3.0, animations: {toastTable.alpha = 0} ) { (_) in
            toastTable.removeFromSuperview()
        }
        
    }
    
}

extension Int {
   static var randomNum : Int{
        return Int.random(in: 1...10)
    }
}



