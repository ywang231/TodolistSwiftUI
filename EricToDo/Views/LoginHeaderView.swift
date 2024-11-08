//
//  LoginHeaderView.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct LoginHeaderView: View {
    let backgroundColor : Color
    let rotateDegree: Double
    let title : String
    let subtitle : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(self.backgroundColor)
                .rotationEffect(Angle(degrees: self.rotateDegree))
            VStack {
                Text(self.title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(self.subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300)
        .offset(y:-100)
    }
}

#Preview {
    LoginHeaderView(backgroundColor: Color.white,
                    rotateDegree: 15.0,
                    title: "ToDo List",
                    subtitle: "Get Things Done")
}
