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
    var timer = Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、imerによって、2秒毎に呼び出され続ける関数
    @objc func onTimer(timer: Timer) {
        
        //関数が呼ばれていることを確認
        print("onTimer")
        
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }

    //再生・一時停止ボタン
    @IBAction func playpause(_ sender: Any) {
        
        // 再生ボタンを押すとタイマー作成、始動
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
    
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
    
    

}

