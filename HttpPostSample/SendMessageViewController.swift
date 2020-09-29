//
//  SendMessageViewController.swift
//  HttpPostSample
//
//  Created by Yeni Kullanıcı on 21.09.2020.
//  Copyright © 2020 Busra Nur OK. All rights reserved.
//

import UIKit


class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var messageTextView: UITextView!
    
    var responseURLString : String = ""
    

    var jsonData : Data!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://192.168.1.102:88//Home/Index")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Set HTTP Request Header (Vaşlığında ne göndereceğim)
        //token burada gönderilir
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        //textbox lardan veri girilse (idi: (id: idText.text))
        //body e yazılacak kısım
        let requestBody = RequestModel(id: 1, name: "Hasan", surname: "okhasanbasri@gmail.com")
        let jsonData = try! JSONEncoder().encode(requestBody)
        request.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                //butona tıklanınca bir şey olmasın istediğimiz için handler a ihtiyacımız yok
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
                return
            }
            
            guard let data = data else {return}
            
            do{
                
                //datayı önce string e çeviriyorum
                //bir formata çevirmiş isem o formata encode ettim olur
                //orjinal formatına çevirir isem decode ederim
                let dataString = String(data: data, encoding: .utf8)
                //sonra onu json a çeviriyorum
                self.jsonData = dataString!.data(using: .utf8)!
                //json dan nesneye çevirmek decode (bana dönen cevap)
                let response = try! JSONDecoder().decode(ResponseModel.self, from: self.jsonData)
                
                
                var resultStr : String = ""
                resultStr += "Hasan Aşık Mı?: \(response.HasanBusrayaAsikMi) Ne Kadar Seviyor? : \(response.HasanBusrayiNeKadarSeviyor) \n"
            
                self.messageTextView.text = resultStr
                
            } catch let jsonErr{
                
                print(jsonErr)
                
            }
            
        }
        
        task.resume()
        
    }

}
