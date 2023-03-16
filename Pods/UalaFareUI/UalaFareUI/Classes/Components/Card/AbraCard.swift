//
//  UIFareCard.swift
//  UalaFareUI
//
//  Created by Luis Perez on 06/09/22.

// swiftlint:disable type_body_length
import UIKit

/// A card type control that works pretty much like a button, you can add a selector to observe touches.
@IBDesignable
public final class AbraCard: UIControl {
    // MARK: Interface builder properties
    /// The title of the card
    @IBInspectable public var title: String? {
        didSet {
            titleLabel.text = title
            titleLabel.isHidden = title?.isEmpty ?? true
            titleLabel.applyTypography(theme.titleTypographyStyle)
            invalidateIntrinsicContentSize()
        }
    }
    
    /// The subtitle of the card, the max number of lines depends on the type of the card
    @IBInspectable public var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
            
            subtitleLabel.isHidden = theme.showSubtitle ? subtitle?.isEmpty ?? true : true
            invalidateIntrinsicContentSize()
        }
    }
    
    /// The rating on the card, it will be showed only when using the rating AbraCardType
    @IBInspectable public var rating: String? {
        didSet {
            setRating(rating ?? "")
        }
    }
    
    /// The card icon image
    @IBInspectable public var iconImage: UIImage? {
        didSet {
            setIconImage(iconImage)
        }
    }
    
    /// The card header image, it will only be showed when using the rating AbraCardType
    @IBInspectable public var headerImage: UIImage? {
        didSet {
            setHeaderImage(headerImage)
        }
    }
    
    /// The type of the card, it's intended to be used only by the interface builder, that is why it is a string
    @IBInspectable public var cardType: String? {
        didSet {
            guard let cardType = cardType,
                  let type = AbraCardType(rawValue: cardType) else {
                return
            }
            
            self.theme = AbraThemeManager.theme.cardTheme(cardType: type)
            invalidateIntrinsicContentSize()
            updateConfiguration()
            restartComponent()
        }
    }
    
    // MARK: View components
    /// The UIImageView of the icon, access it to customize it if needed
    public lazy var iconImageView: UIImageView = {
        let imageView = OverridableIntrinsicSizeUIImageView()
        imageView.customSize = theme.imageSize
        imageView.contentMode = theme.iconImageContentMode
        imageView.isUserInteractionEnabled = false
        imageView.layer.cornerRadius = theme.imageCornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// The UIImageView of the rating icon, access it to customize it if needed
    public lazy var ratingImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 14,
                                                  height: 14))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    /// The label of the title for the card
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.numberOfLines = theme.numberOfLinesForTitle
        label.isUserInteractionEnabled = false
        return label
    }()
    
    /// The label that holds the subtitle of the card
    public lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = subtitle
        label.isUserInteractionEnabled = false
        return label
    }()
    
    /// The label that holds the rating of the card
    public lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "5.0"
        label.isUserInteractionEnabled = false
        return label
    }()
    
    /// The background view of the card, access it if you need more customization
    public lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.isUserInteractionEnabled = false
        backgroundView.clipsToBounds = false
        return backgroundView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = theme.orientation
        mainStackView.spacing = theme.generalSpacing
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.isUserInteractionEnabled = false
        return mainStackView
    }()
    
    private lazy var scoreStackView: UIStackView = {
        let containerStackView = UIStackView()
        containerStackView.alignment = .center
        containerStackView.axis = .horizontal
        containerStackView.spacing = 5
        return containerStackView
    }()
    
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public override var isEnabled: Bool {
        didSet {
            updateConfiguration()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            updateConfiguration()
        }
    }
    
    private var cardHeight: CGFloat {
        if mainStackView.axis == .horizontal {
            if theme.imageSize.height > textLabelsContentHeight {
                return theme.imageSize.height + theme.edgeInsets.top + theme.edgeInsets.bottom
            }
            return textLabelsContentHeight + ratingContentHeight + theme.edgeInsets.top + theme.edgeInsets.bottom
        } else {
            return theme.imageSize.height +
            theme.edgeInsets.top +
            theme.edgeInsets.bottom +
            textLabelsContentHeight +
            ratingContentHeight +
            theme.generalSpacing
        }
    }
    
    private var textLabelsContentHeight: CGFloat {
        return titleLabel.intrinsicContentSize.height +
        calculateSubtitleHeight() +
        theme.spacingBetwenLabels
    }
    
    private var ratingContentHeight: CGFloat {
        if theme.showScore {
            return scoreStackView.frame.height + theme.generalSpacing
        }
        return .zero
    }
    
    public override var intrinsicContentSize: CGSize {
        return theme.fixedSize ?? CGSize(width: theme.cardWidth,
                                         height: cardHeight)
    }
    
    private var theme: AbraCardModel = AbraThemeManager.theme.cardTheme(cardType: .verticalIconSmall)
    
    /**
     - Parameters:
        - type: The type of the card
        - frame: The frame of the card, its zero by default
     
     - Returns: A card of the specified type
     */
    public convenience init(type: AbraCardType, frame: CGRect = .zero) {
        let theme = AbraThemeManager.theme.cardTheme(cardType: type)
        self.init(frame: frame, theme: theme)
        self.cardType = type.rawValue
        observeThemeUpdates()
    }
    
    /**
     - Parameters:
        - frame: The frame of the card, its zero by default
        - theme: The theme for the card, it should be used when a further customization is needed
     
     - Returns: A card with the specified theme
     */
    public init(frame: CGRect = .zero, theme: AbraCardModel) {
        self.theme = theme
        super.init(frame: frame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        observeThemeUpdates()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        observeThemeUpdates()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if mainStackView.superview == nil {
            configureLayout(in: self.bounds)
        }
        updateConfiguration()
    }
    
    // MARK: Public setters
    /// Sets the card icon image
    public func setIconImage(_ image: UIImage?) {
        iconImageView.isHidden = iconImage == nil
        updateConfiguration()
        invalidateIntrinsicContentSize()
    }
    
    /// Sets the card header image
    public func setHeaderImage(_ image: UIImage?) {
        headerImageView.image = headerImage
        headerImageView.isHidden = headerImage == nil
        invalidateIntrinsicContentSize()
    }
    
    /// Sets he card attributed title if needed, for a string without attributes, access the title label directly
    public func setAttributedTitle(_ title: NSAttributedString) {
        titleLabel.attributedText = title
        titleLabel.isHidden = false
        invalidateIntrinsicContentSize()
    }
    
    /// Sets the attributed subtitle if needed, for a string without attributes, access the subtitle label directly
    public func setAttributedSubtitle(_ subtitle: NSAttributedString) {
        subtitleLabel.attributedText = subtitle
        subtitleLabel.isHidden = false
        invalidateIntrinsicContentSize()
    }
    
    /// Sets the rating of the card, only will be displayed when using a rating card
    public func setRating(_ rating: String) {
        ratingLabel.text = rating
        invalidateIntrinsicContentSize()
    }
    
    // MARK: Private functions
    private func configureLayout(in rect: CGRect) {
        self.backgroundColor = .clear
        self.clipsToBounds = false
        self.addSubview(backgroundView)
        backgroundView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: theme.cardWidth),
            mainStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                               constant: theme.edgeInsets.top),
            mainStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                   constant: theme.edgeInsets.left),
            mainStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                    constant: -theme.edgeInsets.right)
        ])
        mainStackView.spacing = theme.generalSpacing
        
        if theme.fixedSize == nil {
            mainStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                                  constant: -theme.edgeInsets.bottom).isActive = true
        }
        
        configureIconImageView(insertInto: mainStackView)
        configureTextLabels(insertInto: mainStackView)
        if theme.showScore {
            configureRating(insertInto: mainStackView)
            configureImageViewHeaderView(rect: rect)
        }
        updateConfiguration()
        invalidateIntrinsicContentSize()
    }
    
    private func configureImageViewHeaderView(rect: CGRect) {
        backgroundView.insertSubview(headerImageView, at: 0)
        headerImageView.layer.cornerRadius = 16
        headerImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            headerImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: rect.height > 70 ? 70 : rect.height)
        ])
    }
    
    private func configureIconImageView(insertInto stackView: UIStackView) {
        stackView.addArrangedSubview(iconImageView)
    }
    
    private func configureTextLabels(insertInto stackView: UIStackView) {
        let verticalStackView = UIStackView()
        verticalStackView.distribution = .fill
        verticalStackView.alignment = theme.textAlignment
        verticalStackView.axis = .vertical
        verticalStackView.spacing = theme.spacingBetwenLabels
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        if !theme.showScore {
            let fillerView = UIView()
            fillerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
            fillerView.setContentHuggingPriority(.defaultLow, for: .vertical)
            verticalStackView.addArrangedSubview(fillerView)
        }
        stackView.addArrangedSubview(verticalStackView)
        titleLabel.applyTypography(theme.titleTypographyStyle)
        subtitleLabel.applyTypography(theme.subtitleTypographyStyle)
        titleLabel.numberOfLines = theme.numberOfLinesForTitle
        subtitleLabel.numberOfLines = theme.numberOfLinesForSubtitle
        titleLabel.textAlignment = labelAlignment(stackAlignment: theme.textAlignment)
        subtitleLabel.textAlignment = labelAlignment(stackAlignment: theme.textAlignment)
    }
    
    private func labelAlignment(stackAlignment: UIStackView.Alignment) -> NSTextAlignment {
        switch stackAlignment {
        case .leading:
            return .left
            
        default:
            return .center
        }
    }
    
    private func updateConfiguration() {
        if isEnabled {
            if isHighlighted {
                setConfiguration(configuration: theme.pressedConfiguration)
            } else {
                setConfiguration(configuration: theme.enabledConfiguration)
            }
        } else {
            setConfiguration(configuration: theme.disabledConfiguration)
        }
    }
    
    private func setConfiguration(configuration: AbraCardModelConfiguration) {
        self.backgroundColor = .clear
        self.clipsToBounds = false
        backgroundView.clipsToBounds = false
        if let shadow = configuration.shadow {
            backgroundView.applyShadow(shadow)
        }
        backgroundView.layer.cornerRadius = configuration.cornerRadius
        backgroundView.backgroundColor = configuration.backgroundColor
        backgroundView.layer.borderWidth = configuration.borderWidth
        backgroundView.layer.borderColor = configuration.borderColor.cgColor
        titleLabel.textColor = configuration.titleColor
        ratingLabel.textColor = configuration.titleColor
        subtitleLabel.textColor = configuration.subtitleColor
        iconImageView.alpha = configuration.imageOpacity
        headerImageView.alpha = configuration.imageOpacity
        ratingImageView.alpha = configuration.imageOpacity
        if let tintColor = configuration.iconTintColor {
            iconImageView.image = iconImage?.withRenderingMode(.alwaysTemplate)
            iconImageView.tintColor = tintColor
        } else {
            iconImageView.image = iconImage
        }
    }
    
    private func configureRating(insertInto stackView: UIStackView) {
        ratingImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        ratingImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        ratingImageView.image = UIImage(withName: "category-loyalty")
        ratingLabel.applyTypography(theme.scoreTypographyStyle)
        
        scoreStackView.addArrangedSubview(ratingImageView)
        scoreStackView.addArrangedSubview(ratingLabel)
        stackView.addArrangedSubview(scoreStackView)
        scoreStackView.isHidden = !theme.showScore
    }
    
    private func restartComponent() {
        scoreStackView.isHidden = !theme.showScore
        subtitleLabel.isHidden = !theme.showSubtitle
        mainStackView.axis = theme.orientation
    }
    
    private func calculateSubtitleHeight() -> CGFloat {
        if !theme.showSubtitle {
            return .zero
        }
        
        guard let font = UIFont(family: theme.subtitleTypographyStyle.attributes.fontFamily,
                                weight: theme.subtitleTypographyStyle.attributes.fontWeight,
                                size: theme.subtitleTypographyStyle.attributes.fontSize) else {
            return subtitleLabel.intrinsicContentSize.height
        }
        
        var containerWidth = theme.cardWidth - theme.edgeInsets.left - theme.edgeInsets.right - theme.generalSpacing
        if iconImage != nil {
            if theme.orientation == .horizontal {
                containerWidth -= theme.generalSpacing
                containerWidth -= theme.imageSize.width
            }
        }
        
        let containerLabel = UILabel()
        containerLabel.numberOfLines = theme.numberOfLinesForSubtitle
        containerLabel.font = font
        containerLabel.text = subtitle
         
        let height = containerLabel.systemLayoutSizeFitting(CGSize(width: containerWidth,
                                                                   height: UIView.layoutFittingCompressedSize.height),
                                                            withHorizontalFittingPriority: .required,
                                                            verticalFittingPriority: .fittingSizeLevel).height
        return height
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pressBeganAnimation()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        pressEndAnimation()
    }
    
    private func pressBeganAnimation() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn]) { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 1.05, y: 1.05)
        } completion: { _ in }
    }
    
    private func pressEndAnimation() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn]) { [weak self] in
            self?.transform = CGAffineTransform.identity
        } completion: { _ in }
    }
}

extension AbraCard: ThemeObserver {
    public func updateTheme() {
        guard let cardType = AbraCardType(rawValue: self.cardType ?? "") else {
            return
        }
        self.cardType = cardType.rawValue
    }
}
