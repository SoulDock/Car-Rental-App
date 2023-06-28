import SwiftUI

struct SettingsView: View {
    @State var phoneNumber: String = "+"
    @State var email: String = ""
    @State var address: String = ""
    
    let formatter: NumberFormatter = {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           return formatter
       }()
    
    var body: some View {
        VStack {
            Text("НАСТРОЙКИ")
                .font(.system(.title, design: .monospaced, weight: .bold))
                .padding(.bottom, 20)
            
            
            Group {
                VStack(alignment: .leading){
                    Text("мой номер телефона")
                        .font(.system(size: 16))
                        .fontDesign(.monospaced)
                        .foregroundColor(Color.secondary)
                    TextField("Номер телефона", text: $phoneNumber){}
                        .padding(.horizontal,20)
                        .frame(height: 45)
                        .font(.system(.title3, design: .monospaced, weight: .regular))
                        .keyboardType(.numberPad)
                        .tracking(2)
                        .background{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color.black, lineWidth: 1.5)
                                
                        }
                }
                
                VStack(alignment: .leading){
                    Text("моя электронная почта")
                        .font(.system(size: 16))
                        .fontDesign(.monospaced)
                        .foregroundColor(Color.secondary)
                    TextField("email", text: $email){}
                        .padding(.horizontal,20)
                        .frame(height: 45)
                        .font(.system(.title3, design: .monospaced, weight: .regular))
                        .tracking(2)
                        .background{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color.black, lineWidth: 1.5)
                                
                        }
                }
                
                VStack(alignment: .leading){
                    Text("адресс доставки | отель")
                        .font(.system(size: 16))
                        .fontDesign(.monospaced)
                        .foregroundColor(Color.secondary)
                    TextField("адресс или отель", text: $address){}
                        .padding(.horizontal,20)
                        .frame(height: 45)
                        .font(.system(.title3, design: .monospaced, weight: .regular))
                        .tracking(2)
                        .background{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color.black, lineWidth: 1.5)
                                
                        }
                }
                Spacer()
                
                VStack {
                        
                    Image("settings")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                    
                    Text("Здесь вы можете сохранить свои данные для более быстрого оформления заказа")
                        .font(.system(size: 16))
                        .fontDesign(.monospaced)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 50)
                .padding(.bottom, 100)
            }
        }.padding(.horizontal, 30)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
