//
//  SecondViewController.swift
//  Interface
//
//  Created by Minh Huynh on 8/11/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var lbTitle:UILabel!
    @IBOutlet var btnClose: UIButton!
    @IBOutlet var lbNum: UILabel!
    @IBOutlet var textFieldNum: UITextField!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnSupport: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let verticalLine = self.view.frame.width/2
        
        btnClose.frame.origin.y = 20
        btnClose.center.x = 20
        
        lbTitle.center.y = btnClose.center.y
        lbTitle.frame.origin.x = btnClose.frame.origin.x + btnClose.frame.width + 10
        
        lbNum.frame.origin.y = lbTitle.frame.origin.y + lbTitle.frame.height + 300
        lbNum.center.x = verticalLine
        
        textFieldNum.frame.origin.y = lbNum.frame.origin.y + lbNum.frame.height + 10
        textFieldNum.center.x = verticalLine
        
        btnLogin.frame.origin.y = textFieldNum.frame.origin.y + textFieldNum.frame.height + 10
        btnLogin.center.x = verticalLine
        btnLogin.addTarget(self, action: #selector(present(sender:)), for: .touchUpInside)
        
        btnSupport.frame.origin.y = btnLogin.frame.origin.y + btnLogin.frame.height + 10
        btnSupport.center.x = verticalLine

        // Do any additional setup after loading the view.
        btnLogin.backgroundColor = UIColor.gray
        btnLogin.titleLabel?.textColor = UIColor.white
        btnLogin.layer.cornerRadius = 5
        btnSupport.backgroundColor = UIColor.white
        btnSupport.titleLabel?.textColor = UIColor.gray
        btnSupport.layer.cornerRadius = 5
        
        textFieldNum.keyboardType = UIKeyboardType.numberPad
        textFieldNum.delegate = self
        
        textFieldNum.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
    }
    
    @objc func present(sender: UIButton) {
        let value = textFieldNum.text
        if value!.count > 0 {
            let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")
            thirdViewController?.modalPresentationStyle = .overFullScreen
            self.present(thirdViewController!, animated: true, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        print(textField.text?.count)
        let value = textField.text
        
        if value!.count == 10 {
            btnLogin.sendActions(for: UIControlEvents.touchUpInside)
        } else if (value!.count > 10) {
            let str = value!.prefix(10)
            textField.text = String(str)
            btnLogin.sendActions(for: UIControlEvents.touchUpInside)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func login(){
        
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
