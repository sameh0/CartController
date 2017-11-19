//
//  CartView.swift
//  CartIndicator
//
//  Created by sameh on 9/10/17.
//  Copyright © 2017 Radvy. All rights reserved.
//

import Foundation
import UIKit

public class CartIndicator:UIControl
{
    var holder:UIView!
    var plus:UIButton!
    var minus:UIButton!
    var indicator:UILabel?
    
    public var maxValue:Int?
    public var minValue:Int =  0
    
    public var color:UIColor?{
        didSet{
            holder.layer.borderColor = color?.cgColor
        }
    }
    
    public var plusImage:UIImage?{
        didSet{
            plus.setImage(self.plusImage, for: .normal)
            plus.setTitle(nil, for: .normal)
        }
    }
    
    public var minusImage:UIImage?{
        didSet{
            minus.setImage(self.minusImage, for: .normal)
            minus.setTitle(nil, for: .normal)
        }
    }
    
    public var plusText:String?{
        didSet{
            plus.setImage(nil, for: .normal)
            plus.setTitle(plusText, for: .normal)
            plus.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    public var minusText:String?{
        didSet{
            minus.setImage(nil, for: .normal)
            minus.setTitle(minusText, for: .normal)
            minus.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    public var buttonFont:UIFont?{
        didSet{
            plus.titleLabel?.font = buttonFont
            minus.titleLabel?.font = buttonFont
        }
    }
    
    public var labelFont:UIFont?{
        didSet{
            indicator?.font = labelFont
        }
    }
    
    public var value:Int = 0{
        didSet{
            indicator?.text = String(value)
            sendActions(for: .valueChanged)
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
        let containerWidth = holder.frame.width / 3
        
        //Containers
        let plusContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: holder.frame.height))
        let indicatorContainer = UIView(frame: CGRect(x: containerWidth, y: 0, width: containerWidth, height: holder.frame.height))
        let minusContainer = UIView(frame: CGRect(x: containerWidth * 2, y: 0, width: containerWidth, height: holder.frame.height))
        
        
        //Plus Sign
        plus = UIButton(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        plus.center = plusContainer.center
        plus.contentVerticalAlignment = .center
        plus.contentHorizontalAlignment = .center
        plus.imageView?.contentMode = .scaleAspectFit
        plusContainer.addSubview(plus)
        plus.addTarget(self, action: #selector(addValue), for: .touchDown)
        
        
        //Indicator Label
        indicator = UILabel(frame: CGRect(x: 0, y: 0, width: indicatorContainer.frame.width, height: indicatorContainer.frame.height))
        indicator?.textAlignment = .center
        indicator?.text = String(value)
        indicatorContainer.addSubview(indicator!)
        
        
        //Minus Sign
        minus = UIButton(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        minus.imageView?.contentMode = .scaleAspectFit
        minus.center = CGPoint(x: minusContainer.bounds.midX, y: minusContainer.bounds.midY)
        minusContainer.addSubview(minus)
        minus.addTarget(self, action: #selector(subtractValue), for: .touchDown)
        
        holder.addSubview(plusContainer)
        holder.addSubview(indicatorContainer)
        holder.addSubview(minusContainer)
        self.addSubview(holder)
        
        //Setting intial Value
    }
    
    
    @objc func addValue(){
        //let value = Int(indicator!.text!)!
        guard maxValue == nil else {
            
            if maxValue! >= value {
                return
            }
            else
            {
                value += 1
                //indicator?.text = String(value + 1)
            }
            
            return
            
        }
        value += 1
        //indicator?.text = String(value + 1)
        //self.sendActions(for: .valueChanged)
    }
    
    @objc func subtractValue(){
        if value <=  minValue
        {
            return
        }
        else
        {
            value -= 1
        }
    }
}
