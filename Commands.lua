

function RegisterCommands()

	-- COMMAND TO DISPLAY THE MAIN WINDOW.
	cmdShowMain = Turbine.ShellCommand();

	function cmdShowMain:Execute( command, arguments )

		if wMainWinParent:IsVisible() == false then
			wMainWinParent:SetVisible(true);
			SETTINGS.MAINWIN.VISIBLE = true;
		else
			wMainWinParent:SetVisible(false);
			SETTINGS.MAINWIN.VISIBLE = false;
		end
	end

	function cmdShowMain:GetHelp()
		return "Rich! Shows/hides the main window.";
	end

	function cmdShowMain:GetShortHelp()
		return "Rich! Shows/hides the main window.";
	end

	Turbine.Shell.AddCommand( "ShowRich", cmdShowMain);

end





