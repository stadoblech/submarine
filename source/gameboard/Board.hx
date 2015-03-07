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
	
}