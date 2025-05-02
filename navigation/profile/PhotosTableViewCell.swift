//
//  PhotosTableViewCell.swift
//  navigation
//
//  Created by august moore on 02/03/2025.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photoStackView)

        for i in 1...4 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "fig\(i)")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            imageView.isUserInteractionEnabled = true
            photoStackView.addArrangedSubview(imageView)
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            photoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
