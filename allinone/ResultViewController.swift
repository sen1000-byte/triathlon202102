//
//  ResultViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameTextView: UITextView!
    
    //値引継ぎ
    var scoreArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreArray.append(scoreArray[0] + scoreArray[1] + scoreArray[2])
        resultLabel.text = "１種目： \(scoreArray[0])\n２種目目：　\(scoreArray[1]) \n３種目目：　\(scoreArray[0])\n合計：　\(scoreArray[3]) "

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setImage() {
        
    }
    
    @IBAction func back() {
        //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
