//
//  settingsManager.swift
//  UVMap
//
//  Created by user227524 on 10/21/22.
//

import Foundation

class SettingsManager: ObservableObject{
    @Published var theme: Int
    @Published var prioritizeSchedule: Bool
    @Published var howEarly: Int
    
    init(){
        
    }
}
