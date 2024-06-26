//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Waqar Azim on 25/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isnight=false
    var body: some View {
        ZStack{
            BackgroundView(topcolor: isnight ? .black : .blue,
                           bottomcolor: isnight ?  .gray : .white);
            VStack{
               CityTextView(cityname: "Zurich,Switzerland")
                VStack(spacing:6){
                    Image(systemName: "cloud.sun.fill").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(height: 180)
                    
                    
                    Text("21°").font(.system(size: 75, weight: .medium)).foregroundColor(.white)
                }
                .padding(.bottom,30)
                HStack{
                    WeatherDayView(daysOfWeek: "TUE", imagename: "cloud.sun.fill", temp: 27)
                    WeatherDayView(daysOfWeek: "WED", imagename: "sun.haze.fill", temp: 27)
                    WeatherDayView(daysOfWeek: "THU", imagename: "cloud.sun.fill", temp: 26)
                    WeatherDayView(daysOfWeek: "FRI", imagename: "cloud.drizzle.fill", temp: 21)
                    WeatherDayView(daysOfWeek: "SAT", imagename: "cloud.heavyrain.fill", temp: 19)


                }
                Spacer()
                Button{
                    isnight.toggle()
                }label: {
                    Text("Change Day Time").frame(width:280 ,height: 50).background(Color.white).font(.system(size: 25,weight: .bold)).cornerRadius(15).foregroundColor(.primary)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var daysOfWeek:String
    var imagename:String
    var temp:Int
    
    
    
    var body: some View {
        VStack{
            Text(daysOfWeek).font(.system(size: 16,weight: .medium)).foregroundColor(.white)
            Image(systemName: imagename).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(height: 50)
            Text("\(temp)°").font(.system(size: 28, weight: .medium)).foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var topcolor:Color
    var bottomcolor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[topcolor,bottomcolor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
struct CityTextView: View {
    var cityname:String
    var body: some View {
        Text("\(cityname)")
            .font(.system(size:32,weight:.medium,design: .default)).foregroundColor(.white).padding()
    }
}
