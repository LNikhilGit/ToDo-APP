//
//  LoginHeaderView.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import SwiftUI

struct LoginHeaderView: View {
    
    let title : String
    let subtitle: String
    let angle : Double
    let backgroundColor: Color
    var delay: Double = 0
    @State private var scale: CGFloat = 0.5
    var body: some View {
        ZStack {
            //RoundedRectangle(cornerRadius: 0)
            Circle()
                .foregroundColor(backgroundColor)
            .rotationEffect(Angle(degrees: angle))
            .scaleEffect(scale)
                        .animation(
                            Animation.easeInOut(duration: 0.6)
                               // 2. << link to value
                        )
                        .onAppear {
                            self.scale = 1    // 3. << withAnimation no needed now
                        }
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 50)

        }
        .frame(width: UIScreen.main.bounds.width * 6, height: 455)
        .offset(y: -170)
    }
}

#Preview {
    LoginHeaderView(title: "", subtitle: "", angle: 15, backgroundColor: .red)
}

