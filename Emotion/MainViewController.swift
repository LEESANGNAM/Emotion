//
//  ViewController.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/25.
//

import UIKit

class MainViewController: UIViewController {
    
    var veryHappyValue: Int = UserDefaults.standard.integer(forKey: "veryHappy")
    var HappyValue: Int = UserDefaults.standard.integer(forKey: "Happy")
    var sosoValue: Int = UserDefaults.standard.integer(forKey: "soso")
    var badValue: Int = UserDefaults.standard.integer(forKey: "bad")
    var sadValue: Int = UserDefaults.standard.integer(forKey: "sad")
    
    let EmotionEnum = Emotion.allCases
    
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
        switch EmotionEnum[sender.tag]{
        case .veryHappy:
            veryHappyValue = veryHappyValue + 1
            UserDefaults.standard.set(veryHappyValue, forKey: Emotion.getString(.veryHappy)())
            print(Emotion.veryHappy,veryHappyValue)
        case .happy:
            HappyValue = HappyValue + 1
            UserDefaults.standard.set(HappyValue, forKey: Emotion.getString(.happy)())
            print(Emotion.happy,HappyValue)
        case .soso:
            sosoValue = sosoValue + 1
            UserDefaults.standard.set(sosoValue, forKey: Emotion.getString(.soso)())
            print(Emotion.soso,sosoValue)
        case .bad:
            badValue = badValue + 1
            UserDefaults.standard.set(badValue, forKey: Emotion.getString(.bad)())
            print(Emotion.bad,badValue)
        case .sad:
            sadValue = sadValue + 1
            UserDefaults.standard.set(sadValue, forKey: Emotion.getString(.sad)())
            print(Emotion.sad,sadValue)
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

