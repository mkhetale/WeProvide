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
        VStack {
            Text("Enter Description of the task")
            TextEditor(text: $profileText)
                .foregroundColor(.secondary)
//                .padding(.top, 30)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
