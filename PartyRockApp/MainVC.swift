//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Mark Price on 7/25/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PUlQNsl4Qvk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/6/67/LesMisLogo.png/330px-LesMisLogo.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PUlQNsl4Qvk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/6/67/LesMisLogo.png/330px-LesMisLogo.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PUlQNsl4Qvk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        let p4 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/6/67/LesMisLogo.png/330px-LesMisLogo.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PUlQNsl4Qvk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/6/67/LesMisLogo.png/330px-LesMisLogo.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PUlQNsl4Qvk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        
        partyRocks.append(p1)
        //partyRocks.append(p2)
        //partyRocks.append(p3)
        //partyRocks.append(p4)
        //partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
            
        }
        
    }


}

