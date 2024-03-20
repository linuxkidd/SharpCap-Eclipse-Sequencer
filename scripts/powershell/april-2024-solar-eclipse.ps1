#######################################################################
# Note: This script is called from within the root SharpCap directory #
#######################################################################

#################
# Configuration #
#################

param (
	[string]$c1 = "",
	[Parameter(Mandatory=$true)][string]$c2,
	[Parameter(Mandatory=$true)][string]$c3,
	[string]$c4 = "",
	[bool]$display_windows_notifications = $true
)

$times = @{ "c1"=$c1; "c2"=$c2; "c3"=$c3; "c4"=$c4; "max_eclipse_offset"=[Math]::Floor(( ( Get-Date $c3 ) - ( Get-Date $c2 ) ).TotalSeconds / 2 ) }

##################
# Alerts to send #
##################

$alerts = @(
    @{'base'='c1'; 'offset'=-120; 'tts'='The SharpCap eclipse script has started'; 'title'='SharpCap Script - Started'},
    @{'base'='c1'; 'offset'=-60; 'tts'='First contact is in 60 seconds'; 'title'='First Contact In 60 Seconds'},
    @{'base'='c1'; 'offset'=-30; 'tts'='30 seconds'; 'title'='First Contact In 30 Seconds'},
    @{'base'='c1'; 'offset'=-20; 'tts'='20 seconds'; 'title'='First Contact In 20 Seconds'},
    @{'base'='c1'; 'offset'=-10; 'tts'='10 seconds'; 'title'='First Contact In 10 Seconds'},
    @{'base'='c1'; 'offset'=0; 'tts'='First contact is happening now'; 'title'='First contact Now'; 'type'='Warning'},

    @{'base'='c2'; 'offset'=-1500; 'tts'='Refocus telescope if necessary'; 'title'='Refocus Telescope'},
    @{'base'='c2'; 'offset'=-1200; 'tts'='Look for Venus at about 5 o''clock in relation to the sun'; 'title'='Look for Venus'},
    @{'base'='c2'; 'offset'=-600; 'tts'='Look for Venus at about 5 o''clock in relation to the sun'; 'title'='Look for Venus'},
    @{'base'='c2'; 'offset'=-300; 'tts'='Look for Venus at about 5 o''clock in relation to the sun'; 'title'='Look for Venus'},
    @{'base'='c2'; 'offset'=-180; 'tts'='Totality is in 3 minutes'; 'title'='Totality in 3 Minutes'},
    @{'base'='c2'; 'offset'=-120; 'tts'='Totality is in 2 minutes'; 'title'='Totality in 2 Minutes'},
    @{'base'='c2'; 'offset'=-90; 'tts'='Look for Jupiter at about 11 o''clock in relation to the sun'; 'title'='Look for Jupiter'},
    @{'base'='c2'; 'offset'=-60; 'tts'='Totality is in 1 minute'; 'title'='Totality in 1 Minute'},
    @{'base'='c2'; 'offset'=-33; 'tts'='Remove solar filter'; 'title'='Remove Solar Filter'; 'type'='Warning'},
    @{'base'='c2'; 'offset'=-30; 'tts'='30 seconds'; 'title'='Totality in 30 Seconds'},
    @{'base'='c2'; 'offset'=-20; 'tts'='20 seconds'; 'title'='Totality in 20 Seconds'},
    @{'base'='c2'; 'offset'=-10; 'tts'='10 seconds'; 'title'='Totality in 10 Seconds'},
    @{'base'='c2'; 'offset'=-8; 'tts'='Look for diamond ring'; 'title'='Diamond Ring'; 'type'='Warning'},
    @{'base'='c2'; 'offset'=-5; 'tts'='Look for Baily''s Beads'; 'title'='Baily''s Beads'; 'type'='Warning'},
    @{'base'='c2'; 'offset'=0; 'tts'='Totality starts now'; 'title'='Totality Starts'; 'type'='Warning'},

    @{'base'='c2'; 'offset'=20; 'tts'='Observe the horizon'; 'title'='Observe the Horizon'},
    @{'base'='c2'; 'offset'=50; 'tts'='Look for comet 12P (Pons-Brooks) near Jupiter at about 4 o''clock in relation to Jupiter. This comet will appear between Jupiter and the Sun if visible.'; 'title'='Comet 12P (Pons-Brooks)'},
    @{'base'='c2'; 'offset'=$times["max_eclipse_offset"]; 'tts'='Maximum eclipse is happening now'; 'title'='Maximum Eclipse Now';'type'='Warning'},
    @{'base'='c2'; 'offset'=80; 'tts'='Observe the horizon'; 'title'='Observe the Horizon'},

    @{'base'='c3'; 'offset'=-60; 'tts'='Totality ends in 60 seconds'; 'title'='Totality Ends in 60 seconds'},
    @{'base'='c3'; 'offset'=-30; 'tts'='30 seconds'; 'title'='Totality ends in 30 seconds'},
    @{'base'='c3'; 'offset'=-20; 'tts'='20 seconds'; 'title'='Totality ends in 30 seconds'},
    @{'base'='c3'; 'offset'=-10; 'tts'='10 seconds'; 'title'='Totality ends in 10 seconds'},
    @{'base'='c3'; 'offset'=0; 'tts'='Totality ending now'; 'title'='Totality Ending Now';'type'='Warning'},
    @{'base'='c3'; 'offset'=3; 'tts'='Look for Baily''s Beads'; 'title'='Baily''s Beads';'type'='Warning'},
    @{'base'='c3'; 'offset'=6; 'tts'='Look for diamond ring'; 'title'='Diamond Ring'},
    @{'base'='c3'; 'offset'=32; 'tts'='Warning, Replace Solar Filter'; 'title'='Replace Solar Filter';'type'='Warning'},
    @{'base'='c3'; 'offset'=60; 'tts'='Jupiter should disappear shortly'; 'title'='Jupiter Disappearing'},
    @{'base'='c3'; 'offset'=300; 'tts'='Venus should disappear shortly'; 'title'='Venus Disappearing'},
    @{'base'='c3'; 'offset'=600; 'tts'='Venus should disappear shortly'; 'title'='Venus Disappearing'},
    @{'base'='c3'; 'offset'=1200; 'tts'='Venus should disappear shortly'; 'title'='Venus Disappearing'},
    @{'base'='c3'; 'offset'=1500; 'tts'='Refocus telescope if necessary'; 'title'='Refocus Telescope'},

    @{'base'='c4'; 'offset'=-60; 'tts'='Last contact in 60 seconds'; 'title'='Last Contact'},
    @{'base'='c4'; 'offset'=-30; 'tts'='30 seconds'; 'title'='Last Contact in 30 seconds'},
    @{'base'='c4'; 'offset'=-20; 'tts'='20 seconds'; 'title'='Last Contact in 20 seconds'},
    @{'base'='c4'; 'offset'=-10; 'tts'='10 seconds'; 'title'='Last Contact in 10 seconds'},
    @{'base'='c4'; 'offset'=0; 'tts'='Last contact is happening now'; 'title'='Last Contact'; 'type'='Warning'}
)


#############
# Functions #
#############

##
# This function returns the current time.
#
# @returns string
#
function getCurrentTime {
	( Get-Date ).ToString( 'HH:mm:ss' )
}

##
# This function returns an offset between a timestamp and the current time.
#
# @param string $timestamp
#
# @returns double
#
function getTimestampFromCurrentTime {
	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $timestamp
	)

	$timestamp_offset = ( ( Get-Date $timestamp ) - ( Get-Date ) ).TotalSeconds

	[ Double ] $timestamp_offset
}

##
# This function sleeps until a specific time.
#
# @param string $timestamp
#
# @returns string
#
function sleepUntil {
	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $timestamp
	)

	$timestamp_offset = getTimestampFromCurrentTime $timestamp
	$current_time = getCurrentTime
	$do_sleep = if ( $timestamp_offset -gt 0 ) { $true } else { $false }

	if ( $do_sleep ) {
		Write-Information "$current_time`: Waiting until $timestamp ($timestamp_offset seconds)..." -InformationAction Continue

		Start-Sleep -Seconds $timestamp_offset
	}
	else {
		Write-Information "$current_time`: $timestamp is before the current time, skipping sleep" -InformationAction Continue
	}

	return $do_sleep
}

##
# This function plays a TTS (text-to-speech) sound.
#
# Note: Calling this function consecutively will result in
# only the last sound playing through the speakers.
#
# @param string $text
#
# @returns void
#
function playTTSSound {
	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $text
	)

	$current_time = getCurrentTime
	Write-Information "$current_time`: Play TTS sound (""$text"")" -InformationAction Continue

	Add-Type -AssemblyName System.Speech

	$tts = ( New-Object System.Speech.Synthesis.SpeechSynthesizer );
	$tts.Volume = 100

	$tts.SpeakAsyncCancelAll();

	$tts.SetOutputToDefaultAudioDevice();

	$tts.SpeakAsync( $text );
}

##
# This function initializes the script.
#
# @returns string
#
function initializeScript {
	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $script_start_time
	)

	$current_time = getCurrentTime
	$initialized_timestamp_offset = getTimestampFromCurrentTime $script_start_time

	Write-Information "$current_time`: SharpCap Powershell Eclipse Script Initialized" -InformationAction Continue
	Write-Information "$current_time`: ----------------------------------------------" -InformationAction Continue
	Write-Information "" -InformationAction Continue

	if ( $initialized_timestamp_offset -gt 0 ) {
		if ( $display_windows_notifications ) {
			showNotifyIcon 'SharCap Script - Initialized' 'The SharpCap eclipse script has been initialized and is waiting to start' 'Info'
		}

		playTTSSound 'The SharpCap eclipse script has been initialized and is waiting to start'
	}
	else {
		Write-Information "$current_time`: Skipping initialize alert" -InformationAction Continue
	}
}

##
# This function displays a Windows notification.
#
# @param string $title
# @param string $text
# @param string $icon_type
# @param string $timeout
#
# @returns void
#
function showNotifyIcon {
	[CmdletBinding()]

	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $title,

		[ Parameter( Mandatory, Position = 1 ) ]
		[ ValidateNotNullOrEmpty() ]
		[ String ] $text,

		[ Parameter( Position = 2 ) ]
		[ ValidateSet( "Error", "Info", "None", "Warning" ) ]
		[ String ] $icon_type = 'Info',

		[ Parameter( Position = 3 ) ]
		[ Int ] $timeout = 10000
	)

	$current_time = getCurrentTime
	Write-Information "$current_time`: Showing notification ($title)" -InformationAction Continue

	Add-Type -AssemblyName "System.Windows.Forms"

	if ( ! ( Test-Path -Path Variable:\Script:icon ) ) {
		$ps_exe = Join-Path $PSHOME "powershell.exe" -Resolve
		$Script:icon = [ Drawing.Icon ]::ExtractAssociatedIcon( $ps_exe )
	}

	$NotifyIcon = ( New-Object System.Windows.Forms.NotifyIcon )
	$NotifyIcon.Icon = $Script:icon;
	$NotifyIcon.Visible = $true;

	$NotifyIcon.ShowBalloonTip( $timeout, $title, $text, [ Windows.Forms.ToolTipIcon ] $icon_type )

	# Note: On Windows 11, calling $NotifyIcon.Dispose(); right after $NotifyIcon.ShowBalloonTip()
	# helps to ensure the notification is removed from the system tray and also the notifications center
	# automatically after some time. It also helps to ensure the notifications are removed from the system
	# tray when the script exits. However, this does affect the notification window title (the Powershell
	# application is not named).
	$null = $NotifyIcon.Dispose();
}

##
# This function sleeps until a specified timestamp and then triggers an audible alert. It may also trigger a Windows Notification.
#
# @param string $timestamp
# @param string $sound_path
# @param string $tts_text
# @param string $notification_title
# @param string $notification_text
# @param string $notification_icon_type
# @param int $notification_timeout
#
# @uses $display_windows_notifications
# @uses $use_tts
#
# @returns void
#
function sleepUntilAndThenTriggerAlert {
	param (
   		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $timestamp,

		[ Parameter( Mandatory, Position = 1 ) ]
		[ String ] $tts_text,

		[ Parameter( Mandatory, Position = 2 ) ]
		[ string ] $notification_title,

		[ Parameter( Position = 3 ) ]
		[ ValidateSet( "Error", "Info", "None", "Warning" ) ]
		[ String ] $notification_icon_type = 'Info',

		[ Parameter( Position = 4 ) ]
		[ Int ] $notification_timeout = 10000
	)

	$current_time = getCurrentTime
	$did_sleep = sleepUntil( $timestamp )

	if ( $did_sleep ) {
		if ( $display_windows_notifications ) {
			showNotifyIcon $notification_title $tts_text $notification_icon_type $notification_timeout
		}

		playTTSSound $tts_text
	}
	else {
		Write-Information "$current_time`: Skipping alert ($notification_title)" -InformationAction Continue
	}

	Write-Information "" -InformationAction Continue
}


##########
# Script #
##########

# Initialize

$initSent = $false
$lastAlert = @{}

$skipPartial = $false
if ( $times['c1'] -eq "" -or $times['c4'] -eq "" ) {
	$skipPartial = $true
}


ForEach($alert in $alerts) {
	if ( $times[$alert['base']] -ne "") {
		if ( $skipPartial -and [Math]::Abs($alert['offset']) -gt 299 ) {
			Continue
		}
		if( -Not $initSent ) {
			initializeScript ( Get-Date $times[$alert['base']] ).AddSeconds( $alert['offset'] + -10 ).ToString( 'HH:mm:ss' )
			$initSent = $true
		}

		$type = 'Info'
		if ( $alert.ContainsKey('type') ) {
			$type = $alert['type']
		}
		$startTime = ( Get-Date $times[$alert['base']] ).AddSeconds( $alert['offset'] ).ToString( 'HH:mm:ss' )
		sleepUntilAndThenTriggerAlert $startTime $alert['tts'] $alert['title'] $type
		$lastAlert = $alert;
	}
}

sleepUntil ( Get-Date $times[$lastAlert['base']] ).AddSeconds( $lastAlert['offset'] + 30 ).ToString( 'HH:mm:ss' )
Write-Information "Exiting..." -InformationAction Continue
if ( $display_windows_notifications ) {
	showNotifyIcon 'SharpCap Script - Ended' 'The SharpCap eclipse script has ended'
}

playTTSSound 'The SharpCap eclipse script has ended, exiting.'
# Exit (5 seconds after the script end alert)
sleepUntil ( Get-Date $times[$lastAlert['base']] ).AddSeconds( $lastAlert['offset'] + 35 ).ToString( 'HH:mm:ss' )
