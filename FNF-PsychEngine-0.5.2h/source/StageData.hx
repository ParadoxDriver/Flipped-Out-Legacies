package;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
import haxe.Json;
import haxe.format.JsonParser;
import Song;

using StringTools;

typedef StageFile = {
	var directory:String;
	var defaultZoom:Float;
	var isPixelStage:Bool;

	var boyfriend:Array<Dynamic>;
	var girlfriend:Array<Dynamic>;
	var opponent:Array<Dynamic>;
	var hide_girlfriend:Bool;

	var camera_boyfriend:Array<Float>;
	var camera_opponent:Array<Float>;
	var camera_girlfriend:Array<Float>;
	var camera_speed:Null<Float>;
}

class StageData {
	public static var forceNextDirectory:String = null;
	public static function loadDirectory(SONG:SwagSong) {
		var stage:String = '';
		if(SONG.stage != null) {
			stage = SONG.stage;
		} else if(SONG.song != null) {
			switch (SONG.song.toLowerCase().replace(' ', '-'))
			{
				case 'Triggered' | 'Flashback' | 'Funny':
					stage = 'camp';
				case 'Slaughter' | 'Shell-Shanked' | 'Annihilation' | 'Conflagration' | 'BloodBath':
					stage = 'blood';
				case 'Hunter' | 'Cutting-Crucifixion':
					stage = 'blood foggy';
				case 'Assault':
					stage = 'blood fire';
				case 'Fallout' | 'In-The-End':
					stage = 'blood night';
				case 'Scope' | 'Flugh':
					stage = 'nevada';
				case 'Unhinged':
					stage = 'nevada-burnt';
				case 'Kapow':
					stage = 'army';
				case 'Overkill':
					stage = 'army-nublar';
				case 'Extinction':
					stage = 'army-fire';
				case 'Double-Whammy':
					stage = 'inner-battle';
				case 'Triggered-Guerrilla' | 'Triggered-Remastered':
					stage = 'camp-fullmetal';
				case 'Slaughter-Guerrilla' | 'Slaughter-Guerrilla-Old':
					stage = 'blood-fullmetal';
				case 'Overkill-Guerrilla':
					stage = 'fire-fullmetal';
				case 'Fallout-Guerrilla':
					stage = 'burnt-fullmetal';
				case 'Kapow-Guerrilla':
					stage = 'army-fullmetal';
				case 'Compass-Guerrilla':
					stage = 'htf-fullmetal';
				case 'Disturbed-Guerrilla':
					stage = 'treehouse-fullmetal';
				case 'Compass' | 'Bombshell':
					stage = 'htf';
				case 'Tags' | 'Outbreak':
					stage = 'fade-camp';
				case 'Slasher' | 'Playdate':
					stage = 'treehouse-slasher';
				case 'Disturbed':
					stage = 'treehouse';
				case 'Disclosed':
					stage = 'insanity';
				case 'Hiding':
					stage = 'camp-retro';
				case 'LSD':
					stage = 'camp-invert';
				case 'Arsenal':
					stage = 'army-combat';
				case 'Bad-Nun':
					stage = 'night-camp';
				case 'Nightmares':
					stage = 'fright';
				case 'Massacre':
					stage = 'defeat-army';
				case 'Suicide-Out':
					stage = 'street';
				case 'Shock-Shanked':
					stage = 'alleyway';
				case 'Lost-Shell':
					stage = 'void_2';
				case 'Megalophobia':
					stage = 'aurora-stage';
				case 'Talasofobia':
					stage = 'sunkstage';
				case 'Bazinga':
					stage = 'fever-camp';
				case 'Crucify':
					stage = 'fever-blood';
				case 'Unknown-Suffering':
					stage = 'bobux';
				case 'Lockjaw':
					stage = 'nevScary';
				case 'Kapowdays':
					stage = 'last-assault';
				case 'Eye-to-Eye':
					stage = 'cave';
				case 'Phantasm':
					stage = 'fleet';
				case 'Incident':
					stage = 'old-camp';
				default:
					stage = 'stage';
			}
		} else {
			stage = 'stage';
		}

		var stageFile:StageFile = getStageFile(stage);
		if(stageFile == null) { //preventing crashes
			forceNextDirectory = '';
		} else {
			forceNextDirectory = stageFile.directory;
		}
	}

	public static function getStageFile(stage:String):StageFile {
		var rawJson:String = null;
		var path:String = Paths.getPreloadPath('stages/' + stage + '.json');

		#if MODS_ALLOWED
		var modPath:String = Paths.modFolders('stages/' + stage + '.json');
		if(FileSystem.exists(modPath)) {
			rawJson = File.getContent(modPath);
		} else if(FileSystem.exists(path)) {
			rawJson = File.getContent(path);
		}
		#else
		if(Assets.exists(path)) {
			rawJson = Assets.getText(path);
		}
		#end
		else
		{
			return null;
		}
		return cast Json.parse(rawJson);
	}
}