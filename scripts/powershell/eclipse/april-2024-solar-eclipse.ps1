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
# This function returns the Start-Sleep offset based on the timestamp.
#
# @param $timestamp string
#
# @returns double
#
function getStart-SleepOffset {

    param (
        $timestamp
    )

	$offset = ((Get-Date $timestamp) - (Get-Date)).TotalSeconds
	
	if ( $offset -lt 0 ) {
		$offset = 0
	}
	
	[Double]$offset
}

##
# This function sleeps until a specific time
#
# @param $timestamp string
#
# @returns void
#
function sleepUntil {

    param (
        $timestamp
    )

	$offset = getStart-SleepOffset( $timestamp )
	$current_time = (Get-Date).ToString('HH:mm:ss')

	Write-Output "$current_time`: Waiting until $timestamp ($offset seconds)"

	Start-Sleep -Seconds $offset
}

##
# This function plays a sound.
#
# Note: Calling this function consecutively will result in
# only the last sound playing through the speakers.
#
# @param $path string
#
# @returns void
#
function playSound {

    param (
        $path
    )

	$current_time = (Get-Date).ToString('HH:mm:ss')

	Write-Output "$current_time`: Playing sound ($path)"

	(New-Object Media.SoundPlayer $path).Play();
}

##
# This function sleeps until a specific time and plays a sound.
#
# @param $timestamp string
# @param $path string
#
# @returns void
#
function sleepUntilandPlaySound {

    param (
        $timestamp,
        $path
    )

	sleepUntil( $timestamp )
	playSound( $path )
}


##########
# Script #
##########

# Initialized
playSound( '.\scripts\eclipse\sounds\00-Initialized.wav' )


# Script Start
sleepUntilandPlaySound -timestamp $script_start_time -path '.\scripts\eclipse\sounds\01-Eclipse-Start.wav'


# C1
sleepUntilandPlaySound -timestamp $c1_sixty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\02-First-Contact-60-Seconds.wav'
sleepUntilandPlaySound -timestamp $c1_thirty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-30-Seconds.wav'
sleepUntilandPlaySound -timestamp $c1_twenty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-20-Seconds.wav'
sleepUntilandPlaySound -timestamp $c1_ten_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-10-Seconds.wav'
sleepUntilandPlaySound -timestamp $c1_alert_time -path '.\scripts\eclipse\sounds\03-First-Contact-Now.wav'


# C2
sleepUntilandPlaySound -timestamp $c2_telescope_refocus_alert_time -path '.\scripts\eclipse\sounds\00-Refocus-Telescope.wav'
sleepUntilandPlaySound -timestamp $c2_venus_twenty_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus.wav'
sleepUntilandPlaySound -timestamp $c2_venus_ten_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus.wav'
sleepUntilandPlaySound -timestamp $c2_venus_five_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus.wav'
sleepUntilandPlaySound -timestamp $c2_three_minutes_alert_time -path '.\scripts\eclipse\sounds\04-Second-Contact-3-Minutes.wav'
sleepUntilandPlaySound -timestamp $c2_two_minutes_alert_time -path '.\scripts\eclipse\sounds\05-Second-Contact-2-Minutes.wav'
sleepUntilandPlaySound -timestamp $c2_jupiter_ninty_seconds_alert_time -path '.\scripts\eclipse\sounds\00-Jupiter.wav'
sleepUntilandPlaySound -timestamp $c2_sixty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\06-Second-Contact-60-Seconds.wav'
sleepUntilandPlaySound -timestamp $c2_remove_solar_filter_alert_time -path '.\scripts\eclipse\sounds\07-Remove-Solar-Filter.wav'
sleepUntilandPlaySound -timestamp $c2_thirty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-30-Seconds.wav'
sleepUntilandPlaySound -timestamp $c2_twenty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-20-Seconds.wav'
sleepUntilandPlaySound -timestamp $c2_ten_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-10-Seconds.wav'
sleepUntilandPlaySound -timestamp $c2_diamond_ring_alert_time -path '.\scripts\eclipse\sounds\00-Diamond-Ring.wav'
sleepUntilandPlaySound -timestamp $c2_bailys_beads_alert_time -path '.\scripts\eclipse\sounds\00-Bailys-Beads.wav'
sleepUntilandPlaySound -timestamp $c2_alert_time -path '.\scripts\eclipse\sounds\08-Second-Contact-Now.wav'


# Totality
sleepUntilandPlaySound -timestamp $totality_start_alert_time -path '.\scripts\eclipse\sounds\09-Totality-Now.wav'
sleepUntilandPlaySound -timestamp $totality_first_observe_horizon_alert_time -path '.\scripts\eclipse\sounds\00-Observe-Horizon.wav'
sleepUntilandPlaySound -timestamp $totality_pons_brooks_alert_time -path '.\scripts\eclipse\sounds\10-Pons-Brooks.wav'
sleepUntilandPlaySound -timestamp $totality_maximum_eclipse_alert_time -path '.\scripts\eclipse\sounds\11-Maximum-Eclipse-Now.wav'
sleepUntilandPlaySound -timestamp $totality_second_observe_horizon_alert_time -path '.\scripts\eclipse\sounds\00-Observe-Horizon.wav'
sleepUntilandPlaySound -timestamp $totality_end_alert_time -path '.\scripts\eclipse\sounds\13-Totality-Ending-Now.wav'


# C3
sleepUntilandPlaySound -timestamp $c3_sixty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\12-Third-Contact-60-Seconds.wav'
sleepUntilandPlaySound -timestamp $c3_thirty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-30-Seconds.wav'
sleepUntilandPlaySound -timestamp $c3_twenty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-20-Seconds.wav'
sleepUntilandPlaySound -timestamp $c3_ten_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-10-Seconds.wav'
sleepUntilandPlaySound -timestamp $c3_alert_time -path '.\scripts\eclipse\sounds\14-Third-Contact-Now.wav'
sleepUntilandPlaySound -timestamp $c3_bailys_beads_alert_time -path '.\scripts\eclipse\sounds\00-Bailys-Beads.wav'
sleepUntilandPlaySound -timestamp $c3_diamond_ring_alert_time -path '.\scripts\eclipse\sounds\00-Diamond-Ring.wav'
sleepUntilandPlaySound -timestamp $c3_replace_solar_filter_alert_time -path '.\scripts\eclipse\sounds\15-Replace-Solar-Filter.wav'
sleepUntilandPlaySound -timestamp $c3_jupiter_sixty_seconds_alert_time -path '.\scripts\eclipse\sounds\00-Jupiter-Disappear.wav'
sleepUntilandPlaySound -timestamp $c3_venus_five_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
sleepUntilandPlaySound -timestamp $c3_venus_ten_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
sleepUntilandPlaySound -timestamp $c3_venus_twenty_minutes_alert_time -path '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
sleepUntilandPlaySound -timestamp $c3_telescope_refocus_alert_time -path '.\scripts\eclipse\sounds\00-Refocus-Telescope.wav'


# C4
sleepUntilandPlaySound -timestamp $c4_sixty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\16-Fourth-Contact-60-Seconds.wav'
sleepUntilandPlaySound -timestamp $c4_thirty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-30-Seconds.wav'
sleepUntilandPlaySound -timestamp $c4_twenty_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-20-Seconds.wav'
sleepUntilandPlaySound -timestamp $c4_ten_seconds_prior_alert_time -path '.\scripts\eclipse\sounds\00-10-Seconds.wav'
sleepUntilandPlaySound -timestamp $c4_alert_time -path '.\scripts\eclipse\sounds\17-Fourth-Contact-Now.wav'


# Script End
sleepUntilandPlaySound -timestamp $script_end_time -path '.\scripts\eclipse\sounds\18-Eclipse-End.wav'


# Exit (5 seconds after the script end sound)
sleepUntil -timestamp (Get-Date $script_end_time).AddSeconds(5).ToString('HH:mm:ss')