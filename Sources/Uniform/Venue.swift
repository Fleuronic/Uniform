import struct DrumKit.Venue

public extension Venue {
	static func info(for record: String, at streetAddress: String) -> (String, String?) {
		switch streetAddress {
		case "1 Big Red Dr": return ("Plymouth High School Stadium", "Plymouth High School")
		case "1 Bills Dr": return ("New Era Field", nil)
		case "1 Citrus Bowl Pl": return ("Camping World Stadium", nil)
		case "1 Crusader Way": return ("Rocco Ortenzio Stadium", "Bishop McDevitt High School")
		case "1 MetLife Stadium Dr": return ("MetLife Stadium", nil)
		case "100 Calumet Ave": return ("Spartan Stadium", "Lima Senior High School")
		case "100 Carson Park Dr": return ("Carson Park", nil)
		case "1000 Machmueller St": return ("Stiehm Stadium", "DC Everest Junior High School")
		case "1000 Mulberry St": return ("St. Vincent Health Stadium", "Zionsville Community High School")
		case "1000 S Silver Springs Rd": return ("Tiger Stadium", "Cape Central High School")
		case "1000 Weigles Hill Rd": return ("Warrior Stadium", "Elizabeth Forward High School")
		case "10211 W Parmer Ln": return ("Kelly Reeves Athletic Complex", nil)
		case "1055 Fowler Ave": return ("Lamonica Stadium", "Clovis High School")
		case "11111 Artesia Blvd": return ("Rants Stadium", "Gahr High School")
		case "11237 Kingston Pike": return ("Eddie Courtney Stadium", "Farragut High School")
		case "114 17th Ave East": return ("Don and Nona Williams Stadium", "University of Wisconsin–Stout")
		case "1165 Eaton Ave": return ("Virgil Schwarm Stadium", "Hamilton High School")
		case "1213 W Allison Rd": return ("Bison Stadium", "Cheyenne South High School")
		case "1282 N Dupont Hwy": return ("Alumni Stadium", "Delaware State University")
		case "1327 Stadium Dr": return ("Five Star Stadium", "Mercer University")
		case "1420 11th Ave SE": return ("Mayo High School Stadium", "Mayo High School")
		case "1500 Greenland Dr": return ("Jonny “Red” Floyd Stadium", "Middle Tennessee State University")
		case "152 Kroncke Dr": return ("Sun Prairie Stadium", "Sun Prairie West High School")
		case "15301 S McNab Ave": return ("Ron Yary Stadium", "Bellflower High School")
		case "1565 East Central Ave": return ("Duarte High School Stadium", "Duarte High School")
		case "1600 Stadium Dr": return ("Panther Stadium", "Prairie View A&M University")
		case "1601 Longhorn Dr": return ("Longhorn Stadium", "Rancho Buena Vista High School")
		case "1606 Norman Dr": return ("Martin Stadium", "Lowndes High School")
		case "1620 E Bulldog Ln": return ("Valley Children’s Stadium", "California State University, Fresno")
		case "1630 Bogie Lake Rd": return ("Lakeland High School Stadium", "Lakeland High School")
		case "1701 Bryant St": return ("Empower Field at Mile High", nil)
		case "175 Avon Belden Rd": return ("Avon Lake Memorial Stadium", "Avon Lake High School")
		case "1801 SE J St": return ("Tiger Stadium", "Bentonville High School")
		case "1900 Avalon Ave": return ("James Moore Stadium", "Muscle Shoals High School")
		case "1AMB Dr NW": return ("Mercedes Benz Stadium", nil)
		case "200 Elizabeth St": return ("Laidley Field", "University of Charleston")
		case "2000 Brush St": return ("Ford Field", nil)
		case "2000 S Millennium Way": return ("Mountain View High School Stadium", "Mountain View High School")
		case "201 Reinhardt Dr": return ("Cajun Field", "University of Louisiana at Lafayette")
		case "20235 Cypress Rosehill Rd": return ("Tomball ISD Stadium", nil)
		case "20655 Flagstaff Ave": return ("Tiger Stadium", "Farmington High School")
		case "2091 238 St": return ("Oskaloosa Community Stadium", nil)
		case "2213 Summit St": return ("Dix Stadium", nil)
		case "24 High School Dr": return ("EHTHS Football Stadium", "Egg Harbor Township High School")
		case "2401 Panther Pl": return ("West Park Stadium", "West Park High School")
		case "2411 W Scyene Rd": return ("Mesquite Memorial Stadium", "West Mesquite High School")
		case "2521 Walnut Ave": return ("Mattoon High School Stadium", "Mattoon High School")
		case "2800 W Gore Blvd": return ("Cameron University Stadium", "Cameron University")
		case "3000 Gateway Campus Blvd": return ("Antimarino Stadium", "Gateway High School")
		case "304 Farragut Rd": return ("Navy-Marine Corps Memorial Stadium", "United States Naval Academy")
		case "308 Warhawk Way": return ("Warhawk Field", "University of Louisiana Monroe")
		case "3128 Graydon Ave": return ("Trojan Stadium", "East Troy High School")
		case "3201 Peters Ave": return ("Elwood Olsen Stadium", "Morningside University")
		case "33000 Yucaipa Blvd": return ("Yucaipa High School Athletics Stadium", "Yucaipa High School")
		case "3333 10th St": return ("Linn-Mar Stadium", "Linn-Mar High School")
		case "335 S Hollywood St": return ("Liberty Bowl Memorial Stadium", nil)
		case "350 N Dreier Blvd": return ("Reitz Bowl", "FJ Reitz High School")
		case "373 Malvern Rd": return ("Rebels Stadium", "Rehobeth High School")
		case "375 E Exchange St": return ("InfoCision Stadium", "University of Akron")
		case "378 Wightman St": return ("Raider Stadium", "Southern Oregon University")
		case "3835 Freeport Blvd": return ("Hughes Stadium", "Sacramento City College")
		case "3885 Jefferson St": return ("Ramona High School Stadium", "Ramona High School")
		case "3900 E Raab Rd": return ("Normal Community High School Stadium", "Normal Community High School")
		case "4000 Ontario Center": return ("Toyota Arena", nil)
		case "4000 St Francis Dr": return ("Boylan Catholic High School Stadium", "Boylan Catholic High School")
		case "4001 Wildcat Dr": return ("Wildcat Stadium", "Calallen High School")
		case "405 Logan Ave N": return ("Renton Memorial Stadium", nil)
		case "4100 Kroes St NE": return ("Carlson-Munger Stadium", "Rockford High School")
		case "4300 Main St": return ("Foshee-Henderson Stadium", "Stanhope Elmore High School")
		case "44 School Dr": return ("Paul V. Moore High School Stadium", "Paul V. Moore High School")
		case "4400 Braselton Hwy": return ("Mill Creek Community Stadium", "Mill Creek High School")
		case "4800 Magnolia Ave": return ("Wheelock Stadium", "Riverside City College")
		case "500 E Veterans Way": return ("Sun Devil Stadium", "Arizona State University")
		case "500 Turin St": return ("Rome Free Academy Stadium", "Rome Free Academy")
		case "5151 Park Ave": return ("Campus Field", "Sacred Heart University")
		case "5175 Franz Rd": return ("Legacy Stadium", nil)
		case "525 7th St NE": return ("Memorial Stadium", "Hoover High School")
		case "529 Hurffville - Cross Keys Rd 2831": return ("Tom Brown Field", "Washington Township High School")
		case "5469 Trussville Clay Rd": return ("Hewitt-Trussville Football Stadium", "Hewitt-Trussville High School")
		case "574 N Park Ln": return ("Eagle High School Football Field", "Eagle High School")
		case "600 Lake Rd": return ("Tiger Field", "Belton High School")
		case "600 Lincoln Ave": return ("O’Brien Field", "Eastern Illinois University")
		case "600 W North Bend Rd": return ("St. Xavier Stadium", "St. Xavier High School")
		case "6000 J St": return ("Hornet Stadium", "California State University, Sacramento")
		case "610 W 4th St": return ("J. Leslie Rollins Stadium", "Buena Vista University")
		case "6200 140th St W": return ("Lightning Stadium", "East View High School")
		case "684 Starr Rd": return ("Streidl Field", "Plainwell High School")
		case "701 South Mount Vernon Ave": return ("SBVC Stadium", "San Bernardino Valley College")
		case "725 N 18th Ave": return ("Edgar Brown Memorial Stadium", "Pasco High School")
		case "801 Hosking Ave": return ("Golden Valley Football Field", "Golden Valley High School")
		case "8135 S Westnedge Ave": return ("McCamley Field", "Portage Central High School")
		case "850 Hancock St": return ("Veterans Memorial Stadium", nil)
		case "851 30th Ave SE": return ("Rochester Regional Stadium", "Rochester Community and Technical College")
		case "8705 Campbellton St": return ("Tiger Stadium", "Douglas County High School")
		case "929 Monroe Dr NE": return ("Eddie S. Henderson Stadium", nil)
		case "930 S Elm St": return ("Natona County High School Stadium", "Natona County High School")
		case "98 Rundlett Hill Rd": return ("Grappone Stadium", "Saint Anselm College")
		case "9300 Lawson Rd": return ("Jubilee Stadium", "Daphne High School")
		case "2225 Oliver Jackson Blvd": return ("Wildcat Stadium", "Abilene Christian University")
		case "Rte 111-West Hollis St": return ("Stellos Stadium", nil)
		case "400 S Haverhill Rd": return ("Butler Football Stadium", "Butler Community College of El Dorado")
		default: break
		}

		var name: String
		var host: String? = nil
		let components = record
			.replacingOccurrences(of: "  ", with: " ")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: " at the ", with: " at ")
			.components(separatedBy: " at ")

		if components.count == 2 {
			name = components[0]
			host = components[1]
		}

		name = components[0]
			.components(separatedBy: "-")[0]
			.replacingOccurrences(of: "HS", with: "High School")
			.replacingOccurrences(of: "High School Stadium", with: "High School")
		
		name = switch name {
		case "Breitenbach Stadium": "Otto Breitenbach Stadium"
		case "Broken Arrow Memorial Stadium": "Tiger Stadium"
		case "Central High School Stadium": "Central High School Football Stadium"
		case "Centerville High School Stadium": "Centerville Stadium"
		case "Champlin Park High School Football Field": "Rebel Stadium"
		case "Clifton School Stadium": "Clifton Stadium"
		case "Dwire Field": "Atrium Stadium"
		case "Foshee": "Foshee-Henderson Stadium"
		case "Lon C Burchfield Stadium": "Lon C. Burchfield Stadium"
		case "Orrville High School Stadium": "Red Rider Stadium"
		case "Salem Stadium": "Salem Football Stadium"
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
		case "Foshee-Henderson Stadium": "Stanhope Elmore High School"
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
		case "Red Rider Stadium": "Orrville High School"
		case "Rio Rancho Ram Stadium": "Rio Rancho High School"
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
		case "Alta High School": "Alta High School Football Field"
		case "Shelton High School": "Finn Stadium"
		case "Cedarburg High School": "Alumni Field"
		case "Dover Area High School": "Eagles Stadium"
		case "Inderkum High School": "Inderkum High School Football Stadium"
		case "Lakeland High School": "Bryant Stadium"
		case "Los Medanos College": "Los Medanos College Football Stadium"
		case "Monterey Trail High School Stadium": "Mark Macres Memorial Stadium"
		case "Plymouth High School": "Rockpile Stadium"
		default: name.hasSuffix("High School") ? "\(name) Stadium" : nil
		}

		if let stadiumName {
			host = name
			name = stadiumName
		} else {
			host = switch host {
			case "Texas A&M": "Texas A&M University"
			case "West Texas A&M": "West Texas A&M University"
			default: host
			}
		}

		return (name, host)
	}
}
