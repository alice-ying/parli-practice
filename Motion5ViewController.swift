//
//  Motion5ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/10/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class Motion5ViewController: UIViewController {

    @IBOutlet weak var motion5Title: UILabel!
    @IBOutlet weak var motion5Exp: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        motion5Title.numberOfLines = 2
        motion5Title.text = m5
        
        motion5Exp.lineBreakMode = .ByWordWrapping
        motion5Exp.numberOfLines = 0
        motion5Exp.text = m5Exp

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        motion5Exp.sizeToFit()
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
