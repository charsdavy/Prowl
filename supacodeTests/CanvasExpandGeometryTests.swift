import CoreGraphics
import Foundation
import Testing

@testable import supacode

struct CanvasExpandGeometryTests {
  private let viewport = CGSize(width: 2000, height: 1400)
  private let center = CGPoint(x: 500, y: 300)
  private let metrics = CanvasExpandGeometry.Metrics(
    padding: 40,
    bottomReserve: 50,
    titleBarHeight: 28,
    minSize: CGSize(width: 300, height: 200)
  )

  @Test func sizeFillsViewportMinusPaddingAndBottomReserve() {
    let result = CanvasExpandGeometry.expandedFrame(
      viewport: viewport,
      cardCenter: center,
      metrics: metrics
    )
    let expectedWidth: CGFloat = 2000 - 40 * 2
    let expectedHeight: CGFloat = 1400 - 40 * 2 - 50 - 28
    #expect(result.size.width == expectedWidth)
    #expect(result.size.height == expectedHeight)
  }

  @Test func offsetCentersCardAtScaleOne() {
    let result = CanvasExpandGeometry.expandedFrame(
      viewport: viewport,
      cardCenter: center,
      metrics: metrics
    )
    // At scale 1, the card's screen center is cardCenter + offset; it should
    // land at the horizontal middle and the toolbar-adjusted vertical middle.
    #expect(center.x + result.offset.width == viewport.width / 2)
    #expect(center.y + result.offset.height == (viewport.height - 50) / 2)
  }

  @Test func clampsToMinSizeOnTinyViewport() {
    let result = CanvasExpandGeometry.expandedFrame(
      viewport: CGSize(width: 200, height: 150),
      cardCenter: .zero,
      metrics: metrics
    )
    #expect(result.size.width == metrics.minSize.width)
    #expect(result.size.height == metrics.minSize.height)
  }
}
