import SwiftUI

struct PhoneNumberLoginView: View {
    @State var userPhoneNumber: String = "+"
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                //IMAGE
                Image("SMSimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                
                //COMPLANATION TEXT
                Text("на ваш номер телефона будет отправлено сообщение с кодом ")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                
                //TEXT FIELD
                TextField("Введите номер телефона", text: $userPhoneNumber){}
                    .padding(.horizontal,20)
                    .frame(width: 300, height: 50)
                    .font(.system(.title, design: .monospaced, weight: .regular))
                    .keyboardType(.numberPad)
                    .background{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("DataInputColor"), lineWidth: 1.5)
                    }
                
                //BUTTON
                NavigationLink {
                    OTPVerificationView(userPhone: userPhoneNumber)
                } label: {
                    Text("Продолжить")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .frame(width: 300, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color("ButtonColor"))
                        .cornerRadius(20)
                }
                .disabledWithOpacity(userPhoneNumber.count < 10)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle("назад")
            
            
        }
    }
}

struct PhoneNumberLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberLoginView()
    }
}

