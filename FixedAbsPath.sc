// PathName and thisProcess mess up relative paths.
// This is a simple fix
//  9 May 2017 14:11

PathFix {
	classvar <>root = "";
}

+ String {
	loadFixed { | absPathPrefix = "" |
		PathFix.root = absPathPrefix;
		^this.load;
		// ^(absPathPrefix ++ this).load;
	}

	fix {
		^PathFix.root ++ this;
	}
}