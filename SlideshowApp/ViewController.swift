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


}

