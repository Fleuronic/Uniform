// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Location

public extension Location {
	typealias Info = (String, String, String)

	// TODO: Ask claude to make sure this is complete across DCX
	static func info(for record: String) -> Info? {
		let record = record.replacingOccurrences(of: "'", with: "’")
		if record.contains("Calgary") {
			return ("Calgary", "AB", "Canada")
		} else if record.contains("Sherbrooke") {
			return ("Sherbrooke", "QC", "Canada")
		} else if record.contains("Beijing") {
			return ("Haidian", "Beijing", "China")
		} else if record.contains("Shanghai") {
			return ("Jing’an", "Shanghai", "China")
		} else if record.contains("Dadizele") {
			return ("Dadizele", "West Flanders", "Belgium")
		} else if record.contains("Arklow") {
			return ("Arklow", "Co. Wicklow", "Ireland")
		} else if record.contains("Barnsley England") {
			return ("Barnsley", "South Yorkshire", "United Kingdom")
		} else if record.contains("Widnes Cheshire") {
			return ("Widnes", "Cheshire", "United Kingdom")
		} else if record.contains("Kerkrade") {
			return ("Kerkrade", "Limburg", "Netherlands")
		} else if record.contains("Middelburg") || record.contains("Middleburg") {
			return ("Middelburg", "Zeeland", "Netherlands")
		} else if record.contains("Huizen") {
			return ("Huizen", "North Holland", "Netherlands")
		} else if record.contains("Union City") {
			return ("Union City", "CA", "United States")
		} else if record.contains("Barnsley") {
			return ("Barnsley", "South Yorkshire", "United Kingdom")
		} else if record.contains("Woking") {
			return ("Woking", "Surrey", "United Kingdom")
		} else if record.contains("Leicester") {
			return ("Leicester", "Leicestershire", "United Kingdom")
		} else if record.contains("Stoke") {
			return ("Stoke-on-Trent", "Staffordshire", "United Kingdom")
		} else if record.contains("Tottenham") {
			return ("Tottenham", "Greater London", "United Kingdom")
		} else if record.contains("Warrington United Kingdom") {
			return ("Warrington", "Cheshire", "United Kingdom")
		} else if record.contains("Aldershot") {
			return ("Aldershot", "Hampshire", "United Kingdom")
		} else if record.contains("Grantham United Kingdom") {
			return ("Grantham", "Lincolnshire", "United Kingdom")
		} else if record.contains("Scunthorpe") {
			return ("Scunthorpe", "Lincolnshire", "United Kingdom")
		} else if record.contains("Milton Keynes") {
			return ("Milton Keynes", "Buckinghamshire", "United Kingdom")
		} else if record.contains("Bedfordshire") {
			return ("Bedford", "Bedfordshire", "United Kingdom")
		} else if record.contains("Gent Belgium") {
			return ("Ghent", "East Flanders", "Belgium")
		} else if record.contains("Antwerpen") {
			return ("Antwerp", "Antwerp", "Belgium")
		} else if record.contains("Assen") {
			return ("Assen", "Drenthe", "Netherlands")
		} else if record.contains("Axel") {
			return ("Axel", "Zeeland", "Netherlands")
		} else if record.contains("Zaandam") {
			return ("Zaandam", "North Holland", "Netherlands")
		} else if record.contains("Helmond") {
			return ("Helmond", "North Brabant", "Netherlands")
		} else if record.contains("Beverwijk") {
			return ("Beverwijk", "North Holland", "Netherlands")
		} else if record.contains("Yokohama") {
			return ("Yokohama", "Kanagawa", "Japan")
		} else if record.contains("Hachioji") {
			return ("Hachioji", "Tokyo", "Japan")
		} else if record.contains("Strangnas") || record.contains("Strängnäs") {
			return ("Strängnäs", "Södermanland", "Sweden")
		} else if record.contains("North Point, Hong Kong") {
			return ("North Point", "Hong Kong", "China")
		} else if record.contains("Heredia") {
			return ("Mercedes Norte", "Heredia", "Costa Rica")
		}

		switch record {
		case "TBA, Midwest": return ("Louisville", "KY", "United States")
		case "Washington, D.C.": return ("Washington", "D.C.", "United States")
		case "Ireland": return ("Dublin", "Co. Dublin", "Ireland")
		default: break
		}

		let components = record.replacingOccurrences(of: ",", with: "").split(separator: " ")
		guard let stateIndex = (components.firstIndex { $0.allSatisfy(\.isUppercase) }) else {
			let components = record.components(separatedBy: ", ")
			return components.count == 3 ? (components[0], components[1], components[2]) : nil
		}

		var city = components[0..<stateIndex].joined(separator: " ")
		var state = String(components[stateIndex]).uppercased()
		let country = if stateIndex == components.count - 1 {
			"United States"
		} else {
			components[(stateIndex + 1)...].joined(separator: " ")
		}

		city = switch city {
		case "City of Industry": "Diamond Bar"
		case "LaCrosse": "La Crosse"
		case "MIllbrook", "Milbrook": "Millbrook"
		case "Winston Salem": "Winston-Salem"
		case "Ft. Edward/Glens Falls": "Glens Falls"
		case "Ft. Mill", "Ft Mill": "Fort Mill"
		case "Ft. Edward": "Fort Edward"
		case "Ft. Monmouth": "Fort Monmouth"
		case "Ft. Walton Beach": "Fort Walton Beach"
		case "Ft. Wayne": "Fort Wayne"
		case "Ft. Worth": "Fort Worth"
		case "Mt. Olive": "Mount Olive"
		case "St. Paul": "Saint Paul"
		case "Saint Peter": "St. Peter"
		case "St. Eustache": "Saint-Eustache"
		case "St. Hyacinthe": "Saint-Hyacinthe"
		case "St. Jean Chrysostome": "Saint-Jean-Chrysostome"
		case "Appleton; Menasha": "Appleton"
		case "Dallas; Fort Worth": "Dallas"
		case "Houston; Austin": "Houston"
		case "Mississauga; Stoney Creek": "Mississauga"
		case "Hopkinsville; Murray": "Murray"
		case "Grande Prairie; Dallas": "Grand Prairie"
		case "Kitchner": "Kitchener"
		case "Jolliette": "Joliette"
		case "Lions Park Brantford": "Brantford"
		case "Riviere du Loup": "Rivière-du-Loup"
		case "Glens Falls/Ft. Edward": "Glens Falls"
		case "Bloomington/Normal": "Bloomington–Normal"
		case "Dallas/Fort Worth": "Dallas–Fort Worth"
		default: city
		}

		state = switch state {
		case "DC": "D.C."
		case "ONT": "ON"
		case "ALB": "AB"
		case "SAS": "SK"
		case "QUE", "QU": "QC"
		default: state
		}

		return (city, state, country)
	}
}
