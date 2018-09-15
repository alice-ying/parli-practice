//
//  Motion2ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/10/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class Motion2ViewController: UIViewController {

    @IBOutlet weak var motion2Title: UILabel!
    @IBOutlet weak var motion2Exp: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        motion2Title.numberOfLines = 2
        motion2Title.text = m2
        
        motion2Exp.lineBreakMode = .ByWordWrapping
        motion2Exp.numberOfLines = 0
        motion2Exp.text = m2Exp

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        motion2Exp.sizeToFit()
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
