//
//  ErrorView.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import SwiftUI

struct ErrorView: View {
    
    var buttonAction: ()->()
    
    var body: some View {
        
        VStack {
            HStack {
                
                Image(systemName: "arrow.2.circlepath")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                VStack (alignment: .leading){
                    
                    Text("search-error-title")
                        .bold()
                    Text("search-error-description")
                    
                    Spacer()
                        .frame(height: 12)
                    
                    Button(action: self.buttonClick) {
                                Text("reload-button-text")
                    }
                }
                
                Spacer()
            }
            .padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1)
                )
            
            Spacer()
        }
        .padding()
        
    }
    
    private func buttonClick() {
        self.buttonAction()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(buttonAction: {
            print("button Clicked")
        })
    }
}
