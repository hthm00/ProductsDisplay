//
//  FirstCollectionView.swift
//  Interface
//
//  Created by Minh Huynh on 9/15/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class FirstCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var label : UILabel!
    
    var height : CGFloat!
    var width : CGFloat!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
        self.height = 92
        self.width = UIScreen.main.bounds.width
        self.frame  = CGRect(x: 0, y: 60, width: width , height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section : CGFloat = CGFloat(self.collectionView(collectionView, numberOfItemsInSection: indexPath.section))
        let spacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: Int(section))
        let cellWidth = (UIScreen.main.bounds.width - (section - 1) * spacing) / section
        self.label.frame = CGRect(x: 0, y: self.frame.origin.y + height, width: cellWidth, height: 2)
        
        return CGSize(width: cellWidth, height: 92)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        for subview in cell.contentView.subviews {
            subview.frame.origin.x = (cell.frame.width - subview.frame.width) / 2
            if let label = subview as? UILabel {
                label.text = "Hello"
            } else if let imgView = subview as? UIImageView {
                imgView.image = UIImage(named: "backspace.png")
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath)
        UIView.animate(withDuration: 0.4) {
            self.label.frame.origin.x = cell.frame.origin.x
        }
    }
    

    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
