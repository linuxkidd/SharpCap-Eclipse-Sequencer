#################
# Configuration #
#################

##
# Global
#

# Windows Notifications
$display_windows_notifications = $true

# TTS
$use_tts = $true


##
# Sounds, Text-to-Speech (TTS), and Notifications
#

# Initialize
$initialize_sound_path = '.\scripts\eclipse\sounds\00-Initialized.wav'
$initialize_tts_text = 'The SharpCap eclipse script has been initialized and is waiting to start'
$initialize_notification_title = 'SharpCap Script - Initialized'
$initialize_notification_text = 'The SharpCap eclipse script is waiting to start'
$initialize_notification_type = 'Info'

# Script Start
$script_start_sound_path = '.\scripts\eclipse\sounds\01-Eclipse-Start.wav'
$script_start_tts_text = 'The SharpCap eclipse script has started'
$script_start_notification_title = 'SharpCap Script - Started'
$script_start_notification_text = 'The SharpCap eclipse script has started'
$script_start_notification_type = 'Info'

# C1 - 60 Seconds Prior
$c1_sixty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\02-First-Contact-60-Seconds.wav'
$c1_sixty_seconds_prior_alert_tts_text = 'First contact is in 60 seconds'
$c1_sixty_seconds_prior_alert_notification_title = 'First Contact In 60 Seconds'
$c1_sixty_seconds_prior_alert_notification_text = 'First contact is in 60 seconds'
$c1_sixty_seconds_prior_alert_notification_type = 'Info'

# C1 - 30 Seconds Prior
$c1_thirty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-30-Seconds.wav'
$c1_thirty_seconds_prior_alert_tts_text = '30 seconds'
$c1_thirty_seconds_prior_alert_notification_title = 'First Contact In 30 Seconds'
$c1_thirty_seconds_prior_alert_notification_text = 'First contact is in 30 seconds'
$c1_thirty_seconds_prior_alert_notification_type = 'Info'

# C1 - 20 Seconds Prior
$c1_twenty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-20-Seconds.wav'
$c1_twenty_seconds_prior_alert_tts_text = '20 seconds'
$c1_twenty_seconds_prior_alert_notification_title = 'First Contact In 20 Seconds'
$c1_twenty_seconds_prior_alert_notification_text = 'First contact is in 20 seconds'
$c1_twenty_seconds_prior_alert_notification_type = 'Info'

# C1 - 10 Seconds Prior
$c1_ten_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-10-Seconds.wav'
$c1_ten_seconds_prior_alert_tts_text = '10 seconds'
$c1_ten_seconds_prior_alert_notification_title = 'First Contact In 10 Seconds'
$c1_ten_seconds_prior_alert_notification_text = 'First contact is in 10 seconds'
$c1_ten_seconds_prior_alert_notification_type = 'Info'

# C1
$c1_alert_sound_path = '.\scripts\eclipse\sounds\03-First-Contact-Now.wav'
$c1_alert_tts_text = 'First contact is happening now'
$c1_alert_notification_title = 'First Contact Now'
$c1_alert_notification_text = 'First contact is happening now'
$c1_alert_notification_type = 'Warning'

# C2 - Telescope Refocus
$c2_telescope_refocus_alert_sound_path = '.\scripts\eclipse\sounds\00-Refocus-Telescope.wav'
$c2_telescope_refocus_alert_tts_text = 'Refocus telescope if necessary'
$c2_telescope_refocus_alert_notification_title = 'Refocus Telescope'
$c2_telescope_refocus_alert_notification_text = 'Refocus telescope if necessary'
$c2_telescope_refocus_alert_notification_type = 'Warning'

# C2 - Venus 20 Minutes Prior
$c2_venus_twenty_minutes_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus.wav'
$c2_venus_twenty_minutes_prior_alert_tts_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_twenty_minutes_prior_alert_notification_title = 'Look for Venus'
$c2_venus_twenty_minutes_prior_alert_notification_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_twenty_minutes_prior_alert_notification_type = 'Info'

# C2 - Venus 10 Minutes Prior
$c2_venus_ten_minutes_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus.wav'
$c2_venus_ten_minutes_prior_alert_tts_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_ten_minutes_prior_alert_notification_title = 'Look for Venus'
$c2_venus_ten_minutes_prior_alert_notification_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_ten_minutes_prior_alert_notification_type = 'Info'

# C2 - Venus 5 Minutes Prior
$c2_venus_five_minutes_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus.wav'
$c2_venus_five_minutes_prior_alert_tts_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_five_minutes_prior_alert_notification_title = 'Look for Venus'
$c2_venus_five_minutes_prior_alert_notification_text = 'Look for Venus at about 5 o''clock in relation to the sun'
$c2_venus_five_minutes_prior_alert_notification_type = 'Info'

# C2 - 3 Minutes Prior
$c2_three_minutes_prior_alert_sound_path = '.\scripts\eclipse\sounds\04-Second-Contact-3-Minutes.wav'
$c2_three_minutes_prior_alert_tts_text = 'Second contact is in 3 minutes'
$c2_three_minutes_prior_alert_notification_title = 'Second Contact In 3 Minutes'
$c2_three_minutes_prior_alert_notification_text = 'Second contact is in 3 minutes'
$c2_three_minutes_prior_alert_notification_type = 'Info'

# C2 - 2 Minutes Prior
$c2_two_minutes_prior_alert_sound_path = '.\scripts\eclipse\sounds\05-Second-Contact-2-Minutes.wav'
$c2_two_minutes_prior_alert_tts_text = 'Second contact is in 2 minutes'
$c2_two_minutes_prior_alert_notification_title = 'Second Contact In 2 Minutes'
$c2_two_minutes_prior_alert_notification_text = 'Second contact is in 2 minutes'
$c2_two_minutes_prior_alert_notification_type = 'Info'

# C2 - Jupiter 90 Seconds Prior
$c2_jupiter_ninety_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-Jupiter.wav'
$c2_jupiter_ninety_seconds_prior_alert_tts_text = 'Look for Jupiter at about 11 o''clock in relation to the sun'
$c2_jupiter_ninety_seconds_prior_alert_notification_title = 'Look for Jupiter'
$c2_jupiter_ninety_seconds_prior_alert_notification_text = 'Look for Jupiter at about 11 o''clock in relation to the sun'
$c2_jupiter_ninety_seconds_prior_alert_notification_type = 'Info'

# C2 - 60 Seconds Prior
$c2_sixty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\06-Second-Contact-60-Seconds.wav'
$c2_sixty_seconds_prior_alert_tts_text = 'Second contact is in 60 seconds'
$c2_sixty_seconds_prior_alert_notification_title = 'Second Contact In 60 Seconds'
$c2_sixty_seconds_prior_alert_notification_text = 'Second contact is in 60 seconds'
$c2_sixty_seconds_prior_alert_notification_type = 'Info'

# C2 - Remove Solar Filter
$c2_remove_solar_filter_alert_sound_path = '.\scripts\eclipse\sounds\07-Remove-Solar-Filter.wav'
$c2_remove_solar_filter_alert_tts_text = 'Remove solar filter'
$c2_remove_solar_filter_alert_notification_title = 'Remove Solar Filter'
$c2_remove_solar_filter_alert_notification_text = 'Remove solar filter'
$c2_remove_solar_filter_alert_notification_type = 'Warning'

# C2 - 30 Seconds Prior
$c2_thirty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-30-Seconds.wav'
$c2_thirty_seconds_prior_alert_tts_text = '30 seconds'
$c2_thirty_seconds_prior_alert_notification_title = 'Second Contact In 30 Seconds'
$c2_thirty_seconds_prior_alert_notification_text = 'Second contact is in 30 seconds'
$c2_thirty_seconds_prior_alert_notification_type = 'Info'

# C2 - 20 Seconds Prior
$c2_twenty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-20-Seconds.wav'
$c2_twenty_seconds_prior_alert_tts_text = '20 seconds'
$c2_twenty_seconds_prior_alert_notification_title = 'Second Contact In 20 Seconds'
$c2_twenty_seconds_prior_alert_notification_text = 'Second contact is in 20 seconds'
$c2_twenty_seconds_prior_alert_notification_type = 'Info'

# C2 - 10 Seconds Prior
$c2_ten_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-10-Seconds.wav'
$c2_ten_seconds_prior_alert_tts_text = '10 seconds'
$c2_ten_seconds_prior_alert_notification_title = 'Second Contact In 10 Seconds'
$c2_ten_seconds_prior_alert_notification_text = 'Second contact is in 10 seconds'
$c2_ten_seconds_prior_alert_notification_type = 'Info'

# C2 - Diamond Ring
$c2_diamond_ring_alert_sound_path = '.\scripts\eclipse\sounds\00-Diamond-Ring.wav'
$c2_diamond_ring_alert_tts_text = 'Look for diamond ring'
$c2_diamond_ring_alert_notification_title = 'Look For Diamond Ring'
$c2_diamond_ring_alert_notification_text = 'Look for Diamond Ring'
$c2_diamond_ring_alert_notification_type = 'Warning'

# C2 - Baily's Beads
$c2_bailys_beads_alert_sound_path = '.\scripts\eclipse\sounds\00-Bailys-Beads.wav'
$c2_bailys_beads_alert_tts_text = 'Look for Baily''s Beads'
$c2_bailys_beads_alert_notification_title = 'Look For Baily''s Beads'
$c2_bailys_beads_alert_notification_text = 'Look for Baily''s Beads'
$c2_bailys_beads_alert_notification_type = 'Warning'

# C2
$c2_alert_sound_path = '.\scripts\eclipse\sounds\08-Second-Contact-Now.wav'
$c2_alert_tts_text = 'Second contact is happening now'
$c2_alert_notification_title = 'Second Contact Now'
$c2_alert_notification_text = 'Second contact is happening now'
$c2_alert_notification_type = 'Warning'

# Totality Start
$totality_start_alert_sound_path = '.\scripts\eclipse\sounds\09-Totality-Now.wav'
$totality_start_alert_tts_text = 'Totality is happening now'
$totality_start_alert_notification_title = 'Totality Now'
$totality_start_alert_notification_text = 'Totality is happening now'
$totality_start_alert_notification_type = 'Warning'

# Totality - First Observe Horizon
$totality_first_observe_horizon_alert_sound_path = '.\scripts\eclipse\sounds\00-Observe-Horizon.wav'
$totality_first_observe_horizon_alert_tts_text = 'Observe the horizon'
$totality_first_observe_horizon_alert_notification_title = 'Observe The Horizon'
$totality_first_observe_horizon_alert_notification_text = 'Observe the horizon'
$totality_first_observe_horizon_alert_notification_type = 'Info'

# Totality - Pons Brooks
$totality_pons_brooks_alert_sound_path = '.\scripts\eclipse\sounds\10-Pons-Brooks.wav'
$totality_pons_brooks_alert_tts_text = 'Look for comet 12P (Pons-Brooks) near Jupiter at about 4 o''clock in relation to Jupiter. This comet will appear between Jupiter and the Sun if visible.'
$totality_pons_brooks_alert_notification_title = 'Comet 12P (Pons-Brooks)'
$totality_pons_brooks_alert_notification_text = 'Look for Comet 12P (Pons-Brooks) near Jupiter at about 4 o''clock in relation to Jupiter. This comet will appear between Jupiter and the Sun if visible.'
$totality_pons_brooks_alert_notification_type = 'Info'

# Totality - Maximum Eclipse
$totality_maximum_eclipse_alert_sound_path = '.\scripts\eclipse\sounds\11-Maximum-Eclipse-Now.wav'
$totality_maximum_eclipse_alert_tts_text = 'Maximum eclipse is happening now'
$totality_maximum_eclipse_alert_notification_title = 'Maximum Eclipse Now'
$totality_maximum_eclipse_alert_notification_text = 'Maximum eclipse is happening now'
$totality_maximum_eclipse_alert_notification_type = 'Warning'

# Totality - Second Observe Horizon
$totality_second_observe_horizon_alert_sound_path = '.\scripts\eclipse\sounds\00-Observe-Horizon.wav'
$totality_second_observe_horizon_alert_tts_text = 'Observe the horizon'
$totality_second_observe_horizon_alert_notification_title = 'Observe The Horizon'
$totality_second_observe_horizon_alert_notification_text = 'Observe the horizon'
$totality_second_observe_horizon_alert_notification_type = 'Info'

# C3 - 60 Seconds Prior
$c3_sixty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\12-Third-Contact-60-Seconds.wav'
$c3_sixty_seconds_prior_alert_tts_text = 'Third contact is in 60 seconds'
$c3_sixty_seconds_prior_alert_notification_title = 'Third Contact In 60 Seconds'
$c3_sixty_seconds_prior_alert_notification_text = 'Third contact is in 60 seconds'
$c3_sixty_seconds_prior_alert_notification_type = 'Info'

# C3 - 30 Seconds Prior
$c3_thirty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-30-Seconds.wav'
$c3_thirty_seconds_prior_alert_tts_text = '30 seconds'
$c3_thirty_seconds_prior_alert_notification_title = 'Third Contact In 30 Seconds'
$c3_thirty_seconds_prior_alert_notification_text = 'Third contact is in 30 seconds'
$c3_thirty_seconds_prior_alert_notification_type = 'Info'

# C3 - 20 Seconds Prior
$c3_twenty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-20-Seconds.wav'
$c3_twenty_seconds_prior_alert_tts_text = '20 seconds'
$c3_twenty_seconds_prior_alert_notification_title = 'Third Contact In 20 Seconds'
$c3_twenty_seconds_prior_alert_notification_text = 'Third contact is in 20 seconds'
$c3_twenty_seconds_prior_alert_notification_type = 'Info'

# C3 - 10 Seconds Prior
$c3_ten_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-10-Seconds.wav'
$c3_ten_seconds_prior_alert_tts_text = '10 seconds'
$c3_ten_seconds_prior_alert_notification_title = 'Third Contact In 10 Seconds'
$c3_ten_seconds_prior_alert_notification_text = 'Third contact is in 10 seconds'
$c3_ten_seconds_prior_alert_notification_type = 'Info'

# Totality End
$totality_end_alert_sound_path = '.\scripts\eclipse\sounds\13-Totality-Ending-Now.wav'
$totality_end_alert_tts_text = 'Totality is ending now'
$totality_end_alert_notification_title = 'Totality Ending'
$totality_end_alert_notification_text = 'Totality is ending now'
$totality_end_alert_notification_type = 'Warning'

# C3
$c3_alert_sound_path = '.\scripts\eclipse\sounds\14-Third-Contact-Now.wav'
$c3_alert_tts_text = 'Third contact is happening now'
$c3_alert_notification_title = 'Third Contact Now'
$c3_alert_notification_text = 'Third contact is happening now'
$c3_alert_notification_type = 'Warning'

# C3 - Baily's Beads
$c3_bailys_beads_alert_sound_path = '.\scripts\eclipse\sounds\00-Bailys-Beads.wav'
$c3_bailys_beads_alert_tts_text = 'Look for Baily''s Beads'
$c3_bailys_beads_alert_notification_title = 'Look For Baily''s Beads'
$c3_bailys_beads_alert_notification_text = 'Look for Baily''s Beads'
$c3_bailys_beads_alert_notification_type = 'Warning'

# C3 - Diamond Ring
$c3_diamond_ring_alert_sound_path = '.\scripts\eclipse\sounds\00-Diamond-Ring.wav'
$c3_diamond_ring_alert_tts_text = 'Look for diamond ring'
$c3_diamond_ring_alert_notification_title = 'Look For Diamond Ring'
$c3_diamond_ring_alert_notification_text = 'Look for Diamond Ring'
$c3_diamond_ring_alert_notification_type = 'Warning'

# C3 - Replace Solar Filter
$c3_replace_solar_filter_alert_sound_path = '.\scripts\eclipse\sounds\15-Replace-Solar-Filter.wav'
$c3_replace_solar_filter_alert_tts_text = 'Replace solar filter'
$c3_replace_solar_filter_alert_notification_title = 'Replace Solar Filter'
$c3_replace_solar_filter_alert_notification_text = 'Replace solar filter'
$c3_replace_solar_filter_alert_notification_type = 'Warning'

# C3 - Jupiter 60 Seconds After
$c3_jupiter_sixty_seconds_after_alert_sound_path = '.\scripts\eclipse\sounds\00-Jupiter-Disappear.wav'
$c3_jupiter_sixty_seconds_after_alert_tts_text = 'Jupiter should disappear shortly'
$c3_jupiter_sixty_seconds_after_alert_notification_title = 'Jupiter Disappearing'
$c3_jupiter_sixty_seconds_after_alert_notification_text = 'Jupiter should disappear shortly'
$c3_jupiter_sixty_seconds_after_alert_notification_type = 'Info'

# C3 - Venus 5 Minutes After
$c3_venus_five_minutes_after_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
$c3_venus_five_minutes_after_alert_tts_text = 'Venus should disappear shortly'
$c3_venus_five_minutes_after_alert_notification_title = 'Venus Disappearing'
$c3_venus_five_minutes_after_alert_notification_text = 'Venus should disappear shortly'
$c3_venus_five_minutes_after_alert_notification_type = 'Info'

# C3 - Venus 10 Minutes After
$c3_venus_ten_minutes_after_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
$c3_venus_ten_minutes_after_alert_tts_text = 'Venus should disappear shortly'
$c3_venus_ten_minutes_after_alert_notification_title = 'Venus Disappearing'
$c3_venus_ten_minutes_after_alert_notification_text = 'Venus should disappear shortly'
$c3_venus_ten_minutes_after_alert_notification_type = 'Info'

# C3 - Venus 20 Minutes After
$c3_venus_twenty_minutes_after_alert_sound_path = '.\scripts\eclipse\sounds\00-Venus-Disappear.wav'
$c3_venus_twenty_minutes_after_alert_tts_text = 'Venus should disappear shortly'
$c3_venus_twenty_minutes_after_alert_notification_title = 'Venus Disappearing'
$c3_venus_twenty_minutes_after_alert_notification_text = 'Venus should disappear shortly'
$c3_venus_twenty_minutes_after_alert_notification_type = 'Info'

# C3 - Telescope Refocus
$c3_telescope_refocus_alert_sound_path = '.\scripts\eclipse\sounds\00-Refocus-Telescope.wav'
$c3_telescope_refocus_alert_tts_text = 'Refocus telescope if necessary'
$c3_telescope_refocus_alert_notification_title = 'Refocus Telescope'
$c3_telescope_refocus_alert_notification_text = 'Refocus telescope if necessary'
$c3_telescope_refocus_alert_notification_type = 'Warning'

# C4 - 60 Seconds Prior
$c4_sixty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\16-Fourth-Contact-60-Seconds.wav'
$c4_sixty_seconds_prior_alert_tts_text = 'Fourth contact is in 60 seconds'
$c4_sixty_seconds_prior_alert_notification_title = 'Fourth Contact In 60 Seconds'
$c4_sixty_seconds_prior_alert_notification_text = 'Fourth contact is in 60 seconds'
$c4_sixty_seconds_prior_alert_notification_type = 'Info'

# C4 - 30 Seconds Prior
$c4_thirty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-30-Seconds.wav'
$c4_thirty_seconds_prior_alert_tts_text = '30 seconds'
$c4_thirty_seconds_prior_alert_notification_title = 'Fourth Contact In 30 Seconds'
$c4_thirty_seconds_prior_alert_notification_text = 'Fourth contact is in 30 seconds'
$c4_thirty_seconds_prior_alert_notification_type = 'Info'

# C4 - 20 Seconds Prior
$c4_twenty_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-20-Seconds.wav'
$c4_twenty_seconds_prior_alert_tts_text = '20 seconds'
$c4_twenty_seconds_prior_alert_notification_title = 'Fourth Contact In 20 Seconds'
$c4_twenty_seconds_prior_alert_notification_text = 'Fourth contact is in 20 seconds'
$c4_twenty_seconds_prior_alert_notification_type = 'Info'

# C4 - 10 Seconds Prior
$c4_ten_seconds_prior_alert_sound_path = '.\scripts\eclipse\sounds\00-10-Seconds.wav'
$c4_ten_seconds_prior_alert_tts_text = '10 seconds'
$c4_ten_seconds_prior_alert_notification_title = 'Fourth Contact In 10 Seconds'
$c4_ten_seconds_prior_alert_notification_text = 'Fourth contact is in 10 seconds'
$c4_ten_seconds_prior_alert_notification_type = 'Info'

# C4
$c4_alert_sound_path = '.\scripts\eclipse\sounds\17-Fourth-Contact-Now.wav'
$c4_alert_tts_text = 'Fourth contact is happening now'
$c4_alert_notification_title = 'Fourth Contact Now'
$c4_alert_notification_text = 'Fourth contact is happening now'
$c4_alert_notification_type = 'Warning'


# Script End
$script_end_sound_path = '.\scripts\eclipse\sounds\18-Eclipse-End.wav'
$script_end_tts_text = 'The SharpCap eclipse script has ended'
$script_end_notification_title = 'SharpCap Script - Ended'
$script_end_notification_text = 'The SharpCap eclipse script has ended'
$script_end_notification_type = 'Info'


##
# Timestamps
#
# Note: Local device times
#

# Script Start
$script_start_time = '13:05:08'


# C1 - 13:06:13
$c1_alert_time = '13:06:13'
$c1_sixty_seconds_prior_alert_time = ( Get-Date $c1_alert_time ).AddSeconds( -60 ).ToString( 'HH:mm:ss' ) # 13:05:13
$c1_thirty_seconds_prior_alert_time = ( Get-Date $c1_alert_time ).AddSeconds( -30 ).ToString( 'HH:mm:ss' ) # 13:05:43
$c1_twenty_seconds_prior_alert_time = ( Get-Date $c1_alert_time ).AddSeconds( -20 ).ToString( 'HH:mm:ss' ) # 13:05:53
$c1_ten_seconds_prior_alert_time = ( Get-Date $c1_alert_time ).AddSeconds( -10 ).ToString( 'HH:mm:ss' ) # 13:06:03


# C2 - 14:20:32
$c2_alert_time = '14:20:32'
$c2_telescope_refocus_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -1500 ).ToString( 'HH:mm:ss' ) # 13:55:32
$c2_venus_twenty_minutes_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -1200 ).ToString( 'HH:mm:ss' ) # 14:00:32
$c2_venus_ten_minutes_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -600 ).ToString( 'HH:mm:ss' ) # 14:10:32
$c2_venus_five_minutes_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -300 ).ToString( 'HH:mm:ss' ) # 14:15:32
$c2_three_minutes_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -180 ).ToString( 'HH:mm:ss' ) # 14:17:32
$c2_two_minutes_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -120 ).ToString( 'HH:mm:ss' ) # 14:18:32
$c2_jupiter_ninety_seconds_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -90 ).ToString( 'HH:mm:ss' ) # 14:19:02
$c2_sixty_seconds_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -60 ).ToString( 'HH:mm:ss' ) # 14:19:32
$c2_remove_solar_filter_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -33 ).ToString( 'HH:mm:ss' ) # 14:20:00
$c2_thirty_seconds_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -30 ).ToString( 'HH:mm:ss' ) # 14:20:02
$c2_twenty_seconds_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -20 ).ToString( 'HH:mm:ss' ) # 14:20:12
$c2_ten_seconds_prior_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -10 ).ToString( 'HH:mm:ss' ) # 14:20:22
$c2_diamond_ring_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -8 ).ToString( 'HH:mm:ss' ) # 14:20:24
$c2_bailys_beads_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( -5 ).ToString( 'HH:mm:ss' ) # 14:20:27


# Totality - 14:20:32 - 14:23:05
$totality_start_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 4 ).ToString( 'HH:mm:ss' ) # 14:20:36
$totality_first_observe_horizon_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 20 ).ToString( 'HH:mm:ss' ) # 14:20:52
$totality_pons_brooks_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 50 ).ToString( 'HH:mm:ss' ) # 14:21:22
$totality_maximum_eclipse_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 76 ).ToString( 'HH:mm:ss' ) # 14:21:48
$totality_second_observe_horizon_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 80 ).ToString( 'HH:mm:ss' ) # 14:21:52


# C3 - 14:23:05
$c3_alert_time = '14:23:05'
$c3_sixty_seconds_prior_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( -60 ).ToString( 'HH:mm:ss' ) # 14:22:05
$c3_thirty_seconds_prior_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( -30 ).ToString( 'HH:mm:ss' ) # 14:22:35
$c3_twenty_seconds_prior_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( -20 ).ToString( 'HH:mm:ss' ) # 14:22:45
$c3_ten_seconds_prior_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( -10 ).ToString( 'HH:mm:ss' ) # 14:22:55
$totality_end_alert_time = ( Get-Date $c2_alert_time ).AddSeconds( 149 ).ToString( 'HH:mm:ss' ) # 14:23:01
$c3_bailys_beads_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 3 ).ToString( 'HH:mm:ss' ) # 14:23:08
$c3_diamond_ring_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 6 ).ToString( 'HH:mm:ss' ) # 14:23:11
$c3_replace_solar_filter_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 32 ).ToString( 'HH:mm:ss' ) # 14:23:37
$c3_jupiter_sixty_seconds_after_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 60 ).ToString( 'HH:mm:ss' ) # 14:24:05
$c3_venus_five_minutes_after_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 300 ).ToString( 'HH:mm:ss' ) # 14:28:05
$c3_venus_ten_minutes_after_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 600 ).ToString( 'HH:mm:ss' ) # 14:33:05
$c3_venus_twenty_minutes_after_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 1200 ).ToString( 'HH:mm:ss' ) # 14:43:05
$c3_telescope_refocus_alert_time = ( Get-Date $c3_alert_time ).AddSeconds( 1500 ).ToString( 'HH:mm:ss' ) # 14:48:05


# C4 - 15:09:26
$c4_alert_time = '15:09:26'
$c4_sixty_seconds_prior_alert_time = ( Get-Date $c4_alert_time ).AddSeconds( -60 ).ToString( 'HH:mm:ss' ) # 15:08:26
$c4_thirty_seconds_prior_alert_time = ( Get-Date $c4_alert_time ).AddSeconds( -30 ).ToString( 'HH:mm:ss' ) # 15:08:56
$c4_twenty_seconds_prior_alert_time = ( Get-Date $c4_alert_time ).AddSeconds( -20 ).ToString( 'HH:mm:ss' ) # 15:09:06
$c4_ten_seconds_prior_alert_time = ( Get-Date $c4_alert_time ).AddSeconds( -10 ).ToString( 'HH:mm:ss' ) # 15:09:16


# Script End
$script_end_time = '15:09:41'