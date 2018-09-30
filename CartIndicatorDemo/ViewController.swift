//
//  ViewController.swift
//  CartIndicatorDemo
//
//  Created by sameh on 9/10/17.
//  Copyright © 2017 Radvy. All rights reserved.
//

import UIKit
import CartIndicator

class ViewController: UIViewController,CartControllerDelegate
{
    @IBOutlet weak var cartView: CartController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //cartView.plusImage = #imageLiteral(resourceName: "plusImage")
        //cartView.minusImage = #imageLiteral(resourceName: "minusImage")
        cartView.plusText = "+"
        cartView.minusText = "–"
        cartView.borderColor = UIColor.lightGray
        cartView.buttonsColor = .red
        cartView.font = UIFont.boldSystemFont(ofSize: 18.0)
        
    }

    func CartDidChange(operationType: ActionType, value: Int) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


