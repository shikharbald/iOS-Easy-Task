//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shikhar N on 8/28/18.
//  Copyright © 2018 Shikhar N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var xlabel: UILabel!
    let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Houston&units=metric&APPID=3787b6476419c45d32ad84402bc82186"
    // the api key
    var Temp:Double = 1
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData(urlString: urlString)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func button(_ sender: UIButton) {
        print("The button was pressed")
        xlabel.text = ("The weather in Texas is \(Temp) degrees")
    }
    
    func getWeatherData(urlString: String) {
        guard let url = URL(string: urlString) else {return}
    
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print(data)
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {return}
                print(json)
                if let main = json["main"] as? [String:AnyObject] {
                    print("\n") 
                    print(main)
                    print("\n")
                    if let temp = main["temp"] as? Double {
                        print(temp)
                        self.Temp = temp
                        print(self.Temp)
                    }
                    
                    }
            }catch let jsonErr {
                print("Json Serialization error:", jsonErr)
            }
            
            
            
        } .resume()
    }
    
    
}
    




