import SwiftUI
struct PriceCalculatorView: View {
    
    private let price: Int = 50
    
    let car: Car
    
    @State var numberOfDays: Int = 1
    @State var selectedDate: Date = Date()
    @State var userPhone: String =  ""
    @State var userEmail: String = ""
    @State var userAddress: String = ""
    @State var userFullName: String = ""
    @State var userDateOfBirth: Date = Date()
    
    @State var dayTimeDelivery: Bool = true
    @State var nightTimeDelivery: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var totalCost: Int {
        return car.price * numberOfDays
    }
    
    var payNowAmount: Int {
        return price / 10
    }
        
    var body: some View {
            ScrollView {
                HStack {
                    Text("Бронирование авто")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .padding(.top, 10)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("MoneyColor"))
                    }
                }
                .padding(.bottom, 10)
                .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("\(car.name)")
                            .font(.system(.largeTitle, design: .default, weight: .regular))
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                    VStack{
                        Image("CarImage")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .cornerRadius(20)
                    }.padding(.bottom, 0)
                    
                    HStack{
                        Text("Стоимость суток:")
                            .font(.title3)
                            .fontDesign(.monospaced)
                            .padding()
                        Text("\(car.price)$")
                            .font(.title2)
                            .foregroundColor(Color("MoneyColor"))
                            .fontDesign(.monospaced)
                            .padding()
                    }
                    
                    DatePicker("Дата начала аренды", selection: $selectedDate, displayedComponents: [.date])
                        .font(.headline)
                        .fontDesign(.monospaced)
                        .padding(.horizontal,15)
                        .padding(.bottom, 20)
                    

                    
                    // MARK: CHECKBOXES
                    VStack(alignment: .leading){
                        Text("Время доставки")
                            .font(.headline)
                            .fontDesign(.monospaced)
                        Toggle(isOn: $dayTimeDelivery) {
                            Text("Доставка утром (9:00-11:00)")
                                .padding(.vertical, 5)
                                .padding(.leading, 20)
                        }.toggleStyle(SwitchToggleStyle(tint: Color("MoneyColor")))
                        Toggle(isOn: $nightTimeDelivery) {
                            Text("Доставка вечером (20:00-22:00)")
                                .padding(.vertical, 5)
                                .padding(.leading, 20)
                        }.toggleStyle(SwitchToggleStyle(tint: Color("MoneyColor")))
                    }
                    .onChange(of: dayTimeDelivery) { newValue in
                        nightTimeDelivery = !newValue
                            }
                    .onChange(of: nightTimeDelivery) { newValue in
                                dayTimeDelivery = !newValue
                    }
                    .padding(.horizontal,15)
                    .padding(.bottom, 0)
                    
                    Stepper(value: $numberOfDays, in: 0...Int.max, label: {
                        Text("Количество суток: \(numberOfDays)")
                            .font(.headline)
                            .fontDesign(.monospaced)
                    })
                    .padding()
                    
                    // MARK: TEXT FIELDS
                    
                    Group{
                        VStack(alignment: .leading){
                            Text("Номер What's App для связи")
                                .font(.headline)
                                .fontDesign(.monospaced)
                            TextField("Номер телефона", text: $userPhone){}
                                .padding(.horizontal,20)
                                .frame(height: 50)
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                                .keyboardType(.numberPad)
                                .tracking(2)
                                .background{
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("DataInputColor"), lineWidth: 1.5)
                                    
                                }
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading){
                            Text("Email")
                                .font(.headline)
                                .fontDesign(.monospaced)
                            TextField("Электронная почта", text: $userEmail){}
                                .textInputAutocapitalization(.never)
                                .padding(.horizontal,20)
                                .frame(height: 50)
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                                .background{
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("DataInputColor"), lineWidth: 1.5)
                                        
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading){
                            Text("Адрес доставки|название отеля")
                                .font(.headline)
                                .fontDesign(.monospaced)
                            TextField("Адрес доставки", text: $userAddress){}
                                .padding(.horizontal,20)
                                .frame(height: 50)
                                .font(.system(.title3, design: .monospaced, weight: .bold))
                                .background{
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("DataInputColor"), lineWidth: 1.5)
                                        
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                        
                        
                        VStack(alignment: .leading){
                            Text("Имя Фамилия на латинице")
                                .font(.headline)
                                .fontDesign(.monospaced)
                            TextField("Имя Фамилия", text: $userFullName){}
                                .padding(.horizontal,20)
                                .frame(height: 50)
                                .font(.system(.title2, design: .monospaced, weight: .regular))
                                .background{
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("DataInputColor"), lineWidth: 1.5)
                                        
                                }
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                        
                        DatePicker("Дата рождения", selection: $userDateOfBirth, displayedComponents: [.date])
                            .font(.headline)
                            .fontDesign(.monospaced)
                            .padding(.horizontal,15)
                            .padding(.bottom, 20)
                        
                        }
                    
                    // MARK: PRICE DISPLAY SECTION
                    Group {
                        VStack(alignment: .center) {
                            PriceDisplay(name: "Общая стоимость:", value: "\(totalCost)")
                            PriceDisplay(name: "К оплате сейчас:", value: "\(car.profit)")
                        }.padding(.horizontal, 30)
                    }
                    
                    Group {
                        Button {
                            print("\(numberOfDays)")
                        } label: {
                            Text("АРЕНДОВАТЬ")
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("MoneyColor"))
                                .cornerRadius(10)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    }
                }
            }.padding(.horizontal, 30)
        }
   }




struct PriceDisplay: View {
    let name: String
    let value: String
    var body: some View{
        HStack{
            Text("\(name)")
                .font(.title3)
                .fontDesign(.monospaced)
                
            Text("\(value)$")
                .font(.title2)
                .foregroundColor(Color("MoneyColor"))
                .fontDesign(.monospaced)
        }.frame(maxWidth: 300)
    }
}


struct PriceCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        PriceCalculatorView(car: .init(id: 0, name: "CarName", price: 0, profit: 0), userPhone: "+", dayTimeDelivery: true, nightTimeDelivery: false)
    }
}


//MARK: VIEW EXTENTIONS

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
