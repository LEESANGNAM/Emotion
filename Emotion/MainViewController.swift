//
//  ViewController.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/25.
//

import UIKit

class MainViewController: UIViewController {
    
    
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
        setUpResultLabes()
    }
    func setUpResultLabes(){
        for label in resultLabels{
            label.text = "0"
        }
    }
    
    func setUpViews(views: [UIView]){
        for view in views {
            view.backgroundColor = randomColor()
        }
    }
    
    func setUpButtonImage(buttons: [UIButton]){
        for button in buttons {
            let Imagename = "emoji\(button.tag+1)"
            button.setImage(UIImage(named: Imagename), for: .normal)
        }
    }
    
   
    func setValue(emotion: Emotion){
        var value = UserDefaults.standard.integer(forKey: Emotion.getString(emotion)())
        value = value + 1
        UserDefaults.standard.set(value, forKey: Emotion.getString(emotion)())
        
    }
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        
        let emotion = EmotionEnum[sender.tag]
        setValue(emotion: emotion)
//        switch emotion{
//        case .veryHappy:
//            setValue(emotion: emotion)
//        case .happy:
//            setValue(emotion: emotion)
//        case .soso:
//            setValue(emotion: emotion)
//        case .bad:
//            setValue(emotion: emotion)
//        case .sad:
//            setValue(emotion: emotion)
//        }
    }
    
    // 랜덤컬러
    func randomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            return color
        }

}

