//
//  ContentView.swift
//  WeProvide
//
//  Created by Mihir Khetale on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                SideBarView()
            } else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
