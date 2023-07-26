//
//  EmotionEnum.swift
//  Emotion
//
//  Created by 이상남 on 2023/07/26.
//

import Foundation


enum Emotion: Int, CaseIterable {
    case veryHappy, happy, soso, bad, sad
    
    func getString() -> String {
        switch self{
            
        case .veryHappy:
            return "veryHappy"
        case .happy:
            return "happy"
        case .soso:
            return "soso"
        case .bad:
            return "bad"
        case .sad:
            return "sad"
        }
    }
}
