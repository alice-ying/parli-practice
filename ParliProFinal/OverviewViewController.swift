//
//  OverviewViewController.swift
//  ParliProFinal
//
//  Created by hying on 6/8/17.
//  Copyright © 2017 ayying. All rights reserved.
//

import UIKit

    // globally stored explanations for use in the individual motion view controllers
    var m1Exp: String!
    var m2Exp: String!
    var m3Exp: String!
    var m4Exp: String!
    var m5Exp: String!

class OverviewViewController: UIViewController {
    
    @IBOutlet weak var motion1: UIButton!
    @IBOutlet weak var motion2: UIButton!
    @IBOutlet weak var motion3: UIButton!
    @IBOutlet weak var motion4: UIButton!
    @IBOutlet weak var motion5: UIButton!

    // a dictionary is created with all motion names as keys and their explanations as values. This allows me to use the globally stored motion name variables in ViewController and easily access their corresponding explanations
    var motionExp = ["Lay on the Table" : "Wording: \"I move that the question be laid on the table.\" -OR- \"I move to lay the question on the table.\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: Negative vote only\n\nIn order when another has the floor: No",
        "Previous Question" : "Wording: \"I move the previous question.\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: No\n\nVote: 2/3\n\nReconsiderable: If affirmative vote and the ordered vote has not been taken yet -OR- if negative vote and substantial debate has occurred\n\nIn order when another has the floor: No",
        "Limit/Extend the Limits of Debate" : "Wording: \"I move that debate be limited/extended to .. speech(es) of... minutes for each member.\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: 2/3\n\nReconsiderable: If affirmative vote and motion hasn't been carried out yet -OR- if negative vote and substantial debate has occurred\n\nIn order when another has the floor: No",
        "Postpone Definitely" : "Wording: \" I move to postpone the question to...\" -OR- \"I move that the motion be postponed until... A.M./P.M.\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: If affirmative vote -OR- If negative vote and substantial debate has occurred\n\nIn order when another has the floor: No",
        "Commit" : "Wording: \"I move to refer the motion to...\" -OR- \"I move that the motion be referred to a committee of... to be appointed by the chair.\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: No",
        "Amend" : "Wording: \"I move to amend by adding/inserting/striking out/striking out and inserting the word(s)... before/after the word(s)...\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: No",
        "Postpone Indefinitely" : "Wording: \"I move that the motion be postponed indefinitely.\"\n\nSecond: Yes\n\nDebatable: Yes (debate can go onto main motion)\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: If affirmative vote\n\nIn order when another has the floor: No",
        "Secondary Amendment" : "Wording: \"I move to amend the amendment by adding/inserting/striking out/striking out and inserting the word(s)... before/after the word(s)...\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: No",
        "Fix the time to Which to Adjourn" : "Wording: \"I move that when this meeting adjourns, it adjourn to meet... at...\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: No",
        "Adjourn" : "Wording: \"I move to adjourn.\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: No",
        "Recess" : "Wording: \"I move to recess for...\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: No",
        "Raise a Question of Privilege" : "Wording: \"I rise to a question of privilege!\"\n\nSecond: No (unless raised in the form of a motion)\n\nDebatable: No\n\nAmendable: No\n\nVote: Chair rules\n\nReconsiderable: No\n\nIn order when another has the floor: If warranted by the urgency of the situation",
        "Call for the Orders of the Day" : "Wording: \"Madam President, I call for the orders of the day.\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: Chair rules; 2/3 to lay the orders of they day aside\n\nReconsiderable: No\n\nIn order when another has the floor: Yes",
        "Parliamentary Inquiry" : "Wording: \"I rise to a parliamentary inquiry!\" -OR- \"Parliamentary inquiry, Madame President!\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: Chair rules\n\nReconsiderable: No\n\nIn order when another has the floor: Yes (if it warrants immediate attention)",
        "Request for Information" : "Wording: \"Madame President, I have a request for information.\" -OR- \"A point of information, please.\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: Chair rules; Majority if made as a main motion\n\nReconsiderable: No\n\nIn order when another has the floor: Yes (if it warrants immediate attention)",
        "Request to Read Papers" : "Wording: \"If there is no objection, I would like to read...\" -OR- \"I move that permission to read a paper in debate be granted.\"\n\nSecond: No (except when moved formally by the maker of the request)\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: Yes (unless the speaker has begun to speak)",
        "Request for Permission to Withdraw/Modify a Motion" : "Wording: \"Madam President, I withdraw the motion.\" -OR- \"Madam President, I ask permission to withdraw the motion.\"\n\nSecond: No (except when moved formally by the maker of the request)\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: Negative vote only\n\nIn order when another has the floor: Yes (unless the speaker has begun to speak)",
        "Request to be Excused from Duty" : "Wording: \"I move that I be excused from...\" -OR- \"I move that the resignation be accepted.\"\n\nSecond: No (except when moved formally by the maker of the request)\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: Negative vote only and the member requesting to be excused has learned of the action taken on his/her request\n\nIn order when another has the floor: Yes (if it warrants immediate attention)",
        "Request for Any Other Privilege" : "Wording: Varies\n\nSecond: No (except when moved formally by the maker of the request)\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: Yes\n\nIn order when another has the floor: Yes (unless the speaker has begun to speak)",
        "Point of Order" : "Wording: \"Point of Order!\" -OR- \"I rise to a point of order.\" -OR- \"I make the point of order that...\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: Chair rules\n\nReconsiderable: No\n\nIn order when another has the floor: Yes",
        "Appeal" : "Wording: \"I appeal from the decision of the chair.\"\n\nSecond: Yes\n\nDebatable: Yes (limited to 1 speech of 10 minutes)\n\nAmendable: No\n\nVote: Majority in the negative\n\nReconsiderable: Yes\n\nIn order when another has the floor: Yes",
        "Objection to the Consideration of the Question" : "Wording: \"I object to the consideration of the question.\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: 2/3 in the negative to continue consideration\n\nReconsiderable: Negative vote only\n\nIn order when another has the floor: Yes (until debate has begun)",
        "Suspend the Rules" : "Wording: \"I move to suspend the rules which interfere with...\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: No\n\nVote: 2/3\n\nReconsiderable: No\n\nIn order when another has the floor: No",
        "Division of a Question" : "Wording: \"I move to divide the resolution so as to consider separately...\" -OR- \"I move to divide the resolution into … parts as follows:...\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: No",
        "Division of the Assembly" : "Wording: \"Division!\"\n\nSecond: No\n\nDebatable: No\n\nAmendable: No\n\nVote: N/A\n\nReconsiderable: No\n\nIn order when another has the floor: Yes",
        "Consideration by Paragraph/Seriatim" : "Wording: \"I move that the resolution be considered by paragraph.\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: No", "Take from the Table" : "Wording: \"I move to take from the table the motion relating to...\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: No",
        "Rescind" : "Wording: \"In accordance with notice given at the last meeting, I move to rescind the resolution that...\" -OR- \"I move that the resolution relating to... adopted on [date] be rescinded.\" -OR- \"I move to rescind the motion relating to... adopted at the... meeting.\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: 2/3; Majority with previous notice\n\nReconsiderable: Negative vote only\n\nIn order when another has the floor: No",
        "Discharge a Committee" : "Wording: \"[standing committee] I move that the... committee be discharged from further consideration of the resolution relating to...\"; [special committee] \"I move that the committee to which was referred the resolution relating to... be discharged.\"\n\nSecond: Yes\n\nDebatable: Yes\n\nAmendable: Yes\n\nVote: 2/3; Majority with previous notice\n\nReconsiderable: Negative vote only\n\nIn order when another has the floor: No",
        "Reconsider" : "Wording: \"[main motion] I move to reconsider the vote on the motion relating to...\"; \"[secondary motions while main motion is pending] I move to reconsider the vote on the amendment striking out... and inserting...\" -OR- \"[secondary motions when main motion has been acted upon] I move to reconsider the votes on the motion relating to... and on the amendment to...\"\n\nSecond: Yes\n\nDebatable: Yes (if the motion being reconsidered is)\n\nAmendable: No\n\nVote: Majority\n\nReconsiderable: No\n\nIn order when another has the floor: Yes (unless the speaker has begun to speak)",
        "Motions Relating to Methods of Voting and the Polls" : "Wording: \"[voting] I move that the vote be counted.\" -OR- \"I move that the vote on this question be taken by rising and be counted.\" -OR- \"I move that the vote be taken by ballot.\"; [polls] \"Have all voted who wish to do so? If no one else wishes to vote... the polls are closed.\" -OR- \"I move that the polls be closed/reopened\"\n\nSecond: Yes\n\nDebatable: No\n\nAmendable: Yes\n\nVote: Majority; 2/3 to close polls\n\nReconsiderable: [reopen polls] Negative vote only; [close polls] No; [other motions] Yes\n\nIn order when another has the floor: No",
        "Motions Relating to Nominations" : "Wording: \"I nominate...\" -OR- \"I move that nominations be closed/reopened.\" -OR- \"I move that candidates for service on the committee be nominated from the floor.\"\n\nSecond: Yes (except for an actual nomination)\n\nDebatable: No (except for an actual nomination)\n\nAmendable: Yes (except for an actual nomination)\n\nVote: Majority; 2/3 to close nominations\n\nReconsiderable: [reopen nominations] Negative vote only; [nominations, nominee not yet notified] Negative vote only; [close nominations] No\n\nIn order when another has the floor: No"]
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // changes the button label display according to what motions were randomly generated earlier
        motion1.setTitle(m1, forState: UIControlState.Normal)
        motion2.setTitle(m2, forState: UIControlState.Normal)
        motion3.setTitle(m3, forState: UIControlState.Normal)
        motion4.setTitle(m4, forState: UIControlState.Normal)
        motion5.setTitle(m5, forState: UIControlState.Normal)
        
        // assigns global exp variables a value according to the motions generated
        m1Exp = motionExp[m1]
        m2Exp = motionExp[m2]
        m3Exp = motionExp[m3]
        m4Exp = motionExp[m4]
        m5Exp = motionExp[m5]
        
        exit.layer.cornerRadius = 5
        exit.clipsToBounds = true
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
