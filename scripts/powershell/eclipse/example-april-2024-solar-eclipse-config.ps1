############################
# Configuration            #
#                          #
# Note: Local device times #
############################

# Script Start
$script_start_time = '13:03:08'


# C1 - 13:04:13
$c1_alert_time = '13:04:13'
$c1_sixty_seconds_prior_alert_time = (Get-Date $c1_alert_time).AddSeconds(-60).ToString('HH:mm:ss') # 13:03:13
$c1_thirty_seconds_prior_alert_time = (Get-Date $c1_alert_time).AddSeconds(-30).ToString('HH:mm:ss') # 13:03:43
$c1_twenty_seconds_prior_alert_time = (Get-Date $c1_alert_time).AddSeconds(-20).ToString('HH:mm:ss') # 13:03:53
$c1_ten_seconds_prior_alert_time = (Get-Date $c1_alert_time).AddSeconds(-10).ToString('HH:mm:ss') # 13:04:03


# C2 - 14:29:32
$c2_alert_time = '14:29:32'
$c2_telescope_refocus_alert_time = (Get-Date $c2_alert_time).AddSeconds(-1500).ToString('HH:mm:ss') # 14:04:32
$c2_venus_twenty_minutes_alert_time = (Get-Date $c2_alert_time).AddSeconds(-1200).ToString('HH:mm:ss') # 14:09:32
$c2_venus_ten_minutes_alert_time = (Get-Date $c2_alert_time).AddSeconds(-600).ToString('HH:mm:ss') # 14:19:32
$c2_venus_five_minutes_alert_time = (Get-Date $c2_alert_time).AddSeconds(-300).ToString('HH:mm:ss') # 14:24:32
$c2_three_minutes_alert_time = (Get-Date $c2_alert_time).AddSeconds(-180).ToString('HH:mm:ss') # 14:26:32
$c2_two_minutes_alert_time = (Get-Date $c2_alert_time).AddSeconds(-120).ToString('HH:mm:ss') # 14:27:32
$c2_jupiter_ninty_seconds_alert_time = (Get-Date $c2_alert_time).AddSeconds(-90).ToString('HH:mm:ss') # 14:28:02
$c2_sixty_seconds_prior_alert_time = (Get-Date $c2_alert_time).AddSeconds(-60).ToString('HH:mm:ss') # 14:28:32
$c2_remove_solar_filter_alert_time = (Get-Date $c2_alert_time).AddSeconds(-33).ToString('HH:mm:ss') # 14:28:59
$c2_thirty_seconds_prior_alert_time = (Get-Date $c2_alert_time).AddSeconds(-30).ToString('HH:mm:ss') # 14:29:02
$c2_twenty_seconds_prior_alert_time = (Get-Date $c2_alert_time).AddSeconds(-20).ToString('HH:mm:ss') # 14:29:12
$c2_ten_seconds_prior_alert_time = (Get-Date $c2_alert_time).AddSeconds(-10).ToString('HH:mm:ss') # 14:29:22
$c2_diamond_ring_alert_time = (Get-Date $c2_alert_time).AddSeconds(-8).ToString('HH:mm:ss') # 14:29:24
$c2_bailys_beads_alert_time = (Get-Date $c2_alert_time).AddSeconds(-5).ToString('HH:mm:ss') # 14:29:27


# Totality - 14:29:32 - 14:32:05
$totality_start_alert_time = (Get-Date $c2_alert_time).AddSeconds(4).ToString('HH:mm:ss') # 14:29:36
$totality_first_observe_horizon_alert_time = (Get-Date $c2_alert_time).AddSeconds(20).ToString('HH:mm:ss') # 14:29:52
$totality_pons_brooks_alert_time = (Get-Date $c2_alert_time).AddSeconds(50).ToString('HH:mm:ss') # 14:30:22
$totality_maximum_eclipse_alert_time = (Get-Date $c2_alert_time).AddSeconds(76).ToString('HH:mm:ss') # 14:30:48
$totality_second_observe_horizon_alert_time = (Get-Date $c2_alert_time).AddSeconds(80).ToString('HH:mm:ss') # 14:30:52


# C3 - 14:32:05
$c3_alert_time = '14:32:05'
$c3_sixty_seconds_prior_alert_time = (Get-Date $c3_alert_time).AddSeconds(-60).ToString('HH:mm:ss') # 14:31:05
$c3_thirty_seconds_prior_alert_time = (Get-Date $c3_alert_time).AddSeconds(-30).ToString('HH:mm:ss') # 14:31:35
$c3_twenty_seconds_prior_alert_time = (Get-Date $c3_alert_time).AddSeconds(-20).ToString('HH:mm:ss') # 14:31:45
$c3_ten_seconds_prior_alert_time = (Get-Date $c3_alert_time).AddSeconds(-10).ToString('HH:mm:ss') # 14:31:55
$totality_end_alert_time = (Get-Date $c2_alert_time).AddSeconds(149).ToString('HH:mm:ss') # 14:32:01
$c3_bailys_beads_alert_time = (Get-Date $c3_alert_time).AddSeconds(3).ToString('HH:mm:ss') # 14:32:08
$c3_diamond_ring_alert_time = (Get-Date $c3_alert_time).AddSeconds(6).ToString('HH:mm:ss') # 14:32:11
$c3_replace_solar_filter_alert_time = (Get-Date $c3_alert_time).AddSeconds(32).ToString('HH:mm:ss') # 14:32:37
$c3_jupiter_sixty_seconds_alert_time = (Get-Date $c3_alert_time).AddSeconds(60).ToString('HH:mm:ss') # 14:33:05
$c3_venus_five_minutes_alert_time = (Get-Date $c3_alert_time).AddSeconds(300).ToString('HH:mm:ss') # 14:37:05
$c3_venus_ten_minutes_alert_time = (Get-Date $c3_alert_time).AddSeconds(600).ToString('HH:mm:ss') # 14:42:05
$c3_venus_twenty_minutes_alert_time = (Get-Date $c3_alert_time).AddSeconds(1200).ToString('HH:mm:ss') # 14:52:05
$c3_telescope_refocus_alert_time = (Get-Date $c3_alert_time).AddSeconds(1500).ToString('HH:mm:ss') # 14:57:05


# C4 - 15:27:26
$c4_alert_time = '15:27:26'
$c4_sixty_seconds_prior_alert_time = (Get-Date $c4_alert_time).AddSeconds(-60).ToString('HH:mm:ss') # 15:26:26
$c4_thirty_seconds_prior_alert_time = (Get-Date $c4_alert_time).AddSeconds(-30).ToString('HH:mm:ss') # 15:26:56
$c4_twenty_seconds_prior_alert_time = (Get-Date $c4_alert_time).AddSeconds(-20).ToString('HH:mm:ss') # 15:27:06
$c4_ten_seconds_prior_alert_time = (Get-Date $c4_alert_time).AddSeconds(-10).ToString('HH:mm:ss') # 15:27:16


# Script End
$script_end_time = '15:27:41'