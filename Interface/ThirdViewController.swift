//
//  ThirdViewController.swift
//  Interface
//
//  Created by Minh Huynh on 8/11/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var labelInput: UILabel!
    @IBOutlet var btnForget: UIButton!
    @IBOutlet var btnBackspace: UIButton!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var keyboardView: UIView!
    @IBOutlet var passcodeView: UIView!
    
    var btns = [MyButton]()
    let PASSCODE = "0000"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get safe area
//        var window : UIWindow!
//        var bottomPadding : CGFloat!
//        if #available(iOS 11.0, *) {
//            window = UIApplication.shared.keyWindow
//            bottomPadding = window?.safeAreaInsets.bottom
//        } else {
//            bottomPadding = self.bottomLayoutGuide.length
//        }
        let bottomPadding : CGFloat = 35
        let size : CGFloat = self.view.frame.width / 5
        let padding : CGFloat = size / 4
        let START_POS = (keyboardView.frame.width - 3*size - 2*padding) / 2
        var cursorX = START_POS
        var cursorY = START_POS
        
        
        labelInput.text = "Nhập mã cá nhân"
        labelInput.textAlignment = .center
        labelInput.center.x = self.view.center.x
        
        btnForget.setTitle("Bạn đã quên mã cá nhân?", for: .normal)
        btnForget.titleLabel?.attributedText = NSAttributedString(string: "Bạn đã quên mã cá nhân?", attributes: [NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue])
        btnForget.titleLabel?.textAlignment = .center
        btnForget.center.x = self.view.center.x
        
        
        
        
        let iconBackspace = UIImage(named: "backspace.png")
        btnBackspace.setImage(iconBackspace, for: .normal)
        btnBackspace.addTarget(self, action: #selector(backspace(sender:)), for: .touchUpInside)
        btnBackspace.center.y = passcodeView.center.y
        btnBackspace.alpha = 0
        
        
        for i in 1...10 {
            let button = MyButton(frame: CGRect(x: cursorX, y: cursorY, width: size, height: size))
            button.setTitle(String(i % 10), for: UIControlState.normal)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont(name: "Arial", size: 20)
            button.addTarget(self, action: #selector(addToPass(sender:)), for: UIControlEvents.touchUpInside)
            cursorX += size + padding
            if i % 3 == 0 {
                cursorX = START_POS
                cursorY += size + padding
                if i == 9 {
                    cursorX += size + padding
                }
            }
            keyboardView.addSubview(button)
        }
        keyboardView.center.x = self.view.center.x
        keyboardView.center.y = self.view.frame.height - bottomPadding - keyboardView.frame.width / 2 - btnCancel.frame.width
        
        btnCancel.setTitle("Hủy", for: .normal)
        btnCancel.titleLabel?.textAlignment = .center
        btnCancel.frame.origin.y = self.view.frame.height - bottomPadding - btnCancel.frame.height
        btnCancel.frame.origin.x = keyboardView.frame.origin.x + keyboardView.frame.width
        //keyboardView.frame.origin.x = btnCancel.frame.origin.x
        self.view.bringSubview(toFront: btnCancel)
        
        
        
        
        
        let size2 : CGFloat = 15
        let padding2 : CGFloat = size2 * 3
        let START_POS2 = (passcodeView.frame.width - 4*size2 - 3*padding2) / 2
        var cursorX2 = START_POS2
        let cursorY2 = passcodeView.frame.height / 2 - size2 / 2
        
        
        for _ in 1...4 {
            let button = MyButton(frame: CGRect(x: cursorX2, y: cursorY2, width: size2, height: size2))
            button.isUserInteractionEnabled = false
            cursorX2 += size2 + padding2
            passcodeView.addSubview(button)
            btns.append(button)
        }
        passcodeView.center.x = self.view.center.x
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func backspace(sender: UIButton) {
        for i in (0...3).reversed() {
            if btns[i].backgroundColor == btns[i].myIsHighLightedColor {
                UIView.animate(withDuration: 0.3, animations: {
                    self.btns[i].backgroundColor = self.btns[i].myBackgroundColor
                })
                if i == 0 {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.btnBackspace.alpha = 0
                    })
                }
                break
            }
        }
    }
    
    @objc func addToPass(sender: UIButton) {
        print(sender.titleLabel!.text)
        UIView.animate(withDuration: 0.3, animations: {
            self.btnBackspace.alpha = 1
        })
        for i in 0...3 {
            if btns[i].backgroundColor != btns[i].myIsHighLightedColor {
                UIView.animate(withDuration: 0.3, animations: {
                    self.btns[i].backgroundColor = self.btns[i].myIsHighLightedColor
                })
                
                btns[i].titleLabel?.text = sender.titleLabel?.text
                if i == 3 {
                    if check() {
                        //login if passcode is correct
                        login()
                    } else {
                        //clears all if passcode is wrong
                        for i in (0...3).reversed() {
                            if btns[i].backgroundColor == btns[i].myIsHighLightedColor {
                                UIView.animate(withDuration: 0.3, animations: {
                                    self.btns[i].backgroundColor = self.btns[i].myBackgroundColor
                                })
                            }
                        }
                        UIView.animate(withDuration: 0.3, animations: {
                            self.btnBackspace.alpha = 0
                        })
                    }
                }
                break
            }
        }
    }
    
    func login() {
        let fourthViewController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController")
        fourthViewController?.modalPresentationStyle = .overFullScreen
        self.present(fourthViewController!, animated: true, completion: nil)
    }
    
    func check() -> Bool{
        var passcode : String! = ""
        for i in 0...3 {
            if let str = btns[i].titleLabel?.text! {
                passcode = passcode + str
                
            }
        }
        print(passcode)
        if passcode == PASSCODE {
            return true
        } else {
            return false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
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
