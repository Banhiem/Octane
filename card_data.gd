
# Unitinfo = [Type, Attack, Retaliation, Health, Cost, Name, Melee or Ranged, Special Text]
# Eventinfo = [Type, Cost, Effect]

enum {Peasant, BlindBarter, FootSoldier, Viking, Gladiator, Samurai, HopLite, Shaman, Knight, Cavalry, Spartan, Centurion, Thief, Death, ScorchedEarth}

const WarriorName = {
	Peasant: 
		["Peasant"],
	BlindBarter:
		["Blind Barter"],
	FootSoldier:
		["Foot Soldier"],
	Viking:
		["Viking"], 
	Gladiator:
		["Gladiator"], 
	Samurai:
		["Samurai"], 
	HopLite:
		["Hoplite"],
	Shaman:
		["Shaman"], 
	Knight:
		["Knight"], 
	Cavalry:
		["Cavalry"], 
	Spartan:
		["Spartan"], 
	Centurion:
		["Centurion"],
	Thief:
		["Thief"],
	Death:
		["Death"],
	ScorchedEarth:
		["Scorched Earth"],
	}

const DATA = {
	Peasant : 
		["Warrior", '1', 1,''],
	BlindBarter :
		["Magic", 'Draw Card', '', ''],
	FootSoldier :
		["Warrior", '2', 2,''],
	Viking:
		["Warrior", '3', 3 ,''],
	Gladiator :
		["Warrior", '4', 4, "4 or Less"],
	Samurai :
		["Warrior", '5', 5,''],
	HopLite : 
		["Warrior", '6', 6,''],
	Shaman :
		["Warrior", '7', 7,'Block Magic'],
	Knight :
		["Warrior", '8', 8,''],
	Cavalry :
		["Warrior", '9', 9, "Skip next player"],
	Spartan :
		["Warrior", '10', 10,''],
	Centurion :
		["Warrior", '11', 11, "Reverse Order"],
	Thief:
		["Magic", "Invisible",'',''],
	Death:
		["Magic", "Reset",'',''],
	ScorchedEarth:
		["Magic", "Burn",'',''],
	}
