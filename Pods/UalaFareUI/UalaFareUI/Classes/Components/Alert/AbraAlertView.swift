//
//  AbraAlertView.swift
//  UalaFareUI
//
//  Created by Luis Perez on 22/11/22.
//

import UIKit

/// A dialog box that shows an message to the user.
open class AbraAlertView: UIView {
    private var theme: AbraAlertViewTheme
    private var alertType: AbraAlertViewType?
    
    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10.25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.applyTypography(theme.titleTypographyStyle)
        label.textColor = theme.titleColor
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.applyTypography(theme.subtitleTypographyStyle)
        label.textColor = theme.subtitleColor
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = OverridableIntrinsicSizeUIImageView()
        imageView.customSize = CGSize(width: 19.5, height: 19.5)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleTopSpacer: UIView = {
        let view = OverridableIntrinsicSizeView()
        view.customSize = CGSize(width: 0, height: 3.25)
        return view
    }()
    
    private lazy var iconLeftSpacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 100,
                      height: 0)
    }
    
    /**
     Initializes the AbraAlertView with the specified configuration
     - Parameters:
        - title: The title of the alert view (optional)
        - subtitle: The subtitle of the alert view
        - icon: The icon that can be showed on the left of the alert view (optional)
        - frame: The frame of the alert
        - theme: The theme with the color and text style for the alert
        
     - Returns: A custom alert view that shows the user a message
     */
    public init(title: String?,
                subtitle: String,
                icon: UIImage?,
                frame: CGRect,
                theme: AbraAlertViewTheme) {
        self.theme = theme
        super.init(frame: frame)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        iconImageView.tintColor = theme.iconTintColor
        if let iconTintColor = theme.iconTintColor {
            iconImageView.image = icon?.withTintColor(iconTintColor, renderingMode: .alwaysTemplate).withAlignmentRectInsets(UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0))
        } else {
            iconImageView.image = icon
        }
    }
    
    /**
     Initializes the AbraAlertView with the specified configuration
     - Parameters:
        - title: The title of the alert view, the default is nil
        - subtitle: The subtitle of the alert view
        - icon: The icon that can be showed on the left of the alert view, the default is nil
        - frame: The frame of the alert, the default is zero
        - type: The type of the alert to be displayed
        
     - Returns: A custom alert view that shows the user a message
     */
    public convenience init(title: String? = nil,
                            subtitle: String,
                            icon: UIImage? = nil,
                            frame: CGRect = .zero,
                            type: AbraAlertViewType) {
        self.init(title: title,
                  subtitle: subtitle,
                  icon: icon,
                  frame: frame,
                  theme: AbraThemeManager.theme.alertViewTheme(alertType: type))
        self.alertType = type
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if containerStack.arrangedSubviews.isEmpty {
            configureUI()
            configureTheme()
        }
    }
    
    private func configureTheme() {
        backgroundColor = theme.backgroundColor
        layer.borderColor = theme.borderColor.cgColor
        iconImageView.tintColor = theme.iconTintColor
        titleLabel.textColor = theme.titleColor
        subtitleLabel.textColor = theme.subtitleColor
        if let iconTintColor = theme.iconTintColor, let icon = iconImageView.image {
            iconImageView.image = icon.withTintColor(iconTintColor, renderingMode: .alwaysTemplate).withAlignmentRectInsets(UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0))
        }
    }
    
    private func configureUI() {
        layer.borderWidth = 1
        layer.cornerRadius = 16.5
        self.addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 320),
            containerStack.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: 12),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: -12),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                    constant: 12),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -12)
        ])
        
        configureIcon()
        configureTitleAndSubtitle()
        handleObjectsVisibility()
        invalidateIntrinsicContentSize()
    }
    
    private func configureIcon() {
        let verticalStackView = UIStackView()
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.widthAnchor.constraint(equalToConstant: iconImageView.intrinsicContentSize.width).isActive = true
        verticalStackView.addArrangedSubview(iconImageView)
        verticalStackView.addArrangedSubview(UIView())
        containerStack.addArrangedSubview(iconLeftSpacer)
        containerStack.addArrangedSubview(verticalStackView)
        iconLeftSpacer.widthAnchor.constraint(equalToConstant: 2.25).isActive = true
        containerStack.setCustomSpacing(0, after: iconLeftSpacer)
    }
    
    private func configureTitleAndSubtitle() {
        let verticalStack = UIStackView()
        
        verticalStack.axis = .vertical
        verticalStack.alignment = .fill
        verticalStack.spacing = 4
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(subtitleLabel)
        containerStack.addArrangedSubview(verticalStack)
    }
    
    open func setTitle(_ title: String) {
        titleLabel.text = title
        handleObjectsVisibility()
    }
    
    private func handleObjectsVisibility() {
        titleLabel.isHidden = titleLabel.text?.count ?? 0 < 1
        subtitleLabel.isHidden = subtitleLabel.text?.count ?? 0 < 1
        iconImageView.isHidden = iconImageView.image == nil
        iconImageView.superview?.isHidden = iconImageView.isHidden
        iconLeftSpacer.isHidden = iconImageView.isHidden
    }
}

extension AbraAlertView: ThemeObserver {
    public func updateTheme() {
        guard let type = alertType else { return }
        self.theme = AbraThemeManager.theme.alertViewTheme(alertType: type)
        configureTheme()
    }
}
