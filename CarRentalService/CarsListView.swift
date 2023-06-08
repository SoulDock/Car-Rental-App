import SwiftUI

//CONSTRUCTION COMMENTS:::::




struct CarsListView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView {
                    
                        ForEach(0..<6){index in
                            VStack{
                                
                                Image("CarImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .overlay(alignment: .bottom) {
                                        HStack(){
                                            Text("HONDA CIVIC")
                                                .font(.system(.title3, design: .default, weight: .regular))
                                            Spacer()
                                            Text("50$")
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
                                         CarView()
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
                            .frame(maxWidth: .infinity)
                            .listRowSeparator(.hidden)
                            .background(Color("TabBG"))
                            .cornerRadius(10)
                        }
                }
            }
            .searchable(text: $searchText)
            .shadow(color: .gray, radius: 6)
            .padding(.horizontal,20)
            .navigationBarTitle("Все авто")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(Color.black)
        .padding(.bottom,75)
        .ignoresSafeArea(.keyboard, edges: .bottom)
       
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView()
    }
}
