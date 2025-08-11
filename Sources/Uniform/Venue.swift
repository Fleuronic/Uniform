import struct DrumKit.Venue

public extension Venue {
	static func info(for record: String) -> (String, String?) {
		var name: String
		var host: String? = nil
		let components = record
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: " at the ", with: " at ")
			.components(separatedBy: " at ")

		if components.count == 2 {
			name = components[0]
			host = components[1]
		}

		name = components[0]
			.components(separatedBy: "-")[0]
			.replacingOccurrencesOf("HS", with: "High School")
		
		name = switch name {
		case "Breitenbach Stadium": "Otto Breitenbach Stadium"
		case "Broken Arrow Memorial Stadium": "Tiger Stadium"
		case "Central High School Stadium": "Central High School Football Stadium"
		case "Centerville High School Stadium": "Centerville Stadium"
		case "Champlin Park High School Football Field": "Rebel Stadium"
		case "Clifton School Stadium": "Clifton Stadium"
		case "Dwire Field": "Atrium Stadium"
		case "Lon C Burchfield Stadium": "Lon C. Burchfield Stadium"
		case "Salem Stadium": "Salem Football Stadium"
		case "Veterans Memorial "
		     case "Vikings Stadium": "Northgate Vikings Stadium"
		default: name
		}

		host = switch name {
		case "Allegacy Federal Credit Union Stadium": "Wake Forest University"
		case "Ankeny Stadium": "Northview Middle School"
		case "Atrium Stadium": "Mason High School"
		case "Blakeslee Stadium": "Minnesota State University, Mankato"
		case "Brunswick Auto Mart Stadium": "Brunswick High School"
		case "Bob Goalby Field": "Belleville West High School"
		case "Canvas Stadium": "Colorado State University"
		case "Cedarburg High School Stadium": "Cedarburg High School"
		case "Centerville Stadium": "Centerville High School"
		case "Central High School Football Stadium": "Central High School"
		case "College Boulevard Activity Center": "Olathe Northwest High School"
		case "DATCU Stadium": "University of North Texas"
		case "Dalzell Field": "Clarke University"
		case "Delaware Stadium": "University of Delaware"
		case "Georgelis Law Firm Stadium": "Hempfield High School"
		case "Golden Wave Stadium": "Tupelo High School"
		case "Hillsboro Stadium": "Portland State University"
		case "Joan C. Edwards Stadium": "Marshall University"
		case "Lon C. Burchfield Stadium": "Sevier County High School"
		case "M. M. Roberts Stadium": "University of Southern Mississippi"
		case "Marion Harding Football Stadium": "Marion Harding High School"
		case "Neil F. Lampson Stadium": "Kennewick High School"
		case "Northgate Vikings Stadium": "Northgate High School"
		case "Otto Breitenbach Stadium": "Middleton High School"
		case "Perkins Stadium": "University of Wisconsin–Whitewater"
		case "Rebel Stadium": "Champlin Park High School"
		case "Salem Football Stadium": "Salem High School"
		case "Scheumann Stadium": "Ball State University"
		case "Sox Harrison Stadium": "Pennsylvania Western University, Edinboro"
		case "Stanford Stadium": "Stanford University"
		case "TDECU Stadium": "University of Houston"
		case "Tiger Stadium": "Broken Arrow High School"
		case "Veterans Memorial Stadium": "Lawrence High School"
		case "Veterans Memorial Field Sports Complex": "University of Wisconsin–La Crosse"
		case "Wildcat Stadium": "Indiana Wesleyan University"
		default: host
		}
		
		let stadiumName: String? = switch name {
		case "Shelton High School": "Finn Stadium"
		case "Cedarburg High School": "Alumni Field"
		case "Dover Area High School": "Eagles Stadium"
		default: name.hasSuffix("High School") ? "\(name) Stadium" : nil
		}

		if let stadiumName {
			host = name
			name = stadiumName
		} else {
			host = switch host {
			case "Texas A&M": "Texas A&M University"
			default: host
			}
		}

		return (name, host)
	}
}
