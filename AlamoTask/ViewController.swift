//
//  ViewController.swift
//  AlamoTask
//
//  Created by kiran on 9/7/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let apiLink = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=20d5805b80704399b088612693a0ce0a"
    @IBOutlet weak var tbleView: UITableView!
    var newsArray:[Article] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tbleView.delegate = self
        tbleView.dataSource = self
        almofireRequest(withUrl: apiLink)

    }
    
    func almofireRequest(withUrl: String) {
      //  if let url = URL(string: apiLink ) {
            Alamofire.request(withUrl).responseJSON { (response) in
                // print(response)
                let newsJson = response.result.value  as! NSDictionary
                //   print(newsJson)
                let dataOut = newsJson["articles"] as! NSArray
                // print(dataOut)
                for article in dataOut {
                    self.newsArray.append(Article(articleJson: article as! NSDictionary))
                    //  print(self.newsArray.count)
                }
                DispatchQueue.main.async {
                    self.tbleView.reloadData()
                }
            }
            
//        } else {
//            print("error with url")
//        }
        
    }
    
}

extension ViewController :UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 431
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbleView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? tblCell
        let news = newsArray[indexPath.row]
        cell?.sourceName.text = news.source?.id
        cell?.title.text = news.title
        cell?.author.text = news.author
        cell?.url.text = news.url
        cell?.publishedat.text = news.publishedAt
        cell?.descript.text = news.desc
        if let image = news.urlToImage {
            cell?.imag.downloadImages(from: image)
        } else  {
            print("image is nil")
        }
        return cell!
    }
}


extension UIImageView {
    func downloadImages(from url: String) {
        let urlRequest = URLRequest.init(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
        
    }
    
}
