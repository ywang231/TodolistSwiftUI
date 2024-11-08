//
//  ELButton.swift
//  EricToDo
//
//  Created by Yanqing Wang on 2024-11-07.
//

import SwiftUI

struct ELButton: View {
    let _backgroundColor: Color
    let _title: String
    let _action: (ELButton)->Void
    
    var body: some View {
        Button {
            self._action(self)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(_backgroundColor)
                Text(_title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }.frame(height: 50)
        .padding(.leading, 5)
        .padding(.trailing, 5)

    }
}

#Preview {
    ELButton(_backgroundColor: Color.blue, _title: "Submit") { tag in
        // Action
    }
}
