//Car View
import SwiftUI

struct CarView: View {
    @State var showCalculator: Bool = false
    
    let car: Car
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
    ]
    var body: some View {
        ScrollView {
            VStack {
                HStack() {
                    Text("\(car.name)")
                        .font(.system(.largeTitle, design: .default, weight: .regular))
                }.frame(maxWidth: .infinity,alignment: .leading)
                VStack{
                    Image("CarImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(20)
                }
                
                
                // MARK: SPECIFICATIONS
                
                    LazyVGrid(columns: columns) {
                        SpecificationItem(name: "Лимит", value: "250 км", imageName: "speedometer")
                        SpecificationItem(name: "Топливо", value: "Дизель", imageName: "fuelpump.fill")
                        SpecificationItem(name: "Трансмиссия", value: "ручная", imageName: "gearshape.fill")
                        SpecificationItem(name: "год выпуска", value: "2017", imageName: "calendar")
                    }
                .frame(maxWidth: 360)
                .padding(.top, 10)
                
                
                // MARK: OTHER SPECIFICATIONS
                
                HStack {
                    Text("Доп Опции")
                        .font(.system(.title2, design: .default, weight: .regular))
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                HStack{
                    SpecificationItem(name: "КАСКО", value: "БЕСПЛАТНО", imageName: "list.clipboard.fill")
                    SpecificationItem(name: "Доставка", value: "БЕСПЛАТНО", imageName: "calendar")
                }
                
                HStack{
                    Text("Стоимость суток:")
                        .font(.title3)
                        .fontDesign(.monospaced)
                    Text("\(car.price)$")
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
                    PriceCalculatorView(car: .init(id: car.id, name: car.name, price: car.price, profit: car.profit), userPhone: "")
                    
                }).cornerRadius(20)
                    
            }
            .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        }
    }
}

struct SpecificationItem: View {
    
    let name: String
    let value: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "\(imageName)")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
            Text("\(name):")
                .foregroundColor(Color.gray)
            Text("\(value)")
                .font(.system(.title3, design: .monospaced, weight: .regular))
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
        CarView(car: .init(id: 0, name: "CarName", price: 0, profit: 0))
    }
}

  
