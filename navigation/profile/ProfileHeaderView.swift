//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by august moore on 26/01/2025.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    // Аватарка
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Имя пользователя
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nickname"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    // Статус
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // Поле для ввода нового статуса
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter new status"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        textField.backgroundColor = .white
        return textField
    }()
    
    // Кнопка установки статуса
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        
        setStatusButton.addTarget(self, action: #selector(setStatusPressed), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        // Аватарка
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(100)
        }
        
        // Имя пользователя
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView).offset(16)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        // Статус
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(nameLabel)
        }
        
        // Поле ввода статуса
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(nameLabel)
            make.height.equalTo(30)
        }
        
        // Кнопка
        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(16) // Добавляем отступ снизу
        }
    }
    
    @objc private func setStatusPressed() {
        guard let newText = statusTextField.text, !newText.isEmpty else {
            print("Status field is empty!")
            return
        }
        setStatus(newText)
    }
    
    public func setStatus(_ text: String) {
        statusLabel.text = text
        print("New Status: \(text)")
    }
}
