//
//  ViewController.swift
//  FindNewGame
//
//  Created by Irsyad Ashari on 08/10/20.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    
    var gameData = [GameData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.dataSource = self
        tabelView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: GameTableViewCell.identifier)
        setViewStyle()
        
        getGameData()
    }
    
    func  setViewStyle(){
        
        self.navigationController?.title = "Game List"
        
    }
    
    func getGameData(){
        
        
        let urlAPI = "https://api.rawg.io/api/games"
        
        print("urlAPI : \(urlAPI)")
        
       
        AF.request(urlAPI, method: .get).responseDecodable(of: GamesModel.self) { response in
            print(response.result)
            
            
            
            if(response.response?.statusCode == 403){
                debugPrint("Forbidden")
                
            }else if(response.response?.statusCode == 200 ){
                DispatchQueue.main.async (){
                    
                    for item in response.value!.results{
                        self.gameData.append(item)
                    }
                    
                    self.tabelView.reloadData()
                }
            }
        }
        
    }
    
    func parseDate(dateUnformatted: String)-> String{
        
        let fullDateArr : [String] = dateUnformatted.components(separatedBy: "-")
        let year = fullDateArr[0]
        let month = getMonthName(month: fullDateArr[1])
        let day = fullDateArr[2]
        let formattedDate : String = "\(day) \(month) \(year)"
        return formattedDate
    }
    
    func getMonthName(month: String)-> String{
        switch month {
            case "01":
                return "January"
            case "02":
                return "February"
            case "03":
                return "March"
            case "04":
                return "April"
            case "05":
                return "Mei"
            case "06":
                return "June"
            case "07":
                return "July"
            case "08":
                return "August"
            case "09":
                return "September"
            case "10":
                return "Oktober"
            case "11":
                return "November"
            case "12":
                return "Desember"
            default:
                return " "
        }
    }
    
}

extension UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifier, for : indexPath) as! GameTableViewCell
        
        let data = gameData[indexPath.row]
        
        if(data.gamePoster != ""){
            let url = URL(string: data.gamePoster)
            cell.gamePoster.kf.setImage(with: url, placeholder: UIImage(named: "scribble"),options: [.transition(.fade(0.5))])
        }else{
            cell.gamePoster.image = UIImage(named: "scribble")
        }
        
        cell.gameTitle.text = gameData[indexPath.row].gameTitle
        
        let date = parseDate(dateUnformatted: gameData[indexPath.row].gameReleasedDate)
        cell.gameDesc.text = "Released Dates :\n\(date)"

        
        return cell
        
    }
    
}
