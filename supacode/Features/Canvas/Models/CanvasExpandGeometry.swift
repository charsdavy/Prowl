import CoreGraphics

/// Geometry for the canvas "expand-in-place" interaction: a card is temporarily
/// blown up to a near-fullscreen size at canvas scale 1 (so its terminal renders
/// at the same font size as Normal/Shelf mode), centered in the viewport with a
/// padding margin and the bottom toolbar reserve avoided.
enum CanvasExpandGeometry {
  /// Layout metrics for an expanded card.
  struct Metrics {
    /// Margin kept on every side of the expanded card.
    var padding: CGFloat
    /// Extra height reserved at the bottom for the help/layout toolbar (matches
    /// `fitToView`'s vertical centering).
    var bottomReserve: CGFloat
    /// Height of the card title bar, added on top of the content height.
    var titleBarHeight: CGFloat
    /// Lower bound for the content size on tiny viewports.
    var minSize: CGSize
  }

  /// Compute the expanded card's content size (excluding the title bar) and the
  /// canvas offset that centers it, assuming canvas scale is fixed at 1.
  ///
  /// - Parameters:
  ///   - viewport: The canvas viewport size.
  ///   - cardCenter: The card's center in canvas coordinates (its stored layout
  ///     position, unchanged by expand).
  ///   - metrics: Padding / reserve / title-bar / min-size metrics.
  static func expandedFrame(
    viewport: CGSize,
    cardCenter: CGPoint,
    metrics: Metrics
  ) -> (size: CGSize, offset: CGSize) {
    let width = max(metrics.minSize.width, viewport.width - metrics.padding * 2)
    let totalHeight = viewport.height - metrics.padding * 2 - metrics.bottomReserve
    let height = max(metrics.minSize.height, totalHeight - metrics.titleBarHeight)

    // Scale is 1, so screen position == cardCenter + offset. Center the card
    // horizontally and vertically within the toolbar-adjusted viewport.
    let offset = CGSize(
      width: viewport.width / 2 - cardCenter.x,
      height: (viewport.height - metrics.bottomReserve) / 2 - cardCenter.y
    )

    return (CGSize(width: width, height: height), offset)
  }
}
