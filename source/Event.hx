package;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Qerts
 */
class Event
{
	//Základní vlastnosti eventu
	private var followingEvent:Event;		//případný následující event
	private var continues:Bool = false;		//jestli event pokračuje dalším eventem nebo ne
	private var ending:Bool = false;		//jestli event končí nebo ne
	
	private var startingLabel:String;
	private var endingLabel:String;
	
	public function new() 
	{
		
	}
	
	//Vrátí, zda event končí nebo ne.
	public function isEventEnding():Bool
	{
		return ending;
	}
	
	//Řekne eventu, že by měl skončit a hráč právě hrál své kolo.
	public function EndEvent()
	{
		ending = true;
	}
	
	//Vrátí, zda má event nějakého následovníka nebo ne.
	public function DoesContinue():Bool
	{
		return continues;
	}
	
	//Vrátí následovníka funkce.
	public function GetFollowingEvent():Event
	{
		return null;
	}
	
	//Nastaví počáteční podmínky pro hráče + smaže obrazovku + vypíše na obrazovku nějaký status.
	public function SetConditions():Void
	{
		ending = true;
		
	}
	
	//Zruší počáteční podmínky pro hráče + smaže status.
	public function UnsetConditions():Void
	{
		
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	public function MakePlayerPay():Void
	{
		
	}
	
}