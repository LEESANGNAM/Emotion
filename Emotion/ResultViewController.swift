//
//  ResultViewController.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultLabels: [UILabel]!
    let emotionEnum = Emotion.allCases
    
    @IBOutlet weak var pullDownButton: UIButton!
    
    @IBOutlet var labelBackgroundViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLabel()
        setUpPulldownButton()
        // Do any additional setup after loading the view.
    }
    // 탭바 넘어갈때 willappear 호출
    override func viewWillAppear(_ animated: Bool) {
        setUpLabel()
    }
    
    func setUpViews(){
        for view in labelBackgroundViews{
            setUpView(view: view)
        }
    }
    
    func setUpView(view: UIView){
        view.layer.cornerRadius = 10
        view.backgroundColor = randomColor()
    }
    
    func setUpLabel(){
        for i in 0...resultLabels.count - 1 {
            setData(index: i)
        }
    }
    func emotionValue(emotion: Emotion) -> Int{
        return  UserDefaults.standard.integer(forKey: "\(emotion)")
    }
    
    func setData(index : Int) {
        let emotion = emotionEnum[index]
        switch emotion{
        case .veryHappy:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .happy:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .soso:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .bad:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .sad:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        }
    }
    
    func setUpPulldownButton(){
        let firstButton = UIAction(title: "지수 모두 초기화") { _ in
            self.emotionResetAll()
        }
        let secondButton = UIAction(title: "완전행복지수 초기화") { _ in
            self.emotionReset(emotion: .veryHappy)
        }
        let thirdButton = UIAction(title: "적당미소지수 초기화") { _ in
            self.emotionReset(emotion: .happy)
        }
        let fourthButton = UIAction(title: "그냥그냥지수 초기화") { _ in
            self.emotionReset(emotion: .soso)
        }
        let fifthButton = UIAction(title: "속상한지수 초기화") { _ in
            self.emotionReset(emotion: .bad)
        }
        let sixthButton = UIAction(title: "많이슬픈지수 초기화") { _ in
            self.emotionReset(emotion: .sad)
        }
        let buttonMenu = UIMenu(children:
        [
            firstButton,secondButton,thirdButton,
            fourthButton,fifthButton,sixthButton
        ])
        pullDownButton.menu = buttonMenu
    }

    func emotionReset(emotion: Emotion){
        UserDefaults.standard.set(0, forKey: Emotion.getString(emotion)())
        guard let index = emotionEnum.firstIndex(of: emotion) else { print("오류 발생"); return }
        switch emotion {
        case .veryHappy:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .happy:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .soso:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .bad:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        case .sad:
            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
        }
        
    }
    
    func emotionResetAll(){
        UserDefaults.standard.set(0, forKey: Emotion.getString(.veryHappy)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.happy)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.soso)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.bad)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.sad)())
        setUpLabel()
    }
    
func randomColor() -> UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    return color
}

}
