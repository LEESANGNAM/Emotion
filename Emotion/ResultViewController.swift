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
    
    
    func setUpLabel(){
        for emotion in emotionEnum{
            setData(emotion: emotion)
        }
    }
    func emotionValue(emotion: Emotion) -> Int{
        return  UserDefaults.standard.integer(forKey: "\(emotion)")
    }
    
    func setData(emotion : Emotion) {
        // 이모션에 해당하는 값이 allCase배열에 없으면 오류고(case 만큼의 표현을 할 레이블) 있으면 해당 레이블의 index를 뽑는다.
        guard let index = emotionEnum.firstIndex(of: emotion) else {
            print("오류 발생")
            return
        }
        // switch case 로 처리를 안해도 각 자 맞는걸로 처리할 것 같다.
        // 새로운 case가 생기면 switch 를 쓰면 case 를 추가해주는 에러가 떠서 바로 추가 해 줄 수 있을 것 같다.
        // 한줄로 처리하면 더 간단?해보인다.
        resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        let emotion = emotionEnum[index]
//        switch emotion{
//        case .veryHappy:
//            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        case .happy:
//            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        case .soso:
//            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        case .bad:
//            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        case .sad:
//            resultLabels[index].text = "\(emotionValue(emotion: emotion))"
//        }
    }
    

    func emotionReset(emotion: Emotion){
        UserDefaults.standard.set(0, forKey: Emotion.getString(emotion)())
        setData(emotion: emotion)
    }
    
    func emotionResetAll(){
        for emotion in emotionEnum {
            emotionReset(emotion: emotion)
        }
    }
    
func randomColor() -> UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    return color
}

}
