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
            Color("vpnBgColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("server2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.yellow)
                    
                    Text("VPN БУДЕТ ДОСТУПЕН В БЛИЖАЙШЕЕ ВРЕМЯ!")
                        .foregroundColor(Color.yellow)
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
