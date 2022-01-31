// CAUTION: Testing Stage, not 100% guaranteed, use at your own risk
// Hyper Princess Pitch AutoSplitter by Zywel Zill
// HyperPrincessPitch.asl

state ("pitch gm7") {
	//Testing
	int level : "pitch gm7.exe", 0x1AF2F8;

	int firstSplit : "jbfmod.dll", 0x0000E884, 0x4, 0x4, 0x4, 0x4B4; // 102 = non-start, rng = start game
	int lastSplit : "jbfmod.dll", 0x0000E87C, 0x4, 0x0, 0x0, 0x0, 0x0, 0x4, 0x4B4; // 102 = non-finish, rng = finish game
	int levelSplit : "pitch gm7.exe", 0x001878B0, 0x244, 0x90, 0x0, 0xF4, 0x88, 0x7C; // Splits when screen goes white - 2 Normal 3 Transition
	// int levelSplit2 : "pitch gm7.exe", 0x001878B0, 0x248, 0x90, 0x0, 0xF4, 0x88, 0x7C;
	// int levelSplit3 : "pitch gm7.exe", 0x001878B0, 0x244, 0x90, 0x0, 0xF8, 0x0, 0x88, 0x7C;
	// int levelSplit4 : "pitch gm7.exe", 0x001878B0, 0x248, 0x90, 0x0, 0xF8, 0x0, 0x88, 0x7C;

	// Not in use anymore
	// int gamestart : "fmod.dll", 0x00035364, 0x200, 0x88, 0x88, 0x0, 0x40, 0x1C, 0x9D4; // 0 normal 1 start 0 back
	// int hpp3_1 : "pitch gm7.exe", 0x001198B8, 0x78, 0x64, 0x30C, 0xAD8, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 1 back
	// int hpp3_2 : "D3DX8.dll", 0x0005C128, 0x8, 0xBC, 0x8, 0xA24, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 1 back
	// int gamestart2 : "pitch gm7.exe", 0x001198B8, 0x78, 0x64, 0x30C, 0xAD8, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 2 back
	// int test1 : "fmod.dll", 0x47A74;
	// int test2 : "pitch gm7.exe", 0x001AF49C, 0x354, 0x4, 0x240, 0x4C, 0x68, 0x1D0; // 0 main 1 start (activates when returning from demo screens)
	// int levelSplitOld : "pitch gm7.exe", 0x1AF314; // Not fully working
}

startup {
	// Practice Mode
	settings.Add("isPractice", false, "Practice Mode (AutoSplitter On/Off)");
	settings.SetToolTip("isPractice", "False by default, turn on (check) if just practicing");
}

start {
	// Start immediately after pressing button and NOT when "road map" screen loads
	if (!settings["isPractice"]) {
		if (current.firstSplit != 102 && old.firstSplit == 102) {
			return true;
		}
	}
}

split {
	if (current.levelSplit == 3 && old.levelSplit == 2 && current.level != 6) {
		return true;
	} else if (current.lastSplit != 102 && old.lastSplit == 102 && current.level == 6) {
		return true;
	}
}

reset {
	// Not Necessary
	// if (current.firstSplit == 121)
	// {
	// 	return true;
	// }
}
