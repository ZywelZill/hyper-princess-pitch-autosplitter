// CAUTION: Testing, non-functional
// Hyper Princess Pitch AutoSplitter by Zywel Zill

state ("pitch gm7")
{
	//Level Internal Number Pointer
	int level : "pitch gm7.exe", 0x1AF2F8;
	int gamestart : "fmod.dll", 0x00035364, 0x200, 0x88, 0x88, 0x0, 0x40, 0x1C, 0x9D4; // 0 normal 1 start 0 back

	int hpp3_1 : "pitch gm7.exe", 0x001198B8, 0x78, 0x64, 0x30C, 0xAD8, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 1 back
	int hpp3_2 : "D3DX8.dll", 0x0005C128, 0x8, 0xBC, 0x8, 0xA24, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 1 back

	int gamestart2 : "pitch gm7.exe", 0x001198B8, 0x78, 0x64, 0x30C, 0xAD8, 0x5F0, 0x660, 0x6C; // 1 normal 2 start 2 back
	
}

startup
{

}

start
{
	// Start immediately after pressing button to start and NOT when "road map" screen loads
	if (current.hpp3_1 == 2)
	{
		return true;
	}
}

split
{
	// Testing
	if (current.gamestart == 1 && old.gamestart == 0 && current.hpp3_1 == 1) {
		return true;
	}


}

reset
{
	//Not implemented yet
	if (current.level == 121)
	{
		return true;
	}
}


/*
	Level Numbers Explanation

	???		-		Main Screen

*/
