//
//  ResultViewController.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/25.
//

import UIKit

class ResultViewController: UIViewController {

    var veryHappyValue: Int = UserDefaults.standard.integer(forKey: "veryHappy")
    var HappyValue: Int = UserDefaults.standard.integer(forKey: "happy")
    var sosoValue: Int = UserDefaults.standard.integer(forKey: "soso")
    var badValue: Int = UserDefaults.standard.integer(forKey: "bad")
    var sadValue: Int = UserDefaults.standard.integer(forKey: "sad")
    
    @IBOutlet var resultLabels: [UILabel]!
    let emotionEnum = Emotion.allCases
    
    
    @IBOutlet var labelBackgroundViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        for i in 0...resultLabels.count - 1{
            setData(index: i)
        }
        // Do any additional setup after loading the view.
    }
    
    func setUpViews(){
        for view in labelBackgroundViews{
            setUpView(view: view)
        }
    }
    
    func setUpView(view: UIView){
        view.layer.cornerRadius = 10
    }
    
    
    
    func setData(index : Int) {
        switch emotionEnum[index]{
        case .veryHappy:
            resultLabels[index].text = "\(veryHappyValue)"
        case .happy:
            resultLabels[index].text = "\(HappyValue)"
        case .soso:
            resultLabels[index].text = "\(sosoValue)"
        case .bad:
            resultLabels[index].text = "\(badValue)"
        case .sad:
            resultLabels[index].text = "\(sadValue)"
        }
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
