import SwiftUI

struct TabBar: View {
   
    @State var selectedTab = "Авто"
    
    let tabs = ["Авто", "Заказы", "Настройки", "VPN"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab){
                CarsView()
                    .tag("Авто")
                OrdersView()
                    .tag("Заказы")
                SettingsView()
                    .tag("Настройки")
                VpnView()
                    .tag("VPN")
                    .foregroundColor(.black)
            }
            
            HStack{
                ForEach(tabs, id: \.self) { tab in
                    TabItem(tab: tab, selected: $selectedTab)
                }
                    
            }
            .padding(.top, 20)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(Color("TabBG"))
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


struct TabItem: View {
    @State var tab: String
    @Binding var selected: String
    var body: some View {
        ZStack {
            Button {
                withAnimation(.spring()) {
                    selected = tab
                }
            } label: {
                HStack{
                    Image(tab)
                        .resizable()
                        .frame(width: 30, height: 30)
                    if selected == tab{
                        Text(tab)
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .opacity(selected == tab ? 1 : 0.7)
        .padding(.vertical, 5)
        .padding(.horizontal, 17)
        .background(selected == tab ? Color.white : Color("TabBg"))
        .clipShape(Capsule())
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
