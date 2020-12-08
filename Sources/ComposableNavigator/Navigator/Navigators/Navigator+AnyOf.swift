import Foundation

public extension Navigator {
  static func anyOf(
    _ navigators: [Navigator]
  ) -> Navigator {
    let buildPath = { (dataSource: Navigator.DataSource, path) -> Routed? in
      return navigators
        .compactMap { $0.build(dataSource: dataSource, path: path) }
        .first
    }

    let parse = { (components: [DeeplinkComponent]) in
      navigators
        .compactMap { $0.parse(components: components) }
        .first
    }

    return Navigator(
      buildPath: buildPath,
      parse: parse
    )
  }

  static func anyOf(
    _ navigators: Navigator...
  ) -> Navigator {
    anyOf(navigators)
  }
}
