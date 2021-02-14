//
//  ViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue識別
        if segue.identifier == "toCount" {
            //遷移先のViewControllerを取得
            let nextView = segue.destination as! CountViewController
            //画面をフルスクリーンにする
            //nextView.modalPresentationStyle = .fullScreen
        }
        
        if segue.identifier == "toRanking" {
            let nextView = segue.destination as! RankingViewController
            //nextView.modalPresentationStyle = .fullScreen
            //navigationController?.navigationBar.isHidden = false
        }
    }

 
 
    
    @IBAction func next() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toCount") as! CountViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
     */

}

