//
//  VpnView.swift
//  CarRentalService
//
//  Created by Стас Асташенко on 05/06/2023.
//

import SwiftUI

struct VpnView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("server2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.black)
                    
                    Text("VPN БУДЕТ ДОСТУПЕН В БЛИЖАЙШЕЕ ВРЕМЯ!")
                        .font(.system(.title3, design: .monospaced, weight: .bold))
                        .multilineTextAlignment(.center)
                }
            }.padding(.horizontal,30)
        }
    }
}

struct VpnView_Previews: PreviewProvider {
    static var previews: some View {
        VpnView()
    }
}
