//
//  ViewController.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/25.
//

import UIKit

class MainViewController: UIViewController {

    var veryHappyValue: Int = 0
    var HappyValue: Int = 0
    var sosoValue: Int = 0
    var badValue: Int = 0
    var sadValue: Int = 0
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    @IBOutlet var resultLabels: [UILabel]!
    @IBOutlet var backgroundViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
 
    
    func configUI(){
        setUpViews(views: backgroundViews)
        setUpButtonImage(buttons: emotionButtons)
        resetValue()
        setUpResultLabes()
    }
    func setUpResultLabes(){
        for label in resultLabels{
            label.text = "0"
        }
    }
    
    func setUpViews(views: [UIView]){
        for view in views {
            view.backgroundColor = RandomColor()
        }
    }
    
    func setUpButtonImage(buttons: [UIButton]){
        for button in buttons {
            let Imagename = "emoji\(button.tag+1)"
            button.setImage(UIImage(named: Imagename), for: .normal)
        }
    }
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        switch sender.tag{
        case Emotion.veryHappy.rawValue:
            veryHappyValue = veryHappyValue + 1
            resultLabels[sender.tag].text = "\(veryHappyValue)"
            print(Emotion.veryHappy,veryHappyValue)
        case Emotion.happy.rawValue:
            HappyValue = HappyValue + 1
            resultLabels[sender.tag].text = "\(HappyValue)"
            print(Emotion.happy,HappyValue)
        case Emotion.soso.rawValue:
            sosoValue = sosoValue + 1
            resultLabels[sender.tag].text = "\(sosoValue)"
            print(Emotion.soso,sosoValue)
        case Emotion.bad.rawValue:
            badValue = badValue + 1
            resultLabels[sender.tag].text = "\(badValue)"
            print(Emotion.bad,badValue)
        case Emotion.sad.rawValue:
            sadValue = sadValue + 1
            resultLabels[sender.tag].text = "\(sadValue)"
            print(Emotion.sad,sadValue)
        default: break
        }
    }
    
    // 랜덤컬러
    func RandomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            return color
        }
    // 값 초기화
    
    func resetValue(){
        var veryHappyValue = 0
        var HappyValue = 0
        var sosoValue = 0
        var badValue = 0
        var sadValue = 0
    }


}

