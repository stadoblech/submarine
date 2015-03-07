package gameboard ;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.text.FlxTextField;
import flixel.ui.FlxButton;
import neko.Lib;
import openfl.text.TextField;

/**
 * ...
 * @author w
 */
class Board extends FlxSpriteGroup
{
	var attackButton:FlxButton;
	var moveButton:FlxButton;
	var proceedButton:FlxButton;
	static var labelBox:FlxText;
	static var limitBox:FlxTextField;
	var limitBoxLabel:FlxTextField;
	static var actionBox:FlxTextField;
	var actionBocLabel:FlxTextField;
	
	//Prototypové zobrazení statů hráče
	var healthLabel:FlxTextField;
	var healthValue:FlxTextField;
	var energyLabel:FlxTextField;
	var energyValue:FlxTextField;
	var terrorLabel:FlxTextField;
	var terrorValue:FlxTextField;
	var oxygenLabel:FlxTextField;
	var oxygenValue:FlxTextField;
	var ammoLabel:FlxTextField;
	var ammoValue:FlxTextField;
	var invenotryLabel:FlxTextField;
	var invanotryValue:FlxText;
	
	
	
	public function new() 
	{
		super();
		
		attackButton = new FlxButton(100, 100, "Attack", proceedAttack);
		add(attackButton);
		
		moveButton = new FlxButton(100, 200, "Move", proceedMove);
		add(moveButton);
		
		proceedButton = new FlxButton(100, 150, "Proceed", proceedProceed);
		add(proceedButton);
		
		labelBox = new FlxText(200, 100, 300, "error", 8, true);
		add(labelBox);
		
		
		limitBox = new FlxTextField(510, 100, 50,  "0", 8, true);
		add(limitBox);
		limitBoxLabel =  new FlxTextField(510, 90, 50, "Time", 8, true);
		add(limitBoxLabel);
		
		actionBox = new FlxTextField(560, 100, 50, "0", 8, true);
		add(actionBox);
		actionBocLabel = new FlxTextField(560, 90, 50, "Actions", 8, true);
		add(actionBocLabel);
		
		
		//prototypové zobrazení statů hráče
		healthLabel =  new FlxTextField(100, 300, 70, "Health:");
		add(healthLabel);
		healthValue = new FlxTextField(170, 300, 70, "0");
		add(healthValue);
		energyLabel = new FlxTextField(100, 310, 70, "Energy:");
		add(energyLabel);
		energyValue = new FlxTextField(170, 310, 70, "0");
		add(energyValue);
		terrorLabel = new FlxTextField(100, 320, 70, "Terror:");
		add(terrorLabel);
		terrorValue = new FlxTextField(170, 320, 70, "0");
		add(terrorValue);
		oxygenLabel = new FlxTextField(100, 330, 70, "Oxygen:");
		add(oxygenLabel);
		oxygenValue = new FlxTextField(170, 330, 70, "0");
		add(oxygenValue);
		ammoLabel = new FlxTextField(100, 340, 70, "Ammunition:");
		add(ammoLabel);
		ammoValue = new FlxTextField(170, 340, 70, "0");
		add(ammoValue);
		invenotryLabel = new FlxTextField(100, 350, 70, "Inventory:");
		add(invenotryLabel);
		invanotryValue = new FlxText(170, 350, 70, "nothing");
		add(invanotryValue);
	}	
	
	private function proceedProceed():Void
	{
		GameStatus.Proceeded = true;
	}
	
	private function proceedAttack():Void
	{
		GameStatus.TotalActions++;
	}
	
	private function proceedMove():Void
	{
		GameStatus.TotalActions++;
	}
	
	public function setLabel():Void
	{
		labelBox.text = GameStatus.Label;
	}
	
	public static function UpdateLabel():Void
	{
		labelBox.text = GameStatus.Label;
	}
	
	public static function UpdateLimit(timeLimitFormatedString:String, maxActionsLimit:Int ):Void
	{
		limitBox.text = timeLimitFormatedString;
		actionBox.text = GameStatus.TotalActions + "/" + maxActionsLimit;
	}
	
	override public function update():Void 
	{
		super.update();
		
		healthValue.text = Std.string(GameStatus.Health);
		energyValue.text = Std.string(GameStatus.Energy);
		terrorValue.text = Std.string(GameStatus.Terror);
		oxygenValue.text = Std.string(GameStatus.Oxygen);
		ammoValue.text = Std.string(GameStatus.Ammunition);
		//invanotryValue.text = GameStatus.Inventory;
	}
	
}