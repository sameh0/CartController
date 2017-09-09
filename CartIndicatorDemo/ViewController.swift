//
//  ViewController.swift
//  CartIndicatorDemo
//
//  Created by sameh on 9/10/17.
//  Copyright © 2017 Radvy. All rights reserved.
//

import UIKit
import CartIndicator

class ViewController: UIViewController {
    @IBOutlet weak var cartView: CartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cartView.plusImage = #imageLiteral(resourceName: "plusImage")
        cartView.minusImage = #imageLiteral(resourceName: "minusImage")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

