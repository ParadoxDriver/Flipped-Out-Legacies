package;

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
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import openfl.Lib;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		Lib.application.window.title = "Friday Night Funkin': Vs Flippy Flipped Out! Legacy Edition - Credits";
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In The Credits list", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('credits/menuCredits'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
		    ['Flipped Out Legacy Team'], //Road Crew
			['ParadoxDriver',       'paradox',                  'Director, Programmer, Charting and Artist',                'https://www.youtube.com/@ParadoxDriver',                           '25EF25'],
			['Charmander 10',       'C10',                      'Unsed Pizza Sprite (it appears in army stage)',            'https://twitter.com/10Charmander',                                 '413C36'],
			['Izumi Player',        'player',                   'Playtester',                                               'https://www.youtube.com/@ParadoxDriver',                           '42BDFF'],
			[''],
			['Used Fan Songs'],
			['Conquers',            'composers/conquers',       'Hunter Composer',                                          'https://www.youtube.com/c/coquers_',                               'D4E270'],
			['Ezhalt',              'composers/ezhalt',         'Annihliaton Composer',                                     'https://twitter.com/_ezhaltd',                                     '742E4E'],
			['Armydillo',           'composers/armydillo',      'FlashBack Composer',                                       'https://www.youtube.com/channel/UCyTE_8yMF9AvTW6jf0xzJjQ',         '9E81C3'],
			['Charlotte The Dog',   'composers/guffy',          'Original Creator of Shell-Shanked',                        'https://www.youtube.com/@Charlottedapup/about',                    'C1C1C1'],
			['Neutroa',             'composers/neutroa',        'Hiding Neutroa Remix',                                     'https://www.youtube.com/@Neutroa',                                 '28122B'],
			['3 - G',               'composers/3-g',            'Disturbed-Guerrilla Composer',                             'https://www.youtube.com/@3G_elrandom/videos',                      '0502FB'],
			['ThunderGhost',        'composers/thunder',        'Outbreak Composer',                                        'https://www.youtube.com/@thunderghost1311',                        'F9DEBA'],
			['Venesio',             'composers/venesio',        'Arsenal Composer',                                         'https://gamebanana.com/members/1804301',                           '0066FF'],
			[''],
			['Used Covers'],
			['V.Ntro',              'covers/v.ntro',            '5 Covers',                                                 'https://gamebanana.com/members/1977023',                           'BB01FF'],
			['Silly_Nex',           'covers/nexsus',            '2 Remake vocals, 1 cover, 1 FanSong and 1 Remix',          'https://www.youtube.com/@nexsussy',                                'C7012A'],
			['Amirlikesmeat',       'covers/amirlikesmeat',     'Unknown Suffering Cover',                                  'https://gamebanana.com/members/1922367',                           'FFFFFF'],
			['Cephonster',          'covers/cephonster',        'KapowDays Cover (DoomsDay Remix)',                         'https://www.youtube.com/@Cephonster',                              '362F84'],
			[''],
			['Used Mashups'],
			['The Blaster',         'others/blaster',           'Special Week Mashups (Except Sink x Fallout)',             'https://www.youtube.com/channel/UCHWQZ0BYFTLiSDr48SCDnsQ',         'FFFFFF'],
			['Nuru',                'others/nuru',              'Sink x Fallout and Happy x Slaughter Mashup',              'https://www.youtube.com/channel/UCNFyOleiK-whpxHCc_cZUpQ',         '3C3F37'],
			['Seras Victoria',      'others/victoria',          'Shell-Shanked x Shotgun-Shell Mashup',                     'https://www.youtube.com/@Seras_Victoria',                          '1F212D'],
			[''],
			['Used Art'],
			['Deco',                'artist/deco',              'Flippy B-Side Reskin',                                      'https://gamebanana.com/members/1749492',                           'FFFFFF'],
			['Noid',                'artist/noid',              'Insane Flippy and Insanity Stage',                          'https://gamebanana.com/members/1970788',                           '444444'],
			['Pw64',                'artist/pw64',              'Csgo Flippy Reskin',                                        'https://gamebanana.com/members/1721457',                           '0017BA'],
			['AlxBK',               'artist/alxbk',             'Flippy Britanico lol (Fever-Flip-Bloody)',                  'https://gamebanana.com/members/1898806',                           '444444'],
			['SpriteMonster',       'artist/monster',           'Nevada BackGround',                                         'https://twitter.com/spritemonster',                                '425F49'],
			['Krak',                'artist/krak',              'Ground and CampFire (it appears in Bad-Nun)',               'https://www.youtube.com/channel/UCmQ39SrSuJc77xg1SmKpYtg',         'A1E3F1'],
			['Paxz3r',              'artist/paxz3r',            'Camp Retro (B-Side) BackGround',                            'https://gamebanana.com/members/1840163',                           '444444'],
			['4ntonySKR',           'artist/4ntonySKR',         'Nentral Scared BF icon',                                    'https://www.youtube.com/c/AntonioFNFXdd',                          'C231D1'],
			['Pikakid 10',          'artist/pikakid',           'Better Notes (Reskin)',                                     'https://gamebanana.com/members/2055717',                           '444444'],
			['Tails Craft',         'artist/tails',             'HurtNote_assets HD Reskin',                                 'https://gamebanana.com/members/1779746',                           'FF8C00'],
			[''],
			['Used Lua Code'],
			['StaleTide',           'luaCode/stale',            'Triggered Introduction Sequence (Dialogue and Cutscene)',   'https://www.youtube.com/channel/UCnijE_F7WI6Y4iZvtLstd0Q',         'F90707'],
			['Zoe.exe',             'luaCode/zoe',              'FlashUnHud Event',                                          'https://www.youtube.com/channel/UCtVh_QG4E7reE8lp1yBDReg',         '58255F'],
			['Saltyboii',           'luaCode/saltyboii',        'badapplelol event',                                         'https://gamebanana.com/members/1948626',                           '888888'],
			['Kamikaze',            'luaCode/kamikaze',         'Lockjaw Psych Engine Recreation',                           'https://www.youtube.com/@kamizito',                                '777777'],
			['Twizinho',            'luaCode/twizinho',         'Camera Switch Event',                                       'https://gamebanana.com/members/1794927',                           'FE9EB8'],
			['Nickobelit',          'luaCode/nickobelit',       "WI Hud Script, and bf, gf retro Optimization",              'https://www.youtube.com/c/Nickobelit',                             'FF0000'],
			[''],
			['Used Source Code'],
			['MarazakX',            'others/mrzk',"FreePlay Vocals Code, Random Main Code and Optimization of some Sprites", 'https://www.youtube.com/@MarazakX',                                '53E52C'],
			[''],
			['Additional Credits'],
			['Soul Legal',          'others/nick',              'Annihliaton Charting (Used in The V1)',                     'https://gamebanana.com/members/1805202',                           'CC0100'],
			['Aizakku',             'others/aizakku',           'Name of the Song (Annihliaton)',                            'https://gamebanana.com/members/1875729',                           'FEC708'],
			['Amigo Likero XD',     'others/full HD 4K',        'Compass Cutscene',                                          'https://www.youtube.com/channel/UCfWn_IvSuWCdfRl-qPqdpSw',         '033566'],
			['BFTheFunkinKG20',     'others/BF',           'Reupload Slaughter-Guerrilla V1 (Slaughter-Guerrilla Extended)', 'https://www.youtube.com/@BFTheFunkinKG20',                         '279ADC'],
			[''],
		    ['Og Flippy Team'],
			['J0nnyTest',           'Flippy/jonny',             'Director and Animator',                                     'https://twitter.com/suprmach199',                                  'CC99FF'],
			['Redsty Phoenix',      'Flippy/redstyphoenix',     'Co-Director and Script Writer',                             'https://twitter.com/RedstyPOfficial',                              'AB0000'],
			['Seberster',           'Flippy/seberster',         'Composer/Music',                                            'https://twitter.com/Seberster',                                    '66FF66'],
			['Conga',               'Flippy/conga',             'Coder/Programmer',                                          'https://twitter.com/Conga_Dev',                                    '9735A5'],
			['TheetPrick',          'Flippy/theetprick',        'Concept and Ideas',                                         'https://twitter.com/Theetprick',                                   '3D3D3D'],
			['IronB',               'Flippy/ironb',             'Trailer Production',                                        'https://twitter.com/IronBoi1392',                                  '5171FF'],
			['Ehtma Reiner',        'Flippy/ehtma',             'Animator [Triggered Cutscene]',                             'https://twitter.com/Ehtma_Reiner',                                 'FFFFFF'],
			['XNDgoat',             'Flippy/xnd',               'Artist',                                                    'https://twitter.com/xndgoat',                                      'FF9746'],         
			['THEJEWELMAN',         'Flippy/thejewelman',       'Charter',                                                   'https://twitter.com/JewelJacob_',                                  '78FEF7'],
			['AlchoholicDJ',        'Flippy/Dj',                'Animator',                                                  'https://twitter.com/AlchoholicDj',                                 'FFFFFF'],
			[''],
			['HTF Creators'],
			['MondoMedia',          'others/mondo',             'HTF Creators',                                              'https://www.youtube.com/mondominishows',                           'F13232'],
			[''],
			['Resource From Other Mods'],
			['Vs Kenny',            'modsLOL/kenny',            'Fog Sprite (it appears in Hunter)',                         'https://gamebanana.com/mods/285688',                               'FF841A'],
			['Happy Tree Funkers',  'modsLOL/funkers',          'Double-Whammy Song (Fan Chart)',                            'https://gamejolt.com/games/HTFunkers/693706',                      '99FD94'],
			['Falling Flakes',      'modsLOL/flaky',            'Blood Note',                                                'https://gamebanana.com/mods/354166',                               'EF3535'],
			['Indi Cross',          'modsLOL/indi',             'Sink/Hunter Death',                                         'https://gamejolt.com/games/indiecross/643540',                     'CD06DE'],
			['FNF Entity',          'modsLOL/entity',           'bf carry icon',                                             'https://gamebanana.com/mods/284934',                               'FE30C0'],
			['Black Betrayal',      'modsLOL/impostor',         'Impostor Death',                                            'https://gamebanana.com/mods/357998',                               'BB2D2D'],
			['FNF Incident',        'modsLOL/troll',            'Minus-Deaht and Hatchet Note',                              'https://gamebanana.com/wips/56747',                                'FFFFFF'],
			['Funkin Breakout',     'modsLOL/park',             'Hunter Rain',                                               'https://gamebanana.com/mods/388984',                               '234FC9'],
			['Vs Sonic.Exe',        'modsLOL/sonic',            'Static Note',                                               'https://gamebanana.com/mods/387978',                               '00558E'],
			['FNF Door Stuck',      'modsLOL/emputado',         'bfDoor and gfDoor',                                         'https://gamebanana.com/wips/61291',                                '2A2A2A'],
			["Wednesday's Infidelity",'modsLOL/melavoyafollar', 'bf-retro and gf retro',                                     'https://gamejolt.com/games/wednesdayinfidelity/672074',            '525951'],
			['Mid Night Suffering',  'modsLOL/rataputa',        'healthBarMadness',                                          'https://gamebanana.com/mods/398444',                               '525951'],
			['TF2 Mann Co',        'modsLOL/elgordoysusamigos', 'healthBarBurnt',                                            'https://gamebanana.com/mods/322803',                               'FF0000'],
			['Antipathy Escape From Nevada', 'modsLOL/wank',    'bf, gf Lockjaw, bf-nomask and Lockjaw Game Over',           'https://gamebanana.com/mods/434513',                               '9271FD'],
			["Funkin' at Freddy's", 'modsLOL/afton',            'Nightmares Game Over',                                      'https://gamejolt.com/games/VsAfton/680949',                        'A357AB'],
			['Vs pou Remaster',     'modsLOL/pou',              'lost-shell Game Over',                                      'https://gamebanana.com/mods/421745',                               'C09858'],
			["Mortimer's Suicidal Night", 'modsLOL/mortimer',   'Suicide-Out Game Over',                                     'https://gamebanana.com/mods/413068',                               '636363'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',   		'psych/shadowmario',	'Main Programmer of Psych Engine',							'https://twitter.com/Shadow_Mario_',	'444444'],
			['RiverOaken',			'psych/riveroaken',		'Main Artist/Animator of Psych Engine',						'https://twitter.com/RiverOaken',		'B42F71'],
			['shubs',				'psych/shubs',			'Additional Programmer of Psych Engine',					'https://twitter.com/yoshubs',			'5E99DF'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'psych/bb-panzu',		'Ex-Programmer of Psych Engine',							'https://twitter.com/bbsub3',			'3E813A'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'psych/iflicky',		'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	'https://twitter.com/flicky_i',			'9E29CF'],
			['SqirraRNG',			'psych/gedehari',		'Chart Editor\'s Sound Waveform base',						'https://twitter.com/gedehari',			'E1843A'],
			['PolybiusProxy',		'psych/polybiusproxy',	'.MP4 Video Loader Extension',								'https://twitter.com/polybiusproxy',	'DCD294'],
			['Keoiki',				'psych/keoiki',			'Note Splash Animations',									'https://twitter.com/Keoiki_',			'FFFFFF'],
			['Smokey',				'psych/smokey',			'Spritemap Texture Support',								'https://twitter.com/Smokey_5_',		'483D92'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'funkin/ninjamuffin99',	"Programmer of Friday Night Funkin'",						'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'funkin/phantomarcade',	"Animator of Friday Night Funkin'",							'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'funkin/evilsk8r',		"Artist of Friday Night Funkin'",							'https://twitter.com/evilsk8r',			'5ABD4B'],
			['kawaisprite',			'funkin/kawaisprite',	"Composer of Friday Night Funkin'",							'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-1 * shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(1 * shiftMult);
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
					}
				}
			}

			if(controls.ACCEPT) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.isBold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
					item.forceX = item.x;
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
					item.forceX = item.x;
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
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

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}