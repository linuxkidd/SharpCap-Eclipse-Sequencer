#######################################################################
# Note: This script is called from within the root SharpCap directory #
#######################################################################

#################
# Configuration #
#################

. .\scripts\eclipse\april-2024-solar-eclipse-config.ps1


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
# This function plays a sound.
#
# Note: Calling this function consecutively will result in
# only the last sound playing through the speakers.
#
# @param string $path
#
# @returns void
#
function playSound {
	param (
		[ Parameter( Mandatory, Position = 0 ) ]
		[ String ] $path
	)

	$current_time = getCurrentTime

	Write-Information "$current_time`: Play sound ($path)" -InformationAction Continue

	( New-Object Media.SoundPlayer $path ).Play();
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
	$current_time = getCurrentTime
	$initialized_timestamp_offset = getTimestampFromCurrentTime $script_start_time

	Write-Information "$current_time`: SharpCap Powershell Eclipse Script Initialized" -InformationAction Continue
	Write-Information "$current_time`: ----------------------------------------------" -InformationAction Continue
	Write-Information "" -InformationAction Continue

	if ( $initialized_timestamp_offset -gt 0 ) {
		if ( $display_windows_notifications ) {
			showNotifyIcon $initialize_notification_title $initialize_notification_text $initialize_notification_type
		}

		if ( $use_tts ) {
			playTTSSound $initialize_tts_text
		}
		else {
			playSound $initialize_sound_path
		}
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
	$NotifyIcon.Dispose();
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
		[ String ] $sound_path,

		[ Parameter( Mandatory, Position = 2 ) ]
		[ String ] $tts_text,

		[ Parameter( Mandatory, Position = 3 ) ]
		[ string ] $notification_title,

		[ Parameter( Mandatory, Position = 4 ) ]
		[ ValidateNotNullOrEmpty() ]
		[ String ] $notification_text,

		[ Parameter( Position = 5 ) ]
		[ ValidateSet( "Error", "Info", "None", "Warning" ) ]
		[ String ] $notification_icon_type = 'Info',

		[ Parameter( Position = 6 ) ]
		[ Int ] $notification_timeout = 10000
	)

	$current_time = getCurrentTime
	$did_sleep = sleepUntil( $timestamp )

	if ( $did_sleep ) {
		if ( $display_windows_notifications ) {
			showNotifyIcon $notification_title $notification_text $notification_icon_type $notification_timeout
		}

		if ( $use_tts ) {
			playTTSSound $tts_text
		}
		else {
			playSound $sound_path
		}
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
initializeScript


# Script Start
sleepUntilAndThenTriggerAlert $script_start_time $script_start_sound_path $script_start_tts_text $script_start_notification_title $script_start_notification_text $script_start_notification_type


# C1
sleepUntilAndThenTriggerAlert $c1_sixty_seconds_prior_alert_time $c1_sixty_seconds_prior_alert_sound_path $c1_sixty_seconds_prior_alert_tts_text $c1_sixty_seconds_prior_alert_notification_title $c1_sixty_seconds_prior_alert_notification_text $c1_sixty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c1_thirty_seconds_prior_alert_time $c1_thirty_seconds_prior_alert_sound_path $c1_thirty_seconds_prior_alert_tts_text $c1_thirty_seconds_prior_alert_notification_title $c1_thirty_seconds_prior_alert_notification_text $c1_thirty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c1_twenty_seconds_prior_alert_time $c1_twenty_seconds_prior_alert_sound_path $c1_twenty_seconds_prior_alert_tts_text $c1_twenty_seconds_prior_alert_notification_title $c1_twenty_seconds_prior_alert_notification_text $c1_twenty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c1_ten_seconds_prior_alert_time $c1_ten_seconds_prior_alert_sound_path $c1_ten_seconds_prior_alert_tts_text $c1_ten_seconds_prior_alert_notification_title $c1_ten_seconds_prior_alert_notification_text $c1_ten_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c1_alert_time $c1_alert_sound_path $c1_alert_tts_text $c1_alert_notification_title $c1_alert_notification_text $c1_alert_notification_type


# C2
sleepUntilAndThenTriggerAlert $c2_telescope_refocus_alert_time $c2_telescope_refocus_alert_sound_path $c2_telescope_refocus_alert_tts_text $c2_telescope_refocus_alert_notification_title $c2_telescope_refocus_alert_notification_text $c2_telescope_refocus_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_venus_twenty_minutes_prior_alert_time $c2_venus_twenty_minutes_prior_alert_sound_path $c2_venus_twenty_minutes_prior_alert_tts_text $c2_venus_twenty_minutes_prior_alert_notification_title $c2_venus_twenty_minutes_prior_alert_notification_text $c2_venus_twenty_minutes_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_venus_ten_minutes_prior_alert_time $c2_venus_ten_minutes_prior_alert_sound_path $c2_venus_ten_minutes_prior_alert_tts_text $c2_venus_ten_minutes_prior_alert_notification_title $c2_venus_ten_minutes_prior_alert_notification_text $c2_venus_ten_minutes_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_venus_five_minutes_prior_alert_time $c2_venus_five_minutes_prior_alert_sound_path $c2_venus_five_minutes_prior_alert_tts_text $c2_venus_five_minutes_prior_alert_notification_title $c2_venus_five_minutes_prior_alert_notification_text $c2_venus_five_minutes_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_three_minutes_prior_alert_time $c2_three_minutes_prior_alert_sound_path $c2_three_minutes_prior_alert_tts_text $c2_three_minutes_prior_alert_notification_title $c2_three_minutes_prior_alert_notification_text $c2_three_minutes_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_two_minutes_prior_alert_time $c2_two_minutes_prior_alert_sound_path $c2_two_minutes_prior_alert_tts_text $c2_two_minutes_prior_alert_notification_title $c2_two_minutes_prior_alert_notification_text $c2_two_minutes_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_jupiter_ninety_seconds_prior_alert_time $c2_jupiter_ninety_seconds_prior_alert_sound_path $c2_jupiter_ninety_seconds_prior_alert_tts_text $c2_jupiter_ninety_seconds_prior_alert_notification_title $c2_jupiter_ninety_seconds_prior_alert_notification_text $c2_jupiter_ninety_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_sixty_seconds_prior_alert_time $c2_sixty_seconds_prior_alert_sound_path $c2_sixty_seconds_prior_alert_tts_text $c2_sixty_seconds_prior_alert_notification_title $c2_sixty_seconds_prior_alert_notification_text $c2_sixty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_remove_solar_filter_alert_time $c2_remove_solar_filter_alert_sound_path $c2_remove_solar_filter_alert_tts_text $c2_remove_solar_filter_alert_notification_title $c2_remove_solar_filter_alert_notification_text $c2_remove_solar_filter_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_thirty_seconds_prior_alert_time $c2_thirty_seconds_prior_alert_sound_path $c2_thirty_seconds_prior_alert_tts_text $c2_thirty_seconds_prior_alert_notification_title $c2_thirty_seconds_prior_alert_notification_text $c2_thirty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_twenty_seconds_prior_alert_time $c2_twenty_seconds_prior_alert_sound_path $c2_twenty_seconds_prior_alert_tts_text $c2_twenty_seconds_prior_alert_notification_title $c2_twenty_seconds_prior_alert_notification_text $c2_twenty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_ten_seconds_prior_alert_time $c2_ten_seconds_prior_alert_sound_path $c2_ten_seconds_prior_alert_tts_text $c2_ten_seconds_prior_alert_notification_title $c2_ten_seconds_prior_alert_notification_text $c2_ten_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_diamond_ring_alert_time $c2_diamond_ring_alert_sound_path $c2_diamond_ring_alert_tts_text $c2_diamond_ring_alert_notification_title $c2_diamond_ring_alert_notification_text $c2_diamond_ring_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_bailys_beads_alert_time $c2_bailys_beads_alert_sound_path $c2_bailys_beads_alert_tts_text $c2_bailys_beads_alert_notification_title $c2_bailys_beads_alert_notification_text $c2_bailys_beads_alert_notification_type
sleepUntilAndThenTriggerAlert $c2_alert_time $c2_alert_sound_path $c2_alert_tts_text $c2_alert_notification_title $c2_alert_notification_text $c2_alert_notification_type


# Totality
sleepUntilAndThenTriggerAlert $totality_start_alert_time $totality_start_alert_sound_path $totality_start_alert_tts_text $totality_start_alert_notification_title $totality_start_alert_notification_text $totality_start_alert_notification_type
sleepUntilAndThenTriggerAlert $totality_first_observe_horizon_alert_time $totality_first_observe_horizon_alert_sound_path $totality_first_observe_horizon_alert_tts_text $totality_first_observe_horizon_alert_notification_title $totality_first_observe_horizon_alert_notification_text $totality_first_observe_horizon_alert_notification_type
sleepUntilAndThenTriggerAlert $totality_pons_brooks_alert_time $totality_pons_brooks_alert_sound_path $totality_pons_brooks_alert_tts_text $totality_pons_brooks_alert_notification_title $totality_pons_brooks_alert_notification_text $totality_pons_brooks_alert_notification_type
sleepUntilAndThenTriggerAlert $totality_maximum_eclipse_alert_time $totality_maximum_eclipse_alert_sound_path $totality_maximum_eclipse_alert_tts_text $totality_maximum_eclipse_alert_notification_title $totality_maximum_eclipse_alert_notification_text $totality_maximum_eclipse_alert_notification_type
sleepUntilAndThenTriggerAlert $totality_second_observe_horizon_alert_time $totality_second_observe_horizon_alert_sound_path $totality_second_observe_horizon_alert_tts_text $totality_second_observe_horizon_alert_notification_title $totality_second_observe_horizon_alert_notification_text $totality_second_observe_horizon_alert_notification_type


# C3
sleepUntilAndThenTriggerAlert $c3_sixty_seconds_prior_alert_time $c3_sixty_seconds_prior_alert_sound_path $c3_sixty_seconds_prior_alert_tts_text $c3_sixty_seconds_prior_alert_notification_title $c3_sixty_seconds_prior_alert_notification_text $c3_sixty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_thirty_seconds_prior_alert_time $c3_thirty_seconds_prior_alert_sound_path $c3_thirty_seconds_prior_alert_tts_text $c3_thirty_seconds_prior_alert_notification_title $c3_thirty_seconds_prior_alert_notification_text $c3_thirty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_twenty_seconds_prior_alert_time $c3_twenty_seconds_prior_alert_sound_path $c3_twenty_seconds_prior_alert_tts_text $c3_twenty_seconds_prior_alert_notification_title $c3_twenty_seconds_prior_alert_notification_text $c3_twenty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_ten_seconds_prior_alert_time $c3_ten_seconds_prior_alert_sound_path $c3_ten_seconds_prior_alert_tts_text $c3_ten_seconds_prior_alert_notification_title $c3_ten_seconds_prior_alert_notification_text $c3_ten_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $totality_end_alert_time $totality_end_alert_sound_path $totality_end_alert_tts_text $totality_end_alert_notification_title $totality_end_alert_notification_text $totality_end_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_alert_time $c3_alert_sound_path $c3_alert_tts_text $c3_alert_notification_title $c3_alert_notification_text $c3_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_bailys_beads_alert_time $c3_bailys_beads_alert_sound_path $c3_bailys_beads_alert_tts_text $c3_bailys_beads_alert_notification_title $c3_bailys_beads_alert_notification_text $c3_bailys_beads_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_diamond_ring_alert_time $c3_diamond_ring_alert_sound_path $c3_diamond_ring_alert_tts_text $c3_diamond_ring_alert_notification_title $c3_diamond_ring_alert_notification_text $c3_diamond_ring_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_replace_solar_filter_alert_time $c3_replace_solar_filter_alert_sound_path $c3_replace_solar_filter_alert_tts_text $c3_replace_solar_filter_alert_notification_title $c3_replace_solar_filter_alert_notification_text $c3_replace_solar_filter_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_jupiter_sixty_seconds_after_alert_time $c3_jupiter_sixty_seconds_after_alert_sound_path $c3_jupiter_sixty_seconds_after_alert_tts_text $c3_jupiter_sixty_seconds_after_alert_notification_title $c3_jupiter_sixty_seconds_after_alert_notification_text $c3_jupiter_sixty_seconds_after_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_venus_five_minutes_after_alert_time $c3_venus_five_minutes_after_alert_sound_path $c3_venus_five_minutes_after_alert_tts_text $c3_venus_five_minutes_after_alert_notification_title $c3_venus_five_minutes_after_alert_notification_text $c3_venus_five_minutes_after_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_venus_ten_minutes_after_alert_time $c3_venus_ten_minutes_after_alert_sound_path $c3_venus_ten_minutes_after_alert_tts_text $c3_venus_ten_minutes_after_alert_notification_title $c3_venus_ten_minutes_after_alert_notification_text $c3_venus_ten_minutes_after_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_venus_twenty_minutes_after_alert_time $c3_venus_twenty_minutes_after_alert_sound_path $c3_venus_twenty_minutes_after_alert_tts_text $c3_venus_twenty_minutes_after_alert_notification_title $c3_venus_twenty_minutes_after_alert_notification_text $c3_venus_twenty_minutes_after_alert_notification_type
sleepUntilAndThenTriggerAlert $c3_telescope_refocus_alert_time $c3_telescope_refocus_alert_sound_path $c3_telescope_refocus_alert_tts_text $c3_telescope_refocus_alert_notification_title $c3_telescope_refocus_alert_notification_text $c3_telescope_refocus_alert_notification_type


# C4
sleepUntilAndThenTriggerAlert $c4_sixty_seconds_prior_alert_time $c4_sixty_seconds_prior_alert_sound_path $c4_sixty_seconds_prior_alert_tts_text $c4_sixty_seconds_prior_alert_notification_title $c4_sixty_seconds_prior_alert_notification_text $c4_sixty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c4_thirty_seconds_prior_alert_time $c4_thirty_seconds_prior_alert_sound_path $c4_thirty_seconds_prior_alert_tts_text $c4_thirty_seconds_prior_alert_notification_title $c4_thirty_seconds_prior_alert_notification_text $c4_thirty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c4_twenty_seconds_prior_alert_time $c4_twenty_seconds_prior_alert_sound_path $c4_twenty_seconds_prior_alert_tts_text $c4_twenty_seconds_prior_alert_notification_title $c4_twenty_seconds_prior_alert_notification_text $c4_twenty_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c4_ten_seconds_prior_alert_time $c4_ten_seconds_prior_alert_sound_path $c4_ten_seconds_prior_alert_tts_text $c4_ten_seconds_prior_alert_notification_title $c4_ten_seconds_prior_alert_notification_text $c4_ten_seconds_prior_alert_notification_type
sleepUntilAndThenTriggerAlert $c4_alert_time $c4_alert_sound_path $c4_alert_tts_text $c4_alert_notification_title $c4_alert_notification_text $c4_alert_notification_type


# Script End
sleepUntilAndThenTriggerAlert $script_end_time $script_end_sound_path $script_end_tts_text $script_end_notification_title $script_end_notification_text $script_end_notification_type


# Exit (5 seconds after the script end alert)
Write-Information "Exiting..." -InformationAction Continue
sleepUntil ( Get-Date $script_end_time ).AddSeconds(5).ToString('HH:mm:ss')