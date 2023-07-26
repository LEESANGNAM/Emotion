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
    
    
    @IBOutlet var labelBackgroundViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLabel()
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
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: Emotion.getString(.veryHappy)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.happy)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.soso)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.bad)())
        UserDefaults.standard.set(0, forKey: Emotion.getString(.sad)())
        
        setUpLabel()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
