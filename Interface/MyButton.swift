//
//  MyButton.swift
//  Calculator
//
//  Created by Minh Huynh on 8/18/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class MyButton: UIButton{
    
    var myTitleColor, myBackgroundColor, myIsHighLightedColor: UIColor!
    
    
    init(frame: CGRect, myTitleColor: UIColor = UIColor.black, myBackgroundColor: UIColor = UIColor.white, myIsHighLightedColor: UIColor = UIColor.green) {
        self.myTitleColor = myTitleColor
        self.myBackgroundColor = myBackgroundColor
        self.myIsHighLightedColor = myIsHighLightedColor
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    convenience init (cursorX: CGFloat, cursorY: CGFloat, width: CGFloat, height: CGFloat) {
//        self.init(type: UIButton(frame: CGRect(x: cursorX, y: cursorY, width: width, height: height)))
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //self.frame = CGRect(x: cursorX, y: cursorY, width: width, height: height)
        //self.backgroundColor = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.0)
        self.titleLabel?.font = UIFont(name: "Arial", size: frame.height / 3)
        self.backgroundColor = myBackgroundColor
        self.setTitleColor(myTitleColor, for: UIControlState.normal)
        self.layer.borderColor = myIsHighLightedColor.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = frame.height / 2
        
        
    }
    
    
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.isHighlighted ? self.myIsHighLightedColor : self.myBackgroundColor
            }
            
        }
    }
}
