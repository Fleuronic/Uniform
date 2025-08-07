import struct DrumKit.Location

public extension Location {
	static func info(for name: String) -> (String, String, String)? {
		guard 
			case let components = name.replacingOccurrences(of: ",", with: "").split(separator: " "),
			let stateIndex = (components.firstIndex { $0.allSatisfy(\.isUppercase) }) else { return nil }
		
		let city = components[0..<stateIndex].joined(separator: " ")
		let state = String(components[stateIndex]).uppercased()
		let country = if stateIndex == components.count - 1 {
			"United States"
		} else {
			components[(stateIndex + 1)...].joined(separator: " ")
		}

		return (city, state, country)
	}
}
