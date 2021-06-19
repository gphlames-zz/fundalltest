//
//  logic.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import Foundation
protocol checkError {
    func didFailWithError(_ error : Error)
    func successful(_ success: successfulregistration)
    func goregardless()
}
protocol succesfullLogin {
    func loginsuccessful(_ userd: successlogin)
    func didFailWithError(_ error : String)
    func goregardless()
}
struct Register{
    var endpoint = "https://campaign.fundall.io/api/v1/register"
    var delegate: checkError?
    var payload: Payload?
    var succes  = successfulregistration()
    func registerUser(){
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let data = try? JSONEncoder().encode(payload){
             request.httpBody = data
            request.httpMethod = "POST"
                        let session = URLSession.shared
                        let task = session.dataTask(with: request) { (data, response, error) in
            
                            if let error = error {
                                self.delegate?.didFailWithError(error)
                                print(error.localizedDescription)
                                self.delegate?.goregardless()
                            } else if let data = data {
                                if let succc = self.parseJSON(data){
                                    self.delegate?.successful(succc)
                                }else{
                                    self.delegate?.goregardless()
                                }
                                do{
                                    print(try JSONSerialization.jsonObject(with: data))
                                    self.delegate?.goregardless()
                                }catch{
                                    
                                }
                            }
                            if let httpResponse = response as? HTTPURLResponse{
                                if httpResponse.statusCode == 400{
                                    print("Eror code:\(httpResponse.statusCode)")
                                    self.delegate?.goregardless()
                                }
                                
                            }
                            
                        }
            task.resume()
            
        }
    }
    func parseJSON(_ data: Data) -> successfulregistration? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(successfulregistration.self, from: data)
            return decodedData
        }catch{
            print(error)
            return nil
        }
    }
}
struct login{
    var endpoint = "https://campaign.fundall.io/api/v1/login"
    var delegate: succesfullLogin?
    var userpayload: userPayload?
    func logininto(){
    let url = URL(string: endpoint)!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    if let data = try? JSONEncoder().encode(userpayload){
         request.httpBody = data
        request.httpMethod = "POST"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                self.delegate?.didFailWithError(error.localizedDescription)
                print(error.localizedDescription)
            } else if let data = data {
                if let succc = self.parseJSON2(data){
                    self.delegate?.loginsuccessful(succc)
                }else{
                    self.delegate?.goregardless()
                }
                do{
                    print(try JSONSerialization.jsonObject(with: data))
                }catch{
                    
                }
            }
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 400{
                    self.delegate?.didFailWithError(String(httpResponse.statusCode))
                }
                self.delegate?.goregardless()
            }
            self.delegate?.goregardless()
        }
        task.resume()
    }
    }
    func parseJSON2(_ data: Data) -> successlogin? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(successlogin.self, from: data)
            return decodedData
        }catch{
            print(error)
            return nil
        }
    }

}
