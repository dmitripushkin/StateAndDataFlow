//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Повелитель on 06.11.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            UserNameText(user: user)
                .padding(.top, 60)
            CountDisplayedText(timer: timer)
                .padding(.top, 60)
            Spacer()
            StartButton(timer: timer)
                .padding(.bottom, 350)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct StartButton: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: {timer.startTimer()}) {
            Text(timer.buttonTitle)
                .font(.largeTitle)
                .foregroundColor(.yellow)
        }
        .frame(width: 200, height: 60)
        .background(.black)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.yellow, lineWidth: 3)
        )
        .shadow(color: .gray, radius: 5, x: 1, y: 1)
    }
}

struct CountDisplayedText: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Text("\(timer.counter)")
            .font(.system(size: 100))
            .foregroundColor(.red)
            .bold()
            .shadow(color: .gray, radius: 5, x: 1, y: 5)
    }
}

struct UserNameText: View {
    @ObservedObject var user: UserManager
    
    var body: some View {
        Text("Hello, \(user.name)!")
            .font(.title)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 3))
    }
}
