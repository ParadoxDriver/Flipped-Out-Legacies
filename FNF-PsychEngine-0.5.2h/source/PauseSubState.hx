package;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.Lib;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxStringUtil;
import PlayState;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var menuItems:Array<String> = [];
	var menuItemsOG:Array<String> = ['Resume', 'Restart Song', 'Exit to menu'];
	var difficultyChoices = [];
	var curSelected:Int = 0;

	var screenError:FlxSprite;
	var screenBlood:FlxSprite;
	var screenNeo:FlxSprite;
	var screenFever:FlxSprite;
	var screenMari:FlxSprite;
	var screenGrey:FlxSprite;
	var screenFire:FlxSprite;
	var vinetca:FlxSprite;
	var pistop:FlxSprite;
    var panel:FlxSprite;
	var settings:FlxSprite;
	var disk:FlxSprite;
	var diskManic:FlxSprite;
	var pauseMusic:FlxSound;
	var practiceText:FlxText;
	var skipTimeText:FlxText;
	var skipTimeTracker:Alphabet;
	var curTime:Float = Math.max(0, Conductor.songPosition);
	//var botplayText:FlxText;

	public static var songName:String = '';

	public function new(x:Float, y:Float)
	{
		super();
		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Listening to: " + PlayState.SONG.song + " - Pause Menu";

		if(CoolUtil.difficulties.length < 2) menuItemsOG.remove('Change Difficulty'); //No need to change difficulty if there is only one!

		if(PlayState.chartingMode)
		{
			menuItemsOG.insert(2, 'Leave Charting Mode');
			
			var num:Int = 0;
			if(!PlayState.instance.startingSong)
			{
				num = 1;
				menuItemsOG.insert(3, 'Skip Time');
			}
			menuItemsOG.insert(3 + num, 'End Song');
			menuItemsOG.insert(4 + num, 'Toggle Practice Mode');
			menuItemsOG.insert(5 + num, 'Toggle Botplay');
		}
		menuItems = menuItemsOG;

		for (i in 0...CoolUtil.difficulties.length) {
			var diff:String = '' + CoolUtil.difficulties[i];
			difficultyChoices.push(diff);
		}
		difficultyChoices.push('BACK');


		pauseMusic = new FlxSound();
		if(songName != null) {
			pauseMusic.loadEmbedded(Paths.music(songName), true, true);
		} else if (songName != 'None') {
			pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)), true, true);
		}
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

     //Screen Pause Base
        screenError = new FlxBackdrop(Paths.image('Pause/ErrorBG_Pause'), 0, 0, true, false);
		screenError.antialiasing = ClientPrefs.globalAntialiasing;
		screenError.screenCenter();
		screenError.alpha = 0;
		screenError.offset.x -= 0;
		screenError.offset.y += 0;
		screenError.velocity.x = 20;
		add(screenError);

     //Others Screens Pause
		screenBlood = new FlxBackdrop(Paths.image('Pause/Bloody/ErrorBG_Pause'), 0, 0, true, false);
		screenBlood.antialiasing = ClientPrefs.globalAntialiasing;
		screenBlood.screenCenter();
		screenBlood.alpha = 0;
		screenBlood.offset.x -= 0;
		screenBlood.offset.y += 0;
		screenBlood.velocity.x = 20;
		add(screenBlood);
		screenBlood.visible = false;

		screenNeo = new FlxBackdrop(Paths.image('Pause/Neo/ErrorBG_Pause'), 0, 0, true, false);
		screenNeo.antialiasing = ClientPrefs.globalAntialiasing;
		screenNeo.screenCenter();
		screenNeo.alpha = 0;
		screenNeo.offset.x -= 0;
		screenNeo.offset.y += 0;
		screenNeo.velocity.x = 20;
		add(screenNeo);
		screenNeo.visible = false;

		screenFever = new FlxBackdrop(Paths.image('Pause/Fever/ErrorBG_Pause'), 0, 0, true, false);
		screenFever.antialiasing = ClientPrefs.globalAntialiasing;
		screenFever.screenCenter();
		screenFever.alpha = 0;
		screenFever.offset.x -= 0;
		screenFever.offset.y += 0;
		screenFever.velocity.x = 20;
		add(screenFever);
		screenFever.visible = false;

        screenFire = new FlxBackdrop(Paths.image('Pause/Fire/ErrorBG_Pause'), 0, 0, true, false);
		screenFire.antialiasing = ClientPrefs.globalAntialiasing;
		screenFire.screenCenter();
		screenFire.alpha = 0;
		screenFire.offset.x -= 0;
		screenFire.offset.y += 0;
		screenFire.velocity.x = 20;
		add(screenFire);
		screenFire.visible = false;

		screenMari = new FlxBackdrop(Paths.image('Pause/Sink/ErrorBG_Pause'), 0, 0, true, false);
		screenMari.antialiasing = ClientPrefs.globalAntialiasing;
		screenMari.screenCenter();
		screenMari.alpha = 0;
		screenMari.offset.x -= 0;
		screenMari.offset.y += 0;
		screenMari.velocity.x = 20;
		add(screenMari);
		screenMari.visible = false;

		screenGrey = new FlxBackdrop(Paths.image('Pause/Stupid Mouse/ErrorBG_Pause'), 0, 0, true, false);
		screenGrey.antialiasing = ClientPrefs.globalAntialiasing;
		screenGrey.screenCenter();
		screenGrey.alpha = 0;
		screenGrey.offset.x -= 0;
		screenGrey.offset.y += 0;
		screenGrey.velocity.x = 20;
		add(screenGrey);
		screenGrey.visible = false;

     //Cool Settings
		vinetca = new FlxSprite().loadGraphic(Paths.image('Pause/GradientScreen'));
		vinetca.antialiasing = ClientPrefs.globalAntialiasing;
		vinetca.screenCenter();
		vinetca.alpha = 0;
		add(vinetca);

		pistop = new FlxSprite().loadGraphic(Paths.image('Pause/Green_Line_Cool'));
		pistop.antialiasing = ClientPrefs.globalAntialiasing;
		pistop.screenCenter();
		pistop.alpha = 0;
		pistop.x += 1400;
		add(pistop);

		panel = new FlxSprite().loadGraphic(Paths.image('Pause/Panel_Pause'));
		panel.antialiasing = ClientPrefs.globalAntialiasing;
		panel.screenCenter();
		panel.alpha = 0;
		panel.x -= 1000;
		add(panel);

		settings = new FlxSprite(5, 5).loadGraphic(Paths.image('Pause/settings'));
		settings.antialiasing = ClientPrefs.globalAntialiasing;
		settings.updateHitbox();
		settings.alpha = 0;
		settings.x -= 1000;
		add(settings);
		
		disk = new FlxSprite(-100, 666);
		disk.frames = Paths.getSparrowAtlas('Pause/CD SPIN');
		disk.antialiasing = ClientPrefs.globalAntialiasing;
		disk.animation.addByPrefix('spin', 'CD SPIN', 24, true);
		disk.animation.play('spin');
		disk.scale.set(0.15, 0.15);
		disk.updateHitbox();
		disk.alpha = 0;
		add(disk);

		diskManic = new FlxSprite(-100, 666);
		diskManic.frames = Paths.getSparrowAtlas('Pause/Stupid Mouse/CD SPIN');
		diskManic.antialiasing = ClientPrefs.globalAntialiasing;
		diskManic.animation.addByPrefix('spin', 'CD SPIN', 24, true);
		diskManic.animation.play('spin');
		diskManic.scale.set(0.15, 0.15);
		diskManic.updateHitbox();
		diskManic.alpha = 0;
		add(diskManic);
		diskManic.visible = false;

		var levelInfo:FlxText = new FlxText(20, 15, 0, "", 32);
		levelInfo.text += PlayState.SONG.song;
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
		levelInfo.updateHitbox();
		levelInfo.color = 0x00E655;
		add(levelInfo);
		
		var blueballedTxt:FlxText = new FlxText(20, 15 + 55, 0, "", 32);
		blueballedTxt.text = "Blueballed: " + PlayState.deathCounter;
		blueballedTxt.scrollFactor.set();
		blueballedTxt.setFormat(Paths.font('vcr.ttf'), 32);
		blueballedTxt.updateHitbox();
		blueballedTxt.color = 0xFF0000;
		add(blueballedTxt);

		var musicTxt:FlxText = new FlxText(20, 15 + 112, "", 32);
		musicTxt.text = "Listening: " + ClientPrefs.pauseMusic;
		musicTxt.scrollFactor.set();
		musicTxt.setFormat(Paths.font("vcr.ttf"), 28);
		musicTxt.x = FlxG.width - (musicTxt.width + 910);
		musicTxt.y = FlxG.height - (musicTxt.height + 10);
		musicTxt.updateHitbox();
		musicTxt.color = 0x00E655;
		add(musicTxt);

		practiceText = new FlxText(20, 15 + 95, 0, "PRACTICE MODE", 32);
		practiceText.scrollFactor.set();
		practiceText.setFormat(Paths.font('vcr.ttf'), 32);
		practiceText.x = FlxG.width - (practiceText.width + 20);
		practiceText.updateHitbox();
		practiceText.visible = PlayState.instance.practiceMode;
		practiceText.color = 0x00E655;
		add(practiceText);

		var chartingText:FlxText = new FlxText(20, 15 + 112, 0, "CHARTING MODE", 32);
		chartingText.scrollFactor.set();
		chartingText.setFormat(Paths.font('vcr.ttf'), 32);
		chartingText.x = FlxG.width - (chartingText.width + 20);
		chartingText.y = FlxG.height - (chartingText.height + 20);
		chartingText.updateHitbox();
		chartingText.visible = PlayState.chartingMode;
		chartingText.color = 0x00E655;
		add(chartingText);

		if(PlayState.SONG.song == 'Slaughter' || PlayState.SONG.song == 'Assault' || PlayState.SONG.song == 'Kapow' || PlayState.SONG.song == 'Overkill' || PlayState.SONG.song == 'Extinction' || PlayState.SONG.song == 'Shell-Shanked' || PlayState.SONG.song == 'Annihilation' || PlayState.SONG.song == 'Double-Whammy' || PlayState.SONG.song == 'Conflagration' || PlayState.SONG.song == 'BloodBath' || PlayState.SONG.song == 'Arsenal' || PlayState.SONG.song == 'KapowDays')
		{
			screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.color = 0xFF0000;
			musicTxt.color = 0xFF0000;
            practiceText.color = 0xFF0000;
			chartingText.color = 0xFF0000;
	    }
		else if(PlayState.SONG.song == 'Massacre')
		{
		    screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.color = 0xFF0000;
			musicTxt.color = 0xFF0000;
            practiceText.color = 0xFF0000;
			chartingText.color = 0xFF0000;
			
			musicTxt.x = FlxG.width - (musicTxt.width + 850);
	    }
		else if(PlayState.SONG.song == 'Fallout'|| PlayState.SONG.song == 'In-The-End')
		{
		    screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.color = 0xFF0000;
			musicTxt.color = 0xFF0000;
            practiceText.color = 0xFF0000;
			chartingText.color = 0xFF0000;
			
			musicTxt.x = FlxG.width - (musicTxt.width + 860);
	    }
		else if(PlayState.SONG.song == 'Hunter' || PlayState.SONG.song == 'Disturbed' || PlayState.SONG.song == 'Cutting-Crucifixion' || PlayState.SONG.song == 'Megalophobia')
		{
			screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

            musicTxt.x = FlxG.width - (musicTxt.width + 860);
            practiceText.x = FlxG.width - (practiceText.width - 25);
            chartingText.x = FlxG.width - (chartingText.width + 5);

            levelInfo.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.RED);
			blueballedTxt.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.RED);
			musicTxt.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.RED);
            practiceText.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.RED);
			chartingText.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.RED);
	    }
		else if(PlayState.SONG.song == 'Unhinged')
		{
		    screenError.visible = false;
			screenFire.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Fire/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Fire/Panel_Pause'));

			levelInfo.color = 0xEB5606;
			musicTxt.color = 0xEB5606;
            practiceText.color = 0xEB5606;
			chartingText.color = 0xEB5606;
	    }
		else if(PlayState.SONG.song == 'Triggered-Guerrilla' || PlayState.SONG.song == 'Triggered-Remastered')
		{
			levelInfo.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			blueballedTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
            practiceText.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			chartingText.setFormat(Paths.font("Antilles.ttf"), 32,FlxColor.fromRGB(0, 230, 85));

            musicTxt.x = FlxG.width - (musicTxt.width + 940);
		    musicTxt.y = FlxG.height - (musicTxt.height + 5);
			practiceText.x = FlxG.width - (practiceText.width + 10);
            chartingText.x = FlxG.width - (chartingText.width + 10);
	    }
		else if(PlayState.SONG.song == 'Slaughter-Guerrilla' || PlayState.SONG.song == 'Slaughter-Guerrilla-Old' || PlayState.SONG.song == 'Fallout-Guerrilla' || PlayState.SONG.song == 'Kapow-Guerrilla')
		{
			screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.RED);
			blueballedTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.RED);
			musicTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.RED);
            practiceText.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.RED);
			chartingText.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.RED);

            musicTxt.x = FlxG.width - (musicTxt.width + 940);
		    musicTxt.y = FlxG.height - (musicTxt.height + 5);
			practiceText.x = FlxG.width - (practiceText.width + 10);
            chartingText.x = FlxG.width - (chartingText.width + 10);
	    }
		else if(PlayState.SONG.song == 'Overkill-Guerrilla')
	    {
		    screenError.visible = false;
			screenFire.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Fire/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Fire/Panel_Pause'));

            levelInfo.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
			blueballedTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
            practiceText.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
			chartingText.setFormat(Paths.font("Antilles.ttf"), 32, FlxColor.fromRGB(255, 85, 0));

			musicTxt.x = FlxG.width - (musicTxt.width + 940);
		    musicTxt.y = FlxG.height - (musicTxt.height + 5);
			practiceText.x = FlxG.width - (practiceText.width + 10);
            chartingText.x = FlxG.width - (chartingText.width + 10);
	    }
		else if(PlayState.SONG.song == 'Compass-Guerrilla')
		{
			levelInfo.setFormat(Paths.font("happyTrees.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			blueballedTxt.setFormat(Paths.font("happyTrees.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("happyTrees.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
            practiceText.setFormat(Paths.font("happyTrees.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			chartingText.setFormat(Paths.font("happyTrees.ttf"), 32, FlxColor.fromRGB(0, 230, 85));

            musicTxt.x = FlxG.width - (musicTxt.width + 935);
		    musicTxt.y = FlxG.height - (musicTxt.height + 4);
			practiceText.x = FlxG.width - (practiceText.width + 5);
            chartingText.x = FlxG.width - (chartingText.width + 5);
	    }
		else if(PlayState.SONG.song == 'Tags' || PlayState.SONG.song == 'Outbreak')
		{
			levelInfo.setFormat(Paths.font("stratum2-medium-webfont.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			blueballedTxt.setFormat(Paths.font("stratum2-medium-webfont.ttf"), 32,FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("stratum2-medium-webfont.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
            practiceText.setFormat(Paths.font("stratum2-medium-webfont.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			chartingText.setFormat(Paths.font("stratum2-medium-webfont.ttf"), 32,FlxColor.fromRGB(0, 230, 85));

            musicTxt.x = FlxG.width - (musicTxt.width + 960);
            musicTxt.y = FlxG.height - (musicTxt.height + 5);
			practiceText.x = FlxG.width - (practiceText.width + 10);
            chartingText.x = FlxG.width - (chartingText.width + 10);
	    }
		else if(PlayState.SONG.song == 'Slasher' || PlayState.SONG.song == 'Playdate' || PlayState.SONG.song == 'Disturbed-Guerrilla')
		{
			screenError.visible = false;
			screenFire.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Fire/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Fire/Panel_Pause'));

            musicTxt.x = FlxG.width - (musicTxt.width + 910);
            practiceText.x = FlxG.width - (practiceText.width - 25);
            chartingText.x = FlxG.width - (chartingText.width + 5);

            levelInfo.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
			blueballedTxt.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
            practiceText.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
			chartingText.setFormat(Paths.font("Slasher.ttf"), 32, FlxColor.fromRGB(255, 85, 0));
	    }
		else if(PlayState.SONG.song == 'Disclosed')
		{
			screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.setFormat(Paths.font("Insanity.ttf"), 32, FlxColor.RED);
			blueballedTxt.setFormat(Paths.font("Insanity.ttf"), 32, FlxColor.RED);
			musicTxt.setFormat(Paths.font("Insanity.ttf"), 32, FlxColor.RED);
            practiceText.setFormat(Paths.font("Insanity.ttf"), 32, FlxColor.RED);
			chartingText.setFormat(Paths.font("Insanity.ttf"), 32, FlxColor.RED);

            musicTxt.x = FlxG.width - (musicTxt.width + 898);
			musicTxt.y = FlxG.height - (musicTxt.height + 4);
			practiceText.x = FlxG.width - (practiceText.width + 20);
	    }
		else if(PlayState.SONG.song == 'Hiding')
		{
			screenError.visible = false;
			screenNeo.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Neo/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Neo/Panel_Pause'));

			musicTxt.x = FlxG.width - (musicTxt.width + 796);

			levelInfo.setFormat(Paths.font("neon2.ttf"), 32, FlxColor.fromRGB(175, 0, 234));
			blueballedTxt.setFormat(Paths.font("neon2.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("neon2.ttf"), 32, FlxColor.fromRGB(175, 0, 234));
            practiceText.setFormat(Paths.font("neon2.ttf"), 32, FlxColor.fromRGB(175, 0, 234));
			chartingText.setFormat(Paths.font("neon2.ttf"), 32, FlxColor.fromRGB(175, 0, 234));
	    }
		else if(PlayState.SONG.song == 'Nightmares')
		{
			levelInfo.setFormat(Paths.font("Five at Freddy's-Regular.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
			blueballedTxt.setFormat(Paths.font("Five at Freddy's-Regular.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("Five at Freddy's-Regular.ttf"), 32, FlxColor.fromRGB(0, 230, 85));
            practiceText.setFormat(Paths.font("Five at Freddy's-Regular.ttf"), 32,FlxColor.fromRGB(0, 230, 85));
			chartingText.setFormat(Paths.font("Five at Freddy's-Regular.ttf"), 32, FlxColor.fromRGB(0, 230, 85));

            musicTxt.y = FlxG.height - (musicTxt.height + 5);
			practiceText.x = FlxG.width - (practiceText.width + 32);
            chartingText.x = FlxG.width - (chartingText.width + 35);
	    }
		else if(PlayState.SONG.song == 'Bad-Nun' || PlayState.SONG.song == 'Bazinga')
		{
			screenError.visible = false;
			screenFever.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Fever/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Fever/Panel_Pause'));

			levelInfo.color = 0x00A0E6;
			musicTxt.color = 0x00A0E6;
            practiceText.color = 0x00A0E6;
			chartingText.color = 0x00A0E6;

			musicTxt.x = FlxG.width - (musicTxt.width + 860);
	    }
		else if(PlayState.SONG.song == 'Crucify')
		{
			screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.color = 0xFF0000;
			musicTxt.color = 0xFF0000;
            practiceText.color = 0xFF0000;
			chartingText.color = 0xFF0000;

			musicTxt.x = FlxG.width - (musicTxt.width + 860);
	    }
		else if(PlayState.SONG.song == 'Talasofobia')
		{
			screenError.visible = false;
			screenMari.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Sink/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Sink/Panel_Pause'));

            levelInfo.setFormat(Paths.font("sonic4.ttf"), 32, FlxColor.fromRGB(74, 216, 164));
			blueballedTxt.setFormat(Paths.font("sonic4.ttf"), 32, FlxColor.fromRGB(255, 0, 0));
			musicTxt.setFormat(Paths.font("sonic4.ttf"), 32, FlxColor.fromRGB(74, 216, 164));
            practiceText.setFormat(Paths.font("sonic4.ttf"), 32, FlxColor.fromRGB(74, 216, 164));
			chartingText.setFormat(Paths.font("sonic4.ttf"), 32, FlxColor.fromRGB(74, 216, 164));

			musicTxt.x = FlxG.width - (musicTxt.width + 930);
		    musicTxt.y = FlxG.height - (musicTxt.height + 4);
	    }
		else if(PlayState.SONG.song == 'Suicide-Out') //|| PlayState.SONG.song == 'Unknown-Suffering'
		{
			screenError.visible = false;
			screenGrey.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Stupid Mouse/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Stupid Mouse/Panel_Pause'));
			settings.loadGraphic(Paths.image('Pause/Stupid Mouse/settings'));
			disk.visible = false;
			diskManic.visible = true;

            levelInfo.setFormat(Paths.font("Disney.ttf"), 32);
			blueballedTxt.setFormat(Paths.font("Disney.ttf"), 32, FlxColor.RED);
			musicTxt.setFormat(Paths.font("Disney.ttf"), 27);
            practiceText.setFormat(Paths.font("Disney.ttf"), 32);
			chartingText.setFormat(Paths.font("Disney.ttf"), 32);

			musicTxt.x = FlxG.width - (musicTxt.width + 824);
			practiceText.x = FlxG.width - (practiceText.width + 10);
			chartingText.x = FlxG.width - (chartingText.width + 10);
	    }
		else if(PlayState.SONG.song == 'Lockjaw')
	    {
		    screenError.visible = false;
			screenBlood.visible = true;
			pistop.loadGraphic(Paths.image('Pause/Bloody/Green_Line_Cool'));
		    panel.loadGraphic(Paths.image('Pause/Bloody/Panel_Pause'));

			levelInfo.setFormat(Paths.font("Impact.ttf"), 32, FlxColor.RED);
			blueballedTxt.setFormat(Paths.font("Impact.ttf"), 32, FlxColor.RED);
			musicTxt.setFormat(Paths.font("Impact.ttf"), 32, FlxColor.RED);
            practiceText.setFormat(Paths.font("Impact.ttf"), 32, FlxColor.RED);
			chartingText.setFormat(Paths.font("Impact.ttf"), 32, FlxColor.RED);

            musicTxt.x = FlxG.width - (musicTxt.width + 905);
		    musicTxt.y = FlxG.height - (musicTxt.height + 2);
			practiceText.x = FlxG.width - (practiceText.width + 10);
            chartingText.x = FlxG.width - (chartingText.width + 10);
	    }

		blueballedTxt.alpha = 0;
		levelInfo.alpha = 0;
		musicTxt.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		blueballedTxt.x = FlxG.width - (blueballedTxt.width + 20);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenError, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});

		FlxTween.tween(screenBlood, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenNeo, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenMari, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenFire, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenFever, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(screenGrey, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});

		FlxTween.tween(vinetca, {alpha: 1}, 0.75, {ease: FlxEase.quartInOut});
		FlxTween.tween(pistop, {alpha: 1}, 0.5, {ease: FlxEase.quartInOut});
		FlxTween.tween(pistop, {x: 0}, 0.6, {ease: FlxEase.expoInOut});
		FlxTween.tween(panel, {alpha: 1}, 0.5, {ease: FlxEase.quartInOut});
		FlxTween.tween(panel, {x: 0}, 0.6, {ease: FlxEase.expoInOut});
		FlxTween.tween(settings, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(settings, {x: 5}, 0.6, {ease: FlxEase.expoInOut});
		FlxTween.tween(disk, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(disk, {x: 5}, 0.6, {ease: FlxEase.expoInOut});
		FlxTween.tween(diskManic, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(diskManic, {x: 5}, 0.6, {ease: FlxEase.expoInOut});
		FlxTween.tween(levelInfo, {alpha: 1, y: 45}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(musicTxt, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.2});
		FlxTween.tween(blueballedTxt, {alpha: 1, y: blueballedTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.7});

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		regenMenu();
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}

	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		super.update(elapsed);
		updateSkipTextStuff();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		var daSelected:String = menuItems[curSelected];
		switch (daSelected)
		{
			case 'Skip Time':
				if (controls.UI_LEFT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime -= 1000;
					holdTime = 0;
				}
				if (controls.UI_RIGHT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime += 1000;
					holdTime = 0;
				}

				if(controls.UI_LEFT || controls.UI_RIGHT)
				{
					holdTime += elapsed;
					if(holdTime > 0.5)
					{
						curTime += 45000 * elapsed * (controls.UI_LEFT ? -1 : 1);
					}

					if(curTime >= FlxG.sound.music.length) curTime -= FlxG.sound.music.length;
					else if(curTime < 0) curTime += FlxG.sound.music.length;
					updateSkipTimeText();
				}
		}

		if (accepted)
		{
			if (menuItems == difficultyChoices)
			{
				if(menuItems.length - 1 != curSelected && difficultyChoices.contains(daSelected)) {
					var name:String = PlayState.SONG.song;
					var poop = Highscore.formatSong(name, curSelected);
					PlayState.SONG = Song.loadFromJson(poop, name);
					PlayState.storyDifficulty = curSelected;
					MusicBeatState.resetState();
					FlxG.sound.music.volume = 0;
					PlayState.changedDifficulty = true;
					PlayState.chartingMode = false;
					return;
				}

				menuItems = menuItemsOG;
				regenMenu();
			}

			switch (daSelected)
			{
				case "Resume":
				    Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Listening to: " + PlayState.SONG.song;
					close();
				case 'Change Difficulty':
					menuItems = difficultyChoices;
					regenMenu();
				case 'Toggle Practice Mode':
					PlayState.instance.practiceMode = !PlayState.instance.practiceMode;
					PlayState.changedDifficulty = true;
					practiceText.visible = PlayState.instance.practiceMode;
				case "Restart Song":
					restartSong();
				case "Leave Charting Mode":
					restartSong();
					PlayState.chartingMode = false;
				case 'Skip Time':
					if(curTime < Conductor.songPosition)
					{
						PlayState.startOnTime = curTime;
						restartSong(true);
					}
					else
					{
						if (curTime != Conductor.songPosition)
						{
							PlayState.instance.clearNotesBefore(curTime);
							PlayState.instance.setSongTime(curTime);
						}
						close();
					}
				case "End Song":
					close();
					PlayState.instance.finishSong(true);
				case 'Toggle Botplay':
					PlayState.instance.cpuControlled = !PlayState.instance.cpuControlled;
					PlayState.changedDifficulty = true;
					PlayState.instance.botplayTxt.visible = PlayState.instance.cpuControlled;
					PlayState.instance.botplayTxt.alpha = 1;
					PlayState.instance.botplaySine = 0;
				case "Exit to menu":
					PlayState.deathCounter = 0;
					PlayState.seenCutscene = false;

					if(PlayState.isStoryMode) {
						MusicBeatState.switchState(new StoryMenuState());
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
					} else {
						MusicBeatState.switchState(new FreeplayState());
						FlxG.sound.music.stop();
					}
					PlayState.cancelMusicFadeTween();
					PlayState.changedDifficulty = false;
					PlayState.chartingMode = false;
			}
		}
	}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.resetState();
		}
		else
		{
			MusicBeatState.resetState();
		}
	}

	override function destroy()
	{
		pauseMusic.destroy();

		super.destroy();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));

				if(item == skipTimeTracker)
				{
					curTime = Math.max(0, Conductor.songPosition);
					updateSkipTimeText();
				}
			}
		}
	}

	function regenMenu():Void {
		for (i in 0...grpMenuShit.members.length) {
			var obj = grpMenuShit.members[0];
			obj.kill();
			grpMenuShit.remove(obj, true);
			obj.destroy();
		}

		for (i in 0...menuItems.length) {
			var item = new Alphabet(0, 70 * i + 30, menuItems[i], true, false);
			item.isMenuItem = true;
			item.targetY = i;
			grpMenuShit.add(item);

			if(menuItems[i] == 'Skip Time')
			{
				skipTimeText = new FlxText(0, 0, 0, '', 64);
				skipTimeText.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				skipTimeText.scrollFactor.set();
				skipTimeText.borderSize = 2;
				skipTimeTracker = item;
				add(skipTimeText);

				updateSkipTextStuff();
				updateSkipTimeText();
			}
		}
		curSelected = 0;
		changeSelection();
	}
	
	function updateSkipTextStuff()
	{
		if(skipTimeText == null) return;

		skipTimeText.x = skipTimeTracker.x + skipTimeTracker.width + 60;
		skipTimeText.y = skipTimeTracker.y;
		skipTimeText.visible = (skipTimeTracker.alpha >= 1);
	}

	function updateSkipTimeText()
	{
		skipTimeText.text = FlxStringUtil.formatTime(Math.max(0, Math.floor(curTime / 1000)), false) + ' / ' + FlxStringUtil.formatTime(Math.max(0, Math.floor(FlxG.sound.music.length / 1000)), false);
	}
}
