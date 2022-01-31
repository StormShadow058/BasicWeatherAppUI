//
//  ContentView.swift
//  BasicWeather
//
//  Created by Vansh Maheshwari on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            GradientView(isNight: $isNight)
            VStack {
                CityView(cityName: "New Delhi")
                
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: isNight ? 9 : 14)
                
                Spacer()
                
                HStack(spacing: 20) {
                    DaysView(weekDay: "MON",
                             weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                             temp: isNight ? 4 : 9)
                    DaysView(weekDay: "TUE",
                             weatherImage: isNight ? "moon.fill" : "sun.max.fill",
                             temp: isNight ? 5 : 10)
                    DaysView(weekDay: "WED",
                             weatherImage: isNight ? "moon.fill" : "sun.max.fill",
                             temp: isNight ? 4 : 9)
                    DaysView(weekDay: "THU",
                             weatherImage: isNight ? "moon.stars.fill" : "cloud.bolt.fill",
                             temp: isNight ? 7 : 12)
                    DaysView(weekDay: "FRI",
                             weatherImage: isNight ? "moon.fill" : "cloud.drizzle.fill",
                             temp: isNight ? 5 : 10)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                },
                label: {
                    BigButtonView(nameOfButton: "Change Time of Day", textColor: .blue, bgColor: .white)
                })
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DaysView: View {
    
    var weekDay: String
    var weatherImage: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(weekDay)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .medium, design: .rounded))
        }
    }
}

struct GradientView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                      isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 7) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct BigButtonView: View {
    
    var nameOfButton: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(nameOfButton)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(bgColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(50)
    }
}
