//
//  ContentView.swift
//  WaterBalance
//
//  Created by Nataliia Nikitina on 3.07.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataManager = WaterDataManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Водный Баланс")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.primary)  
                .padding(.top, 40)
            
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.15), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 220, height: 220)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(dataManager.progressPercentage))
                    .stroke(
                        LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 220, height: 220)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut, value: dataManager.waterIntake)
                
                VStack(spacing: 8) {
                    Text("\(Int(dataManager.waterIntake)) мл")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    Text("из \(Int(dataManager.dailyGoal)) мл")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Button(action: {
                dataManager.addGlass()
            }) {
                HStack {
                    Image(systemName: "drop.fill")
                    Text("Добавить стакан (250 мл)")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                dataManager.resetProgress()
            }) {
                Text("Очистить прогресс")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
