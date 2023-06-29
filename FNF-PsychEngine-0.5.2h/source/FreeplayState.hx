package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import lime.utils.Assets;
import openfl.Lib;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	private static var curSelected:Int = 0;
	var curDifficulty:Int = -1;
	private static var lastDifficultyName:String = '';
	public static var startingSelection:Int = 0;

	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;
	public var camZooming:Bool = false;

	private var iconArray:Array<HealthIcon> = [];
	var guerrillaSongs:Array<String> = ["triggered-guerrilla", "slaughter-guerrilla", "overkill-guerrilla", "fallout-guerrilla", "triggered-remastered", "slaughter-guerrilla-old", "kapow-guerrilla", "compass-guerrilla", "disturbed-guerrilla"];
	var csgoSongs:Array<String> = ["tags", "outbreak"];
	var minusSongs:Array<String> = ["slasher", "disturbed", "playdate"];
    var bsideSongs:Array<String> = ["hiding"];
	var aviSongs:Array<String> = ["suicide-out", "unknown-suffering"];
	var antiSongs:Array<String> = ["lockjaw"];
	var caosSongs:Array<String> = ["talasofobia", "phantasm"];

    var songTimer:FlxTimer;
	var bg:FlxSprite;
	var barrier:FlxSprite;
	var sidebar:FlxSprite;
	var grain:FlxSprite;
	var dastat:FlxSprite;
	var waves:FlxSprite;
	var intendedColor:Int;
	var flipps:FlxSprite;
	var colorTween:FlxTween;

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - FreePlay Menu";

		CoolUtil.precacheMusic('freakyMenu');
		
		persistentUpdate = true;
		PlayState.isStoryMode = false;
		WeekData.reloadWeekFiles(false);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the FreePlay Menu", null);
		#end

		for (i in 0...WeekData.weeksList.length) {
			if(weekIsLocked(WeekData.weeksList[i])) continue;

			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];

			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs)
			{
				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
		}
		WeekData.loadTheFirstEnabledMod();

		/*		//KIND OF BROKEN NOW AND ALSO PRETTY USELESS//

		var initSonglist = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
		for (i in 0...initSonglist.length)
		{
			if(initSonglist[i] != null && initSonglist[i].length > 0) {
				var songArray:Array<String> = initSonglist[i].split(":");
				addSong(songArray[0], 0, songArray[1], Std.parseInt(songArray[2]));
			}
		}*/

		bg = new FlxSprite().loadGraphic('assets/images/splashes/Camp-bg.png');
		add(bg);

		flipps = new FlxSprite().loadGraphic('assets/images/splashes/Camp-fg.png');
		add(flipps);

		dastat = new FlxSprite();
		dastat.frames = Paths.getSparrowAtlas('splashes/Effects/daSTAT');
		dastat.animation.addByPrefix('static','overstat', 24, true);
		dastat.animation.play('static');
		dastat.antialiasing = ClientPrefs.globalAntialiasing;
		dastat.screenCenter();
		dastat.scale.x = 8.0;
		dastat.scale.y = 4.0;
		dastat.alpha = 0;
		add(dastat);

		waves = new FlxSprite();
		waves.frames = Paths.getSparrowAtlas('splashes/Effects/waves');
		waves.animation.addByPrefix('idle', "idle", 13);//Aquí tiene pa que me la bese, entre más me la beses más me crece, busca un cura pa que me la rece, y trae un martillo pa que me la endereces, por el chiquito se te aparece toas las veces y cuando te estreses aquí te tengo éste pa que te desestreses, con este tallo el jopo se te esflorece, se cumple el ciclo hasta que anochece, to los días y toas las veces, de tanto entablar la raja del jopo se te desaparece, porque este sable no se compadece, si pides ñapa se te ofrece, y si repites se te agradece, no te hace rico pero tampoco te empobrece, no te hace inteligente pero tampoco te embrutece, y no paro aquí compa que éste nuevamente se endurece, hasta que amanece, cambie esa cara que parece que se entristece, si te haces viejo éste te rejuvenece, no te hago bulla porque depronto te ensordece, y eso cuadro no te favorece, pero tranquilo que éste te abastece, porque allá abajo se te humedece, viendo como el que me cuelga resplandece, si a ti te da miedo a mí me enorgullece, y así toas las vece ¿que te parece?, y tranquilo mijo que aquí éste reaparece, no haga fuerza porque éste se sobrecrece, una fresadora te traigo pa que me la freses, así se fortalece y de nuevo la historia se establece, que no se te nuble la vista porque éste te la aclarece, y sino le entendiste nuevamente la explicación se te ofrece, pa que por el chiquito éste de nuevo te empiece... Aquí tienes para que me la beses, entre más me la beses más me crece, busca un cura para que me la rece, un martillo para que me la endereces, un chef para que me la aderece, 8000 mondas por el culo se te aparecen, si me la sobas haces que se me espese, si quieres la escaneas y te la llevas para que en tu hoja de vida la anexes Te la meto por debajo del agua como los peces, y aquella flor de monda que en tu culo crece, reposa sobre tus nalgas a veces y descansa en paz en tu chicorio cuando anochece Que te parece, te lo meti antes de los 9 meses te meto la verga pa que el tunel del orto se te enderece, de tanta monda hasta tu novia va a queda preña de mi por 9 meses, te la empujo y te la pongo pa que me la peses, y te meto la guamayeta un millon de veces que de tanta monda van a respirar hasta los peces.
		waves.antialiasing = ClientPrefs.globalAntialiasing;
		waves.animation.play('idle');
		waves.scale.set(1280/512, 1280/512);
		waves.alpha = 0;
	    waves.screenCenter();
		add(waves);

		barrier = new FlxSprite().loadGraphic(Paths.image('menuSide'));
		barrier.antialiasing = ClientPrefs.globalAntialiasing;
		barrier.screenCenter();
		barrier.x -= 200;
		add(barrier);
		FlxTween.tween(barrier, {x: barrier.x + 200}, 1, {ease: FlxEase.expoInOut});

		sidebar = new FlxSprite().loadGraphic(Paths.image('menuSideCool'));
		sidebar.antialiasing = ClientPrefs.globalAntialiasing;
		sidebar.screenCenter();
		sidebar.x -= 200;
		add(sidebar);
		sidebar.visible = false;
		FlxTween.tween(sidebar, {x: sidebar.x + 200}, 1, {ease: FlxEase.expoInOut});

        grain = new FlxSprite();
		grain.frames = Paths.getSparrowAtlas('splashes/Effects/grain');
		grain.animation.addByPrefix('idle', "pantalla", 24);
		grain.antialiasing = ClientPrefs.globalAntialiasing;
		grain.animation.play('idle');
		grain.scale.set(0.67, 0.67);
	    grain.screenCenter();
		add(grain);
		grain.visible = false;

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			if (songText.width > 980)
			{
				var textScale:Float = 980 / songText.width;
				songText.scale.x = textScale;
				for (letter in songText.lettersArray)
				{
					letter.x *= textScale;
					letter.offset.x *= textScale;
				}
				//songText.updateHitbox();
				//trace(songs[i].songName + ' new scale: ' + textScale);
			}

			Paths.currentModDirectory = songs[i].folder;
			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);

			// songText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// songText.screenCenter(X);
		}
		WeekData.setDirectoryFromWeek();

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);

		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		diffText.color = FlxColor.RED;
		add(diffText);

		add(scoreText);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;

		if(lastDifficultyName == '')
		{
			lastDifficultyName = CoolUtil.defaultDifficulty;
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		changeSelection();
		changeDiff();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));

			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;

			FlxG.stage.addChild(texFel);

			// scoreText.textField.htmlText = md;

			trace(md);
		 */

		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		#if PRELOAD_ALL
		var leText:String = "Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 16;
		#else
		var leText:String = "Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 18;
		#end
		var text:FlxText = new FlxText(textBG.x, textBG.y + 4, FlxG.width, leText, size);
		text.setFormat(Paths.font("vcr.ttf"), size, FlxColor.WHITE, RIGHT);
		text.scrollFactor.set();
		add(text);
		super.create();
	}

	override function closeSubState() {
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
		songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
	}

	function weekIsLocked(name:String):Bool {
		var leWeek:WeekData = WeekData.weeksLoaded.get(name);
		return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!StoryMenuState.weekCompleted.exists(leWeek.weekBefore) || !StoryMenuState.weekCompleted.get(leWeek.weekBefore)));
	}

	/*public function addWeek(songs:Array<String>, weekNum:Int, weekColor:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);
			this.songs[this.songs.length-1].color = weekColor;

			if (songCharacters.length != 1)
				num++;
		}
	}*/

	var instPlaying:Int = -1;
	private static var vocals:FlxSound = null;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null && FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(Highscore.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

		scoreText.text = 'PERSONAL BEST: ' + lerpScore + ' (' + ratingSplit.join('.') + '%)';
		positionHighscore();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if(songs.length > 1)
		{
			if (upP)
			{
				changeSelection(-shiftMult);
				holdTime = 0;
			}
			if (downP)
			{
				changeSelection(shiftMult);
				holdTime = 0;
			}

			if(controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					changeDiff();
				}
			}
		}

		if (controls.UI_LEFT_P)
			changeDiff(-1);
		else if (controls.UI_RIGHT_P)
			changeDiff(1);
		else if (upP || downP) changeDiff();

		if (controls.BACK)
		{
			persistentUpdate = false;
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if(ctrl)
		{
			persistentUpdate = false;
			openSubState(new GameplayChangersSubstate());
		}
		else if (accepted)
		{
			persistentUpdate = false;
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
			/*#if MODS_ALLOWED
			if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
			#else
			if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
			#end
				poop = songLowercase;
				curDifficulty = 1;
				trace('Couldnt find file');
			}*/
			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songLowercase);
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty; 

			trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
			if(colorTween != null) {
				colorTween.cancel();
			}

			for (song in grpSongs)
			{
				if (song.targetY == 0)
					continue;

				FlxTween.tween(song, {alpha: 0}, 0.1);
			}

			for (icon in iconArray)
			{
				if (iconArray.indexOf(icon) == curSelected)
					continue;

				FlxTween.tween(icon, {alpha: 0}, 0.1);
			}
			
			if (FlxG.keys.pressed.SHIFT){
				LoadingState.loadAndSwitchState(new ChartingState());
			}else{
				LoadingState.loadAndSwitchState(new PlayState());
			}

			FlxG.sound.music.volume = 0;
		}
		else if(controls.RESET)
		{
			persistentUpdate = false;
			openSubState(new ResetScoreSubState(songs[curSelected].songName, curDifficulty, songs[curSelected].songCharacter));
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		super.update(elapsed);
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length-1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;

		lastDifficultyName = CoolUtil.difficulties[curDifficulty];

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		PlayState.storyDifficulty = curDifficulty;

		var diff:String = CoolUtil.difficultyString();

		if (guerrillaSongs.contains(songs[curSelected].songName))
			diff = "GUERRILLA";
		else if (csgoSongs.contains(songs[curSelected].songName))
			diff = "EXPERT";
		else if (minusSongs.contains(songs[curSelected].songName))
			diff = "MINUS";
		else if (bsideSongs.contains(songs[curSelected].songName))
			diff = "BSIDE";
		else if (antiSongs.contains(songs[curSelected].songName))
			diff = "FUCKED";
		else if (caosSongs.contains(songs[curSelected].songName))
			diff = "CHAOS";

		diffText.text = '< ' + diff + ' >';
		positionHighscore();
	}

	function changeSelection(change:Int = 0, playSound:Bool = true)
	{
		if(playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;

	     flipps.y = 1000;
		 flipps.x = 5;

		if (curSelected == 0)
		{
			bg.loadGraphic('assets/images/splashes/Camp-bg.png');
			flipps.loadGraphic('assets/images/splashes/Camp-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 1)
		{
			bg.loadGraphic('assets/images/splashes/Bloody-bg.png');
			flipps.loadGraphic('assets/images/splashes/Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 2)
		{
			bg.loadGraphic('assets/images/splashes/Hunter-bg.png');
			flipps.loadGraphic('assets/images/splashes/Hunter-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 3)
		{
			bg.loadGraphic('assets/images/splashes/Assault-bg.png');
			flipps.loadGraphic('assets/images/splashes/Assault-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 4)
		{
			bg.loadGraphic('assets/images/splashes/Fallout-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fallout-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 5)
		{
			bg.loadGraphic('assets/images/splashes/Jungle-bg.png');
			flipps.loadGraphic('assets/images/splashes/Camp-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 6)
		{
			bg.loadGraphic('assets/images/splashes/Jungle-alt-bg.png');
			flipps.loadGraphic('assets/images/splashes/Jungle-alt-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 7)
		{
			bg.loadGraphic('assets/images/splashes/Kapow-bg.png');
			flipps.loadGraphic('assets/images/splashes/Kapow-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else if (curSelected == 8)
		{
			bg.loadGraphic('assets/images/splashes/Army-Nublar-bg.png');
			flipps.loadGraphic('assets/images/splashes/Army-Nublar-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 9)
		{
			bg.loadGraphic('assets/images/splashes/Army-Fire-bg.png');
			flipps.loadGraphic('assets/images/splashes/Army-Fire-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 10)
		{
			bg.loadGraphic('assets/images/splashes/Camp-bg.png');
			flipps.loadGraphic('assets/images/splashes/Camp-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 11)
		{
			bg.loadGraphic('assets/images/splashes/Bloody-bg.png');
			flipps.loadGraphic('assets/images/splashes/Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}													
		else if (curSelected == 12)
		{
			bg.loadGraphic('assets/images/splashes/Bloody-bg.png');
			flipps.loadGraphic('assets/images/splashes/Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 13)
		{
			bg.loadGraphic('assets/images/splashes/Autopsy-Turvy-bg.png');
			flipps.loadGraphic('assets/images/splashes/Autopsy-Turvy-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 14) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/camp-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/camp-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 15) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/bloody-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/bloody-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}													
		else if (curSelected == 16) //Art by MarazakX Modified by Paradox
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/insane-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/insane-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 17)
		if (FlxG.random.bool(27.48)) //Art by Paradox
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/fearful-Alt-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/fearful-Alt-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else
	    {	//Art by MarazakX // Modified by Paradox
			bg.loadGraphic('assets/images/splashes/FullMetal/fearful-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/fearful-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}													
		else if (curSelected == 18)
		{
			bg.loadGraphic('assets/images/splashes/Alt-bg.png');
			flipps.loadGraphic('assets/images/splashes/Alt-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 19)
		{
			bg.loadGraphic('assets/images/splashes/Csgo-bg.png');
			flipps.loadGraphic('assets/images/splashes/Csgo-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 20)
		{
			bg.loadGraphic('assets/images/splashes/Minus-bg.png');
			flipps.loadGraphic('assets/images/splashes/Minus-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}														
		else if (curSelected == 21)
		if (FlxG.random.bool(40.72)) //Art by 3-G
		{
			bg.loadGraphic('assets/images/splashes/Minus-Night-bg.png');
			flipps.loadGraphic('assets/images/splashes/Dside-Minus-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			dastat.alpha = 0;
		}
		else
	    {
			bg.loadGraphic('assets/images/splashes/Minus-Night-bg.png');
			flipps.loadGraphic('assets/images/splashes/Minus-Night-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			dastat.alpha = 0;
	    }
		else if (curSelected == 22)
		{
			bg.loadGraphic('assets/images/splashes/Insanity-bg.png');
			flipps.loadGraphic('assets/images/splashes/Insanity-fg.png');
			dastat.alpha = 0.20;
			sidebar.visible = false;
			barrier.visible = true;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 23)
		{
			bg.loadGraphic('assets/images/splashes/Retro-bg.png');
			flipps.loadGraphic('assets/images/splashes/Retro-fg.png');
			dastat.alpha = 0;
			sidebar.visible = true;
			barrier.visible = false;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}														
		else if (curSelected == 24)
		{
			bg.loadGraphic('assets/images/splashes/Camp-bg.png');
			flipps.loadGraphic('assets/images/splashes/Camp-fg.png');
			sidebar.visible = false;
			barrier.visible = true;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 25)
		{
			bg.loadGraphic('assets/images/splashes/Bloody-bg.png');
			flipps.loadGraphic('assets/images/splashes/Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 26)
		{
			bg.loadGraphic('assets/images/splashes/Bloody-bg.png');
			flipps.loadGraphic('assets/images/splashes/Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 27) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/Kapow-bg.png');
			flipps.loadGraphic('assets/images/splashes/Kapow-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 28)
		{
			bg.loadGraphic('assets/images/splashes/Alt-bg.png');
			flipps.loadGraphic('assets/images/splashes/Alt-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 29)
		{
			bg.loadGraphic('assets/images/splashes/Csgo-bg.png');
			flipps.loadGraphic('assets/images/splashes/Csgo-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 30)
		{
			bg.loadGraphic('assets/images/splashes/Minus-bg.png');
			flipps.loadGraphic('assets/images/splashes/Minus-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 31) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/camp-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/camp-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else if (curSelected == 32) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/bloody-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/bloody-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}			
		else if (curSelected == 33) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/Army-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/Army-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 34) //Art by MarazakX
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/Alt-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/Alt-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else if (curSelected == 35) //Art by MarazakX Modified by Paradox
		{
			bg.loadGraphic('assets/images/splashes/FullMetal/minus-Metal-bg.png');
			flipps.loadGraphic('assets/images/splashes/FullMetal/minus-Metal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 36)
		{
			bg.loadGraphic('assets/images/splashes/Fever-Night-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fever-Ship-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 37)
		{
			bg.loadGraphic('assets/images/splashes/Fazbear-Fright-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fazbear-Fright-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																	
		else if (curSelected == 38)
		{
			bg.loadGraphic('assets/images/splashes/Arsenal-bg.png');
			flipps.loadGraphic('assets/images/splashes/Arsenal-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else if (curSelected == 39)
		{
			bg.loadGraphic('assets/images/splashes/Hunter-bg.png');
			flipps.loadGraphic('assets/images/splashes/Hunter-Ship-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = false;
		}																	
		else if (curSelected == 40)
		{
			bg.loadGraphic('assets/images/splashes/Suicide-bg.png');
			flipps.loadGraphic('assets/images/splashes/Suicide-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = true;
		}																			
		else if (curSelected == 41)
		{
			bg.loadGraphic('assets/images/splashes/Shanked-bg.png');
			flipps.loadGraphic('assets/images/splashes/Shanked-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = false;
		}	
		else if (curSelected == 42)
		{
			bg.loadGraphic('assets/images/splashes/Front-bg.png');
			flipps.loadGraphic('assets/images/splashes/Front-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	
		else if (curSelected == 43)
		{
			bg.loadGraphic('assets/images/splashes/Aurora-bg.png');
			flipps.loadGraphic('assets/images/splashes/Aurora-fg.png');
			waves.alpha = 0;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 44)
		{
			bg.loadGraphic('assets/images/splashes/Glowing-Sea-bg.png');
			flipps.loadGraphic('assets/images/splashes/Glowing-Sea-fg.png');
			waves.alpha = 0.08;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}						
		else if (curSelected == 45)
		{
			bg.loadGraphic('assets/images/splashes/Fever-Night-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fever-Night-fg.png');
			waves.alpha = 0;
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 46)
		{
			bg.loadGraphic('assets/images/splashes/Fallout-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fever-Bloody-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}															
		else if (curSelected == 47)
		{
			bg.loadGraphic('assets/images/splashes/Jungle-bg.png');
			flipps.loadGraphic('assets/images/splashes/Camp-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = false;
		}
		else if (curSelected == 48)
		{
			bg.loadGraphic('assets/images/splashes/street-bg.png');
			flipps.loadGraphic('assets/images/splashes/street-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = true;
		}
		else if (curSelected == 49)
		{
			bg.loadGraphic('assets/images/splashes/NevScary-bg.png');
			flipps.loadGraphic('assets/images/splashes/NevScary-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
			grain.visible = false;
		}															
		else if (curSelected == 50) //Art by Paradox
		{
			bg.loadGraphic('assets/images/splashes/Traumatic-bg.png');
			flipps.loadGraphic('assets/images/splashes/Traumatic-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}
		else if (curSelected == 51)
		{
			bg.loadGraphic('assets/images/splashes/Cave-bg.png');
			flipps.loadGraphic('assets/images/splashes/Cave-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}		
		else if (curSelected == 52)
		{
			bg.loadGraphic('assets/images/splashes/Fearful-bg.png');
			flipps.loadGraphic('assets/images/splashes/Fearful-fg.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}																																																																																																																																																																
		else
		{
			bg.loadGraphic('assets/images/menudesat.png');
			FlxTween.tween(flipps,{y: 0}, 0.25 ,{ease: FlxEase.expoInOut});
		}	


		#if PRELOAD_ALL
		if (FlxG.sound.music.playing)
		{
			FlxG.sound.music.stop();
		}
		if (songTimer != null)
		{
			songTimer.cancel();
			songTimer.destroy();
		}
		songTimer = new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
			if (FlxG.sound.music.playing)
			{
				FlxG.sound.music.stop();
			}
			FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
			Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm);
		}, 1);
		#else
		Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm);
		#end
			
		var newColor:Int = songs[curSelected].color;
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		if (guerrillaSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.fromRGB(0, 142, 50));
		}
		else if (csgoSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.GRAY);
		}
		else if (minusSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.fromRGB(51, 0, 255));
		}
		else if (bsideSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.PURPLE);
		}
		else if (aviSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.WHITE);
		}
		else if (antiSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.fromRGB(201, 0, 12));
		}
		else if (caosSongs.contains(songs[curSelected].songName))
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.YELLOW);
		}
		else if (diffText.color != FlxColor.RED)
		{
			FlxTween.globalManager.cancelTweensOf(diffText);

			FlxTween.color(diffText, 0.5, diffText.color, FlxColor.RED);
		}

		// selector.y = (70 * curSelected) + 30;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		
		Paths.currentModDirectory = songs[curSelected].folder;
		PlayState.storyWeek = songs[curSelected].week;

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		if(CoolUtil.difficulties.contains(CoolUtil.defaultDifficulty))
		{
			curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		}
		else
		{
			curDifficulty = 0;
		}

		var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
    }

	override function beatHit()
	{
		super.beatHit();

		if ([
		'triggered', //main week song list
		'slaughter', 
		'hunter', 
		'assault', 
		'fallout', 
		'scope', //alt week song list
	    'unhinged',
	    'kapow',
	    'overkill',
	    'extinction',
	    'flashback', //disorder week song list
	    'shell-shanked',
	    'annihilation',
		'double-whammy',
		'triggered-guerrilla', //guerrilla week song list
		'slaughter-guerrilla',
		'overkill-guerrilla',
		'fallout-guerrilla',
	    'compass', //bonus weekk song list
	    'tags',
		'slasher',
	    'disturbed',
	    'disclosed',
	    'hiding',
	    'lsd', //track additional week song list
		'conflagration',
		'bloodbath',
		'arsenal',
		'bombshell',
		'outbreak',
		'playdate',
		'triggered-remastered', //additional guerrilla week song list
		'slaughter-guerrilla-old',
		'kapow-guerrilla',
		'compass-guerrilla',
		'disturbed-guerrilla',
		'bad-nun', //special week song list
		'nightmares',
		'massacre',
		'cutting-crucifixion',
		'suicide-out',
		'shock-shanked', //genesis week song list
		'lost-shell',
		'megalophobia',
		'talasofobia',
		'bazinga', //roading week song list
		'crucify',
		'flugh',
		'unknown-suffering',
		'lockjaw',
		'kapowdays',
		'eye-to-eye',
	    'phantasm'].contains(songs[curSelected].songName.toLowerCase()))
		{
			if(curBeat % 2 == 0) {
			if(ClientPrefs.camZooms)
			{
				FlxG.camera.zoom += 0.025; //fnf sex mod be like
			if(!camZooming) { //Copied from PlayState.hx
				FlxTween.tween(FlxG.camera, {zoom: 1}, 0.5);
			}
		    }
		}
		if (songs[curSelected].songName.toLowerCase() == 'lsd') //lizzy strawberry instale los shaders con tu video y el juego crashea cuando lo abro :(
			{
				if(curBeat == 16) 
				{
					bg.loadGraphic('assets/images/splashes/invert-bg.png'); //when no sabes instalar los shaders
			        flipps.loadGraphic('assets/images/splashes/invert-fg.png'); //el daltonico:
					FlxG.camera.flash(FlxColor.WHITE, 0.7); //cum
					FlxTween.color(diffText, 0.1, diffText.color, FlxColor.fromRGB(149, 64, 212));
				}
			}
		else if (songs[curSelected].songName.toLowerCase() == 'playdate') //UFFF temazo
			{
				if(curBeat == 64) 
				{
			        flipps.loadGraphic('assets/images/splashes/junior-fg.png'); //no se tomo la descritolina
					FlxG.camera.zoom += 0.075; //que chinge su madre el sat 
				}
			}
		else if (songs[curSelected].songName.toLowerCase() == 'unknown-suffering') //box funkin....................................hola
			{
				if(curBeat == 96) 
				{
			        flipps.loadGraphic('assets/images/splashes/street-alt-fg.png'); //ostia un negro!!!
					FlxG.camera.flash(FlxColor.BLACK, 0.7); //la puta madre se corto la luz
				}
			}
		}
	}

	private function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 6;

		scoreBG.scale.x = FlxG.width - scoreText.x + 6;
		scoreBG.x = FlxG.width - (scoreBG.scale.x / 2);
		diffText.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		diffText.x -= diffText.width / 2;
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";

	public function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}