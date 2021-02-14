//
//  CountViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit

class CountViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var countMain, count1, count2, count3, count4, count5: Int!
    
    var pushnumber: [Int] = [1,5,10, 15, 4]
    
    //タイマー導入
    var mainTimer: Timer!
    var totalTime: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        countMain = 0
        count1 = 0
        count2 = 0
        count3 = 0
        count4 = 0
        count5 = 0
        pushnumber.shuffle()
        label.text = String(countMain)
        
        totalTime = 0
        
        //ナビゲーションコントローラーの非表示設定
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mesureSec), userInfo: nil, repeats: true)
    }
    
    @objc func mesureSec() {
        totalTime += 1
        
    }
    
    //煩雑、もう少し簡単にしたい
    @IBAction func button(sender: UIButton) {
        switch sender.tag {
        case 1:
            if count1 < pushnumber[0] {
                count1 += 1
                countMain += 1
            }else{
                sender.backgroundColor = UIColor.darkGray
                sender.isEnabled = false
            }
        case 2:
            if count2 < pushnumber[1] {
                count2 += 1
                countMain += 1
            }else{
                sender.backgroundColor = UIColor.darkGray
                sender.isEnabled = false
            }
        case 3:
            if count3 < pushnumber[2] {
                count3 += 1
                countMain += 1
            }else{
                sender.backgroundColor = UIColor.darkGray
                sender.isEnabled = false
            }
        case 4:
            if count4 < pushnumber[3] {
                count4 += 1
                countMain += 1
            }else{
                sender.backgroundColor = UIColor.darkGray
                sender.isEnabled = false
            }
        case 5:
            if count5 < pushnumber[4] {
                count5 += 1
                countMain += 1
            }else{
                sender.backgroundColor = UIColor.darkGray
                sender.isEnabled = false
            }
        default:
            print("count_error")
        }
        label.text = String(countMain)

        
        //35までカウント出来たら次のページへ移る
        if countMain == 35 {
            //タイマーを止める
            if mainTimer.isValid {
                mainTimer.invalidate()
            }
            let alert: UIAlertController = UIAlertController(title: "クリア", message: "この種目のスコア： \(String(describing: self.totalTime))秒", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "次に進む", style: .default, handler: { action in
                self.performSegue(withIdentifier: "toColor", sender: nil)
                
                /*Segueを使わない時　ただし、storyboard内で繋いでる時は画面遷移がダブるためエラーになる
                let colorViewController = self.storyboard?.instantiateViewController(identifier: "Color") as! UINavigationController
                self.navigationController?.pushViewController(colorViewController, animated: true)
                 */
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //segue識別
//        if segue.identifier == "toColor" {
//            //遷移先のViewControllerを取得
//            let nextView = segue.destination as! ColorViewController
//            //画面をフルスクリーンにする
//            nextView.modalPresentationStyle = .fullScreen
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
