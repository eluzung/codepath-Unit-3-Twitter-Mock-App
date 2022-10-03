//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Elaine Luzung on 9/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var liked:Bool = false
    var tweetId:Int = -1 //not set to any tweet
    
    func setLiked(_ isLiked:Bool) {
        liked = isLiked
        if(liked) {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func likeTweet(_ sender: Any) {
            let toBeLiked = !liked
            if(toBeLiked) {
                TwitterAPICaller.client?.likeTweet(tweetId: tweetId, success: {
                    self.setLiked(true)
                }, failure: { (error) in
                    print("Like tweet unsuccessful: \(error)")
                })
            } else {
                TwitterAPICaller.client?.unlikeTweet(tweetId: tweetId, success: {
                    self.setLiked(false)
                }, failure: { (error) in
                    print("Unliking tweet unsuccessful: \(error)")
                })
            }
        }
    
    @IBAction func retweet(_ sender: Any) {
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
