package events.marvellousCave;
using flixel.util.FlxRandom;

/**
 * ...
 * @author Qerts
 */
class MarvellousCave2 extends Event
{

	public function new() 
	{
		super();
		continues = true;
	}	
	
	
	//Vrátí následovníka funkce.
	override public function GetFollowingEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 2);
		switch (rand) 
		{
			case 0:
				return new MarvellousCave5();				
			case 1:
				return new MarvellousCave3();
			case 2:
				return new MarvellousCave4();
			default:
				return null;
		}
	}
	
	//Nastaví počáteční podmínky pro hráče + smaže obrazovku + vypíše na obrazovku nějaký status.
	override public function SetConditions():Void
	{
		//Tento event nemá žádné podmínky.
		GameStatus.Label = "Plujes dal a tunel se pomalu rozsiruje. V zari vsudypritomnych krystalu a vlastnich svetel vidis, ze ses dostal na krizovatku. Dal vedou tri cesty. Nahoru, odkud prichazi nejvetsi zare krystalu, dolu do tmy, kam ale proudi nejvice vody nebo rovne. Rozhodnuti je na tobe, snad te nebude stat zivot.";
		GameStatus.SubmarineView = View.MarvellousCave_CrossRoad;
		
	}	
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		var shot:Bool = false;
		var tooQuick:Bool = false;
		var rightMove:Bool = false;
		var wrongMove:Bool = false;
		
		GameStatus.Label = "";		
		
		var rate:Int = 0;
		
		//Vyhodnocení rychlosti
		switch (GameStatus.Speed) 
		{
			case 1:
				rate++;
			case 2:
				rate++;
			case 3:
				rate++;
			case 4:
				rate++;
			case 5:
				rate--;
				tooQuick = true;
			case 6:
				rate--;
				tooQuick = true;
			case 7:
				rate--;
				tooQuick = true;
			case 8:
				rate--;
				tooQuick = true;
			case 9:
				rate--;
				tooQuick = true;
			case 10:
				rate--;
				tooQuick = true;
			default:
				rate--;
		}
		//Vyhodnocení směrů
		for (i in GameStatus.Move) 
		{
			switch (i) 
			{
				case Maneuvre.Down:
					if (!rightMove) 
					{
						rate++;
						GameStatus.Label += "Dolu do hlubin? Tvou lod polyka tma tak hutna, ze ji neproriznou skoro ani svetlomety.";
						rightMove = true;
					}
				case Maneuvre.Left:
					rate--;
					wrongMove = true;
				case Maneuvre.Right:
					rate--;
					wrongMove = true;
				case Maneuvre.Up:	
					if (!rightMove) 
					{
						rate++;
						GameStatus.Label += "Zamiril jsi nahoru, do zare. S kazdym sahem je svetlo jasnejsi a jasnejsi, az nevidis temer nic.";
						rightMove = true;
					}
				default:
					
			}
		}
		//Vyhodnocení dmg
		switch (GameStatus.Damage) 
		{
			case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10:
				shot = true;
				rate--;
			case 11, 12, 13, 14, 16, 17, 18, 19, 20:
				shot = true;
				rate--;
			case 21, 22, 23, 24, 25, 26, 27, 28, 29, 30:
				shot = true;
				rate--;
			case 31, 32, 33, 34, 35, 36, 37, 38, 39, 40:
				shot = true;
				rate--;
			default:
				
		}
		//Speciální vyhodnocení
		if (shot) 
		{
			//GameStatus.Label += "Ouch, captain. Don't shot in caves! It could be dangerous... ye know...";
			GameStatus.Label += "Nevidis malem ani zablesk zbrani, ale v jeskynich rozhodne nestrilej! ";
		}
		if (tooQuick) 
		{
			GameStatus.Label += "A vubec, brzdi, nebo to napalis do steny!";
		}
		if (rightMove) 
		{
			
		}
		if (wrongMove) 
		{
			//GameStatus.Label += "Anyway, what ye think ya doing, captain? Dese maneuvers are very unsafe in place like this. Now ye damaged yer ship, lad.";
			GameStatus.Label += "Ne, do stran zadne cesty nevedou, jen jsi promackl par plechu.";
			GameStatus.Health -= 2;
		}
		
		//Vyhodnocení ratu
		if (rate < 0) 
		{
			rate = 0;
		}
		switch (rate) 
		{
			case 0:
				//GameStatus.Label += "Dis doesn't look well sir. Yer submarine is maybe too large for this tunnel... or for ye to handle. Dis will leave some scars. Anyway, don't ye think this is kinda creepy, captain? Dis shiny tunnel is really ... pinky. And thin too.";
				GameStatus.Label += "Tohle nevypada dobre, pane. Tvoje ponorka je mozna prilis velka, aby se vlezla do tunelu... nebo abys ji zvladl. Tohle necha par sramu. Nicmene, nemyslis, ze je to tady dost desive, kapitane? Tendlenc zarivy tunel je opravdu... ruzovy. A taky uzky.";
				GameStatus.Health -= 5;
				GameStatus.Terror--;
			case 1:
				//GameStatus.Label += "Don't ye think this is kinda creepy, captain? Dis shiny tunnel is really ... pinky. And thin too.";
				GameStatus.Label += "Tohle slo dobre, tunel je dostatecne siroky a tobe se tresou ruce jen trochu. Zadny strach, smrt v takove hloubce by byla rychla.";
				GameStatus.Terror--;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
			case 20:
			case 21:
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
			case 30:
				
				
			default:
				
		}
	}
	
}