
# Unitinfo = [Type, Attack, Retaliation, Health, Cost, Name, Melee or Ranged, Special Text]
# Eventinfo = [Type, Cost, Effect]

enum {Peasant, FootSoldier, Viking, Gladiator, Samurai, HopLite, Knight, Cavalry, Spartan, Centurion, Thief, Death, ScorchedEarth}

const WarriorName = {
	Peasant: 
		["Peasant"],
	FootSoldier:
		["Foot Soldier"],
	Viking:
		["Viking"], 
	Gladiator:
		["Gladiator"], 
	Samurai:
		["Samurai"], 
	HopLite:
		["HopLite"], 
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
	FootSoldier :
		["Warrior", '2', 2,''],
	Viking:
		["Warrior", '3', 3,''],
	Gladiator :
		["Warrior", '4', 4, "4 or Less"],
	Samurai :
		["Warrior", '5', 5,''],
	HopLite : 
		["Warrior", '6', 6,''],
	Knight :
		["Warrior", '7', 7,''],
	Cavalry :
		["Warrior", '8', 8, "Skip next player"],
	Spartan :
		["Warrior", '9', 9,''],
	Centurion :
		["Warrior", '10', 10, "Reverse Order"],
	Thief:
		["Magic", "Invisible",'',''],
	Death:
		["Magic", "Reset",'',''],
	ScorchedEarth:
		["Magic", "Burn",'',''],
	}
