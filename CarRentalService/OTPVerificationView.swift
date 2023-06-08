import SwiftUI

struct OTPVerificationView: View {
    
    @State var otpText: String = ""
    @State var userPhone: String
    var verificationCode: String = "1234"
    @FocusState private var isKeyBoardShowing: Bool
    
    var body: some View {
        VStack(){
            //Image
            Image("SMSimage")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .padding(.bottom, 20)
            //Description & SEND CODE AGAIN BUTON
            Text("СМС с кодом верификации было отправлено на \(userPhone)")
                .frame(width: 300)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
            
            //TextField
            HStack(spacing: 0){
                ForEach(0..<4, id: \.self){ index in
                    OTPTextBox(index)
                }
            }.background {
                TextField("", text: $otpText.limit(4))
                    .keyboardType(.numberPad)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyBoardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyBoardShowing.toggle()
            }
            
            //BUTTON
            NavigationLink{
                if otpText == verificationCode {
                    TabBar()
                }else{
                    EmptyView()
                }
                
            } label:{
                Text("Продолжить")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame(width: 300, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color("ButtonColor"))
                    .cornerRadius(20)
            }.disabledWithOpacity(otpText.count < 4)
            
            VStack(spacing: 0){
                
                Text("не пришел код?")
                    .font(.system(size: 16))
                    .fontDesign(.monospaced)
                    .foregroundColor(Color.secondary)
                    .multilineTextAlignment(.center)
                
                // MARK: COUNTDOWN TIMER
                VerificationCountDownTimerView()
                
            }.padding(.top, 30)
               
        }
        .padding(.horizontal, 30)
    }
    
    // MARK: OTP text box
    @ViewBuilder
    func OTPTextBox(_ index: Int)-> some View{
        ZStack{
            if otpText.count > index{
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            }else{
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background{
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 1.5)
        }
        .padding(5)
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView(userPhone: "ваш номер телефона")
    }
}


// MARK: View Extensions

extension View{
    func disabledWithOpacity(_ condition: Bool)-> some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

// MARK: Binding <String> Extention

extension Binding where Value == String {
    func limit (_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
