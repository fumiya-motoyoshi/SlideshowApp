//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Fumiya Motoyoshi on 2020/02/02.
//  Copyright © 2020 fumiya.motoyoshi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //UIImageView（拡大画像表示用）をOutlet接続
    @IBOutlet weak var extendedImage: UIImageView!
        
    //表示されている画像の番号を受け取るためのプロパティを宣言しておく
    var x:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
        }
    

    
        //表示している画像の番号を元に画像を表示
        func displayImage() {
            
            //画像の名前の配列
            let imageNameArray = [
                "image1",
                "image2",
                "image3",
            ]
        
            //viewControllerから表示されている画像の番号を取得する(xに数値を代入)
            let dispImageNo = x
            
            //表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]
            
            //画像を読み込み
            let image = UIImage(named: name)
            
            //extendedImageに読み込んだ画像をセット
            extendedImage.image = image
            
    
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


