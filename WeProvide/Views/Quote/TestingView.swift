//
//  TestingView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 4/27/21.
//

import SwiftUI

struct TestingView: View {
    @State private var profileText: String = "Enter your bio"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
            
            VStack {
                Text("Test")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text("Testing123")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
