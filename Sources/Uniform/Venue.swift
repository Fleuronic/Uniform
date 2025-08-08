import struct DrumKit.Venue

public extension Venue {
	static func info(for record: String) -> (String, String?) {
		let components = record.components(separatedBy: " at ")
		if components.count == 2 {
			return (components[0], components[1])
		}

		var name = components[0]
		var host: String? = switch name {
		case "Scheumann Stadium": "Ball State University"
		case "Canvas Stadium": "Colorado State University"
		case "Neil F. Lampson Stadium": "Kennewick High School"
		case "Hillsboro Stadium": "Portland State University"
		default: nil
		}
		
		let stadiumName: String? = switch name {
		case "Shelton High School": "Finn Stadium"
		case "Cedarburg High School": "Alumni Field"
		default: nil
		}

		if let stadiumName {
			host = name
			name = stadiumName
		}

		return (name, host)
	}
}

// "Cedarburg High School Stadium" "Cedarburg High School Stadium" 
// "Everett Memorial Stadium" "Everett Memorial Stadium" 
// "Swanson Stadium at Guilford High School Stadium" "Swanson Stadium at Guilford High School" 
// "Hillsboro Stadium" "Hillsboro Stadium" 
// "Oxnard High School Stadium" "Oxnard High School" 
// "Inderkum High School Stadium" "Inderkum High School" 
// "Perkins Stadium" "Perkins Stadium" 
// "River Bluff High School-Lexington,SC Stadium" "River Bluff High School-Lexington,SC" 
// "Stanford Stadium" "Stanford Stadium" 
// "Veterans Memorial Field Sports Complex Stadium" "Veterans Memorial Field Sports Complex" 
// "Lon C Burchfield Stadium at Sevier County HS Stadium" "Lon C Burchfield Stadium at Sevier County HS" 
// "Blakeslee Stadium" "Blakeslee Stadium" 
// "Vikings Stadium" "Vikings Stadium" 
// "Memorial Stadium at Bakersfield College Stadium" "Memorial Stadium at Bakersfield College" 
// "Cougar Stadium at College of Canyons Stadium" "Cougar Stadium at College of Canyons" 
// "Ankeny Stadium" "Ankeny Stadium" 
// "Golden Wave Stadium" "Golden Wave Stadium" 
// "Hilmer Lodge Stadium at Mt. San Antonio College Stadium" "Hilmer Lodge Stadium at Mt. San Antonio College" 
// "Dalzell Field Stadium" "Dalzell Field" 
// "Rose Bowl Stadium" "Rose Bowl Stadium" 
// "Clifton School Stadium" "Clifton School Stadium" 
// "The Sports Complex at Benedictine University Stadium" "The Sports Complex at Benedictine University" 
// "War Memorial Stadium" "War Memorial Stadium" 
// "Buena Park High School Stadium" "Buena Park High School" 
// "John D. Riggs Stadium at Mesa Community College Stadium" "John D. Riggs Stadium at Mesa Community College" 
// "College Boulevard Activity Center Stadium" "College Boulevard Activity Center" 
// "Broken Arrow Memorial Stadium" "Broken Arrow Memorial Stadium" 
// "Rio Rancho Ram Stadium" "Rio Rancho Ram Stadium" 
// "Buffalo Stadium at West Texas A&amp;M Stadium" "Buffalo Stadium at West Texas A&amp;M" 
// "Panther Stadium at Midway High School Stadium" "Panther Stadium at Midway High School" 
// "DATCU Stadium" "DATCU Stadium" 
// "TDECU Stadium" "TDECU Stadium" 
// "Alamodome Stadium" "Alamodome" 
// "Georgelis Law Firm Stadium" "Georgelis Law Firm Stadium" 
// "Champlin Park High School Football Field Stadium" "Champlin Park High School Football Field" 
// "Pennington Field at HEB ISD Stadium" "Pennington Field at HEB ISD" 
// "McKinney ISD Stadium" "McKinney ISD Stadium" 
// "Miami Valley South Stadium at Bellbrook High School Stadium" "Miami Valley South Stadium at Bellbrook High School" 
// "Bob Goalby Field Stadium" "Bob Goalby Field" 
// "Central High School Stadium" "Central High School Stadium" 
// "Brunswick Auto Mart Stadium" "Brunswick Auto Mart Stadium" 
// "M. M. Roberts Stadium" "M. M. Roberts Stadium" 
// "Breitenbach Stadium" "Breitenbach Stadium" 
// "Jaguar Stadium at Spain Park High School Stadium" "Jaguar Stadium at Spain Park High School" 
// "Nissan Stadium" "Nissan Stadium" 
// "Dover Area High School Stadium" "Dover Area High School" 
// "Center Parc Stadium" "Center Parc Stadium" 
// "Roxbury HS Stadium" "Roxbury HS Stadium" 
// "Huskie Stadium at Northern Illinois University Stadium" "Huskie Stadium at Northern Illinois University" 
// "War Memorial Field Stadium" "War Memorial Field" 
// "Allegacy Federal Credit Union Stadium" "Allegacy Federal Credit Union Stadium" 
// "Norton High School Stadium" "Norton High School Stadium" 
// "Dwire Field Stadium" "Dwire Field" 
// "Centerville High School Stadium" "Centerville High School Stadium" 
// "Delaware Stadium" "Delaware Stadium" 
// "Doug Shaw Memorial Stadium" "Doug Shaw Memorial Stadium" 
// "Richard Wackar Stadium at Rowan University Stadium" "Richard Wackar Stadium at Rowan University" 
// "Salem Stadium" "Salem Stadium" 
// "Joan C. Edwards Stadium" "Joan C. Edwards Stadium" 
// "Marion Harding Football Stadium" "Marion Harding Football Stadium" 
// "Veterans Memorial Stadium" "Veterans Memorial Stadium" 
// "J. Birney Crum Stadium" "J. Birney Crum Stadium" 
// "J. Birney Crum Stadium" "J. Birney Crum Stadium" 
// "STA Stadium at Williamsport Area High School Stadium" "STA Stadium at Williamsport Area High School" 
// "Lubbers Stadium at Grand Valley State University Stadium" "Lubbers Stadium at Grand Valley State University" 
// "Walter E. Kottmeyer Stadium at Downingtown West High School Stadium" "Walter E. Kottmeyer Stadium at Downingtown West High School" 
// "Sox Harrison Stadium" "Sox Harrison Stadium" 
// "Wildcat Stadium" "Wildcat Stadium" 
// "Tom Benson Stadium at the Pro Football Hall of Fame Stadium" "Tom Benson Stadium at the Pro Football Hall of Fame" 
// "Baldwin  High School Stadium" "Baldwin  High School Stadium" 
// "Wildcat Stadium" "Wildcat Stadium" 
// "Lucas Oil Stadium" "Lucas Oil Stadium" 
// "Monument Circle Stadium" "Monument Circle" 
// "Lucas Oil Stadium" "Lucas Oil Stadium" 
// "Lucas Oil Stadium" "Lucas Oil Stadium" 
// "Lucas Oil Stadium" "Lucas Oil Stadium" 
// "Lucas Oil Stadium" "Lucas Oil Stadium" 