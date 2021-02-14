//
//  MazeViewController.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/13.
//

import UIKit
import CoreMotion

class MazeViewController: UIViewController {
    
    @IBOutlet var blockImage1: UIImageView!
    @IBOutlet var blockImage2: UIImageView!
    @IBOutlet var blockImage3: UIImageView!
    @IBOutlet var blockImage4: UIImageView!
    @IBOutlet var blockImage5: UIImageView!
    @IBOutlet var blockImage6: UIImageView!
    @IBOutlet var goalImageView: UIImageView!
    @IBOutlet var meImageView: UIImageView!
    //加速度を扱う
    let motionManager = CMMotionManager()
    
    //ブロックの進むベクトル値
    var vectBlock1: CGPoint = CGPoint(x: 2, y: 2)
    var vectBlock2: CGPoint = CGPoint(x: -2, y: 2)
    var vectBlock3: CGPoint = CGPoint(x: 2, y: -2)
    var vectBlock4: CGPoint = CGPoint(x: -2, y: -2)
    var vectBlock5: CGPoint = CGPoint(x: 0, y: 5)
    var vectBlock6: CGPoint = CGPoint(x: 5, y: 0)
    
    //自分の値
    var myAccelerationX: Double = 0.0
    var myAccelerationY: Double = 0.0
    var myLocationX: CGFloat!
    var myLocationY: CGFloat!
    
    //最初のブロックの位置取得
    var myFirstPosition: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFirstPosition = meImageView.frame.origin
        
        //0.01秒ごとにselectorを発動する
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(moveBlock), userInfo: nil, repeats: true)
        
        //加速度の設定
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {data, error in
                self.myAccelerationX = (data?.acceleration.x)! * 10
                self.myAccelerationY = (data?.acceleration.y)! * 10
                
                //壁に当たったかの時
                if self.meImageView.center.y <= self.meImageView.frame.height / 2{
                    self.myAccelerationY = 0
                    self.meImageView.center.y = self.meImageView.frame.height / 2 + 5
                }else if self.meImageView.center.y >= self.view.bounds.maxY - self.meImageView.frame.height / 2 {
                    self.myAccelerationY = 0
                    self.meImageView.center.y = self.view.bounds.maxY - self.meImageView.frame.height / 2 - 5
                }else if self.meImageView.center.x <= self.meImageView.frame.width / 2 {
                    self.myAccelerationX = 0
                    self.meImageView.center.x = self.meImageView.frame.width / 2 + 5
                }else if self.meImageView.center.x >= self.view.bounds.maxX - self.meImageView.frame.width / 2 {
                    self.myAccelerationX = 0
                    self.meImageView.center.x = self.view.bounds.maxX - self.meImageView.frame.width / 2 - 5
                }
                
                //位置を変更
                self.meImageView.center.x += CGFloat(self.myAccelerationX)
                self.meImageView.center.y -= CGFloat(self.myAccelerationY)
                
                //接触判定
                if self.meImageView.frame.intersects(self.blockImage1.frame) || self.meImageView.frame.intersects(self.blockImage2.frame) || self.meImageView.frame.intersects(self.blockImage3.frame) || self.meImageView.frame.intersects(self.blockImage4.frame) || self.meImageView.frame.intersects(self.blockImage5.frame) || self.meImageView.frame.intersects(self.blockImage6.frame) {
                    self.meImageView.frame.origin = self.myFirstPosition
                }
                if self.meImageView.frame.intersects(self.goalImageView.frame){
                    self.judgeAlert()
                }
            })
        }

        // Do any additional setup after loading the view.
    }
    
    func judgeAlert() {
        let alert: UIAlertController = UIAlertController(title: "クリア", message: "ボタンを押して結果を見る", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "結果を見る", style: .default, handler: {action in
            self.performSegue(withIdentifier: "toResult", sender: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func howToMoveBlock(sender: UIImageView){
        switch sender.tag {
        case 1:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock1.y = vectBlock1.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock1.y = vectBlock1.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock1.x = vectBlock1.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock1.x = vectBlock1.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock1.x
            sender.center.y += vectBlock1.y

        case 2:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock2.y = vectBlock2.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock2.y = vectBlock2.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock2.x = vectBlock2.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock2.x = vectBlock2.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock2.x
            sender.center.y += vectBlock2.y
            
        case 3:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock3.y = vectBlock3.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock3.y = vectBlock3.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock3.x = vectBlock3.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock3.x = vectBlock3.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock3.x
            sender.center.y += vectBlock3.y
        case 4:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock4.y = vectBlock4.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock4.y = vectBlock4.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock4.x = vectBlock4.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock4.x = vectBlock4.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock4.x
            sender.center.y += vectBlock4.y
        case 5:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock5.y = vectBlock5.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock5.y = vectBlock5.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock5.x = vectBlock5.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock5.x = vectBlock5.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock5.x
            sender.center.y += vectBlock5.y
        case 6:
            //壁に当たった時に反射するようにする
            if sender.center.y <= sender.bounds.height / 2{
                vectBlock6.y = vectBlock6.y * -1
            }else if sender.center.y >= self.view.bounds.maxY - sender.bounds.height / 2 {
                vectBlock6.y = vectBlock6.y * -1
            }else if sender.center.x <= sender.frame.width / 2 {
                vectBlock6.x = vectBlock6.x * -1
            }else if sender.center.x >= self.view.bounds.maxX - sender.frame.width / 2 {
                vectBlock6.x = vectBlock6.x * -1
            }
            //進む方に足していく
            sender.center.x += vectBlock6.x
            sender.center.y += vectBlock6.y
        default:
            break
        }
        
    }
    
    @objc func moveBlock() {
        howToMoveBlock(sender: blockImage1)
        howToMoveBlock(sender: blockImage2)
        howToMoveBlock(sender: blockImage3)
        howToMoveBlock(sender: blockImage4)
        howToMoveBlock(sender: blockImage5)
        howToMoveBlock(sender: blockImage6)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //segue識別
//        if segue.identifier == "toResult" {
//            //遷移先のViewControllerを取得
//            let nextView = segue.destination as! ResultViewController
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
