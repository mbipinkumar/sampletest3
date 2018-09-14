//
//  ViewController.swift
//  sampletest3
//
//  Created by bipin kumar on 3/10/18.
//  Copyright © 2018 bipin kumar. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var scrollVw: UIScrollView!
    var attributedText:NSAttributedString?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("somethin")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
        /*
        var label = UILabel()
        label.text = "ababababa"
        if let title = label.text{
            label.attributedText = title.getUnderLineAttributedText()
            print(label.attributedText as Any)
            text1.attributedText = label.attributedText
        }*/
        
        /*
        let main_string = "Hello World"
        let string_to_color = "World"
        
        let range = (main_string as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: main_string)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red , range: range)
        
        text1.attributedText = attribute
 */
        
        
        
        let textView: UITextView = UITextView()
        textView.frame = CGRect(x: 10, y: 200, width: 300, height: 40)
        textView.delegate = self
        self.view.addSubview(textView)
        
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        
          textView.attributedText = attributedString
        
        let view1 = UIView.init(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        view1.backgroundColor = UIColor.clear
        self.view.addSubview(view1)
        
        let imageView = UIImageView(image: UIImage(named: "photo.jpg"))
        imageView.frame = view1.bounds
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        view1.addSubview(imageView)
        
        let shape = CAShapeLayer()
        view1.layer.addSublayer(shape)
        shape.opacity = 0.5
        shape.lineWidth = 2
        shape.lineJoin = kCALineJoinMiter
        shape.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        shape.fillColor = UIColor(hue: 0.786, saturation: 0.15, brightness: 0.89, alpha: 1.0).cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 120, y: 20))
        path.addLine(to: CGPoint(x: 150, y: 90))
        path.addLine(to: CGPoint(x: 100, y: 250))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 150, y: 350))
        path.addLine(to: CGPoint(x: 100, y: 400))
        path.close()
        shape.path = path.cgPath
        
        
        //do some changes
        
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)

    }
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
        let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else{
                return
        }
        let contentInSect = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollVw.contentInset = contentInSect
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollVw.contentInset = UIEdgeInsets.zero
    }
    
   


}

extension String {
    func getUnderLineAttributedText() -> NSAttributedString {
        let stringg =  NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        let string =  NSMutableAttributedString(string: self, attributes: [.link: NSUnderlineStyle.styleSingle.rawValue])
    
        
        return string
    }
}

