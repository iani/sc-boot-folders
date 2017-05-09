StartupFolders {
	*initClass {
		StartUp add: {
			(Platform.userAppSupportDir ++ "/langStartup.scd").postln;
			(Platform.userAppSupportDir ++ "/langStartup.scd").pathMatch.postln;
			(Platform.userAppSupportDir ++ "/langStartup.scd").load;
			ServerTree add: {
				(Platform.userAppSupportDir ++ "/serverStartup.scd").load;
			};
		};
	}
}