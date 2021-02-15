//
//  ViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    var scoreArray: [Int] = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let saveData: UserDefaults = UserDefaults.standard
//        saveData.setValue(scoreArray, forKey: "Time")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue識別
        if segue.identifier == "toCount" {
            //遷移先のViewControllerを取得
            let nextView = segue.destination as! CountViewController
            nextView.scoreArray = scoreArray
        }
        
//        if segue.identifier == "toRanking" {
//            let nextView = segue.destination as! RankingViewController
//            //nextView.modalPresentationStyle = .fullScreen
//            //navigationController?.navigationBar.isHidden = false
//        }
    }

 
 /*
    
    @IBAction func next() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toCount") as! CountViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
     */

}

