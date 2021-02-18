//
//  ResultViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController, UITextFieldDelegate{
    
    //realmインスタンスなんかな？作った！
    let realm = try! Realm()
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameTextView: UITextField!
    
    //値引継ぎ
    var scoreArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreArray.append(scoreArray[0] + scoreArray[1] + scoreArray[2])
        resultLabel.text = "１種目： \(scoreArray[0])\n２種目目：　\(scoreArray[1]) \n３種目目：　\(scoreArray[2])\n合計：　\(scoreArray[3]) "

        nameTextView.text = "guest"
        nameTextView.delegate = self
        // Do any additional setup after loading the view.
        print(scoreArray)
    }
    
    //キーボードをreturnが押された時に閉じるようにする
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func setImage() {
        
    }
    
    
    @IBAction func back() {
        //セーブする
        //Realmに保存するよ
        //newSaveData　という保存するボックスを作る
        let newSaveData = saveFormat()
        //Realmの各要素に追加してく
        newSaveData.name = nameTextView.text ?? "guest"
        newSaveData.score = scoreArray[3]
        newSaveData.iconImage = ""
        //Realmに書き込む！
        try! self.realm.write{
            self.realm.add(newSaveData)
        }
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
