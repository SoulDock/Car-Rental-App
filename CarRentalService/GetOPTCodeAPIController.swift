import Foundation
func getDataFromServer(queryString: String) {
    let urlString = "\(queryString)"
    guard var urlComponents = URLComponents(string: urlString) else {
        print("Error: cannot create URL components")
        return
    }
    urlComponents.query = queryString
    
    guard let url = urlComponents.url else {
        print("Error: cannot create URL")
        return
    }
    
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        // Обрабатывайте полученные данные здесь
        print(String(data: data, encoding: .utf8)!)
    }
    task.resume()
}
