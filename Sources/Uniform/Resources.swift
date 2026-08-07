// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

public enum Resources {
	public static func probe() -> String? {
		guard
			let url = Bundle.module.url(forResource: "probe", withExtension: "json"),
			let data = try? Data(contentsOf: url),
			let json = try? JSONSerialization.jsonObject(with: data) as? [String: String]
		else { return nil }

		return json["status"]
	}
}
