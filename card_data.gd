
# Unitinfo = [Type, Attack, Retaliation, Health, Cost, Name, Melee or Ranged, Special Text]
# Eventinfo = [Type, Cost, Effect]

enum {Peasant, BlindBarter, FootSoldier, Viking, Gladiator, Samurai, HopLite, Shaman, Knight, Cavalry, Spartan, Centurion, Thief, Death, ScorchedEarth}

const WarriorName = {
	Peasant: 
		["Peasant"],
	BlindBarter:
		["BlindBarter"],
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
		["Warrior", '2', 2, 'Trade Cards'],
	FootSoldier :
		["Warrior", '3', 3,''],
	Viking:
		["Warrior", '4', 4,''],
	Gladiator :
		["Warrior", '5', 5, "4 or Less"],
	Samurai :
		["Warrior", '6', 6,''],
	HopLite : 
		["Warrior", '7', 7,''],
	Shaman :
		["Warrior", '8', 8,'Block Magic'],
	Knight :
		["Warrior", '9', 9,''],
	Cavalry :
		["Warrior", '10', 10, "Skip next player"],
	Spartan :
		["Warrior", '11', 11,''],
	Centurion :
		["Warrior", '12', 12, "Reverse Order"],
	Thief:
		["Magic", "Invisible",'',''],
	Death:
		["Magic", "Reset",'',''],
	ScorchedEarth:
		["Magic", "Burn",'',''],
	}
