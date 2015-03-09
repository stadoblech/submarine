package;

/**
 * ...
 * @author Qerts
 */
class GameStatus
{
	
	public static var Label:String;
	public static var SubmarineView:View;
	
	//Staty hráče
	public static var Health:Int;
	public static var Energy:Int;
	public static var Terror:Int;
	public static var Oxygen:Int; //v hodinách
	public static var Inventory:Array<String>;
	public static var Ammunition:Int;
	public static var Speed:Int;
	
	//Staty způsobené hráčem
	public static var Damage:Int;
	public static var Move:Array<Maneuvre>;
	public static var TotalActions:Int;
	
	//Systémové staty
	public static var Proceeded:Bool;
	
	public static function RestartProperties():Void
	{
		
		Label = "Welcome subexplorer. Find the way to salvation.... or die here, in waste depths of the Titan's Ocean.";
		
		Health = 100;
		Energy = 100;
		Terror = 0;
		Oxygen = 240; //na deset dní		
		Inventory = new Array<String>();
		Ammunition = 100;
		Speed = 3;
		
		RestartPlayerStats();
	}
	
	public static function RestartPlayerStats():Void
	{
		Damage = 0;
		Move = new Array<Maneuvre>();
		TotalActions = 0;
	}
	
	
}
