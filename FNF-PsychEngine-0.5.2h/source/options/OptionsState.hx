package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import openfl.Lib;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Note Colors', 'Controls', 'Adjust Delay and Combo', 'Graphics', 'Visuals and UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
			    FlxG.sound.music.stop();
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Options - " + options[curSelected];
	}

	var glow:FlxSprite;
	var bars:FlxSprite;
	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		FlxG.sound.playMusic(Paths.music('configMenu'));
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('Options/menuBG-Options'));
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		var glow:FlxSprite = new FlxSprite().loadGraphic(Paths.image('Options/Glow_Options'));
		glow.screenCenter();
		glow.antialiasing = ClientPrefs.globalAntialiasing;
		add(glow);
		
		var bars:FlxSprite = new FlxSprite().loadGraphic(Paths.image('Options/Options_Bars'));
		bars.screenCenter();
		bars.antialiasing = ClientPrefs.globalAntialiasing;
		add(bars);

	 var hours:Int = Date.now().getHours();
        if(hours > 19) { //Night Menu
           bg.loadGraphic(Paths.image('Options/menuBG-Night-Options'));
		   glow.loadGraphic(Paths.image('Options/Glow_Night_Options'));
	    } else if(hours > 8) { //Day Menu
           bg.loadGraphic(Paths.image('Options/menuBG-Options'));
		   glow.loadGraphic(Paths.image('Options/Glow_Options'));
        }
	
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '>', true, false);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true, false);
		add(selectorRight);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();

		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Options";
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Options";
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
			FlxG.sound.music.stop();
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}