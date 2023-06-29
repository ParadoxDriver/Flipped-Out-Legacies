package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.Lib;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var flipSelected:Int = 0;	
	public static var psychEngineVersion:String = '0.5.2h'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'options'
	];

    var bg:FlxSprite;
	var grid:FlxSprite;
	var spark:FlxSprite;
    var flip:FlxSprite;
	var barrier:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Main Menu";
		WeekData.loadTheFirstEnabledMod();

		if (!FlxG.sound.music.playing)
		{	
			FlxG.sound.playMusic(Paths.music("freakyMenu"));
		}

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

        var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 2)), 0.1);
		bg = new FlxSprite(-80, 760).loadGraphic(Paths.image('splashes/Main/menuBG'));
		bg.scrollFactor.set(yScroll, 0);
		bg.setGraphicSize(Std.int(bg.width * 1.18));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		
		grid = new FlxBackdrop(Paths.image('splashes/Main/menuBG_Grid'), 0, 0, true, false);
		grid.antialiasing = ClientPrefs.globalAntialiasing;
		grid.screenCenter();
		grid.offset.x -= 0;
		grid.offset.y += 0;
		grid.velocity.x = 35;
		grid.visible = false;
		add(grid);

		spark = new FlxSprite(0, 760).loadGraphic(Paths.image('splashes/Main/menuSpark'));
        spark.scrollFactor.x = 0.05;
		spark.scrollFactor.y = 0;
		spark.setGraphicSize(Std.int(spark.width * 1.10));
		spark.visible = false;
		spark.updateHitbox();
		spark.screenCenter();
		spark.antialiasing = ClientPrefs.globalAntialiasing;
		add(spark);

		flip = new FlxSprite(0, 760).loadGraphic(Paths.image('splashes/Main/menuFlip'));
		flip.scrollFactor.set(0, 0);
		flip.updateHitbox();
		flip.antialiasing = ClientPrefs.globalAntialiasing;
		flip.screenCenter();
		add(flip);

		if(FlxG.random.bool(55.38)) //Alt Menu
		{
			bg.loadGraphic(Paths.image('splashes/Main/menu2BG'));
			spark.visible = true;
			flip.loadGraphic(Paths.image('splashes/Main/menu2Flip'));
		}

		else if(FlxG.random.bool(35.22)) //Paradox Menu
		{
			Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Paradox Edition - Main Menu";
			bg.loadGraphic(Paths.image('splashes/Main/menuBG_Paradox'));
			grid.visible = true;
			flip.loadGraphic(Paths.image('splashes/Main/menuFlip_Paradox'));
		}

		else if(FlxG.random.bool(16.12)) //Corrupted Menu
		{
			Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Corrupted Edition - Main Menu";
			bg.loadGraphic(Paths.image('splashes/Main/menu3BG'));
			flip.loadGraphic(Paths.image('splashes/Main/menu3Flip'));
		}
		
		else if(FlxG.random.bool(5.57)) //Bad Menu
		{
			Lib.application.window.title = "Friday Night Funkin': Vs Flipo Las Flipantes Aventuras Del Oso Malandro y Su Pandilla - Main Menu";
			flip.loadGraphic(Paths.image('splashes/Main/menujejeboy'));
		}

		barrier = new FlxSprite(0, 760).loadGraphic(Paths.image('menuBottom'));
		barrier.screenCenter();
		barrier.scrollFactor.set(0, 0);
		barrier.updateHitbox();
		barrier.antialiasing = ClientPrefs.globalAntialiasing;
		add(barrier);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/
		
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(85, 600);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[0]);
			menuItem.animation.addByPrefix('idle', optionShit[0] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[0] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.6));
			menuItem.ID = 0;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 3) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();

            var menuItem:FlxSprite = new FlxSprite(415, 600);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[1]);
			menuItem.animation.addByPrefix('idle', optionShit[1] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[1] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.5));
			menuItem.ID = 1;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 3) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();

			var menuItem:FlxSprite = new FlxSprite(680, 600);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[2]);
			menuItem.animation.addByPrefix('idle', optionShit[2] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[2] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.5));
			menuItem.ID = 2;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 3) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.135));
			menuItem.updateHitbox();

			var menuItem:FlxSprite = new FlxSprite(943, 600);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[3]);
			menuItem.animation.addByPrefix('idle', optionShit[3] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[3] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.5));
			menuItem.ID = 3;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 3) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();

		    FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.fromRGB(200, 100, 250), LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Flippy Flipped Out! Legacy Edition v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.fromRGB(30, 235, 30), LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{

				if(curSelected == 1 || curSelected == 3) 
					FlxG.sound.music.fadeOut(0.85, 0);

					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

				menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxTween.tween(bg,{y: 1300}, 1 ,{ease: FlxEase.expoInOut});
							FlxTween.tween(grid,{y: 1300}, 1 ,{ease: FlxEase.expoInOut});
							FlxTween.tween(spark,{y: 1300}, 1 ,{ease: FlxEase.expoInOut});
                            FlxTween.tween(flip,{y: 1300}, 1 ,{ease: FlxEase.expoInOut});
							FlxTween.tween(barrier,{y: 1300}, 1 ,{ease: FlxEase.expoInOut});
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
									    FlxG.sound.music.stop();
										MusicBeatState.switchState(new FreeplayState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
									    FlxG.sound.music.stop();
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			else if (FlxG.keys.justPressed.FIVE)
			{
				selectedSomethin = true;
				var songLowercase:String = Paths.formatToSongPath('in-the-end');
				var poop:String = Highscore.formatSong(songLowercase, 2);

			    PlayState.SONG = Song.loadFromJson('In-The-End-hard', songLowercase);
			    PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.stop();
			}
			else if (FlxG.keys.justPressed.SIX)
			{
				selectedSomethin = true;
				var songLowercase:String = Paths.formatToSongPath('incident');
				var poop:String = Highscore.formatSong(songLowercase, 2);

			    PlayState.SONG = Song.loadFromJson('Incident-hard', songLowercase);
			    PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.stop();
			}
			else if (FlxG.keys.justPressed.EIGHT)
			{
				selectedSomethin = true;
				var songLowercase:String = Paths.formatToSongPath('funny');
				var poop:String = Highscore.formatSong(songLowercase, 2);

			    PlayState.SONG = Song.loadFromJson('Funny-hard', songLowercase);
			    PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.stop();
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
