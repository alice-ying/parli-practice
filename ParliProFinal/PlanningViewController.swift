//
//  PlanningViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/7/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class PlanningViewController: UIViewController {

    @IBOutlet weak var mainMotion: UILabel!
    @IBOutlet weak var motion1: UILabel!
    @IBOutlet weak var motion2: UILabel!
    @IBOutlet weak var motion3: UILabel!
    @IBOutlet weak var motion4: UILabel!
    @IBOutlet weak var motion5: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    // starting time for the timer; seconds set to 60 so that decrementing it displays 59, 58, etc.
    var timer = NSTimer()
    var minutes = 12
    var seconds = 60
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    
    @IBOutlet weak var countDownDisplay: UILabel!
    
    // displays the motions that were stored in globally in the ViewController view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resumeButton.layer.cornerRadius = 5
        resumeButton.clipsToBounds = true
        pauseButton.layer.cornerRadius = 5
        pauseButton.clipsToBounds = true
        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        mainMotion.lineBreakMode = .ByWordWrapping
        mainMotion.numberOfLines = 0
        mainMotion.text = "Main motion: " + main
        
        motion1.lineBreakMode = .ByWordWrapping
        motion1.numberOfLines = 0
        motion1.text = "1. " + m1
        
        motion2.lineBreakMode = .ByWordWrapping
        motion2.numberOfLines = 0
        motion2.text = "2. " + m2
        
        motion3.lineBreakMode = .ByWordWrapping
        motion3.numberOfLines = 0
        motion3.text = "3. " + m3
        
        motion4.lineBreakMode = .ByWordWrapping
        motion4.numberOfLines = 0
        motion4.text = "4. " + m4
        
        motion5.lineBreakMode = .ByWordWrapping
        motion5.numberOfLines = 0
        motion5.text = "5. " + m5
    
    // creates and displays the initial time value on the timer; calls function update every second to update the timer display
        resumeButton.enabled = false
        resumeButton.backgroundColor = UIColor.grayColor()
        countDownDisplay.text = String(minutes) + ":00"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    // method that is called by the timer function above; series of conditionals used to display :00 instead of :60, and :05 instead of :5 for example
    func update(){
        if minutes >= 0 && seconds > 0{
            countDownDisplay.textColor = UIColor.blackColor()
            if seconds == 60{
                countDownDisplay.text = String(minutes - 1) + ":" + String(seconds - 1)
                minutes -= 1
                seconds -= 1
                
            }
            else if seconds <= 10{
                seconds -= 1
                countDownDisplay.text = String(minutes) + ":0" + String(seconds)
                if seconds == 0{
                    if minutes != 0{
                        seconds = 60
                    }
                }
            }
            else{
                seconds -= 1
                countDownDisplay.text = String(minutes) + ":" + String(seconds)
            }
        }
        else if minutes == 0 && seconds == 0{
            performSegueWithIdentifier("toRolePlay", sender: self)
            minutes -= 1
        }
    // turns lable display red when timer hits 1 min
        if minutes < 1 || minutes == 1 && seconds == 60{
            countDownDisplay.textColor = UIColor.redColor()
        }
    }
    
    // buttons are enabled/disabled according to what button is pressed; allows for more user-friendly experience by making clear what buttons can and can't be pressed at any given moment
    @IBAction func pause(sender: UIButton) {
        timer.invalidate()
        pauseButton.enabled = false
        pauseButton.backgroundColor = UIColor.grayColor()
        resumeButton.enabled = true
        resumeButton.backgroundColor = UIColor.blackColor()
    }
    
    @IBAction func resume(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        resumeButton.enabled = false
        resumeButton.backgroundColor = UIColor.grayColor()
        pauseButton.enabled = true
        pauseButton.backgroundColor = UIColor.blackColor()
    }
    
    @IBAction func toRolePlay(sender: UIButton) {
        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
