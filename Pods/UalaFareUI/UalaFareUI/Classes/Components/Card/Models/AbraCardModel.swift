//
//  UIFareCardModel.swift
//  UalaFareUI
//
//  Created by Luis Perez on 05/09/22.
//

/// The model for the AbraCard, it is needed so the card can know what rules to follow when drawing
public protocol AbraCardModel {
    var titleTypographyStyle: TypographyStyle { get }
    var subtitleTypographyStyle: TypographyStyle { get }
    var scoreTypographyStyle: TypographyStyle { get }
    var type: AbraCardType { get }
    var enabledConfiguration: AbraCardModelConfiguration { get }
    var disabledConfiguration: AbraCardModelConfiguration { get }
    var pressedConfiguration: AbraCardModelConfiguration { get }
    var edgeInsets: UIEdgeInsets { get }
    var imageSize: CGSize { get }
    var imageCornerRadius: CGFloat { get }
    var generalSpacing: CGFloat { get }
    var spacingBetwenLabels: CGFloat { get }
    var orientation: NSLayoutConstraint.Axis { get }
    var textAlignment: UIStackView.Alignment { get }
    var showScore: Bool { get }
    var showHeaderImage: Bool { get }
    var showSubtitle: Bool { get }
    var iconImageContentMode: UIView.ContentMode { get }
    var cardWidth: CGFloat { get }
    var numberOfLinesForTitle: Int { get }
    var numberOfLinesForSubtitle: Int { get }
    var fixedSize: CGSize? { get }
}

struct DefaultAbraCardModel: AbraCardModel {
    var titleTypographyStyle: TypographyStyle
    var subtitleTypographyStyle: TypographyStyle
    var scoreTypographyStyle: TypographyStyle
    var type: AbraCardType
    var enabledConfiguration: AbraCardModelConfiguration
    var disabledConfiguration: AbraCardModelConfiguration
    var pressedConfiguration: AbraCardModelConfiguration
    var edgeInsets: UIEdgeInsets
    var imageSize: CGSize
    var imageCornerRadius: CGFloat
    var generalSpacing: CGFloat
    var spacingBetwenLabels: CGFloat
    var orientation: NSLayoutConstraint.Axis
    var textAlignment: UIStackView.Alignment
    var showScore: Bool
    var showHeaderImage: Bool
    var showSubtitle: Bool
    var iconImageContentMode: UIView.ContentMode
    var cardWidth: CGFloat
    var numberOfLinesForTitle: Int
    var numberOfLinesForSubtitle: Int
    var fixedSize: CGSize?
}
