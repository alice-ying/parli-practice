//
//  Motion4ViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/10/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

class Motion4ViewController: UIViewController {

    @IBOutlet weak var motion4Title: UILabel!
    @IBOutlet weak var motion4Exp: UILabel!
    
    @IBOutlet weak var exit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
        
        motion4Title.numberOfLines = 2
        motion4Title.text = m4
        
        motion4Exp.lineBreakMode = .ByWordWrapping
        motion4Exp.numberOfLines = 0
        motion4Exp.text = m4Exp

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        motion4Exp.sizeToFit()
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
