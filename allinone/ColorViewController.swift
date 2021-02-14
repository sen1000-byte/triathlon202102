//
//  ColorViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var sampleImageView: UIImageView!
    @IBOutlet var makingImageView: UIImageView!
    
    var red: Int!
    var green: Int!
    var blue: Int!
    
    var makingRed: CGFloat!
    var makingGreen: CGFloat!
    var makingBlue: CGFloat!
    
    var whichColor: Int = 0
    
    //タイマー導入
    var mainTimer: Timer!
    var totalTime: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期化
        red = Int.random(in: 50...255)
        green = Int.random(in: 50...255)
        blue = Int.random(in: 50...255)
        makingRed = 0
        makingBlue = 0
        makingGreen = 0
        whichColor = 0
        
        totalTime = 0
        
        sampleImageView.backgroundColor = UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
        makingImageView.backgroundColor = UIColor(red: makingRed/255, green: makingGreen / 255, blue: makingBlue / 255, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mesureSec), userInfo: nil, repeats: true)
    }
    @objc func mesureSec() {
        totalTime += 1
    }
    
    //ジャッジする関数+=10は許す
    func  judge() {
        let gapRed:CGFloat! = abs(CGFloat(red) - makingRed)
        let gapGreen:CGFloat! = abs(CGFloat(green) - makingGreen)
        let gapBlue:CGFloat! = abs(CGFloat(blue) - makingBlue)
        
        if gapRed <= 20 && gapGreen <= 20 && gapBlue <= 20 {
            //タイマーを止める
            if mainTimer.isValid {
                mainTimer.invalidate()
            }
            let alert: UIAlertController = UIAlertController(title: "クリア", message: "この種目のスコア： \(String(describing: self.totalTime))秒", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "次へ進む", style: .default, handler: {action in
                self.performSegue(withIdentifier: "toMaze", sender: nil)
            } ))
            present(alert, animated: true, completion: nil)
        }
    }
    
    //タッチ開始の位置を所得
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        let maxy = self.view.bounds.maxY
        //タッチした場所によって変更
        if location.y <= maxy - 135 && location.y >= maxy - 185{
            whichColor = 3
        } else if location.y <= maxy - 205 && location.y >= maxy - 255{
            whichColor = 2
        }else if location.y <= maxy - 275 && location.y >= maxy - 325{
            whichColor = 1
        }else{
            whichColor = 0
        }
    }
    //タッチの位置を取得
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチの位置を取得
        let touch: UITouch = touches.first!
        let old: CGPoint = touch.previousLocation(in: self.view)
        let new: CGPoint = touch.location(in: self.view)
        
        switch whichColor {
        case 1:
            makingRed = makingRed + (new.x - old.x)
            if makingRed > 255 {
                makingRed = 255
            }else if makingRed < 0 {
                makingRed = 0
            }
        case 2:
            makingGreen = makingGreen + (new.x - old.x)
            if makingGreen > 255 {
                makingGreen = 255
            }else if makingGreen < 0 {
                makingGreen = 0
            }
        case 3:
            makingBlue = makingBlue + (new.x - old.x)
            if makingBlue > 255 {
                makingBlue = 255
            }else if makingBlue < 0 {
                makingBlue = 0
            }
        default:
            break
        }
        makingImageView.backgroundColor = UIColor(red: makingRed/255, green: makingGreen / 255, blue: makingBlue / 255, alpha: 1.0)
        judge()
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //segue識別
//        if segue.identifier == "toMaze" {
//            //遷移先のViewControllerを取得
//            let nextView = segue.destination as! MazeViewController
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
