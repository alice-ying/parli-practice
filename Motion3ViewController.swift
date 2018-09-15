//
//  Motion3ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/10/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class Motion3ViewController: UIViewController {

    @IBOutlet weak var motion3Title: UILabel!
    @IBOutlet weak var motion3Exp: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        motion3Title.numberOfLines = 2
        motion3Title.text = m3
        
        motion3Exp.lineBreakMode = .ByWordWrapping
        motion3Exp.numberOfLines = 0
        motion3Exp.text = m3Exp

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        motion3Exp.sizeToFit()
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
