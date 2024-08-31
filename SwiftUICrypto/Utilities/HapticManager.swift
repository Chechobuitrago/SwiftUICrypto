//
//  HapticManager.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 30/08/24.
//

import Foundation
import SwiftUI

class HapticManager {
    
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
