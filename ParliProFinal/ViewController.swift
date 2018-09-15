//
//  ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/7/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

// assings all motion lables to an empty string to be updated later using the actual motion name; these are stored globally so that the names can be accessed in other view controllers
var main: String = ""
var m1: String = ""
var m2: String = ""
var m3: String = ""
var m4: String = ""
var m5: String = ""

class ViewController: UIViewController {

// creates variables to be displayed with default numbers and unwrapped temporary values
// temporary variables are necessary because the actual values will be run through a series of loops
// by the end of the loop, the actual value will be 0, and the conditional to check if there are a total of 5 motions would not be executed properly.
    var numSub = 2
    var tempNS: Int!
    var numPriv = 1
    var tempNP: Int!
    var numInc = 1
    var tempNI: Int!
    var numBQ = 1
    var tempNBQ: Int!
    
    
    @IBOutlet weak var directions: UILabel!
    @IBOutlet weak var sub: UILabel!
    @IBOutlet weak var priv: UILabel!
    @IBOutlet weak var inc: UILabel!
    @IBOutlet weak var bq: UILabel!
    @IBOutlet weak var error: UILabel!
    
    @IBOutlet weak var sMinus: UIButton!
    @IBOutlet weak var sPlus: UIButton!
    @IBOutlet weak var pMinus: UIButton!
    @IBOutlet weak var pPlus: UIButton!
    @IBOutlet weak var iMinus: UIButton!
    @IBOutlet weak var iPlus: UIButton!
    @IBOutlet weak var bMinus: UIButton!
    @IBOutlet weak var bPlus: UIButton!
    @IBOutlet weak var gen: UIButton!
    
    @IBAction func generator(sender: UIButton) {
    
    // sets temp variables to the value entered by the user; the temp variable will not change, unlike the actual
        tempNS = numSub
        tempNP = numPriv
        tempNI = numInc
        tempNBQ = numBQ
        
    // lists created so that motions can be accessed through random indexing
        var mainMotions:[String] = ["that our chapter host a MedTalk", "that we partner with the local Red Cross Organization to conduct a fundraiser", "that our chapter distribute NAMI brochures", "that our chapter host a HOSA 5k", "that our chapter provide the high school with protein chewy bars for students on test day", "that our chapter provide Novi High School with a class set of the new edition of the medical careers book", "that our chapter provide Novi High School with new AEDs", "that our chapter hold an AIDS fundraiser", "that our chapter hold a blood drive", "that our chapter host a pennies-for-patients fundraiser", "that our chapter partner with the local NAMI organization to hold an educational booth at the upcoming health fair", "that our chapter provide Providence Park Hospital with more ambulances."]
        var subMotions: [String] = ["Lay on the Table", "Previous Question", "Limit/Extend the Limits of Debate", "Postpone Definitely", "Commit", "Amend", "Postpone Indefinitely", "Secondary Amendment"]
        var privMotions: [String] = ["Fix the time to Which to Adjourn", "Adjourn", "Recess", "Raise a Question of Privilege", /*"Call for the Orders of the Day"*/]
        var incMotions: [String] = ["Parliamentary Inquiry", "Request for Information", /*"Request to Read Papers", "Request for Permission to Withdraw/Modify a Motion", "Request to be Excused from Duty", "Request for Any Other Privilege",*/ "Point of Order", "Appeal", "Objection to the Consideration of the Question", "Suspend the Rules", "Division of a Question", "Division of the Assembly", /*"Consideration by Paragraph/Seriatim", "Motions Relating to Methods of Voting and the Polls", "Motions Relating to Nominations"*/]
        var bQMotions: Array<String> = ["Take from the Table", "Rescind", "Discharge a Committee", "Reconsider"]
        
    // randomly selects a motion from the lists above and places it in a random index of the motion list; the value at that index is then removed to prevent double motions
    // this ensures that random motions of each type are chosen, and that all 5 motions of varied type are ordered randomly
        if numSub + numPriv + numInc + numBQ == 5{
            var index: [Int] = [0,1,2,3,4]
            var motions = [String](count: 5, repeatedValue: "")
            
            while numSub > 0{
                motions[index.removeAtIndex(Int(arc4random_uniform(UInt32(index.count))))] = subMotions.removeAtIndex(Int(arc4random_uniform(UInt32(subMotions.count))))
                numSub = numSub - 1
            }
            while numPriv > 0{
                motions[index.removeAtIndex(Int(arc4random_uniform(UInt32(index.count))))] = privMotions.removeAtIndex(Int(arc4random_uniform(UInt32(privMotions.count))))
                numPriv = numPriv - 1
            }
            while numInc > 0{
                motions[index.removeAtIndex(Int(arc4random_uniform(UInt32(index.count))))] = incMotions.removeAtIndex(Int(arc4random_uniform(UInt32(incMotions.count))))
                numInc = numInc - 1
            }
            while numBQ > 0{
                motions[index.removeAtIndex(Int(arc4random_uniform(UInt32(index.count))))] = bQMotions.removeAtIndex(Int(arc4random_uniform(UInt32(bQMotions.count))))
                numBQ = numBQ - 1
            }
            
            main = mainMotions.removeAtIndex(Int(arc4random_uniform(UInt32(mainMotions.count))))
            m1 = motions[0]
            m2 = motions[1]
            m3 = motions[2]
            m4 = motions[3]
            m5 = motions[4]
            
            numSub = tempNS
            numPriv = tempNP
            numInc = tempNI
            numBQ = tempNBQ
        }
    }
    
    // updates the value of the label displayed through user interaction with incrementation buttons
    @IBAction func subPlus(sender: UIButton) {
        if numSub < 5{
            numSub += 1
            sub.text = String(numSub)
        }
    }

    @IBAction func privPlus(sender: UIButton) {
        if numPriv < 5{
            numPriv += 1
            priv.text = String(numPriv)
        }
    }
    
    @IBAction func incPlus(sender: UIButton){
        if numInc < 5{
            numInc += 1
            inc.text = String(numInc)
        }
    }
    
    @IBAction func bqPlus(sender: UIButton) {
        if numBQ < 5{
            numBQ += 1
            bq.text = String(numBQ)
        }
    }
    
    
    @IBAction func subMinus(sender: UIButton) {
        if numSub > 0{
            numSub -= 1
            sub.text = String(numSub)
        }
    }
    
    @IBAction func privMinus(sender: UIButton) {
        if numPriv > 0{
            numPriv -= 1
            priv.text = String(numPriv)
        }
    }
    
    @IBAction func incMinus(sender: UIButton) {
        if numInc > 0{
            numInc -= 1
            inc.text = String(numInc)
        }
    }
    
    @IBAction func bqMinus(sender: UIButton) {
         if numBQ > 0{
            numBQ -= 1
            bq.text = String(numBQ)
        }
    }
    
    // prevents segue from being performed if there aren't a total of 5 motions and prints an error message to notify the user
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if let ident = identifier {
            if ident == "toPlanning" {
                if tempNS + tempNP + tempNI + tempNBQ == 5 {
                    error.text = ""
                    sub.backgroundColor = UIColor.grayColor()
                    priv.backgroundColor = UIColor.grayColor()
                    inc.backgroundColor = UIColor.grayColor()
                    bq.backgroundColor = UIColor.grayColor()
                    return true
                }
            }
        }
        error.text = "Error: please enter 5 motions"
        sub.backgroundColor = UIColor.redColor()
        priv.backgroundColor = UIColor.redColor()
        inc.backgroundColor = UIColor.redColor()
        bq.backgroundColor = UIColor.redColor()
        return false
    }
    
    // creates rounded buttons when the page loads by setting a radius for each corner
    override func viewDidLoad() {
        super.viewDidLoad()
        
        directions.text = "Enter a total of 5 motions:"
        
        sMinus.layer.cornerRadius = 5
        sMinus.clipsToBounds = true
        sPlus.layer.cornerRadius = 5
        sPlus.clipsToBounds = true
        pMinus.layer.cornerRadius = 5
        pMinus.clipsToBounds = true
        pPlus.layer.cornerRadius = 5
        pPlus.clipsToBounds = true
        iMinus.layer.cornerRadius = 5
        iMinus.clipsToBounds = true
        iPlus.layer.cornerRadius = 5
        iPlus.clipsToBounds = true
        bMinus.layer.cornerRadius = 5
        bMinus.clipsToBounds = true
        bPlus.layer.cornerRadius = 5
        bPlus.clipsToBounds = true
        gen.layer.cornerRadius = 5
        gen.clipsToBounds = true
        
        error.text = ""
        
        sub.text = String(numSub)
        sub.layer.masksToBounds = true
        sub.layer.cornerRadius = 5
        
        priv.text = String(numPriv)
        priv.layer.masksToBounds = true
        priv.layer.cornerRadius = 5
        
        inc.text = String(numInc)
        inc.layer.masksToBounds = true
        inc.layer.cornerRadius = 5
        
        bq.text = String(numBQ)
        bq.layer.masksToBounds = true
        bq.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}