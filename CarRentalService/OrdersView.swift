// Заказы пользователя
import SwiftUI

struct OrdersView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { order in
                    //Text("\(order)")
                VStack{
                    HStack{
                        Text("Jeep Safari")
                            .font(.system(.title2, design: .default, weight: .bold))
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack{
                        Text("25.04.2023")
                            .font(.system(.title3, design: .default, weight: .bold))
                        Spacer()
                        Text("50$")
                            .font(.system(.title3, design: .monospaced, weight: .bold))
                            .foregroundColor(Color("MoneyColor"))
                    }
                    .padding(.bottom, 10)
                    HStack{
                        Text("Статус:")
                            .font(.system(.title3, design: .default, weight: .bold))
                        Spacer()
                        Text("ЗАВЕРШЕН")
                            .font(.system(.title3, design: .monospaced, weight: .bold))
                            .foregroundColor(Color("MoneyColor"))
                    }
                                     
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color("TabBG"))
                .cornerRadius(20)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom,80)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
