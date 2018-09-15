//
//  Motion1ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/10/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

// all individual view controllers work the same (Motion1, Motion2... Motion5)
class Motion1ViewController: UIViewController {

    // displays motion name at the top of the screen
    @IBOutlet weak var motion1Title: UILabel!
    @IBOutlet weak var motion1Exp: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        // restricts title display to 2 lines and truncates it in the middle
        motion1Title.numberOfLines = 2
        motion1Title.text = m1
        
        // displays the explanation that was sotred globally and wraps the words in a label of variable size. This is done by setting the number of lines to 0 and changing the display using .lineBreakMode from truncation to word wrapping
        motion1Exp.lineBreakMode = .ByWordWrapping
        motion1Exp.numberOfLines = 0
        motion1Exp.text = m1Exp
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        motion1Exp.sizeToFit()
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
