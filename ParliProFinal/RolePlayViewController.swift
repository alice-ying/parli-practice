//
//  RolePlayViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/7/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class RolePlayViewController: UIViewController {
   
    // timer functions the same as that in the Planning view controller, except that the initial value is set to 9:00 for the main timer and 1:00 for the secretary timer
    var timer = NSTimer()
    var minutes = 9
    var seconds = 60
    @IBOutlet weak var countDownDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var exit: UIButton!
    
    var secrTimer = NSTimer()
    var secrMinutes = 1
    var secrSeconds = 60
    @IBOutlet weak var secrCountDown: UILabel!
    
    @IBAction func start(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        startButton.enabled = false
        startButton.backgroundColor = UIColor.grayColor()
        pauseButton.enabled = true
        pauseButton.backgroundColor = UIColor.blackColor()
        restartButton.enabled = true
        restartButton.backgroundColor = UIColor.blackColor()
        doneButton.enabled = true
        doneButton.backgroundColor = UIColor.blackColor()
    }
    
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
            secrTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("secrUpdate"), userInfo: nil, repeats: true)
            minutes -= 1
            pauseButton.enabled = false
            pauseButton.backgroundColor = UIColor.grayColor()
            restartButton.enabled = false
            restartButton.backgroundColor = UIColor.grayColor()
            doneButton.enabled = false
            doneButton.backgroundColor = UIColor.grayColor()
        }
        if minutes < 1 || minutes == 1 && seconds == 60{
            countDownDisplay.textColor = UIColor.redColor()
        }
    }
    
    @IBAction func restart(sender: UIButton) {
        timer.invalidate()
        minutes = 9
        seconds = 60
        countDownDisplay.text = String(minutes) + ":00"
        restartButton.enabled = false
        restartButton.backgroundColor = UIColor.grayColor()
        pauseButton.enabled = false
        pauseButton.backgroundColor = UIColor.grayColor()
        startButton.setTitle("Start", forState: UIControlState.Normal)
        startButton.backgroundColor = UIColor.blackColor()
        startButton.enabled = true
        doneButton.enabled = false
        doneButton.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func pause(sender: UIButton) {
        timer.invalidate()
        pauseButton.enabled = false
        pauseButton.backgroundColor = UIColor.grayColor()
        startButton.enabled = true
        startButton.backgroundColor = UIColor.blackColor()
        startButton.setTitle("Resume", forState: UIControlState.Normal)
    }
    
    // automatically starts the secretary timer when done is pressed, while also pausing the main timer.
    @IBAction func done(sender: UIButton) {
        secrTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("secrUpdate"), userInfo: nil, repeats: true)
        doneButton.enabled = false
        doneButton.backgroundColor = UIColor.grayColor()
        startButton.enabled = false
        startButton.backgroundColor = UIColor.grayColor()
        pauseButton.enabled = false
        pauseButton.backgroundColor = UIColor.grayColor()
        restartButton.enabled = false
        restartButton.backgroundColor = UIColor.grayColor()
        timer.invalidate()
    }
    
    func secrUpdate(){
        if secrSeconds > 0 && secrMinutes >= 0{
            if secrSeconds == 60{
                secrCountDown.text = String(secrMinutes - 1) + ":" + String(secrSeconds - 1)
                secrMinutes -= 1
                secrSeconds -= 1
            }
            else if secrSeconds <= 10 {
                secrCountDown.textColor = UIColor.redColor()
                secrCountDown.text = String(secrMinutes) + ":0" + String(secrSeconds - 1)
                secrSeconds -= 1
            }
            else{
                if secrSeconds == 11{
                    secrCountDown.textColor = UIColor.redColor()
                }
                secrCountDown.text = String(secrMinutes) + ":" + String(secrSeconds - 1)
                secrSeconds -= 1
            }
        }
        else if secrMinutes == 0 && secrSeconds == 0{
            performSegueWithIdentifier("toOverview", sender: self)
            secrMinutes -= 1
        }

    }
    
    @IBAction func toOverview(sender: UIButton) {
        timer.invalidate()
        secrTimer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.layer.cornerRadius = 5
        pauseButton.clipsToBounds = true
        startButton.layer.cornerRadius = 5
        startButton.clipsToBounds = true
        restartButton.layer.cornerRadius = 5
        restartButton.clipsToBounds = true
        doneButton.layer.cornerRadius = 5
        doneButton.clipsToBounds = true
        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        restartButton.enabled = false
        restartButton.backgroundColor = UIColor.grayColor()
        pauseButton.enabled = false
        pauseButton.backgroundColor = UIColor.grayColor()
        doneButton.enabled = false
        doneButton.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view.
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
