import SwiftUI

struct CarsView: View {
    @StateObject private var vm = CarViewModel()
    
    var body: some View {
        ScrollView {
                VStack {
                    ForEach(vm.cars, id: \.id){car in
                        VStack{
                            VStack{
                                Image("CarImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .overlay(alignment: .bottom) {
                                        HStack(){
                                            Text("\(car.name)")
                                                .font(.system(.title3, design: .default, weight: .regular))
                                                .textCase(.uppercase)
                                            Spacer()
                                            Text("\(car.price)$")
                                                .font(.system(.title3, design: .monospaced, weight: .bold))
                                                .foregroundColor(Color("MoneyColor"))
                                        }
                                        .padding(.horizontal, 30)
                                        .padding(.bottom, 5)
                                    }
                                
                                //ОСНОВНАЯ ИНФОРМАЦИЯ ОБ АВТО
                                VStack(alignment: .center){
                                    VStack(alignment: .leading){
                                        HStack {
                                            HStack {
                                                Image(systemName: "speedometer")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(.black)
                                                Text("250км")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17, weight: .regular, design: .none))
                                            }
                                            Spacer()
                                            HStack {
                                                Image(systemName: "fuelpump")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.black)
                                                Text("Дизель")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17, weight: .regular, design: .none))
                                            }
                                            
                                        }
                                        HStack {
                                            HStack {
                                                Image(systemName: "gearshape")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(.black)
                                                Text("ручная")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17, weight: .regular, design: .none))
                                            }
                                            Spacer()
                                            HStack {
                                                Image(systemName: "calendar")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.black)
                                                Text("от 1 суток")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17, weight: .regular, design: .none))
                                            }
                                            
                                        }
                                    }
                                    .background(Color("CarsListColor1"))
                                    .padding(.vertical,10)
                                    .frame(width: 250)
                                    
                                    NavigationLink {
                                        CarView(car: car)
                                    } label: {
                                        Text("ПОДРОБНЕЕ")
                                            .font(.system(size: 18, weight: .bold, design: .default))
                                            .frame(width: 300, height: 50)
                                            .foregroundColor(Color.white)
                                            .background(Color("MoneyColor"))
                                            .cornerRadius(10)
                                        
                                    }
                                    .padding(.bottom, 20)
                                    .frame(width: 300)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color("TabBG"))
                            }
                            .navigationBarTitle("назад")
                            .frame(maxWidth: .infinity)
                            .listRowSeparator(.hidden)
                            .background(Color("TabBG"))
                            .cornerRadius(10)
                        }
                    }
                }
        }
        .onAppear(perform: vm.getCars)
        .padding(.horizontal,20)
        .padding(.bottom, 80)
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
