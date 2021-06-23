//
//  ChatListViewCell.swift
//  Convert
//
//  Created by Alexei Mashkov on 22.06.2021.
//

import UIKit

class ChatListViewCell: UITableViewCell {
    static let identifier = "ChatListCell"
    
    private var chatImg = UIImageView()
    private var nameLbl = UILabel()
    private var messageLbl = UILabel()
    private var unreadMessegCountLbl = UILabel()
    private var isReadFlagImg = UIImageView()   //  is user's opponent read message
    private var dateTimeLbl = UILabel()
    private var statusCircle = UIView()   //  colored circle around photo
    private let paddingSize4Img: CGFloat = 14.5
    private let spaceBtwNameAndMessag: CGFloat = 18
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(statusCircle)  //  status view must be added before chatImg!
        addSubview(chatImg)
        addSubview(nameLbl)
        addSubview(messageLbl)
        addSubview(dateTimeLbl)
        addSubview(isReadFlagImg)
        addSubview(unreadMessegCountLbl)
        
        configureChatImage()
        configureDateTime()
        configureChatName()
        configureMessage()
        configureUnreadMessageCount()
        configureReadFlag()
        configureStatus()
    }
    
    private func configureChatImage() {
        chatImg.translatesAutoresizingMaskIntoConstraints = false
        chatImg.centerYAnchor
            .constraint(equalTo: centerYAnchor).isActive = true
        chatImg.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: paddingSize4Img).isActive = true
        chatImg.heightAnchor
            .constraint(equalToConstant: 60).isActive = true
        chatImg.widthAnchor
            .constraint(equalToConstant: 60).isActive = true
        
        chatImg.image = UIImage(named: "test")
        chatImg.layer.cornerRadius = 30
        chatImg.clipsToBounds = true
    }
    
    private func configureDateTime () {
        dateTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        dateTimeLbl.topAnchor
            .constraint(equalTo: topAnchor, constant: spaceBtwNameAndMessag).isActive = true
        dateTimeLbl.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        dateTimeLbl.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        
        dateTimeLbl.numberOfLines = 1
        dateTimeLbl.text = "18:31"
        dateTimeLbl.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func configureChatName() {
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.topAnchor
            .constraint(equalTo: topAnchor, constant: spaceBtwNameAndMessag).isActive = true
        nameLbl.leadingAnchor
            .constraint(equalTo: chatImg.trailingAnchor, constant: paddingSize4Img).isActive = true
        nameLbl.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        
        nameLbl.numberOfLines = 1
        nameLbl.text = "Mashkov Alexei"
        nameLbl.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func configureMessage() {
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        messageLbl.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -spaceBtwNameAndMessag).isActive = true
        messageLbl.leadingAnchor
            .constraint(equalTo: chatImg.trailingAnchor, constant: paddingSize4Img).isActive = true
        messageLbl.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -42).isActive = true
        messageLbl.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        
        messageLbl.numberOfLines = 1
        messageLbl.text = "Hello, my friend! dgn gkjbjngkbjkn jbnrjkn rgbn"
        messageLbl.font = UIFont.systemFont(ofSize: 16)
        messageLbl.textColor = .darkGray
    }
    
    private func configureUnreadMessageCount() {}
    
    private func configureReadFlag() {
        // checkmark
        isReadFlagImg.translatesAutoresizingMaskIntoConstraints = false
        isReadFlagImg.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -spaceBtwNameAndMessag - 3).isActive = true
        isReadFlagImg.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        isReadFlagImg.heightAnchor
            .constraint(equalToConstant: 10).isActive = true
        isReadFlagImg.widthAnchor
            .constraint(equalToConstant: 18.885).isActive = true
        
        isReadFlagImg.image = UIImage(named: "checkmarks")
        isReadFlagImg.setImageColor(color: UIColor.systemGreen)
    }
    
    private func configureStatus() {
        statusCircle.translatesAutoresizingMaskIntoConstraints = false
        statusCircle.centerYAnchor
            .constraint(equalTo: centerYAnchor).isActive = true
        statusCircle.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        statusCircle.heightAnchor
            .constraint(equalToConstant: 69).isActive = true
        statusCircle.widthAnchor
            .constraint(equalToConstant: 69).isActive = true
        
        statusCircle.layer.cornerRadius = 34.5
        statusCircle.backgroundColor = .white
        statusCircle.layer.borderColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00).cgColor
        statusCircle.layer.borderWidth = 2.5
        statusCircle.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
