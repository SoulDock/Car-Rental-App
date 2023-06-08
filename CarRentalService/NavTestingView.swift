//
//  NavTestingView.swift
//  CarRentalService
//
//  Created by Стас Асташенко on 18/05/2023.
//

import SwiftUI

struct NavTestingView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink {
                    CarView()
                } label: {
                    Text("Some Text")
                }
                .opacity(0.0)
                .buttonStyle(PlainButtonStyle())
            }

        }
    }
}

struct NavTestingView_Previews: PreviewProvider {
    static var previews: some View {
        NavTestingView()
    }
}
