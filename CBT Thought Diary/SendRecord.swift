func sendRecord() {
    let urlString = "https://records-583023182320.europe-central2.run.app/records"
    
    guard let url = URL(string: urlString) else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    
}
