//
//  FirstViewController.swift
//  Interface
//
//  Created by Minh Huynh on 8/11/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var lbWelcome: UILabel!
    @IBOutlet var lbLogin: UILabel!
    @IBOutlet var btnLoginWithNumber: UIButton!
    @IBOutlet var btnLoginWithId: UIButton!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lbNotRegistered: UILabel!
    @IBOutlet var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let verticalLine = self.view.center.x
        let topPadding :CGFloat = 30
        
        
        self.title = "Đăng nhập"

        var cursorX = topPadding
        
        //imgView.frame.origin.y = topPadding + 120
        //imgView.center.x = verticalLine
        
        //lbWelcome.frame.origin.y = imgView.frame.origin.y + imgView.frame.height + 100
        //lbWelcome.center.x = verticalLine
        
        for subview : UIView in self.view.subviews {
            if subview.tag == 1 {
                subview.center.x = verticalLine
            }
        }
        
        //lbLogin.frame.origin.y = lbWelcome.frame.origin.y + lbWelcome.frame.height + 10
        //lbLogin.center.x = verticalLine
        
        //btnLoginWithNumber.frame.origin.y = lbLogin.frame.origin.y + lbLogin.frame.height + 20
        //btnLoginWithNumber.center.x = verticalLine

        //btnLoginWithId.frame.origin.y = btnLoginWithNumber.frame.origin.y + btnLoginWithNumber.frame.height + 10
        //btnLoginWithId.center.x = verticalLine
        
        //lbNotRegistered.frame.origin.y = btnLoginWithId.frame.origin.y + btnLoginWithId.frame.height + 20
        lbNotRegistered.center.x = verticalLine - btnRegister.frame.width/2
        
        //btnRegister.frame.origin.y = lbNotRegistered.frame.origin.y
        btnRegister.center.x = verticalLine + lbNotRegistered.frame.width/2
        
        imgView.layer.cornerRadius = 5
        
        btnLoginWithNumber.backgroundColor = UIColor.gray
        btnLoginWithNumber.titleLabel?.textColor = UIColor.white
        btnLoginWithNumber.layer.cornerRadius = 5
        btnLoginWithNumber.addTarget(self, action: #selector(present(sender:)), for: .touchUpInside)
        
        btnLoginWithId.backgroundColor = UIColor.gray
        btnLoginWithId.titleLabel?.textColor = UIColor.white
        btnLoginWithId.layer.cornerRadius = 5
        let iconNum = UIImage(named: "icon_phone.png")
        btnLoginWithNumber.setImage(iconNum, for: UIControlState.normal)
        let iconId = UIImage(named: "icon_id.png")
        btnLoginWithId.setImage(iconId, for: UIControlState.normal)
        
    }
    
    @objc func present(sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        secondViewController?.modalPresentationStyle = .overFullScreen
        self.present(secondViewController!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
