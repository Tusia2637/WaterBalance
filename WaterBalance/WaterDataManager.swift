//
//  WaterDataManager.swift
//  WaterBalance
//
//  Created by Nataliia Nikitina on 3.07.2026.
//

import Foundation
import Combine


class WaterDataManager: ObservableObject {
    
    @Published var waterIntake: Double {
        didSet {
            
            UserDefaults.standard.set(waterIntake, forKey: "savedWaterIntake")
        }
    }
    
    let dailyGoal: Double = 2000.0
    
    init() {
       
        self.waterIntake = UserDefaults.standard.double(forKey: "savedWaterIntake")
    }
    
    func addGlass() {
        if waterIntake < dailyGoal {
            waterIntake += 250
        }
    }
    
    func resetProgress() {
        waterIntake = 0
    }
    
    var progressPercentage: Double {
        return min(waterIntake / dailyGoal, 1.0)
    }
}
