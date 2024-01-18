
// 세로 스크롤 게시물 ViewCell

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    
    let DataManager = DataManager()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let user = DataManager.getUserData(index: 0)
        
        // 식당 이름
        let storeLabel: UILabel = {
            let storeLabel = UILabel()
            storeLabel.text = user.food.name
            return storeLabel
        }()
        
        // 식당 주소
        let addressLabel: UILabel = {
            let addressLabel = UILabel()
            addressLabel.text = user.food.address
            return addressLabel
        }()
        
        // 찜하기
        let pinButton: UIButton = {
            let pinButton = UIButton()
            //            pinButton.setImage("", for: .normal)
            return pinButton
        }()
        
        // 이모지
        let emojiLabel: UILabel = {
            let emojiLabel = UILabel()
            emojiLabel.text = user.emoji
            return emojiLabel
        }()
        
        // 별점
        let starLabel: UILabel = {
            let starLabel = UILabel()
            starLabel.text = user.star
            return starLabel
        }()
        
        //ID
        let iDLabel: UILabel = {
            let iDLabel = UILabel()
            iDLabel.text = user.id
            return iDLabel
        }()
        
        // 콘텐츠
        let contentLabel: UILabel = {
            let contentLabel = UILabel()
            contentLabel.text = user.content
            return contentLabel
        }()
        
        
        let verticalStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [storeLabel, addressLabel])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
