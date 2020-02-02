//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Fumiya Motoyoshi on 2020/01/22.
//  Copyright © 2020 fumiya.motoyoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let initialimage = UIImage(named: "image1.jpg")
        imageView.image = initialimage
        
    }
    
    //表示している画像の番号
    var dispImageNo = 0
    
    //表示している画像の番号を元に画像を表示
    func displayImage() {
        
        //画像の名前の配列
        let imageNameArray = [
            "image1",
            "image2",
            "image3",
        ]
        
        //画像の番号が正常な範囲を指しているかチェック
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named: name)
        
        //Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    
    //画像をタップすると別の画面に遷移
    @IBAction func tapAction(_ sender: Any) {
        
        //segueから遷移先のResultViewControllerを取得する
        func prepare( fpr segue: UIStoryboardSegue, sender: Any?) {
            let _:ResultViewController = segue.destination as! ResultViewController
    
            //遷移先のResultViewControllerで宣言しているxに値（現在表示されている画像の番号）を代入して渡す
            var dispImageNo = 
            
            
        }
        
    }
    
    //遷移先から戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        //他の画面からsegueを使って戻ってきた時に呼ばれる
    }
    

    //進むボタン IBAction
    @IBAction func nextimage(_ sender: Any) {
        
        //表示している画像の番号を１増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    //戻るボタン
    @IBAction func previousimage(_ sender: Any) {
        
        //表示している画像の番号を１減らす
        dispImageNo -= 1
        
        //表示している画像に番号を元に画像を表示する
        displayImage()
    }
    
    //タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、imerによって、2秒毎に呼び出され続ける関数
    @objc func onTimer(_ timer: Timer) {
        
        //関数が呼ばれていることを確認
        print("onTimer")
        
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }

    //再生・一時停止ボタン
    
    @IBOutlet weak var playpauselabel: UIButton!
    
    @IBOutlet weak var nextimagelabel: UIButton!
    
    @IBOutlet weak var previmagelabel: UIButton!
    
    
    @IBAction func playpause(_ sender: Any) {
        
        // 再生ボタンを押すとタイマー作成、始動
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            playpauselabel.setTitle("停止", for: .normal) //タイマーが再生している＝nilではない状態
            nextimagelabel.isEnabled = false
            previmagelabel.isEnabled = false
        } else {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            playpauselabel.setTitle("再生", for: .normal)//タイマーが停止している＝nilの状態
            //停止ボタンをタップすると、無効になっている状態の進むボタンと戻るボタンをタップ可能にする
            //タイマーが停止している＝nilの状態
            nextimagelabel.isEnabled = true
            previmagelabel.isEnabled = true
        }
    }
    
  
    

}

