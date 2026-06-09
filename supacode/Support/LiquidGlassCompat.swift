import SwiftUI

extension View {
  /// Apply Liquid Glass on macOS 26+, fall back to a translucent material on
  /// older systems so the same shape still reads as a "floating" surface.
  @ViewBuilder
  func liquidGlassBackground(
    in shape: some Shape,
    fallback: AnyShapeStyle = AnyShapeStyle(.regularMaterial)
  ) -> some View {
    if #available(macOS 26.0, *) {
      self.glassEffect(.regular, in: shape)
    } else {
      self.background(fallback, in: shape)
    }
  }
}

extension View {
  /// `onDragSessionUpdated` is macOS 26+. On older systems we silently no-op,
  /// which only loses the explicit drag-ended cleanup hook — the rest of the
  /// drag pipeline still works through the standard drop-target callbacks.
  @ViewBuilder
  func compatOnDragSessionEnded(_ action: @escaping () -> Void) -> some View {
    if #available(macOS 26.0, *) {
      self.onDragSessionUpdated { session in
        switch session.phase {
        case .ended, .dataTransferCompleted:
          action()
        default:
          break
        }
      }
    } else {
      self
    }
  }
}
