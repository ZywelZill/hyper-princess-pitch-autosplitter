// Hyper Princess Pitch AutoSplitter by Zywel Zill
// HyperPrincessPitch.asl

state ("pitch gm7") {
	// Level Internal Number
	int level : "pitch gm7.exe", 0x1AF2F8;

	// First Split Checker (Only used in "start")
	int firstSplit : "jbfmod.dll", 0x0000E884, 0x4, 0x4, 0x4, 0x4B4; // 102 = non-start, rng = start game

	// Last Split Checker (Only used after defeating Mecha-Santa)
	int lastSplit : "jbfmod.dll", 0x0000E87C, 0x4, 0x0, 0x0, 0x0, 0x0, 0x4, 0x4B4; // 102 = non-finish, rng = finish game

	// Split Checker (Used in every level transition)
	int levelSplit : "pitch gm7.exe", 0x001878B0, 0x244, 0x90, 0x0, 0xF4, 0x88, 0x7C; // 2 normal, 3 transition
	// int levelSplit2 : "pitch gm7.exe", 0x001878B0, 0x248, 0x90, 0x0, 0xF4, 0x88, 0x7C;
	// int levelSplit3 : "pitch gm7.exe", 0x001878B0, 0x244, 0x90, 0x0, 0xF8, 0x0, 0x88, 0x7C;
	// int levelSplit4 : "pitch gm7.exe", 0x001878B0, 0x248, 0x90, 0x0, 0xF8, 0x0, 0x88, 0x7C;
}

startup {
	// Practice Mode
	settings.Add("isPractice", false, "Practice Mode (AutoSplitter On/Off)");
	settings.SetToolTip("isPractice", "False by default, turn on (check) if just practicing");
}

start {
	// Starts immediately after pressing button in difficulty selection screen
	if (!settings["isPractice"]) {
		if (current.firstSplit != 102 && old.firstSplit == 102) {
			return true;
		}
	}
}

split {
	// Splits happen when boss "starts exploding" or "disappear"
	// Last Split happens when screen goes white
	if (current.levelSplit == 3 && old.levelSplit == 2 && current.level != 6) {
		return true;
	} else if (current.lastSplit != 102 && old.lastSplit == 102 && current.level == 6) {
		return true;
	}
}
