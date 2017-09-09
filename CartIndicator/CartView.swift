//
//  CartView.swift
//  CartIndicator
//
//  Created by sameh on 9/10/17.
//  Copyright © 2017 Radvy. All rights reserved.
//

import Foundation
import UIKit

public class CartView:UIControl
{
    var holder:UIView!
    var plus:UIButton!
    var minus:UIButton!
    var indicator:UILabel!
    public var maxValue:Int?
    public var minValue:Int =  0
    
    public var plusImage:UIImage?{
        didSet{
            plus.setImage(self.plusImage, for: .normal)
        }
    }
    public var minusImage:UIImage?{
        didSet{
            minus.setImage(self.minusImage, for: .normal)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initalizing()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        initalizing()
    }
    
    private func initalizing() {
        
        holder = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        holder.layer.cornerRadius = holder.frame.height / 2
        holder.layer.borderWidth = 1.0
        holder.layer.borderColor = UIColor.black.cgColor
        
        let itemWidth = holder.frame.width / 6
        let itemHeight = holder.frame.height / 2
        
        plus = UIButton(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        plus.setImage(self.plusImage ?? UIImage(), for: .normal)
        plus.addTarget(self, action: #selector(addValue), for: .touchDown)
        
        let indWidth = ((holder.frame.width / 2 ) - (itemWidth / 2 ))
        indicator = UILabel(frame: CGRect(x: indWidth, y: 0, width: itemWidth, height: frame.height))
        indicator?.text = "0"
        indicator.textAlignment = .center
        
        minus = UIButton(frame: CGRect(x: (frame.width - itemWidth), y: 0, width: itemWidth, height: itemHeight))
        minus.setImage(self.minusImage ?? UIImage(), for: .normal)
        minus.addTarget(self, action: #selector(subtractValue), for: .touchDown)
        
        
        holder.addSubview(plus)
        holder.addSubview(indicator)
        holder.addSubview(minus)
        self.addSubview(holder)
    }
    
    
     func addValue(){
        let value = Int(indicator!.text!)!
        
        guard maxValue == nil else {
            
            if maxValue! >= value {
                return
            }
            else
            {
                indicator?.text = String(value + 1)
            }
            
            return
            
        }
        indicator?.text = String(value + 1)
        
    }
    
     func subtractValue(){
        let value = Int(indicator!.text!)!
        if value <=  minValue
        {
            return
        }
        else
        {
            indicator?.text = String(value - 1)
        }
    }
}
