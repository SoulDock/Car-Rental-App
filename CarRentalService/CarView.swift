//Car View
import SwiftUI

struct CarView: View {
    @State var showCalculator: Bool = false
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
    ]
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("CIVIC")
                        .font(.system(.largeTitle, design: .default, weight: .regular))
                    Text("honda")
                        .font(.system(.title2, design: .default, weight: .regular))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth: .infinity,alignment: .leading)
                VStack{
                    Image("CarImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(20)
                }
                
                
                //SPECIFICATIONS
                    LazyVGrid(columns: columns) {
                        VStack(alignment: .leading){
                            Image(systemName: "speedometer")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            Text("Лимит:")
                                .foregroundColor(Color.gray)
                            Text("250 км")
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                        }
                        .padding(.leading, 15)
                        .frame(width: 170, height: 100,alignment: .leading)
                        .background{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color("TabBG"), lineWidth: 3)
                        }
                        
                        VStack(alignment: .leading){
                            Image(systemName: "fuelpump.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            Text("Топливо:")
                                .foregroundColor(Color.gray)
                            Text("дизель")
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                        }
                        .padding(.leading, 15)
                        .frame(width: 170, height: 100,alignment: .leading)
                        .background{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color("TabBG"), lineWidth: 3)
                        }
                        
                        VStack(alignment: .leading){
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            Text("Трансмиссия:")
                                .foregroundColor(Color.gray)
                            Text("ручная")
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                        }
                        .padding(.leading, 15)
                        .frame(width: 170, height: 100,alignment: .leading)
                        .background{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color("TabBG"), lineWidth: 3)
                        }
                        
                        VStack(alignment: .leading){
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            Text("год выпуска:")
                                .foregroundColor(.gray)
                            Text("2013")
                                .font(.system(.title3, design: .monospaced, weight: .regular))
                        }
                        .padding(.leading, 15)
                        .frame(width: 170, height: 100,alignment: .leading)
                        .background{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color("TabBG"), lineWidth: 3)
                        }
                        
                    }
                .frame(maxWidth: 360)
                .padding(.top, 10)
                
                HStack {
                    Text("Доп Опции")
                        .font(.system(.title2, design: .default, weight: .regular))
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                //Доп опции
                HStack{
                    VStack(alignment: .leading){
                        Image(systemName: "list.clipboard.fill")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .foregroundColor(.gray)
                        Text("КАСКО:")
                            .foregroundColor(.gray)
                        Text("БЕСПЛАТНО")
                            .font(.system(.title3, design: .monospaced, weight: .regular))
                            .foregroundColor(Color("MoneyColor"))
                    }
                    .padding(.leading, 15)
                    .frame(width: 170, height: 100,alignment: .leading)
                    .background{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("TabBG"), lineWidth: 3)
                    }
                    VStack(alignment: .leading){
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                        Text("Доставка:")
                            .foregroundColor(.gray)
                        Text("БЕСПЛАТНО")
                            .foregroundColor(Color("MoneyColor"))
                            .font(.system(.title3, design: .monospaced, weight: .regular))
                    }
                    .padding(.leading, 15)
                    .frame(width: 170, height: 100,alignment: .leading)
                    .background{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color("TabBG"), lineWidth: 3)
                    }
                }
                
                HStack{
                    Text("Стоимость суток:")
                        .font(.title3)
                        .fontDesign(.monospaced)
                    Text("50$")
                        .font(.title2)
                        .foregroundColor(Color("MoneyColor"))
                        .fontDesign(.monospaced)
                }.padding(.top, 10)
                
                Button {
                    showCalculator.toggle()
                } label: {
                    Text("АРЕНДОВАТЬ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .frame(width: 300, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color("MoneyColor"))
                        .cornerRadius(10)
                }.padding(.vertical, 10)
                
                    
                
                //MARK: SHOW CALCULATOR
                
                .sheet(isPresented: $showCalculator, content:  {
                    PriceCalculatorView(userPhone: "")
                    
                }).cornerRadius(20)
                    
            }
            .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        }
    }
}

struct SpecificationItem: View {
    @State var imageName: String
    var body: some View {
        VStack(alignment: .leading){
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
            Text("title")
            Text("320 hp")
        }
        .padding(.leading, 15)
        .frame(width: 170, height: 100,alignment: .leading)
        .background{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color("TabBG"), lineWidth: 3)
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}

