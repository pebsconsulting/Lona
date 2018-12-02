import AppKit
import Foundation

// MARK: - PrimaryAxisFillNestedSiblings

public class PrimaryAxisFillNestedSiblings: NSBox {

  // MARK: Lifecycle

  public init(_ parameters: Parameters) {
    self.parameters = parameters

    super.init(frame: .zero)

    setUpViews()
    setUpConstraints()

    update()
  }

  public convenience init() {
    self.init(Parameters())
  }

  public required init?(coder aDecoder: NSCoder) {
    self.parameters = Parameters()

    super.init(coder: aDecoder)

    setUpViews()
    setUpConstraints()

    update()
  }

  // MARK: Public

  public var parameters: Parameters {
    didSet {
      if parameters != oldValue {
        update()
      }
    }
  }

  // MARK: Private

  private var horizontalView = NSBox()
  private var leftCardView = FillWidthFitHeightCard()
  private var spacerView = NSBox()
  private var rightCardView = FillWidthFitHeightCard()

  private func setUpViews() {
    boxType = .custom
    borderType = .noBorder
    contentViewMargins = .zero
    horizontalView.boxType = .custom
    horizontalView.borderType = .noBorder
    horizontalView.contentViewMargins = .zero
    spacerView.boxType = .custom
    spacerView.borderType = .noBorder
    spacerView.contentViewMargins = .zero

    addSubview(horizontalView)
    horizontalView.addSubview(leftCardView)
    horizontalView.addSubview(spacerView)
    horizontalView.addSubview(rightCardView)

    fillColor = Colors.teal50
    horizontalView.fillColor = Colors.teal100
  }

  private func setUpConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    horizontalView.translatesAutoresizingMaskIntoConstraints = false
    leftCardView.translatesAutoresizingMaskIntoConstraints = false
    spacerView.translatesAutoresizingMaskIntoConstraints = false
    rightCardView.translatesAutoresizingMaskIntoConstraints = false

    let horizontalViewTopAnchorConstraint = horizontalView.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    let horizontalViewBottomAnchorConstraint = horizontalView
      .bottomAnchor
      .constraint(equalTo: bottomAnchor, constant: -10)
    let horizontalViewLeadingAnchorConstraint = horizontalView
      .leadingAnchor
      .constraint(equalTo: leadingAnchor, constant: 10)
    let horizontalViewTrailingAnchorConstraint = horizontalView
      .trailingAnchor
      .constraint(equalTo: trailingAnchor, constant: -10)
    let leftCardViewRightCardViewWidthAnchorSiblingConstraint = leftCardView
      .widthAnchor
      .constraint(equalTo: rightCardView.widthAnchor)
    let leftCardViewHeightAnchorParentConstraint = leftCardView
      .heightAnchor
      .constraint(lessThanOrEqualTo: horizontalView.heightAnchor)
    let spacerViewHeightAnchorParentConstraint = spacerView
      .heightAnchor
      .constraint(lessThanOrEqualTo: horizontalView.heightAnchor)
    let rightCardViewHeightAnchorParentConstraint = rightCardView
      .heightAnchor
      .constraint(lessThanOrEqualTo: horizontalView.heightAnchor)
    let leftCardViewLeadingAnchorConstraint = leftCardView
      .leadingAnchor
      .constraint(equalTo: horizontalView.leadingAnchor)
    let leftCardViewTopAnchorConstraint = leftCardView.topAnchor.constraint(equalTo: horizontalView.topAnchor)
    let leftCardViewBottomAnchorConstraint = leftCardView.bottomAnchor.constraint(equalTo: horizontalView.bottomAnchor)
    let spacerViewLeadingAnchorConstraint = spacerView.leadingAnchor.constraint(equalTo: leftCardView.trailingAnchor)
    let spacerViewTopAnchorConstraint = spacerView.topAnchor.constraint(equalTo: horizontalView.topAnchor)
    let rightCardViewTrailingAnchorConstraint = rightCardView
      .trailingAnchor
      .constraint(equalTo: horizontalView.trailingAnchor)
    let rightCardViewLeadingAnchorConstraint = rightCardView
      .leadingAnchor
      .constraint(equalTo: spacerView.trailingAnchor)
    let rightCardViewTopAnchorConstraint = rightCardView.topAnchor.constraint(equalTo: horizontalView.topAnchor)
    let rightCardViewBottomAnchorConstraint = rightCardView
      .bottomAnchor
      .constraint(equalTo: horizontalView.bottomAnchor)
    let spacerViewHeightAnchorConstraint = spacerView.heightAnchor.constraint(equalToConstant: 0)
    let spacerViewWidthAnchorConstraint = spacerView.widthAnchor.constraint(equalToConstant: 8)

    leftCardViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    spacerViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow
    rightCardViewHeightAnchorParentConstraint.priority = NSLayoutConstraint.Priority.defaultLow

    NSLayoutConstraint.activate([
      horizontalViewTopAnchorConstraint,
      horizontalViewBottomAnchorConstraint,
      horizontalViewLeadingAnchorConstraint,
      horizontalViewTrailingAnchorConstraint,
      leftCardViewRightCardViewWidthAnchorSiblingConstraint,
      leftCardViewHeightAnchorParentConstraint,
      spacerViewHeightAnchorParentConstraint,
      rightCardViewHeightAnchorParentConstraint,
      leftCardViewLeadingAnchorConstraint,
      leftCardViewTopAnchorConstraint,
      leftCardViewBottomAnchorConstraint,
      spacerViewLeadingAnchorConstraint,
      spacerViewTopAnchorConstraint,
      rightCardViewTrailingAnchorConstraint,
      rightCardViewLeadingAnchorConstraint,
      rightCardViewTopAnchorConstraint,
      rightCardViewBottomAnchorConstraint,
      spacerViewHeightAnchorConstraint,
      spacerViewWidthAnchorConstraint
    ])
  }

  private func update() {}
}

// MARK: - Parameters

extension PrimaryAxisFillNestedSiblings {
  public struct Parameters: Equatable {
    public init() {}
  }
}

// MARK: - Model

extension PrimaryAxisFillNestedSiblings {
  public struct Model: LonaViewModel, Equatable {
    public var parameters: Parameters
    public var type: String {
      return "PrimaryAxisFillNestedSiblings"
    }

    public init(_ parameters: Parameters) {
      self.parameters = parameters
    }

    public init() {
      self.init(Parameters())
    }
  }
}
