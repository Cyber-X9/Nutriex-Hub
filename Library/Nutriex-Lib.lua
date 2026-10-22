--[[
  _  _      _       _           _  _      _     
 | \| |_  _| |_ _ _(_)_____ __ | || |_  _| |__  
 | .` | || |  _| '_| / -_) \ / | __ | || | '_ \ 
 |_|\_|\_,_|\__|_| |_\___/_\_\ |_||_|\_,_|_.__/  
  -------------------------------------------
 • Nutriex UI library - By CyberX      
 • Version: 1.0.0
 • Nutriex Security Version: 1.0                
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Localization = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")

local isStudio
local website = "github.com/Nebula-Softworks"

if RunService:IsStudio() then
 	isStudio = true
end

local Nutriex = { 
	Folder = "Nutriex", 
	Options = {}, 
	ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(117, 164, 206)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(123, 201, 201)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(224, 138, 175))} 
}

local IconModule = {
	Lucide = nil,
	Material = {
		["perm_media"] = "rbxassetid://6031215982";
		["sticky_note_2"] = "rbxassetid://6031265972";
		["gavel"] = "rbxassetid://6023565902";
		["table_view"] = "rbxassetid://6031233835";
		["home"] = "rbxassetid://6026568195";
		["list"] = "rbxassetid://6026568229";
		["alarm_add"] = "rbxassetid://6023426898";
		["speaker_notes"] = "rbxassetid://6031266001";
		["check_circle_outline"] = "rbxassetid://6023426909";
		["extension"] = "rbxassetid://6023565892";
		["pending"] = "rbxassetid://6031084745";
		["pageview"] = "rbxassetid://6031216007";
		["group_work"] = "rbxassetid://6023565910";
		["zoom_in"] = "rbxassetid://6031075573";
		["aspect_ratio"] = "rbxassetid://6022668895";
		["code"] = "rbxassetid://6022668955";
		["3d_rotation"] = "rbxassetid://6022668893";
		["translate"] = "rbxassetid://6031225812";
		["star_rate"] = "rbxassetid://6031265978";
		["system_update_alt"] = "rbxassetid://6031251515";
		["open_with"] = "rbxassetid://6026568265";
		["build_circle"] = "rbxassetid://6023426952";
		["toc"] = "rbxassetid://6031229341";
		["settings_phone"] = "rbxassetid://6031289445";
		["open_in_full"] = "rbxassetid://6026568245";
		["history"] = "rbxassetid://6026568197";
		["accessibility_new"] = "rbxassetid://6022668945";
		["hourglass_disabled"] = "rbxassetid://6026568193";
		["line_style"] = "rbxassetid://6026568276";
		["account_circle"] = "rbxassetid://6022668898";
		["settings_cell"] = "rbxassetid://6031280890";
		["search_off"] = "rbxassetid://6031260783";
		["shop"] = "rbxassetid://6031265983";
		["anchor"] = "rbxassetid://6023426906";
		["language"] = "rbxassetid://6026568213";
		["settings_brightness"] = "rbxassetid://6031280902";
		["restore_page"] = "rbxassetid://6031154877";
		["chrome_reader_mode"] = "rbxassetid://6023426912";
		["sync_alt"] = "rbxassetid://6031233840";
		["book"] = "rbxassetid://6022860343";
		["smart_button"] = "rbxassetid://6031265962";
		["request_page"] = "rbxassetid://6031154873";
		["lock_clock"] = "rbxassetid://6026568260";
		["android"] = "rbxassetid://6022668966";
		["outgoing_mail"] = "rbxassetid://6026568242";
		["dynamic_form"] = "rbxassetid://6023426970";
		["track_changes"] = "rbxassetid://6031225814";
		["source"] = "rbxassetid://6031289451";
		["thumb_down"] = "rbxassetid://6031229336";
		["integration_instructions"] = "rbxassetid://6026568214";
		["opacity"] = "rbxassetid://6026568295";
		["perm_identity"] = "rbxassetid://6031215978";
		["view_module"] = "rbxassetid://6031079152";
		["perm_data_setting"] = "rbxassetid://6031215991";
		["assignment_turned_in"] = "rbxassetid://6023426904";
		["change_history"] = "rbxassetid://6023426914";
		["thumb_down_off_alt"] = "rbxassetid://6031229354";
		["text_rotation_angledown"] = "rbxassetid://6031251513";
		["bookmark"] = "rbxassetid://6022852108";
		["view_stream"] = "rbxassetid://6031079164";
		["remove_done"] = "rbxassetid://6031086169";
		["markunread_mailbox"] = "rbxassetid://6031082531";
		["store"] = "rbxassetid://6031265968";
		["text_rotation_angleup"] = "rbxassetid://6031229337";
		["eco"] = "rbxassetid://6023426988";
		["find_in_page"] = "rbxassetid://6023426986";
		["api"] = "rbxassetid://6022668911";
		["launch"] = "rbxassetid://6026568211";
		["text_rotation_down"] = "rbxassetid://6031229334";
		["flip_to_back"] = "rbxassetid://6023565896";
		["contact_page"] = "rbxassetid://6022668881";
		["preview"] = "rbxassetid://6031260793";
		["restore"] = "rbxassetid://6031260800";
		["favorite_border"] = "rbxassetid://6023565882";
		["assignment_late"] = "rbxassetid://6022668880";
		["youtube_searched_for"] = "rbxassetid://6031075934";
		["hourglass_full"] = "rbxassetid://6026568190";
		["timeline"] = "rbxassetid://6031229350";
		["turned_in"] = "rbxassetid://6031225808";
		["info"] = "rbxassetid://6026568227";
		["restore_from_trash"] = "rbxassetid://6031154869";
		["arrow_circle_down"] = "rbxassetid://6022668877";
		["flaky"] = "rbxassetid://6031082523";
		["alarm_on"] = "rbxassetid://6023426920";
		["swap_vertical_circle"] = "rbxassetid://6031233839";
		["open_in_new"] = "rbxassetid://6026568256";
		["watch_later"] = "rbxassetid://6031075924";
		["alarm_off"] = "rbxassetid://6023426901";
		["maximize"] = "rbxassetid://6026568267";
		["lock_outline"] = "rbxassetid://6031082533";
		["outbond"] = "rbxassetid://6026568244";
		["view_carousel"] = "rbxassetid://6031251507";
		["published_with_changes"] = "rbxassetid://6031243328";
		["verified_user"] = "rbxassetid://6031225819";
		["drag_indicator"] = "rbxassetid://6023426962";
		["lightbulb_outline"] = "rbxassetid://6026568254";
		["segment"] = "rbxassetid://6031260773";
		["assignment"] = "rbxassetid://6022668882";
		["work_outline"] = "rbxassetid://6031075930";
		["line_weight"] = "rbxassetid://6026568226";
		["dangerous"] = "rbxassetid://6022668916";
		["assessment"] = "rbxassetid://6022668897";
		["view_day"] = "rbxassetid://6031079153";
		["help_center"] = "rbxassetid://6026568192";
		["logout"] = "rbxassetid://6031082522";
		["event"] = "rbxassetid://6023426959";
		["get_app"] = "rbxassetid://6023565889";
		["tab"] = "rbxassetid://6031233851";
		["label"] = "rbxassetid://6031082525";
		["g_translate"] = "rbxassetid://6031082526";
		["view_week"] = "rbxassetid://6031079154";
		["view_in_ar"] = "rbxassetid://6031079158";
		["card_travel"] = "rbxassetid://6023426925";
		["lock_open"] = "rbxassetid://6026568220";
		["voice_over_off"] = "rbxassetid://6031075927";
		["app_blocking"] = "rbxassetid://6022668952";
		["settings_ethernet"] = "rbxassetid://6031280883";
		["supervised_user_circle"] = "rbxassetid://6031289449";
		["done_all"] = "rbxassetid://6023426929";
		["lightbulb"] = "rbxassetid://6026568247";
		["find_replace"] = "rbxassetid://6023426979";
		["bookmarks"] = "rbxassetid://6023426924";
		["today"] = "rbxassetid://6031229352";
		["class"] = "rbxassetid://6022668949";
		["supervisor_account"] = "rbxassetid://6031251516";
		["support"] = "rbxassetid://6031251532";
		["done_outline"] = "rbxassetid://6023426936";
		["reorder"] = "rbxassetid://6031154868";
		["fact_check"] = "rbxassetid://6023426951";
		["thumb_up"] = "rbxassetid://6031229347";
		["assignment_returned"] = "rbxassetid://6023426899";
		["card_giftcard"] = "rbxassetid://6023426978";
		["trending_down"] = "rbxassetid://6031225811";
		["settings_backup_restore"] = "rbxassetid://6031280886";
		["settings_voice"] = "rbxassetid://6031265966";
		["dns"] = "rbxassetid://6023426958";
		["perm_scan_wifi"] = "rbxassetid://6031215985";
		["plagiarism"] = "rbxassetid://6031243320";
		["commute"] = "rbxassetid://6022668901";
		["gif"] = "rbxassetid://6031082540";
		["work"] = "rbxassetid://6031075939";
		["picture_in_picture_alt"] = "rbxassetid://6031215979";
		["query_builder"] = "rbxassetid://6031086183";
		["label_off"] = "rbxassetid://6026568209";
		["all_out"] = "rbxassetid://6022668876";
		["article"] = "rbxassetid://6022668907";
		["shopping_basket"] = "rbxassetid://6031265997";
		["mark_as_unread"] = "rbxassetid://6026568223";
		["work_off"] = "rbxassetid://6031075937";
		["delete_outline"] = "rbxassetid://6022668962";
		["account_box"] = "rbxassetid://6023426915";
		["home_filled"] = "rbxassetid://9080449299";
		["lock"] = "rbxassetid://6026568224";
		["perm_device_information"] = "rbxassetid://6031215996";
		["add_task"] = "rbxassetid://6022668912";
		["text_rotate_up"] = "rbxassetid://6031251526";
		["swipe"] = "rbxassetid://6031233863";
		["eject"] = "rbxassetid://6023426930";
		["mediation"] = "rbxassetid://6026568249";
		["label_important_outline"] = "rbxassetid://6026568199";
		["settings_remote"] = "rbxassetid://6031289442";
		["history_toggle_off"] = "rbxassetid://6026568196";
		["invert_colors"] = "rbxassetid://6026568253";
		["visibility_off"] = "rbxassetid://6031075929";
		["addchart"] = "rbxassetid://6023426905";
		["cancel_schedule_send"] = "rbxassetid://6022668963";
		["loyalty"] = "rbxassetid://6026568237";
		["speaker_notes_off"] = "rbxassetid://6031265965";
		["online_prediction"] = "rbxassetid://6026568239";
		["remove_shopping_cart"] = "rbxassetid://6031260778";
		["text_rotate_vertical"] = "rbxassetid://6031251518";
		["visibility"] = "rbxassetid://6031075931";
		["add_to_drive"] = "rbxassetid://6022860335";
		["accessible"] = "rbxassetid://6022668902";
		["bookmark_border"] = "rbxassetid://6022860339";
		["tour"] = "rbxassetid://6031229362";
		["compare_arrows"] = "rbxassetid://6022668951";
		["view_sidebar"] = "rbxassetid://6031079160";
		["face"] = "rbxassetid://6023426944";
		["wysiwyg"] = "rbxassetid://6031075938";
		["camera_enhance"] = "rbxassetid://6023426935";
		["perm_camera_mic"] = "rbxassetid://6031215983";
		["model_training"] = "rbxassetid://6026568222";
		["arrow_circle_up"] = "rbxassetid://6022668934";
		["euro_symbol"] = "rbxassetid://6023426954";
		["pending_actions"] = "rbxassetid://6031260777";
		["not_accessible"] = "rbxassetid://6026568269";
		["explore_off"] = "rbxassetid://6023426953";
		["build"] = "rbxassetid://6023426938";
		["backup"] = "rbxassetid://6023426911";
		["settings_input_antenna"] = "rbxassetid://6031280891";
		["disabled_by_default"] = "rbxassetid://6023426939";
		["upgrade"] = "rbxassetid://6031225815";
		["contactless"] = "rbxassetid://6022668886";
		["trending_flat"] = "rbxassetid://6031225818";
		["schedule"] = "rbxassetid://6031260808";
		["offline_pin"] = "rbxassetid://6031084770";
		["date_range"] = "rbxassetid://6022668894";
		["flight_land"] = "rbxassetid://6023565897";
		["view_headline"] = "rbxassetid://6031079151";
		["cached"] = "rbxassetid://6023426921";
		["unpublished"] = "rbxassetid://6031225817";
		["outlet"] = "rbxassetid://6031084748";
		["favorite"] = "rbxassetid://6023426974";
		["vertical_split"] = "rbxassetid://6031225820";
		["report_problem"] = "rbxassetid://6031086176";
		["fingerprint"] = "rbxassetid://6023565895";
		["important_devices"] = "rbxassetid://6026568202";
		["outbox"] = "rbxassetid://6026568263";
		["all_inbox"] = "rbxassetid://6022668909";
		["label_important"] = "rbxassetid://6026568215";
		["print"] = "rbxassetid://6031243324";
		["settings_bluetooth"] = "rbxassetid://6031280905";
		["power_settings_new"] = "rbxassetid://6031260781";
		["zoom_out"] = "rbxassetid://6031075577";
		["stars"] = "rbxassetid://6031265971";
		["offline_bolt"] = "rbxassetid://6031084742";
		["feedback"] = "rbxassetid://6023426957";
		["accessibility"] = "rbxassetid://6022668887";
		["announcement"] = "rbxassetid://6022668946";
		["settings_input_hdmi"] = "rbxassetid://6031280970";
		["leaderboard"] = "rbxassetid://6026568216";
		["view_quilt"] = "rbxassetid://6031079155";
		["note_add"] = "rbxassetid://6031084749";
		["theaters"] = "rbxassetid://6031229335";
		["alarm"] = "rbxassetid://6023426910";
		["settings_input_composite"] = "rbxassetid://6031280896";
		["grade"] = "rbxassetid://6026568189";
		["tab_unselected"] = "rbxassetid://6031251505";
		["swap_vert"] = "rbxassetid://6031233847";
		["assignment_return"] = "rbxassetid://6023426931";
		["highlight_alt"] = "rbxassetid://6023565913";
		["shopping_bag"] = "rbxassetid://6031265970";
		["contact_support"] = "rbxassetid://6022668879";
		["flip_to_front"] = "rbxassetid://6023565894";
		["touch_app"] = "rbxassetid://6031229361";
		["room"] = "rbxassetid://6031154875";
		["send_and_archive"] = "rbxassetid://6031280889";
		["view_array"] = "rbxassetid://6031225842";
		["settings_power"] = "rbxassetid://6031289446";
		["admin_panel_settings"] = "rbxassetid://6022668961";
		["open_in_browser"] = "rbxassetid://6026568266";
		["card_membership"] = "rbxassetid://6023426942";
		["rule"] = "rbxassetid://6031154859";
		["schedule_send"] = "rbxassetid://6031154866";
		["calendar_today"] = "rbxassetid://6022668917";
		["info_outline"] = "rbxassetid://6026568210";
		["description"] = "rbxassetid://6022668888";
		["dashboard_customize"] = "rbxassetid://6022668899";
		["rowing"] = "rbxassetid://6031154857";
		["swap_horizontal_circle"] = "rbxassetid://6031233833";
		["account_balance_wallet"] = "rbxassetid://6022668892";
		["view_agenda"] = "rbxassetid://6031225831";
		["shop_two"] = "rbxassetid://6031289461";
		["done"] = "rbxassetid://6023426926";
		["circle_notifications"] = "rbxassetid://6023426923";
		["compress"] = "rbxassetid://6022668878";
		["calendar_view_day"] = "rbxassetid://6023426946";
		["thumbs_up_down"] = "rbxassetid://6031229373";
		["account_balance"] = "rbxassetid://6022668900";
		["play_for_work"] = "rbxassetid://6031260776";
		["pets"] = "rbxassetid://6031260782";
		["view_column"] = "rbxassetid://6031079172";
		["search"] = "rbxassetid://6031154871";
		["autorenew"] = "rbxassetid://6023565901";
		["copyright"] = "rbxassetid://6023565898";
		["privacy_tip"] = "rbxassetid://6031260784";
		["arrow_right_alt"] = "rbxassetid://6022668890";
		["delete"] = "rbxassetid://6022668885";
		["nightlight_round"] = "rbxassetid://6031084743";
		["batch_prediction"] = "rbxassetid://6022860334";
		["shopping_cart"] = "rbxassetid://6031265976";
		["login"] = "rbxassetid://6031082527";
		["settings_input_svideo"] = "rbxassetid://6031289444";
		["payment"] = "rbxassetid://6031084751";
		["update"] = "rbxassetid://6031225810";
		["text_rotation_none"] = "rbxassetid://6031229344";
		["perm_contact_calendar"] = "rbxassetid://6031215990";
		["explore"] = "rbxassetid://6023426941";
		["delete_forever"] = "rbxassetid://6022668939";
		["rounded_corner"] = "rbxassetid://6031154861";
		["book_online"] = "rbxassetid://6022860332";
		["quickreply"] = "rbxassetid://6031243319";
		["bug_report"] = "rbxassetid://6022852107";
		["subtitles_off"] = "rbxassetid://6031289466";
		["close_fullscreen"] = "rbxassetid://6023426928";
		["horizontal_split"] = "rbxassetid://6026568194";
		["minimize"] = "rbxassetid://6026568240";
		["filter_list_alt"] = "rbxassetid://6023426955";
		["add_shopping_cart"] = "rbxassetid://6022668875";
		["next_plan"] = "rbxassetid://6026568231";
		["view_list"] = "rbxassetid://6031079156";
		["receipt"] = "rbxassetid://6031086173";
		["polymer"] = "rbxassetid://6031260785";
		["spellcheck"] = "rbxassetid://6031289450";
		["wifi_protected_setup"] = "rbxassetid://6031075926";
		["label_outline"] = "rbxassetid://6026568207";
		["highlight_off"] = "rbxassetid://6023565916";
		["turned_in_not"] = "rbxassetid://6031225806";
		["edit_off"] = "rbxassetid://6023426983";
		["question_answer"] = "rbxassetid://6031086172";
		["settings_overscan"] = "rbxassetid://6031289459";
		["trending_up"] = "rbxassetid://6031225816";
		["verified"] = "rbxassetid://6031225809";
		["flight_takeoff"] = "rbxassetid://6023565891";
		["grading"] = "rbxassetid://6026568191";
		["dashboard"] = "rbxassetid://6022668883";
		["expand"] = "rbxassetid://6022668891";
		["backup_table"] = "rbxassetid://6022860338";
		["analytics"] = "rbxassetid://6022668884";
		["picture_in_picture"] = "rbxassetid://6031215994";
		["settings"] = "rbxassetid://6031280882";
		["accessible_forward"] = "rbxassetid://6022668906";
		["pan_tool"] = "rbxassetid://6031084771";
		["https"] = "rbxassetid://6026568200";
		["filter_alt"] = "rbxassetid://6023426984";
		["thumb_up_off_alt"] = "rbxassetid://6031229342";
		["record_voice_over"] = "rbxassetid://6031243318";
		["help_outline"] = "rbxassetid://6026568201";
		["check_circle"] = "rbxassetid://6023426945";
		["comment_bank"] = "rbxassetid://6023426937";
		["perm_phone_msg"] = "rbxassetid://6031215986";
		["settings_applications"] = "rbxassetid://6031280894";
		["exit_to_app"] = "rbxassetid://6023426922";
		["saved_search"] = "rbxassetid://6031154867";
		["toll"] = "rbxassetid://6031229343";
		["not_started"] = "rbxassetid://6026568232";
		["subject"] = "rbxassetid://6031289452";
		["redeem"] = "rbxassetid://6031086170";
		["input"] = "rbxassetid://6026568225";
		["settings_input_component"] = "rbxassetid://6031280884";
		["assignment_ind"] = "rbxassetid://6022668935";
		["swap_horiz"] = "rbxassetid://6031233841";
		["fullscreen"] = "rbxassetid://6031094681";
		["cancel"] = "rbxassetid://6031094677";
		["subdirectory_arrow_left"] = "rbxassetid://6031104654";
		["close"] = "rbxassetid://6031094678";
		["arrow_back_ios"] = "rbxassetid://6031091003";
		["east"] = "rbxassetid://6031094675";
		["unfold_more"] = "rbxassetid://6031104644";
		["south"] = "rbxassetid://6031104646";
		["arrow_drop_up"] = "rbxassetid://6031090990";
		["arrow_back"] = "rbxassetid://6031091000";
		["arrow_downward"] = "rbxassetid://6031090991";
		["west"] = "rbxassetid://6031104677";
		["legend_toggle"] = "rbxassetid://6031097233";
		["fullscreen_exit"] = "rbxassetid://6031094691";
		["last_page"] = "rbxassetid://6031094686";
		["switch_right"] = "rbxassetid://6031104649";
		["check"] = "rbxassetid://6031094667";
		["home_work"] = "rbxassetid://6031094683";
		["north_east"] = "rbxassetid://6031097228";
		["double_arrow"] = "rbxassetid://6031094674";
		["more_vert"] = "rbxassetid://6031104648";
		["chevron_left"] = "rbxassetid://6031094670";
		["more_horiz"] = "rbxassetid://6031104650";
		["unfold_less"] = "rbxassetid://6031104681";
		["first_page"] = "rbxassetid://6031094682";
		["payments"] = "rbxassetid://6031097227";
		["arrow_right"] = "rbxassetid://6031090994";
		["offline_share"] = "rbxassetid://6031097267";
		["south_west"] = "rbxassetid://6031104652";
		["expand_less"] = "rbxassetid://6031094679";
		["south_east"] = "rbxassetid://6031104642";
		["assistant_navigation"] = "rbxassetid://6031091006";
		["apps"] = "rbxassetid://6031090999";
		["arrow_upward"] = "rbxassetid://6031090997";
		["app_settings_alt"] = "rbxassetid://6031090998";
		["subdirectory_arrow_right"] = "rbxassetid://6031104647";
		["north_west"] = "rbxassetid://6031104630";
		["switch_left"] = "rbxassetid://6031104651";
		["chevron_right"] = "rbxassetid://6031094680";
		["arrow_forward"] = "rbxassetid://6031090995";
		["arrow_forward_ios"] = "rbxassetid://6031091008";
		["arrow_drop_down"] = "rbxassetid://6031091004";
		["refresh"] = "rbxassetid://6031097226";
		["pivot_table_chart"] = "rbxassetid://6031097234";
		["expand_more"] = "rbxassetid://6031094687";
		["campaign"] = "rbxassetid://6031094666";
		["arrow_left"] = "rbxassetid://6031091002";
		["arrow_drop_down_circle"] = "rbxassetid://6031091001";
		["menu_open"] = "rbxassetid://6031097229";
		["waterfall_chart"] = "rbxassetid://6031104632";
		["assistant_direction"] = "rbxassetid://6031091005";
		["menu"] = "rbxassetid://6031097225";
		["personal_video"] = "rbxassetid://6034457070";
		["power_off"] = "rbxassetid://6034457087";
		["wifi_off"] = "rbxassetid://6034461625";
		["adb"] = "rbxassetid://6034418515";
		["airline_seat_recline_normal"] = "rbxassetid://6034418512";
		["sync_problem"] = "rbxassetid://6034452653";
		["network_check"] = "rbxassetid://6034461631";
		["event_busy"] = "rbxassetid://6034439634";
		["airline_seat_flat"] = "rbxassetid://6034418511";
		["disc_full"] = "rbxassetid://6034418518";
		["sd_card"] = "rbxassetid://6034457089";
		["time_to_leave"] = "rbxassetid://6034452660";
		["phone_bluetooth_speaker"] = "rbxassetid://6034457057";
		["phone_paused"] = "rbxassetid://6034457066";
		["phone_locked"] = "rbxassetid://6034457058";
		["more"] = "rbxassetid://6034461627";
		["add_call"] = "rbxassetid://6034418524";
		["account_tree"] = "rbxassetid://6034418507";
		["do_not_disturb_on"] = "rbxassetid://6034439649";
		["event_note"] = "rbxassetid://6034439637";
		["sync_disabled"] = "rbxassetid://6034452649";
		["mms"] = "rbxassetid://6034461621";
		["airline_seat_flat_angled"] = "rbxassetid://6034418513";
		["bluetooth_audio"] = "rbxassetid://6034418522";
		["vibration"] = "rbxassetid://6034452651";
		["system_update"] = "rbxassetid://6034452663";
		["enhanced_encryption"] = "rbxassetid://6034439652";
		["wc"] = "rbxassetid://6034452643";
		["live_tv"] = "rbxassetid://6034439648";
		["folder_special"] = "rbxassetid://6034439639";
		["phone_missed"] = "rbxassetid://6034457056";
		["airline_seat_recline_extra"] = "rbxassetid://6034418528";
		["sms"] = "rbxassetid://6034452645";
		["tap_and_play"] = "rbxassetid://6034452650";
		["confirmation_number"] = "rbxassetid://6034418519";
		["event_available"] = "rbxassetid://6034439643";
		["sms_failed"] = "rbxassetid://6034452676";
		["do_not_disturb_alt"] = "rbxassetid://6034461619";
		["do_not_disturb"] = "rbxassetid://6034439645";
		["ondemand_video"] = "rbxassetid://6034457065";
		["no_encryption"] = "rbxassetid://6034457059";
		["airline_seat_legroom_extra"] = "rbxassetid://6034418508";
		["tv_off"] = "rbxassetid://6034452646";
		["sim_card_alert"] = "rbxassetid://6034452641";
		["airline_seat_legroom_normal"] = "rbxassetid://6034418532";
		["wifi"] = "rbxassetid://6034461626";
		["do_not_disturb_off"] = "rbxassetid://6034439642";
		["imagesearch_roller"] = "rbxassetid://6034439635";
		["power"] = "rbxassetid://6034457105";
		["airline_seat_legroom_reduced"] = "rbxassetid://6034418520";
		["phone_in_talk"] = "rbxassetid://6034457067";
		["airline_seat_individual_suite"] = "rbxassetid://6034418514";
		["priority_high"] = "rbxassetid://6034457092";
		["phone_callback"] = "rbxassetid://6034457104";
		["phone_forwarded"] = "rbxassetid://6034457106";
		["sync"] = "rbxassetid://6034452662";
		["vpn_lock"] = "rbxassetid://6034452648";
		["support_agent"] = "rbxassetid://6034452656";
		["network_locked"] = "rbxassetid://6034457064";
		["directions_off"] = "rbxassetid://6034418517";
		["drive_eta"] = "rbxassetid://6034464371";
		["sensor_window"] = "rbxassetid://6031067242";
		["sensor_door"] = "rbxassetid://6031067241";
		["keyboard_return"] = "rbxassetid://6034818370";
		["monitor"] = "rbxassetid://6034837803";
		["device_hub"] = "rbxassetid://6034789877";
		["keyboard"] = "rbxassetid://6034818398";
		["keyboard_voice"] = "rbxassetid://6034818360";
		["cast"] = "rbxassetid://6034789876";
		["developer_board"] = "rbxassetid://6034789883";
		["tablet"] = "rbxassetid://6034848733";
		["keyboard_hide"] = "rbxassetid://6034818386";
		["dock"] = "rbxassetid://6034789888";
		["phonelink"] = "rbxassetid://6034837801";
		["device_unknown"] = "rbxassetid://6034789884";
		["speaker_group"] = "rbxassetid://6034848732";
		["desktop_mac"] = "rbxassetid://6034789898";
		["point_of_sale"] = "rbxassetid://6034837798";
		["memory"] = "rbxassetid://6034837807";
		["keyboard_tab"] = "rbxassetid://6034818363";
		["router"] = "rbxassetid://6034837806";
		["sim_card"] = "rbxassetid://6034837800";
		["headset"] = "rbxassetid://6034789880";
		["gamepad"] = "rbxassetid://6034789879";
		["speaker"] = "rbxassetid://6034848746";
		["devices_other"] = "rbxassetid://6034789873";
		["laptop"] = "rbxassetid://6034818367";
		["scanner"] = "rbxassetid://6034837799";
		["tv"] = "rbxassetid://6034848740";
		["headset_mic"] = "rbxassetid://6034818383";
		["browser_not_supported"] = "rbxassetid://6034789875";
		["computer"] = "rbxassetid://6034789874";
		["connected_tv"] = "rbxassetid://6034789870";
		["phonelink_off"] = "rbxassetid://6034837804";
		["headset_off"] = "rbxassetid://6034818402";
		["cast_connected"] = "rbxassetid://6034789895";
		["watch"] = "rbxassetid://6034848747";
		["keyboard_arrow_up"] = "rbxassetid://6034818379";
		["keyboard_backspace"] = "rbxassetid://6034818381";
		["laptop_chromebook"] = "rbxassetid://6034818364";
		["phone_iphone"] = "rbxassetid://6034837811";
		["smartphone"] = "rbxassetid://6034848731";
		["power_input"] = "rbxassetid://6034837794";
		["videogame_asset"] = "rbxassetid://6034848748";
		["desktop_windows"] = "rbxassetid://6034789893";
		["keyboard_arrow_down"] = "rbxassetid://6034818372";
		["laptop_mac"] = "rbxassetid://6034837808";
		["laptop_windows"] = "rbxassetid://6034837796";
		["keyboard_arrow_right"] = "rbxassetid://6034818365";
		["cast_for_education"] = "rbxassetid://6034789872";
		["keyboard_capslock"] = "rbxassetid://6034818403";
		["toys"] = "rbxassetid://6034848752";
		["tablet_android"] = "rbxassetid://6034848734";
		["mouse"] = "rbxassetid://6034837797";
		["phone_android"] = "rbxassetid://6034837793";
		["keyboard_arrow_left"] = "rbxassetid://6034818375";
		["security"] = "rbxassetid://6034837802";
		["dry_cleaning"] = "rbxassetid://6034754456";
		["bakery_dining"] = "rbxassetid://6034767610";
		["place"] = "rbxassetid://6034503372";
		["run_circle"] = "rbxassetid://6034503367";
		["local_post_office"] = "rbxassetid://6034513883";
		["takeout_dining"] = "rbxassetid://6034467808";
		["nightlife"] = "rbxassetid://6034510003";
		["design_services"] = "rbxassetid://6034754453";
		["celebration"] = "rbxassetid://6034767613";
		["near_me_disabled"] = "rbxassetid://6034509988";
		["add_location_alt"] = "rbxassetid://6034483678";
		["directions_run"] = "rbxassetid://6034754445";
		["local_fire_department"] = "rbxassetid://6034684949";
		["add_road"] = "rbxassetid://6034483677";
		["my_location"] = "rbxassetid://6034509987";
		["dinner_dining"] = "rbxassetid://6034754457";
		["local_airport"] = "rbxassetid://6034687951";
		["zoom_out_map"] = "rbxassetid://6035229856";
		["pin_drop"] = "rbxassetid://6034470807";
		["subway"] = "rbxassetid://6034467790";
		["electric_moped"] = "rbxassetid://6034744027";
		["restaurant_menu"] = "rbxassetid://6034503378";
		["local_gas_station"] = "rbxassetid://6034684935";
		["local_cafe"] = "rbxassetid://6034687954";
		["theater_comedy"] = "rbxassetid://6034467796";
		["directions_bus"] = "rbxassetid://6034754434";
		["hail"] = "rbxassetid://6034744033";
		["satellite"] = "rbxassetid://6034503370";
		["local_phone"] = "rbxassetid://6034513884";
		["electric_bike"] = "rbxassetid://6034744032";
		["local_see"] = "rbxassetid://6034513887";
		["transit_enterexit"] = "rbxassetid://6034467805";
		["local_convenience_store"] = "rbxassetid://6034687956";
		["local_offer"] = "rbxassetid://6034513891";
		["electric_car"] = "rbxassetid://6034744029";
		["beenhere"] = "rbxassetid://6034483675";
		["miscellaneous_services"] = "rbxassetid://6034509993";
		["maps_ugc"] = "rbxassetid://6034509992";
		["moped"] = "rbxassetid://6034509999";
		["medical_services"] = "rbxassetid://6034510001";
		["money"] = "rbxassetid://6034509997";
		["transfer_within_a_station"] = "rbxassetid://6034467809";
		["electrical_services"] = "rbxassetid://6034744038";
		["museum"] = "rbxassetid://6034510005";
		["add_location"] = "rbxassetid://6034483672";
		["layers"] = "rbxassetid://6034687957";
		["handyman"] = "rbxassetid://6034744057";
		["local_pharmacy"] = "rbxassetid://6034513903";
		["electric_rickshaw"] = "rbxassetid://6034744043";
		["alt_route"] = "rbxassetid://6034483670";
		["no_transfer"] = "rbxassetid://6034503363";
		["pedal_bike"] = "rbxassetid://6034503374";
		["directions_transit"] = "rbxassetid://6034754436";
		["railway_alert"] = "rbxassetid://6034470823";
		["local_police"] = "rbxassetid://6034513895";
		["directions_car"] = "rbxassetid://6034754441";
		["category"] = "rbxassetid://6034767621";
		["attractions"] = "rbxassetid://6034767620";
		["person_pin_circle"] = "rbxassetid://6034503375";
		["cleaning_services"] = "rbxassetid://6034767619";
		["terrain"] = "rbxassetid://6034467794";
		["no_meals"] = "rbxassetid://6034510024";
		["train"] = "rbxassetid://6034467803";
		["delivery_dining"] = "rbxassetid://6034767644";
		["pest_control"] = "rbxassetid://6034470809";
		["directions"] = "rbxassetid://6034754449";
		["atm"] = "rbxassetid://6034767614";
		["rate_review"] = "rbxassetid://6034503385";
		["local_bar"] = "rbxassetid://6034687950";
		["local_drink"] = "rbxassetid://6034687965";
		["directions_railway"] = "rbxassetid://6034754433";
		["person_pin"] = "rbxassetid://6034503364";
		["ev_station"] = "rbxassetid://6034744037";
		["home_repair_service"] = "rbxassetid://6034744064";
		["bus_alert"] = "rbxassetid://6034767618";
		["agriculture"] = "rbxassetid://6034483674";
		["volunteer_activism"] = "rbxassetid://6034467799";
		["breakfast_dining"] = "rbxassetid://6034483671";
		["layers_clear"] = "rbxassetid://6034687975";
		["plumbing"] = "rbxassetid://6034470800";
		["taxi_alert"] = "rbxassetid://6034467792";
		["add_business"] = "rbxassetid://6034483666";
		["badge"] = "rbxassetid://6034767607";
		["edit_attributes"] = "rbxassetid://6034754443";
		["directions_walk"] = "rbxassetid://6034754448";
		["local_play"] = "rbxassetid://6034513889";
		["bike_scooter"] = "rbxassetid://6034483669";
		["two_wheeler"] = "rbxassetid://6034467795";
		["local_florist"] = "rbxassetid://6034684940";
		["local_hotel"] = "rbxassetid://6034684939";
		["no_meals_ouline"] = "rbxassetid://6034510025";
		["festival"] = "rbxassetid://6034744031";
		["local_shipping"] = "rbxassetid://6034684926";
		["directions_boat"] = "rbxassetid://6034754442";
		["wrong_location"] = "rbxassetid://6034467801";
		["restaurant"] = "rbxassetid://6034503366";
		["directions_subway"] = "rbxassetid://6034754440";
		["not_listed_location"] = "rbxassetid://6034503380";
		["electric_scooter"] = "rbxassetid://6034744041";
		["ramen_dining"] = "rbxassetid://6034503377";
		["edit_road"] = "rbxassetid://6034744035";
		["local_printshop"] = "rbxassetid://6034513897";
		["map"] = "rbxassetid://6034684930";
		["car_rental"] = "rbxassetid://6034767641";
		["multiple_stop"] = "rbxassetid://6034510026";
		["brunch_dining"] = "rbxassetid://6034767611";
		["local_laundry_service"] = "rbxassetid://6034684943";
		["set_meal"] = "rbxassetid://6034503368";
		["local_car_wash"] = "rbxassetid://6034687976";
		["pest_control_rodent"] = "rbxassetid://6034470803";
		["local_pizza"] = "rbxassetid://6034513885";
		["local_grocery_store"] = "rbxassetid://6034684933";
		["traffic"] = "rbxassetid://6034467797";
		["departure_board"] = "rbxassetid://6034767615";
		["icecream"] = "rbxassetid://6034687967";
		["navigation"] = "rbxassetid://6034509984";
		["near_me"] = "rbxassetid://6034509996";
		["fastfood"] = "rbxassetid://6034744034";
		["local_library"] = "rbxassetid://6034684931";
		["local_activity"] = "rbxassetid://6034687955";
		["local_hospital"] = "rbxassetid://6034684956";
		["menu_book"] = "rbxassetid://6034509994";
		["directions_bike"] = "rbxassetid://6034754459";
		["store_mall_directory"] = "rbxassetid://6034470811";
		["trip_origin"] = "rbxassetid://6034467804";
		["tram"] = "rbxassetid://6034467806";
		["edit_location"] = "rbxassetid://6034754439";
		["streetview"] = "rbxassetid://6034470805";
		["hvac"] = "rbxassetid://6034687960";
		["lunch_dining"] = "rbxassetid://6034684928";
		["car_repair"] = "rbxassetid://6034767617";
		["compass_calibration"] = "rbxassetid://6034767623";
		["360"] = "rbxassetid://6034767608";
		["flight"] = "rbxassetid://6034744030";
		["local_mall"] = "rbxassetid://6034684934";
		["hotel"] = "rbxassetid://6034687977";
		["local_parking"] = "rbxassetid://6034513893";
		["hardware"] = "rbxassetid://6034744036";
		["local_dining"] = "rbxassetid://6034687963";
		["park"] = "rbxassetid://6034503369";
		["location_pin"] = "rbxassetid://6034684937";
		["local_movies"] = "rbxassetid://6034684936";
		["local_atm"] = "rbxassetid://6034687953";
		["local_taxi"] = "rbxassetid://6034684927";
		["brightness_low"] = "rbxassetid://6034989542";
		["screen_lock_landscape"] = "rbxassetid://6034996700";
		["graphic_eq"] = "rbxassetid://6034989551";
		["screen_lock_rotation"] = "rbxassetid://6034996710";
		["signal_cellular_4_bar"] = "rbxassetid://6035030076";
		["airplanemode_inactive"] = "rbxassetid://6034983848";
		["signal_wifi_0_bar"] = "rbxassetid://6035030067";
		["battery_full"] = "rbxassetid://6034983854";
		["gps_fixed"] = "rbxassetid://6034989550";
		["brightness_high"] = "rbxassetid://6034989541";
		["ad_units"] = "rbxassetid://6034983845";
		["signal_cellular_alt"] = "rbxassetid://6035030079";
		["bluetooth_connected"] = "rbxassetid://6034983855";
		["wifi_tethering"] = "rbxassetid://6035039430";
		["dvr"] = "rbxassetid://6034989561";
		["screen_search_desktop"] = "rbxassetid://6034996711";
		["network_wifi"] = "rbxassetid://6034996712";
		["access_alarms"] = "rbxassetid://6034983853";
		["nfc"] = "rbxassetid://6034996698";
		["location_disabled"] = "rbxassetid://6034996694";
		["signal_wifi_4_bar"] = "rbxassetid://6035030077";
		["access_time"] = "rbxassetid://6034983856";
		["mobile_off"] = "rbxassetid://6034996702";
		["battery_unknown"] = "rbxassetid://6034983842";
		["signal_cellular_null"] = "rbxassetid://6035030075";
		["bluetooth_disabled"] = "rbxassetid://6034989562";
		["developer_mode"] = "rbxassetid://6034989549";
		["network_cell"] = "rbxassetid://6034996709";
		["sd_storage"] = "rbxassetid://6034996719";
		["signal_cellular_no_sim"] = "rbxassetid://6035030078";
		["devices"] = "rbxassetid://6034989540";
		["screen_rotation"] = "rbxassetid://6034996701";
		["device_thermostat"] = "rbxassetid://6034989544";
		["signal_wifi_off"] = "rbxassetid://6035030074";
		["widgets"] = "rbxassetid://6035039429";
		["bluetooth"] = "rbxassetid://6034983880";
		["battery_charging_full"] = "rbxassetid://6034983849";
		["mobile_friendly"] = "rbxassetid://6034996699";
		["signal_cellular_0_bar"] = "rbxassetid://6035030072";
		["storage"] = "rbxassetid://6035030083";
		["send_to_mobile"] = "rbxassetid://6034996697";
		["location_searching"] = "rbxassetid://6034996695";
		["brightness_auto"] = "rbxassetid://6034989545";
		["wifi_lock"] = "rbxassetid://6035039428";
		["gps_not_fixed"] = "rbxassetid://6034989547";
		["access_alarm"] = "rbxassetid://6034983844";
		["battery_alert"] = "rbxassetid://6034983843";
		["signal_cellular_off"] = "rbxassetid://6035030084";
		["signal_cellular_connected_no_internet_4"] = "rbxassetid://6035229858";
		["gps_off"] = "rbxassetid://6034989548";
		["add_alarm"] = "rbxassetid://6034983850";
		["brightness_medium"] = "rbxassetid://6034989543";
		["usb"] = "rbxassetid://6035030080";
		["airplanemode_active"] = "rbxassetid://6034983864";
		["reset_tv"] = "rbxassetid://6034996696";
		["wallpaper"] = "rbxassetid://6035030102";
		["settings_system_daydream"] = "rbxassetid://6035030081";
		["bluetooth_searching"] = "rbxassetid://6034989553";
		["add_to_home_screen"] = "rbxassetid://6034983858";
		["screen_lock_portrait"] = "rbxassetid://6034996706";
		["data_usage"] = "rbxassetid://6034989568";
		["_auto_delete"] = "rbxassetid://6031071068";
		["_error"] = "rbxassetid://6031071057";
		["_notification_important"] = "rbxassetid://6031071056";
		["_add_alert"] = "rbxassetid://6031071067";
		["_warning"] = "rbxassetid://6031071053";
		["_error_outline"] = "rbxassetid://6031071050";
		["check_box_outline_blank"] = "rbxassetid://6031068420";
		["toggle_off"] = "rbxassetid://6031068429";
		["indeterminate_check_box"] = "rbxassetid://6031068445";
		["radio_button_checked"] = "rbxassetid://6031068426";
		["toggle_on"] = "rbxassetid://6031068430";
		["check_box"] = "rbxassetid://6031068421";
		["radio_button_unchecked"] = "rbxassetid://6031068433";
		["star"] = "rbxassetid://6031068423";
		["star_border"] = "rbxassetid://6031068425";
		["star_half"] = "rbxassetid://6031068427";
		["star_outline"] = "rbxassetid://6031068428";
		["multiline_chart"] = "rbxassetid://6034941721";
		["pie_chart"] = "rbxassetid://6034973076";
		["format_line_spacing"] = "rbxassetid://6034910905";
		["format_align_left"] = "rbxassetid://6034900727";
		["linear_scale"] = "rbxassetid://6034941707";
		["insert_photo"] = "rbxassetid://6034941703";
		["scatter_plot"] = "rbxassetid://6034973094";
		["post_add"] = "rbxassetid://6034973083";
		["format_textdirection_r_to_l"] = "rbxassetid://6034925623";
		["format_size"] = "rbxassetid://6034910908";
		["format_color_fill"] = "rbxassetid://6034910903";
		["format_paint"] = "rbxassetid://6034925618";
		["format_underlined"] = "rbxassetid://6034925627";
		["format_shapes"] = "rbxassetid://6034910909";
		["title"] = "rbxassetid://6034934042";
		["highlight"] = "rbxassetid://6034925617";
		["bar_chart"] = "rbxassetid://6034898096";
		["format_indent_increase"] = "rbxassetid://6034900724";
		["merge_type"] = "rbxassetid://6034941705";
		["bubble_chart"] = "rbxassetid://6034925612";
		["publish"] = "rbxassetid://6034973085";
		["format_indent_decrease"] = "rbxassetid://6034900733";
		["margin"] = "rbxassetid://6034941701";
		["table_rows"] = "rbxassetid://6034934025";
		["stacked_line_chart"] = "rbxassetid://6034934039";
		["border_clear"] = "rbxassetid://6034898135";
		["border_color"] = "rbxassetid://6034898100";
		["border_inner"] = "rbxassetid://6034898131";
		["insert_chart"] = "rbxassetid://6034925628";
		["border_top"] = "rbxassetid://6034900726";
		["padding"] = "rbxassetid://6034973078";
		["border_vertical"] = "rbxassetid://6034900725";
		["score"] = "rbxassetid://6034934041";
		["border_right"] = "rbxassetid://6034898120";
		["add_chart"] = "rbxassetid://6034898093";
		["space_bar"] = "rbxassetid://6034934037";
		["border_outer"] = "rbxassetid://6034898104";
		["mode_comment"] = "rbxassetid://6034941700";
		["attach_money"] = "rbxassetid://6034898098";
		["drag_handle"] = "rbxassetid://6034910907";
		["format_align_right"] = "rbxassetid://6034900723";
		["pie_chart_outlined"] = "rbxassetid://6034973077";
		["horizontal_rule"] = "rbxassetid://6034925610";
		["border_all"] = "rbxassetid://6034898101";
		["border_style"] = "rbxassetid://6034898097";
		["insert_comment"] = "rbxassetid://6034925609";
		["vertical_align_top"] = "rbxassetid://6034973080";
		["vertical_align_center"] = "rbxassetid://6034934051";
		["format_color_text"] = "rbxassetid://6034910910";
		["format_quote"] = "rbxassetid://6034925629";
		["height"] = "rbxassetid://6034925613";
		["add_comment"] = "rbxassetid://6034898128";
		["format_strikethrough"] = "rbxassetid://6034910904";
		["strikethrough_s"] = "rbxassetid://6034934030";
		["border_left"] = "rbxassetid://6034898099";
		["format_list_bulleted"] = "rbxassetid://6034925620";
		["format_italic"] = "rbxassetid://6034910912";
		["format_list_numbered"] = "rbxassetid://6034925622";
		["attach_file"] = "rbxassetid://6034898102";
		["wrap_text"] = "rbxassetid://6034973118";
		["insert_invitation"] = "rbxassetid://6034973091";
		["format_list_numbered_rtl"] = "rbxassetid://6034910906";
		["border_horizontal"] = "rbxassetid://6034898105";
		["format_align_center"] = "rbxassetid://6034900718";
		["format_textdirection_l_to_r"] = "rbxassetid://6034925619";
		["show_chart"] = "rbxassetid://6034934032";
		["insert_chart_outlined"] = "rbxassetid://6034925606";
		["vertical_align_bottom"] = "rbxassetid://6034934023";
		["subscript"] = "rbxassetid://6034934059";
		["format_align_justify"] = "rbxassetid://6034900721";
		["format_clear"] = "rbxassetid://6034910902";
		["notes"] = "rbxassetid://6034973084";
		["insert_drive_file"] = "rbxassetid://6034941697";
		["functions"] = "rbxassetid://6034925614";
		["insert_emoticon"] = "rbxassetid://6034973079";
		["insert_link"] = "rbxassetid://6034973074";
		["format_color_reset"] = "rbxassetid://6034900743";
		["monetization_on"] = "rbxassetid://6034973115";
		["short_text"] = "rbxassetid://6034934035";
		["mode_edit"] = "rbxassetid://6034941708";
		["superscript"] = "rbxassetid://6034934034";
		["table_chart"] = "rbxassetid://6034973081";
		["format_bold"] = "rbxassetid://6034900732";
		["money_off"] = "rbxassetid://6034973088";
		["border_bottom"] = "rbxassetid://6034898094";
		["text_fields"] = "rbxassetid://6034934040";
		["note"] = "rbxassetid://6026663734";
		["shuffle"] = "rbxassetid://6026667003";
		["library_books"] = "rbxassetid://6026660085";
		["library_music"] = "rbxassetid://6026660075";
		["surround_sound"] = "rbxassetid://6026671209";
		["forward_30"] = "rbxassetid://6026660088";
		["music_video"] = "rbxassetid://6026663704";
		["videocam_off"] = "rbxassetid://6026671212";
		["control_camera"] = "rbxassetid://6026647916";
		["explicit"] = "rbxassetid://6026647913";
		["3k_plus"] = "rbxassetid://6026681598";
		["fiber_pin"] = "rbxassetid://6026660064";
		["skip_previous"] = "rbxassetid://6026667011";
		["pause_circle_filled"] = "rbxassetid://6026663718";
		["video_settings"] = "rbxassetid://6026671211";
		["movie"] = "rbxassetid://6026660081";
		["add_to_queue"] = "rbxassetid://6026647903";
		["6k"] = "rbxassetid://6026681579";
		["web_asset"] = "rbxassetid://6026671239";
		["play_circle_outline"] = "rbxassetid://6026663726";
		["volume_off"] = "rbxassetid://6026671224";
		["mic_off"] = "rbxassetid://6026660076";
		["featured_play_list"] = "rbxassetid://6026647932";
		["pause_circle_outline"] = "rbxassetid://6026663701";
		["slow_motion_video"] = "rbxassetid://6026681583";
		["7k"] = "rbxassetid://6026681584";
		["playlist_add"] = "rbxassetid://6026663728";
		["fiber_smart_record"] = "rbxassetid://6026660080";
		["8k"] = "rbxassetid://6026643014";
		["hd"] = "rbxassetid://6026660065";
		["repeat_one_on"] = "rbxassetid://6026666992";
		["recent_actors"] = "rbxassetid://6026663773";
		["fiber_new"] = "rbxassetid://6026647930";
		["fiber_dvr"] = "rbxassetid://6026647912";
		["hearing_disabled"] = "rbxassetid://6026660068";
		["forward_10"] = "rbxassetid://6026660062";
		["4k_plus"] = "rbxassetid://6026643005";
		["repeat_one"] = "rbxassetid://6026681590";
		["equalizer"] = "rbxassetid://6026647906";
		["stop"] = "rbxassetid://6026681576";
		["2k"] = "rbxassetid://6026643032";
		["playlist_add_check"] = "rbxassetid://6026663727";
		["not_interested"] = "rbxassetid://6026663743";
		["videocam"] = "rbxassetid://6026671213";
		["sort_by_alpha"] = "rbxassetid://6026667009";
		["library_add"] = "rbxassetid://6026660063";
		["stop_circle"] = "rbxassetid://6026681577";
		["pause"] = "rbxassetid://6026663719";
		["new_releases"] = "rbxassetid://6026663730";
		["album"] = "rbxassetid://6026647905";
		["sd"] = "rbxassetid://6026681582";
		["volume_up"] = "rbxassetid://6026671215";
		["replay_5"] = "rbxassetid://6026666993";
		["high_quality"] = "rbxassetid://6026660059";
		["shuffle_on"] = "rbxassetid://6026666996";
		["play_arrow"] = "rbxassetid://6026663699";
		["snooze"] = "rbxassetid://6026667006";
		["closed_caption_disabled"] = "rbxassetid://6026647900";
		["subscriptions"] = "rbxassetid://6026671207";
		["skip_next"] = "rbxassetid://6026667005";
		["branding_watermark"] = "rbxassetid://6026647911";
		["speed"] = "rbxassetid://6026681578";
		["art_track"] = "rbxassetid://6026647908";
		["3k"] = "rbxassetid://6026681574";
		["4k"] = "rbxassetid://6026643017";
		["volume_mute"] = "rbxassetid://6026671214";
		["playlist_play"] = "rbxassetid://6026663723";
		["remove_from_queue"] = "rbxassetid://6026663771";
		["fast_forward"] = "rbxassetid://6026647902";
		["play_disabled"] = "rbxassetid://6026663702";
		["fast_rewind"] = "rbxassetid://6026647942";
		["5k"] = "rbxassetid://6026681575";
		["replay_10"] = "rbxassetid://6026667007";
		["video_library"] = "rbxassetid://6026671208";
		["loop"] = "rbxassetid://6026660087";
		["replay_circle_filled"] = "rbxassetid://6026667002";
		["5g"] = "rbxassetid://6026643007";
		["library_add_check"] = "rbxassetid://6026660083";
		["repeat"] = "rbxassetid://6026666998";
		["queue_play_next"] = "rbxassetid://6026663700";
		["forward_5"] = "rbxassetid://6026660067";
		["web"] = "rbxassetid://6026671234";
		["mic_none"] = "rbxassetid://6026660066";
		["queue"] = "rbxassetid://6026663724";
		["closed_caption_off"] = "rbxassetid://6026647943";
		["hearing"] = "rbxassetid://6026660060";
		["queue_music"] = "rbxassetid://6026663725";
		["airplay"] = "rbxassetid://6026647929";
		["9k"] = "rbxassetid://6026643013";
		["video_label"] = "rbxassetid://6026671204";
		["8k_plus"] = "rbxassetid://6026643003";
		["play_circle_filled"] = "rbxassetid://6026663705";
		["1k"] = "rbxassetid://6026643002";
		["fiber_manual_record"] = "rbxassetid://6026647909";
		["closed_caption"] = "rbxassetid://6026647896";
		["subtitles"] = "rbxassetid://6026671203";
		["featured_video"] = "rbxassetid://6026647910";
		["replay_30"] = "rbxassetid://6026667010";
		["10k"] = "rbxassetid://6026643035";
		["5k_plus"] = "rbxassetid://6026643028";
		["6k_plus"] = "rbxassetid://6026643019";
		["replay"] = "rbxassetid://6026666999";
		["repeat_on"] = "rbxassetid://6026666994";
		["1k_plus"] = "rbxassetid://6026681580";
		["2k_plus"] = "rbxassetid://6026681588";
		["games"] = "rbxassetid://6026660074";
		["volume_down"] = "rbxassetid://6026671206";
		["mic"] = "rbxassetid://6026660078";
		["call_to_action"] = "rbxassetid://6026647898";
		["7k_plus"] = "rbxassetid://6026643012";
		["av_timer"] = "rbxassetid://6026647934";
		["9k_plus"] = "rbxassetid://6026681585";
		["radio"] = "rbxassetid://6026663698";
		["10mp"] = "rbxassetid://6031328149";
		["20mp"] = "rbxassetid://6031488940";
		["wb_twighlight"] = "rbxassetid://6034412760";
		["movie_creation"] = "rbxassetid://6034323681";
		["crop_portrait"] = "rbxassetid://6031630198";
		["filter_5"] = "rbxassetid://6031597518";
		["broken_image"] = "rbxassetid://6031471480";
		["flip_camera_android"] = "rbxassetid://6034333280";
		["flip_camera_ios"] = "rbxassetid://6034333267";
		["circle"] = "rbxassetid://6031625146";
		["photo_camera_front"] = "rbxassetid://6031771000";
		["assistant"] = "rbxassetid://6031360356";
		["face_retouching_natural"] = "rbxassetid://6034333274";
		["palette"] = "rbxassetid://6034316009";
		["nature_people"] = "rbxassetid://6034323711";
		["14mp"] = "rbxassetid://6031328161";
		["gradient"] = "rbxassetid://6034333261";
		["filter_4"] = "rbxassetid://6031597512";
		["panorama_wide_angle_select"] = "rbxassetid://6031770990";
		["photo"] = "rbxassetid://6031770993";
		["grid_off"] = "rbxassetid://6034333286";
		["leak_add"] = "rbxassetid://6034407074";
		["landscape"] = "rbxassetid://6034407069";
		["exposure_plus_1"] = "rbxassetid://6034328970";
		["slideshow"] = "rbxassetid://6031754546";
		["camera_alt"] = "rbxassetid://6031572307";
		["audiotrack"] = "rbxassetid://6031471489";
		["filter_none"] = "rbxassetid://6031600815";
		["blur_off"] = "rbxassetid://6031371055";
		["crop_16_9"] = "rbxassetid://6031630205";
		["blur_on"] = "rbxassetid://6031371068";
		["brightness_4"] = "rbxassetid://6031471483";
		["details"] = "rbxassetid://6034328968";
		["panorama_horizontal"] = "rbxassetid://6034315966";
		["camera_rear"] = "rbxassetid://6031572316";
		["hdr_weak"] = "rbxassetid://6034407083";
		["collections"] = "rbxassetid://6031625145";
		["hdr_enhanced_select"] = "rbxassetid://6034333281";
		["adjust"] = "rbxassetid://6031339048";
		["burst_mode"] = "rbxassetid://6031572306";
		["nature"] = "rbxassetid://6034323695";
		["brightness_6"] = "rbxassetid://6031572309";
		["19mp"] = "rbxassetid://6031339054";
		["grain"] = "rbxassetid://6034333288";
		["receipt_long"] = "rbxassetid://6031763428";
		["photo_filter"] = "rbxassetid://6031770992";
		["edit"] = "rbxassetid://6034328955";
		["healing"] = "rbxassetid://6034407071";
		["exposure_neg_1"] = "rbxassetid://6034328957";
		["exposure"] = "rbxassetid://6034328962";
		["wb_shade"] = "rbxassetid://6034315974";
		["compare"] = "rbxassetid://6031625151";
		["cases"] = "rbxassetid://6031572324";
		["timer_3"] = "rbxassetid://6031754540";
		["exposure_plus_2"] = "rbxassetid://6034328961";
		["12mp"] = "rbxassetid://6031328140";
		["22mp"] = "rbxassetid://6031360353";
		["timer_off"] = "rbxassetid://6031734881";
		["auto_stories"] = "rbxassetid://6031360360";
		["rotate_left"] = "rbxassetid://6031763427";
		["wb_iridescent"] = "rbxassetid://6034315972";
		["shutter_speed"] = "rbxassetid://6031763443";
		["switch_video"] = "rbxassetid://6031754536";
		["23mp"] = "rbxassetid://6031339045";
		["euro"] = "rbxassetid://6034328963";
		["15mp"] = "rbxassetid://6031328158";
		["filter_center_focus"] = "rbxassetid://6031600817";
		["photo_library"] = "rbxassetid://6031770998";
		["mp"] = "rbxassetid://6034323674";
		["looks_4"] = "rbxassetid://6034407089";
		["filter_2"] = "rbxassetid://6031597521";
		["crop_3_2"] = "rbxassetid://6034328956";
		["auto_fix_normal"] = "rbxassetid://6031371074";
		["auto_fix_off"] = "rbxassetid://6031360381";
		["wb_auto"] = "rbxassetid://6031734875";
		["switch_camera"] = "rbxassetid://6031754550";
		["filter_vintage"] = "rbxassetid://6031600811";
		["photo_size_select_small"] = "rbxassetid://6031763457";
		["blur_linear"] = "rbxassetid://6031488930";
		["hdr_on"] = "rbxassetid://6034333279";
		["tag_faces"] = "rbxassetid://6031754560";
		["21mp"] = "rbxassetid://6031339065";
		["camera"] = "rbxassetid://6031572312";
		["image_aspect_ratio"] = "rbxassetid://6034407073";
		["filter_b_and_w"] = "rbxassetid://6031600824";
		["crop_landscape"] = "rbxassetid://6031630202";
		["13mp"] = "rbxassetid://6031328137";
		["grid_on"] = "rbxassetid://6034333276";
		["motion_photos_pause"] = "rbxassetid://6034323668";
		["filter_6"] = "rbxassetid://6031597524";
		["linked_camera"] = "rbxassetid://6034407082";
		["panorama_fish_eye"] = "rbxassetid://6034315969";
		["panorama"] = "rbxassetid://6034315955";
		["color_lens"] = "rbxassetid://6031625148";
		["lens"] = "rbxassetid://6034407081";
		["crop_din"] = "rbxassetid://6031630208";
		["exposure_neg_2"] = "rbxassetid://6034328973";
		["mic_external_off"] = "rbxassetid://6034323672";
		["crop_free"] = "rbxassetid://6031630212";
		["crop_original"] = "rbxassetid://6031630204";
		["panorama_photosphere_select"] = "rbxassetid://6034315975";
		["photo_size_select_actual"] = "rbxassetid://6031771012";
		["leak_remove"] = "rbxassetid://6034407080";
		["collections_bookmark"] = "rbxassetid://6034328965";
		["straighten"] = "rbxassetid://6031754545";
		["timelapse"] = "rbxassetid://6031754541";
		["picture_as_pdf"] = "rbxassetid://6031763425";
		["crop_rotate"] = "rbxassetid://6031630203";
		["control_point_duplicate"] = "rbxassetid://6034328959";
		["photo_camera_back"] = "rbxassetid://6031771007";
		["looks_3"] = "rbxassetid://6034407088";
		["motion_photos_off"] = "rbxassetid://6034323670";
		["rotate_right"] = "rbxassetid://6031763429";
		["view_compact"] = "rbxassetid://6031734878";
		["crop_7_5"] = "rbxassetid://6031630197";
		["style"] = "rbxassetid://6031754538";
		["exposure_zero"] = "rbxassetid://6034329000";
		["camera_front"] = "rbxassetid://6031572318";
		["hdr_strong"] = "rbxassetid://6034333272";
		["view_comfy"] = "rbxassetid://6031734876";
		["panorama_vertical"] = "rbxassetid://6034315963";
		["panorama_vertical_select"] = "rbxassetid://6034315961";
		["looks_two"] = "rbxassetid://6034412757";
		["filter_drama"] = "rbxassetid://6031600813";
		["center_focus_strong"] = "rbxassetid://6031625147";
		["18mp"] = "rbxassetid://6031339064";
		["7mp"] = "rbxassetid://6031328139";
		["wb_sunny"] = "rbxassetid://6034412758";
		["filter_9_plus"] = "rbxassetid://6031600812";
		["crop"] = "rbxassetid://6034328964";
		["vignette"] = "rbxassetid://6031734905";
		["brightness_2"] = "rbxassetid://6031488938";
		["crop_square"] = "rbxassetid://6031630222";
		["looks_5"] = "rbxassetid://6034412764";
		["flip"] = "rbxassetid://6034333275";
		["looks_one"] = "rbxassetid://6034412761";
		["flash_off"] = "rbxassetid://6034333270";
		["hdr_off"] = "rbxassetid://6034333266";
		["photo_album"] = "rbxassetid://6031770989";
		["motion_photos_paused"] = "rbxassetid://6034323675";
		["photo_camera"] = "rbxassetid://6031770997";
		["2mp"] = "rbxassetid://6031328138";
		["3mp"] = "rbxassetid://6031328136";
		["24mp"] = "rbxassetid://6031360352";
		["filter_9"] = "rbxassetid://6031597534";
		["6mp"] = "rbxassetid://6031328131";
		["remove_red_eye"] = "rbxassetid://6031763426";
		["4mp"] = "rbxassetid://6031328152";
		["add_a_photo"] = "rbxassetid://6031339049";
		["filter_3"] = "rbxassetid://6031597513";
		["crop_5_4"] = "rbxassetid://6034328960";
		["8mp"] = "rbxassetid://6031328133";
		["camera_roll"] = "rbxassetid://6031572314";
		["panorama_wide_angle"] = "rbxassetid://6031770995";
		["transform"] = "rbxassetid://6031734873";
		["flare"] = "rbxassetid://6031600816";
		["image_search"] = "rbxassetid://6034407084";
		["auto_awesome"] = "rbxassetid://6031360365";
		["motion_photos_on"] = "rbxassetid://6034323669";
		["rotate_90_degrees_ccw"] = "rbxassetid://6031763456";
		["filter_1"] = "rbxassetid://6031597511";
		["filter_tilt_shift"] = "rbxassetid://6031600814";
		["image"] = "rbxassetid://6034407078";
		["center_focus_weak"] = "rbxassetid://6031625144";
		["blur_circular"] = "rbxassetid://6031488945";
		["bedtime"] = "rbxassetid://6031371054";
		["auto_fix_high"] = "rbxassetid://6031360355";
		["monochrome_photos"] = "rbxassetid://6034323678";
		["flash_auto"] = "rbxassetid://6034333287";
		["5mp"] = "rbxassetid://6031328144";
		["photo_size_select_large"] = "rbxassetid://6031763423";
		["assistant_photo"] = "rbxassetid://6031339052";
		["animation"] = "rbxassetid://6031625150";
		["looks"] = "rbxassetid://6034407096";
		["17mp"] = "rbxassetid://6031339055";
		["panorama_horizontal_select"] = "rbxassetid://6034315965";
		["flash_on"] = "rbxassetid://6034333271";
		["iso"] = "rbxassetid://6034407106";
		["music_note"] = "rbxassetid://6034323673";
		["music_off"] = "rbxassetid://6034323679";
		["navigate_next"] = "rbxassetid://6034315956";
		["timer"] = "rbxassetid://6031754564";
		["loupe"] = "rbxassetid://6034412770";
		["navigate_before"] = "rbxassetid://6034323696";
		["brightness_1"] = "rbxassetid://6031471488";
		["brightness_7"] = "rbxassetid://6031471491";
		["tonality"] = "rbxassetid://6031734891";
		["brush"] = "rbxassetid://6031572320";
		["colorize"] = "rbxassetid://6031625161";
		["filter_7"] = "rbxassetid://6031597515";
		["16mp"] = "rbxassetid://6031328168";
		["timer_10"] = "rbxassetid://6031734880";
		["portrait"] = "rbxassetid://6031763434";
		["tune"] = "rbxassetid://6031734877";
		["image_not_supported"] = "rbxassetid://6034407076";
		["wb_cloudy"] = "rbxassetid://6031734907";
		["auto_awesome_motion"] = "rbxassetid://6031360370";
		["filter_8"] = "rbxassetid://6031597532";
		["brightness_5"] = "rbxassetid://6031471479";
		["movie_filter"] = "rbxassetid://6034323687";
		["add_photo_alternate"] = "rbxassetid://6031471484";
		["add_to_photos"] = "rbxassetid://6031371075";
		["texture"] = "rbxassetid://6031754553";
		["11mp"] = "rbxassetid://6031328141";
		["mic_external_on"] = "rbxassetid://6034323671";
		["looks_6"] = "rbxassetid://6034412759";
		["dehaze"] = "rbxassetid://6031630200";
		["control_point"] = "rbxassetid://6031625131";
		["panorama_photosphere"] = "rbxassetid://6034412763";
		["filter_frames"] = "rbxassetid://6031600833";
		["auto_awesome_mosaic"] = "rbxassetid://6031371053";
		["9mp"] = "rbxassetid://6031328146";
		["filter"] = "rbxassetid://6031597514";
		["brightness_3"] = "rbxassetid://6031572317";
		["dirty_lens"] = "rbxassetid://6034328967";
		["wb_incandescent"] = "rbxassetid://6034316010";
		["filter_hdr"] = "rbxassetid://6031600819";
		["textsms"] = "rbxassetid://6035202006";
		["comment"] = "rbxassetid://6035181871";
		["call_end"] = "rbxassetid://6035173845";
		["qr_code_scanner"] = "rbxassetid://6035202022";
		["phonelink_setup"] = "rbxassetid://6035202025";
		["call_merge"] = "rbxassetid://6035173843";
		["phonelink_erase"] = "rbxassetid://6035202085";
		["contact_mail"] = "rbxassetid://6035181868";
		["contact_phone"] = "rbxassetid://6035181861";
		["screen_share"] = "rbxassetid://6035202008";
		["present_to_all"] = "rbxassetid://6035202020";
		["stay_primary_portrait"] = "rbxassetid://6035202009";
		["message"] = "rbxassetid://6035202033";
		["sentiment_satisfied_alt"] = "rbxassetid://6035202069";
		["stay_current_portrait"] = "rbxassetid://6035202004";
		["voicemail"] = "rbxassetid://6035202019";
		["business"] = "rbxassetid://6035173853";
		["mail_outline"] = "rbxassetid://6035190844";
		["vpn_key"] = "rbxassetid://6035202034";
		["forward_to_inbox"] = "rbxassetid://6035190840";
		["contacts"] = "rbxassetid://6035181864";
		["phonelink_ring"] = "rbxassetid://6035202066";
		["domain_disabled"] = "rbxassetid://6035181862";
		["person_add_disabled"] = "rbxassetid://6035202007";
		["stay_primary_landscape"] = "rbxassetid://6035202026";
		["alternate_email"] = "rbxassetid://6035173865";
		["phone_disabled"] = "rbxassetid://6035202028";
		["email"] = "rbxassetid://6035181866";
		["mobile_screen_share"] = "rbxassetid://6035202021";
		["live_help"] = "rbxassetid://6035190836";
		["chat_bubble"] = "rbxassetid://6035181858";
		["stop_screen_share"] = "rbxassetid://6035202042";
		["location_on"] = "rbxassetid://6035190846";
		["chat_bubble_outline"] = "rbxassetid://6035181869";
		["dialer_sip"] = "rbxassetid://6035181865";
		["no_sim"] = "rbxassetid://6035202030";
		["list_alt"] = "rbxassetid://6035190838";
		["call"] = "rbxassetid://6035173859";
		["pause_presentation"] = "rbxassetid://6035202015";
		["invert_colors_off"] = "rbxassetid://6035190842";
		["call_missed_outgoing"] = "rbxassetid://6035173847";
		["stay_current_landscape"] = "rbxassetid://6035202011";
		["import_export"] = "rbxassetid://6035202040";
		["add_ic_call"] = "rbxassetid://6035173839";
		["dialpad"] = "rbxassetid://6035181892";
		["nat"] = "rbxassetid://6035202082";
		["unsubscribe"] = "rbxassetid://6035202044";
		["mark_chat_unread"] = "rbxassetid://6035190841";
		["portable_wifi_off"] = "rbxassetid://6035202091";
		["location_off"] = "rbxassetid://6035202049";
		["person_search"] = "rbxassetid://6035202013";
		["phonelink_lock"] = "rbxassetid://6035202064";
		["desktop_access_disabled"] = "rbxassetid://6035181863";
		["import_contacts"] = "rbxassetid://6035190854";
		["rss_feed"] = "rbxassetid://6035202016";
		["chat"] = "rbxassetid://6035173838";
		["print_disabled"] = "rbxassetid://6035202041";
		["mark_email_read"] = "rbxassetid://6035202038";
		["hourglass_top"] = "rbxassetid://6035190886";
		["clear_all"] = "rbxassetid://6035181870";
		["forum"] = "rbxassetid://6035202002";
		["qr_code"] = "rbxassetid://6035202012";
		["speaker_phone"] = "rbxassetid://6035202018";
		["rtt"] = "rbxassetid://6035202010";
		["domain_verification"] = "rbxassetid://6035181867";
		["app_registration"] = "rbxassetid://6035173870";
		["call_split"] = "rbxassetid://6035173861";
		["cell_wifi"] = "rbxassetid://6035173852";
		["phone_enabled"] = "rbxassetid://6035202089";
		["call_made"] = "rbxassetid://6035173858";
		["call_received"] = "rbxassetid://6035173844";
		["phone"] = "rbxassetid://6035202017";
		["ring_volume"] = "rbxassetid://6035202032";
		["mark_email_unread"] = "rbxassetid://6035202027";
		["hourglass_bottom"] = "rbxassetid://6035202043";
		["read_more"] = "rbxassetid://6035202014";
		["duo"] = "rbxassetid://6035181860";
		["more_time"] = "rbxassetid://6035202036";
		["wifi_calling"] = "rbxassetid://6035202065";
		["swap_calls"] = "rbxassetid://6035202037";
		["cancel_presentation"] = "rbxassetid://6035173837";
		["call_missed"] = "rbxassetid://6035173850";
		["mark_chat_read"] = "rbxassetid://6035202031";
		["text_snippet"] = "rbxassetid://6031302995";
		["snippet_folder"] = "rbxassetid://6031302947";
		["workspaces_outline"] = "rbxassetid://6031302952";
		["file_download"] = "rbxassetid://6031302931";
		["request_quote"] = "rbxassetid://6031302941";
		["approval"] = "rbxassetid://6031302928";
		["drive_folder_upload"] = "rbxassetid://6031302929";
		["rule_folder"] = "rbxassetid://6031302940";
		["attach_email"] = "rbxassetid://6031302935";
		["topic"] = "rbxassetid://6031302976";
		["upload_file"] = "rbxassetid://6031302959";
		["attachment"] = "rbxassetid://6031302921";
		["file_download_done"] = "rbxassetid://6031302926";
		["drive_file_move_outline"] = "rbxassetid://6031302924";
		["cloud_upload"] = "rbxassetid://6031302992";
		["cloud_circle"] = "rbxassetid://6031302919";
		["folder_shared"] = "rbxassetid://6031302945";
		["cloud_download"] = "rbxassetid://6031302917";
		["file_upload"] = "rbxassetid://6031302996";
		["workspaces_filled"] = "rbxassetid://6031302961";
		["cloud_queue"] = "rbxassetid://6031302916";
		["cloud"] = "rbxassetid://6031302918";
		["folder_open"] = "rbxassetid://6031302934";
		["grid_view"] = "rbxassetid://6031302950";
		["cloud_off"] = "rbxassetid://6031302993";
		["create_new_folder"] = "rbxassetid://6031302933";
		["cloud_done"] = "rbxassetid://6031302927";
		["folder"] = "rbxassetid://6031302932";
		["drive_file_move"] = "rbxassetid://6031302922";
		["drive_file_rename_outline"] = "rbxassetid://6031302994";
		["notifications_active"] = "rbxassetid://6034304908";
		["sentiment_neutral"] = "rbxassetid://6034230636";
		["sick"] = "rbxassetid://6034230642";
		["poll"] = "rbxassetid://6034267991";
		["emoji_events"] = "rbxassetid://6034275726";
		["groups"] = "rbxassetid://6034281935";
		["sports_soccer"] = "rbxassetid://6034227075";
		["person_add"] = "rbxassetid://6034287514";
		["mood_bad"] = "rbxassetid://6034295706";
		["person_remove_alt_1"] = "rbxassetid://6034287515";
		["king_bed"] = "rbxassetid://6034281948";
		["architecture"] = "rbxassetid://6034275730";
		["deck"] = "rbxassetid://6034295703";
		["group_add"] = "rbxassetid://6034281909";
		["sports_basketball"] = "rbxassetid://6034230649";
		["emoji_symbols"] = "rbxassetid://6034281899";
		["switch_account"] = "rbxassetid://6034227138";
		["remove_moderator"] = "rbxassetid://6034267998";
		["coronavirus"] = "rbxassetid://6034275724";
		["people"] = "rbxassetid://6034287513";
		["person"] = "rbxassetid://6034287594";
		["elderly"] = "rbxassetid://6034295698";
		["clean_hands"] = "rbxassetid://6034275729";
		["emoji_flags"] = "rbxassetid://6034304898";
		["psychology"] = "rbxassetid://6034287516";
		["person_add_alt"] = "rbxassetid://6034267994";
		["sports_volleyball"] = "rbxassetid://6034227139";
		["domain"] = "rbxassetid://6034275722";
		["emoji_objects"] = "rbxassetid://6034281900";
		["ios_share"] = "rbxassetid://6034281941";
		["history_edu"] = "rbxassetid://6034281934";
		["share"] = "rbxassetid://6034230648";
		["military_tech"] = "rbxassetid://6034295711";
		["sports_kabaddi"] = "rbxassetid://6034227141";
		["cake"] = "rbxassetid://6034295702";
		["engineering"] = "rbxassetid://6034281908";
		["emoji_food_beverage"] = "rbxassetid://6034304883";
		["notifications_none"] = "rbxassetid://6034308947";
		["emoji_people"] = "rbxassetid://6034281904";
		["thumb_down_alt"] = "rbxassetid://6034227069";
		["sentiment_very_satisfied"] = "rbxassetid://6034230650";
		["nights_stay"] = "rbxassetid://6034304881";
		["reduce_capacity"] = "rbxassetid://6034268013";
		["add_moderator"] = "rbxassetid://6034295699";
		["science"] = "rbxassetid://6034230640";
		["pages"] = "rbxassetid://6034304892";
		["sentiment_satisfied"] = "rbxassetid://6034230668";
		["plus_one"] = "rbxassetid://6034268012";
		["party_mode"] = "rbxassetid://6034287521";
		["person_remove"] = "rbxassetid://6034267996";
		["single_bed"] = "rbxassetid://6034230651";
		["mood"] = "rbxassetid://6034295704";
		["public"] = "rbxassetid://6034287522";
		["sports_rugby"] = "rbxassetid://6034227073";
		["sports_handball"] = "rbxassetid://6034227074";
		["person_add_alt_1"] = "rbxassetid://6034287519";
		["people_alt"] = "rbxassetid://6034287518";
		["notifications_off"] = "rbxassetid://6034304894";
		["whatshot"] = "rbxassetid://6034287525";
		["emoji_transportation"] = "rbxassetid://6034281894";
		["outdoor_grill"] = "rbxassetid://6034304900";
		["sentiment_very_dissatisfied"] = "rbxassetid://6034230659";
		["masks"] = "rbxassetid://6034295710";
		["luggage"] = "rbxassetid://6034295708";
		["sports_motorsports"] = "rbxassetid://6034227071";
		["sports_esports"] = "rbxassetid://6034227061";
		["location_city"] = "rbxassetid://6034304889";
		["sports_golf"] = "rbxassetid://6034227060";
		["sentiment_dissatisfied"] = "rbxassetid://6034230637";
		["no_luggage"] = "rbxassetid://6034304891";
		["fireplace"] = "rbxassetid://6034281910";
		["emoji_nature"] = "rbxassetid://6034281896";
		["group"] = "rbxassetid://6034281901";
		["thumb_up_alt"] = "rbxassetid://6034227076";
		["sports_tennis"] = "rbxassetid://6034227068";
		["facebook"] = "rbxassetid://6034281898";
		["sports_mma"] = "rbxassetid://6034227072";
		["person_outline"] = "rbxassetid://6034268008";
		["sports_baseball"] = "rbxassetid://6034230652";
		["sports_cricket"] = "rbxassetid://6034230660";
		["people_outline"] = "rbxassetid://6034287528";
		["notifications_paused"] = "rbxassetid://6034304896";
		["emoji_emotions"] = "rbxassetid://6034275731";
		["follow_the_signs"] = "rbxassetid://6034281911";
		["sanitizer"] = "rbxassetid://6034287586";
		["self_improvement"] = "rbxassetid://6034230634";
		["notifications"] = "rbxassetid://6034308946";
		["public_off"] = "rbxassetid://6034287538";
		["recommend"] = "rbxassetid://6034287524";
		["sports_football"] = "rbxassetid://6034227067";
		["sports_hockey"] = "rbxassetid://6034227064";
		["school"] = "rbxassetid://6034230641";
		["connect_without_contact"] = "rbxassetid://6034275800";
		["sports"] = "rbxassetid://6034230647";
		["construction"] = "rbxassetid://6034275725";
		["inventory"] = "rbxassetid://6035056487";
		["add_box"] = "rbxassetid://6035047375";
		["how_to_reg"] = "rbxassetid://6035053288";
		["unarchive"] = "rbxassetid://6035078921";
		["block_flipped"] = "rbxassetid://6035047378";
		["file_copy"] = "rbxassetid://6035053293";
		["bolt"] = "rbxassetid://6035047381";
		["remove_circle_outline"] = "rbxassetid://6035067843";
		["move_to_inbox"] = "rbxassetid://6035067838";
		["save_alt"] = "rbxassetid://6035067842";
		["weekend"] = "rbxassetid://6035078894";
		["where_to_vote"] = "rbxassetid://6035078913";
		["biotech"] = "rbxassetid://6035047385";
		["report_off"] = "rbxassetid://6035067830";
		["clear"] = "rbxassetid://6035047409";
		["redo"] = "rbxassetid://6035056483";
		["link"] = "rbxassetid://6035056475";
		["drafts"] = "rbxassetid://6035053297";
		["push_pin"] = "rbxassetid://6035056481";
		["reply"] = "rbxassetid://6035067844";
		["undo"] = "rbxassetid://6035078896";
		["archive"] = "rbxassetid://6035047379";
		["add"] = "rbxassetid://6035047377";
		["insights"] = "rbxassetid://6035067839";
		["flag"] = "rbxassetid://6035053279";
		["save"] = "rbxassetid://6035067857";
		["text_format"] = "rbxassetid://6035078890";
		["content_cut"] = "rbxassetid://6035053280";
		["ballot"] = "rbxassetid://6035047386";
		["remove"] = "rbxassetid://6035067836";
		["calculate"] = "rbxassetid://6035047384";
		["report"] = "rbxassetid://6035067826";
		["markunread"] = "rbxassetid://6035056476";
		["delete_sweep"] = "rbxassetid://6035053301";
		["gesture"] = "rbxassetid://6035053287";
		["link_off"] = "rbxassetid://6035056484";
		["forward"] = "rbxassetid://6035053298";
		["reply_all"] = "rbxassetid://6035067824";
		["how_to_vote"] = "rbxassetid://6035053295";
		["square_foot"] = "rbxassetid://6035078918";
		["outlined_flag"] = "rbxassetid://6035056486";
		["add_circle"] = "rbxassetid://6035047380";
		["stacked_bar_chart"] = "rbxassetid://6035078892";
		["policy"] = "rbxassetid://6035056512";
		["backspace"] = "rbxassetid://6035047397";
		["sort"] = "rbxassetid://6035078888";
		["content_paste"] = "rbxassetid://6035053285";
		["low_priority"] = "rbxassetid://6035056491";
		["font_download"] = "rbxassetid://6035053275";
		["shield"] = "rbxassetid://6035078889";
		["waves"] = "rbxassetid://6035078898";
		["select_all"] = "rbxassetid://6035067834";
		["dynamic_feed"] = "rbxassetid://6035053289";
		["mail"] = "rbxassetid://6035056477";
		["amp_stories"] = "rbxassetid://6035047382";
		["filter_list"] = "rbxassetid://6035053294";
		["send"] = "rbxassetid://6035067832";
		["create"] = "rbxassetid://6035053304";
		["stream"] = "rbxassetid://6035078897";
		["next_week"] = "rbxassetid://6035067835";
		["inbox"] = "rbxassetid://6035067831";
		["add_link"] = "rbxassetid://6035047374";
		["content_copy"] = "rbxassetid://6035053278";
		["remove_circle"] = "rbxassetid://6035067837";
		["add_circle_outline"] = "rbxassetid://6035047391";
		["block"] = "rbxassetid://6035047387";
		["tag"] = "rbxassetid://6035078895";
		["beach_access"] = "rbxassetid://6035107923";
		["stroller"] = "rbxassetid://6035161535";
		["family_restroom"] = "rbxassetid://6035121916";
		["corporate_fare"] = "rbxassetid://6035121908";
		["no_meeting_room"] = "rbxassetid://6035153649";
		["do_not_touch"] = "rbxassetid://6035121915";
		["ac_unit"] = "rbxassetid://6035107929";
		["business_center"] = "rbxassetid://6035107933";
		["spa"] = "rbxassetid://6035153639";
		["no_flash"] = "rbxassetid://6035145424";
		["no_cell"] = "rbxassetid://6035145376";
		["room_service"] = "rbxassetid://6035153648";
		["tapas"] = "rbxassetid://6035161533";
		["microwave"] = "rbxassetid://6035145367";
		["meeting_room"] = "rbxassetid://6035145361";
		["wash"] = "rbxassetid://6035161540";
		["escalator"] = "rbxassetid://6035121939";
		["house_siding"] = "rbxassetid://6035145393";
		["food_bank"] = "rbxassetid://6035121921";
		["foundation"] = "rbxassetid://6035121918";
		["elevator"] = "rbxassetid://6035121912";
		["room_preferences"] = "rbxassetid://6035153642";
		["do_not_step"] = "rbxassetid://6035121910";
		["free_breakfast"] = "rbxassetid://6035145363";
		["house"] = "rbxassetid://6035145364";
		["child_care"] = "rbxassetid://6035107927";
		["night_shelter"] = "rbxassetid://6035145378";
		["child_friendly"] = "rbxassetid://6035121942";
		["checkroom"] = "rbxassetid://6035107931";
		["hot_tub"] = "rbxassetid://6035145382";
		["dry"] = "rbxassetid://6035121909";
		["charging_station"] = "rbxassetid://6035107925";
		["all_inclusive"] = "rbxassetid://6035107920";
		["bento"] = "rbxassetid://6035107924";
		["no_backpack"] = "rbxassetid://6035145368";
		["storefront"] = "rbxassetid://6035161534";
		["no_food"] = "rbxassetid://6035145372";
		["backpack"] = "rbxassetid://6035107928";
		["stairs"] = "rbxassetid://6035153637";
		["carpenter"] = "rbxassetid://6035107955";
		["no_stroller"] = "rbxassetid://6035153661";
		["roofing"] = "rbxassetid://6035153656";
		["umbrella"] = "rbxassetid://6035161550";
		["sports_bar"] = "rbxassetid://6035153638";
		["apartment"] = "rbxassetid://6035107922";
		["smoke_free"] = "rbxassetid://6035153647";
		["pool"] = "rbxassetid://6035153655";
		["bathtub"] = "rbxassetid://6035107939";
		["no_drinks"] = "rbxassetid://6035145390";
		["escalator_warning"] = "rbxassetid://6035121930";
		["wheelchair_pickup"] = "rbxassetid://6035161536";
		["smoking_rooms"] = "rbxassetid://6035153636";
		["rice_bowl"] = "rbxassetid://6035153662";
		["tty"] = "rbxassetid://6035161541";
		["no_photography"] = "rbxassetid://6035153664";
		["casino"] = "rbxassetid://6035107936";
		["fence"] = "rbxassetid://6035121923";
		["grass"] = "rbxassetid://6035145359";
		["countertops"] = "rbxassetid://6035121914";
		["kitchen"] = "rbxassetid://6035145362";
		["golf_course"] = "rbxassetid://6035145423";
		["soap"] = "rbxassetid://6035153645";
		["water_damage"] = "rbxassetid://6035161563";
		["airport_shuttle"] = "rbxassetid://6035107921";
		["fitness_center"] = "rbxassetid://6035121907";
		["baby_changing_station"] = "rbxassetid://6035107930";
		["fire_extinguisher"] = "rbxassetid://6035121913";
		["sparkle"] = "rbxassetid://4483362748"
	}
}

-- Other Variables
local request = (syn and syn.request) or (http and http.request) or http_request or nil
local tweeninfo = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local PresetGradients = {
	["Nightlight (Classic)"] = {Color3.fromRGB(147, 255, 239), Color3.fromRGB(201,211,233), Color3.fromRGB(255, 167, 227)},
	["Nightlight (Neo)"] = {Color3.fromRGB(117, 164, 206), Color3.fromRGB(123, 201, 201), Color3.fromRGB(224, 138, 175)},
	Starlight = {Color3.fromRGB(147, 255, 239), Color3.fromRGB(181, 206, 241), Color3.fromRGB(214, 158, 243)},
	Solar = {Color3.fromRGB(242, 157, 76), Color3.fromRGB(240, 179, 81), Color3.fromRGB(238, 201, 86)},
	Sparkle = {Color3.fromRGB(199, 130, 242), Color3.fromRGB(221, 130, 238), Color3.fromRGB(243, 129, 233)},
	Lime = {Color3.fromRGB(170, 255, 127), Color3.fromRGB(163, 220, 138), Color3.fromRGB(155, 185, 149)},
	Vine = {Color3.fromRGB(0, 191, 143), Color3.fromRGB(0, 126, 94), Color3.fromRGB(0, 61, 46)},
	Cherry = {Color3.fromRGB(148, 54, 54), Color3.fromRGB(168, 67, 70), Color3.fromRGB(188, 80, 86)},
	Daylight = {Color3.fromRGB(51, 156, 255), Color3.fromRGB(89, 171, 237), Color3.fromRGB(127, 186, 218)},
	Blossom = {Color3.fromRGB(255, 165, 243), Color3.fromRGB(213, 129, 231), Color3.fromRGB(170, 92, 218)},
}

local function GetIcon(icon, source)
	if source == "Custom" then
		return "rbxassetid://" .. icon
	elseif source == "Lucide" then
		-- full credit to latte softworks :)
		local iconData = not isStudio and game:HttpGet("https://raw.githubusercontent.com/latte-soft/lucide-roblox/refs/heads/master/lib/Icons.luau")
		local icons = isStudio and IconModule.Lucide or loadstring(iconData)()
		if not isStudio then
			icon = string.match(string.lower(icon), "^%s*(.*)%s*$") :: string
			local sizedicons = icons['48px']

			local r = sizedicons[icon]
			if not r then
				error("Lucide Icons: Failed to find icon by the name of \"" .. icon .. "\.", 2)
			end

			local rirs = r[2]
			local riro = r[3]

			if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
				error("Lucide Icons: Internal error: Invalid auto-generated asset entry")
			end

			local irs = Vector2.new(rirs[1], rirs[2])
			local iro = Vector2.new(riro[1], riro[2])

			local asset = {
				id = r[1],
				imageRectSize = irs,
				imageRectOffset = iro,
			}

			return asset
		else
			return "rbxassetid://10723434557"
		end
	else	
		if icon ~= nil and IconModule[source] then
			local sourceicon = IconModule[source]
			return sourceicon[icon]
		else
			return nil
		end
	end
end

local function RemoveTable(tablre, value)
	for i,v in pairs(tablre) do
		if tostring(v) == tostring(value) then
			table.remove(tablre, i)
		end
	end
end

local function Kwargify(defaults, passed)
	for i, v in pairs(defaults) do
		if passed[i] == nil then
			passed[i] = v
		end
	end
	return passed
end

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

function tween(object, goal, callback, tweenin)
	local tween = TweenService:Create(object,tweenin or tweeninfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local function unpackt(array : table)
	local val = ""
	local i = 0
	for _,v in pairs(array) do
		if i < 3 then
			val = val .. v .. ", "
			i += 1
		else
			val = "Various"
			break
		end
	end

	return val
end

-- Interface Management
local NutriexLibrary = isStudio and script.Parent:WaitForChild("Nutriex UI") or game:GetObjects("rbxassetid://86467455075715")[1]

local SizeBleh = nil

local function Hide(Window, bind, notif)
	SizeBleh = Window.Size
	bind = string.split(tostring(bind), "Enum.KeyCode.")
	bind = bind[2]
	tween(Window, {BackgroundTransparency = 1})
	tween(Window.Elements, {BackgroundTransparency = 1})
	tween(Window.Line, {BackgroundTransparency = 1})
	tween(Window.Title.Title, {TextTransparency = 1})
	tween(Window.Title.subtitle, {TextTransparency = 1})
	tween(Window.Logo, {ImageTransparency = 1})
	tween(Window.Navigation.Line, {BackgroundTransparency = 1})

	for _, TopbarButton in ipairs(Window.Controls:GetChildren()) do
		if TopbarButton.ClassName == "Frame" then
			tween(TopbarButton, {BackgroundTransparency = 1})
			tween(TopbarButton.UIStroke, {Transparency = 1})
			tween(TopbarButton.ImageLabel, {ImageTransparency = 1})
			TopbarButton.Visible = false
		end
	end
	for _, tabbtn in ipairs(Window.Navigation.Tabs:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "InActive Template" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.DropShadowHolder.DropShadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
		end
	end

	task.wait(0.28)
	Window.Size = UDim2.new(0,0,0,0)
	Window.Parent.ShadowHolder.Visible = false
	task.wait()
	Window.Elements.Parent.Visible = false
	Window.Visible = false
end


if gethui then
	NutriexLibrary.Parent = gethui()
elseif syn and syn.protect_gui then 
	syn.protect_gui(NutriexLibrary)
	NutriexLibrary.Parent = CoreGui
elseif not isStudio and CoreGui:FindFirstChild("RobloxGui") then
	NutriexLibrary.Parent = CoreGui:FindFirstChild("RobloxGui")
elseif not isStudio then
	NutriexLibrary.Parent = CoreGui
end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == NutriexLibrary.Name and Interface ~= NutriexLibrary then
			Hide(Interface.SmartWindow)
			Interface.Enabled = false
			Interface.Name = "Nutriex-Old"
		end
	end
elseif not isStudio then
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == NutriexLibrary.Name and Interface ~= NutriexLibrary then
			Hide(Interface.SmartWindow)
			Interface.Enabled = false
			Interface.Name = "Nutriex-Old"
		end
	end
end

NutriexLibrary.Enabled = false
NutriexLibrary.SmartWindow.Visible = false
NutriexLibrary.Notifications.Template.Visible = false
NutriexLibrary.DisplayOrder = 1000000

local Main : Frame = NutriexLibrary.SmartWindow
local Dragger = Main.Drag
local dragBar = NutriexLibrary.Drag
local dragInteract = dragBar and dragBar.Interact or nil
local dragBarCosmetic = dragBar and dragBar.Drag or nil
local Elements = Main.Elements.Interactions
local LoadingFrame = Main.LoadingFrame
local Navigation = Main.Navigation
local Tabs = Navigation.Tabs
local Notifications = NutriexLibrary.Notifications
local KeySystem : Frame = Main.KeySystem

-- local function LoadConfiguration(Configuration, autoload)
-- 	local Data = HttpService:JSONDecode(Configuration)
-- 	local changed
-- 	local notified = false

-- 	-- Iterate through current UI elements' flags
-- 	for FlagName, Flag in pairs(Nutriex.Flags) do
-- 		local FlagValue = Data[FlagName]

-- 		if FlagValue then
-- 			task.spawn(function()
-- 				if Flag.Type == "ColorPicker" then
-- 					changed = true
-- 					Flag:Set(UnpackColor(FlagValue))
-- 				else
-- 					if (Flag.CurrentValue or Flag.CurrentKeybind or Flag.CurrentOption or Flag.Color) ~= FlagValue then 
-- 						changed = true
-- 						Flag:Set(FlagValue) 	
-- 					end
-- 				end
-- 			end)
-- 		else
-- 			notified = true
-- 			Nutriex:Notification({Title = "Config Error", Content = "Nutriex was unable to load or find '"..FlagName.. "'' in the current script. Check ".. website .." for help.", Icon = "flag"})
-- 		end
-- 	end
-- 	if autoload and notified == false then
-- 		Nutriex:Notification({
-- 			Title = "Config Autoloaded",
-- 			Content = "The Configuration Has Been Automatically Loaded. ",
-- 			Icon = "file-code-2",
-- 			ImageSource = "Lucide"
-- 		})
-- 	elseif notified == false then
-- 		Nutriex:Notification({
-- 			Title = "Config Loaded",
-- 			Content = "The Configuration Has Been Loaded. ",
-- 			Icon = "file-code-2",
-- 			ImageSource = "Lucide"
-- 		})
-- 	end

-- 	return changed
-- end

-- local function SaveConfiguration(Configuration, ConfigFolder, hasRoot)
-- 	local Data = {}
-- 	for i,v in pairs(Nutriex.Flags) do
-- 		if v.Type == "ColorPicker" then
-- 			Data[i] = PackColor(v.Color)
-- 		else
-- 			Data[i] = v.CurrentValue or v.CurrentBind or v.CurrentOption or v.Color
-- 		end
-- 	end	
-- 	if hasRoot then
-- 		writefile(ConfigurationFolder .. "/" .. hasRoot .. "/" .. ConfigFolder .. "/" .. Configuration .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
-- 	else
-- 		writefile(ConfigurationFolder .. "/" .. "/" .. ConfigFolder .. Configuration .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
-- 	end
-- end

-- local function SetAutoload(ConfigName, ConfigFolder, hasRoot)
-- 	if hasRoot then
-- 		writefile(ConfigurationFolder .. "/" .. hasRoot .. "/" .. ConfigFolder .. "/" .. "autoload.txt", tostring(ConfigName) .. ConfigurationExtension)
-- 	else
-- 		writefile(ConfigurationFolder .. "/" .. "/" .. ConfigFolder .. "autoload.txt", tostring(ConfigName) .. ConfigurationExtension)
-- 	end
-- end

-- local function LoadAutoLoad(ConfigFolder, hasRoot)
-- 	local autoload = isfile(ConfigurationFolder .. "/" .. "/" .. ConfigFolder .. "autoload.txt")
-- 	if hasRoot then
-- 		autoload = isfile(ConfigurationFolder .. "/" .. hasRoot .. "/" .. ConfigFolder .. "/" .. "autoload.txt")
-- 	end

-- 	if autoload then
-- 		if hasRoot then
-- 			LoadConfiguration(readfile(ConfigurationFolder .. "/" .. hasRoot .. "/" .. ConfigFolder .. "/" .. readfile(ConfigurationFolder .. "/" .. hasRoot .. "/" .. ConfigFolder .. "/" .. "autoload.txt")), true)
-- 		else
-- 			LoadConfiguration(readfile(ConfigurationFolder .. "/" .. ConfigFolder .. "/" .. readfile(ConfigurationFolder .. "/" .. ConfigFolder .. "/" .. "autoload.txt")), true)
-- 		end
-- 	end
-- end

local UserInputService = game:GetService("UserInputService")

local function Draggable(Bar, Window)
    local Dragging = false
    local DragInput, MousePos, WindowPos

    Bar.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            MousePos = Input.Position
            WindowPos = Window.AbsolutePosition

            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    Bar.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            DragInput = Input
        end
    end)

    UserInputService.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            local Delta = Input.Position - MousePos
            Window.Position = UDim2.new(
                WindowPos.X.Scale, 
                WindowPos.X.Offset + Delta.X, 
                WindowPos.Y.Scale, 
                WindowPos.Y.Offset + Delta.Y
            )
        end
    end)
end

function Nutriex:Notification(data)
    task.spawn(function()
        data = Kwargify({
            Title = "Missing Title",
            Content = "Missing or Unknown Content",
            Icon = "view_in_ar",
            ImageSource = "Material",
            Duration = nil
        }, data or {})

        local newNotification = Notifications.Template:Clone()
        newNotification.Name = data.Title
        newNotification.Parent = Notifications
        newNotification.LayoutOrder = #Notifications:GetChildren()
        newNotification.Visible = false

        newNotification.Title.Text = data.Title
        newNotification.Description.Text = data.Content 

        local successIcon, iconAsset = pcall(function()
            return GetIcon(data.Icon, data.ImageSource)
        end)
        newNotification.Icon.Image = (successIcon and iconAsset and iconAsset ~= "") and iconAsset or "rbxassetid://0"

        newNotification.BackgroundTransparency = 1
        newNotification.Title.TextTransparency = 1
        newNotification.Description.TextTransparency = 1
        newNotification.UIStroke.Transparency = 1
        if newNotification:FindFirstChild("Shadow") then
            newNotification.Shadow.ImageTransparency = 1
        end
        newNotification.Icon.ImageTransparency = 1

        local paddingOffset = Notifications:FindFirstChildOfClass("UIListLayout") and Notifications.UIListLayout.Padding.Offset or 6
        newNotification.Size = UDim2.new(1, 0, 0, 0)
        newNotification.Icon.Size = UDim2.new(0, 24, 0, 24)
        newNotification.Icon.Position = UDim2.new(0, 14, 0.5, -12)

        newNotification.Visible = true

        task.wait()
        
        newNotification.Description.Size = UDim2.new(1, -60, 0, 0)
        local boundsHeight = math.max(newNotification.Description.TextBounds.Y + 45, 52)

        TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 0, boundsHeight),
            BackgroundTransparency = 0.45
        }):Play()

        TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Transparency = 0.85}):Play()
        if newNotification:FindFirstChild("Shadow") then
            TweenService:Create(newNotification.Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {ImageTransparency = 0.82}):Play()
        end

        TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {TextTransparency = 0}):Play()
        TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {TextTransparency = 0.25}):Play()
        TweenService:Create(newNotification.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {ImageTransparency = 0}):Play()

        local autoDuration = math.min(math.max((#newNotification.Description.Text * 0.08) + 2.5, 3), 8)
        task.wait(data.Duration or autoDuration)

        local fadeOutTween = TweenService:Create(newNotification, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        })
        
        TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Transparency = 1}):Play()
        if newNotification:FindFirstChild("Shadow") then
            TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {ImageTransparency = 1}):Play()
        end
        TweenService:Create(newNotification.Title, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
        TweenService:Create(newNotification.Description, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
        TweenService:Create(newNotification.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {ImageTransparency = 1}):Play()

        fadeOutTween:Play()
        fadeOutTween.Completed:Wait()

        local shrinkTween = TweenService:Create(newNotification, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 0, -paddingOffset)
        })
        shrinkTween:Play()
        shrinkTween.Completed:Wait()

        newNotification.Visible = false
        newNotification:Destroy()
    end)
end

local function Unhide(Window, currentTab)
	Window.Size = SizeBleh
	Window.Elements.Visible = true
	Window.Visible = true
	task.wait()
	tween(Window, {BackgroundTransparency = 0.2})
	tween(Window.Elements, {BackgroundTransparency = 0.08})
	tween(Window.Line, {BackgroundTransparency = 0})
	tween(Window.Title.Title, {TextTransparency = 0})
	tween(Window.Title.subtitle, {TextTransparency = 0})
	tween(Window.Logo, {ImageTransparency = 0})
	tween(Window.Navigation.Line, {BackgroundTransparency = 0})

	for _, TopbarButton in ipairs(Window.Controls:GetChildren()) do
		if TopbarButton.ClassName == "Frame" and TopbarButton.Name ~= "Theme" then
			TopbarButton.Visible = true
			tween(TopbarButton, {BackgroundTransparency = 0.25})
			tween(TopbarButton.UIStroke, {Transparency = 0.5})
			tween(TopbarButton.ImageLabel, {ImageTransparency = 0.25})
		end
	end
	for _, tabbtn in ipairs(Window.Navigation.Tabs:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "InActive Template" then
			if tabbtn.Name == currentTab then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.41}):Play()
			end
			TweenService:Create(tabbtn.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
			TweenService:Create(tabbtn.DropShadowHolder.DropShadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
		end
	end

end

local MainSize
local MinSize 
if Camera.ViewportSize.X > 774 and Camera.ViewportSize.Y > 503 then
	MainSize = UDim2.fromOffset(675, 424)
	MinSize = UDim2.fromOffset(500, 42)
else
	MainSize = UDim2.fromOffset(Camera.ViewportSize.X - 100, Camera.ViewportSize.Y - 100)
	MinSize = UDim2.fromOffset(Camera.ViewportSize.X - 275, 42)
end

local function Maximise(Window)
	Window.Controls.ToggleSize.ImageLabel.Image = "rbxassetid://10137941941"
	tween(Window, {Size = MainSize})
	Window.Elements.Visible = true
	Window.Navigation.Visible = true
end

local function Minimize(Window)
	Window.Controls.ToggleSize.ImageLabel.Image = "rbxassetid://11036884234"
	Window.Elements.Visible = false
	Window.Navigation.Visible = false
	tween(Window, {Size = MinSize})
end


function Nutriex:CreateWindow(WindowSettings)

	WindowSettings = Kwargify({
		Name = "Nutriex UI Example Window",
		Subtitle = "",
		LogoID = "6031097225",
		LoadingEnabled = true,
		LoadingTitle = "Nutriex Interface Suite",
		LoadingSubtitle = "by Nebula Softworks",

		ConfigSettings = {},

		KeySystem = false,
		KeySettings = {}
	}, WindowSettings or {})

	WindowSettings.ConfigSettings = Kwargify({
		RootFolder = nil,
		ConfigFolder = "Big Hub"
	}, WindowSettings.ConfigSettings or {})

	WindowSettings.KeySettings = Kwargify({
		Title = WindowSettings.Name,
		Subtitle = "Key System",
		Note = "No Instructions",
		SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		Key = {""}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		SecondAction = {}	
	}, WindowSettings.KeySettings or {})

	WindowSettings.KeySettings.SecondAction = Kwargify({
		Enabled = false,
		Type = "Discord", -- Link/Discord
		Parameter = "" -- for discord, add the invite link like home tab. for link, type the link of ur key sys
	}, WindowSettings.KeySettings.SecondAction)

	local Passthrough = false

	local Window = { Bind = Enum.KeyCode.K, CurrentTab = nil, State = true, Size = false, Settings = nil }

	Main.Title.Title.Text = WindowSettings.Name
	Main.Title.subtitle.Text = WindowSettings.Subtitle
	Main.Logo.Image = "rbxassetid://" .. WindowSettings.LogoID
	Main.Visible = true
	Main.BackgroundTransparency = 1
	Main.Size = MainSize
	Main.Size = UDim2.fromOffset(Main.Size.X.Offset - 70, Main.Size.Y.Offset - 55)
	Main.Parent.ShadowHolder.Size = Main.Size
	LoadingFrame.Frame.Frame.Title.TextTransparency = 1
	LoadingFrame.Frame.Frame.Subtitle.TextTransparency = 1
	LoadingFrame.Version.TextTransparency = 1
	LoadingFrame.Frame.ImageLabel.ImageTransparency = 1

	tween(Elements.Parent, {BackgroundTransparency = 1})
	Elements.Parent.Visible = false

	LoadingFrame.Frame.Frame.Title.Text = WindowSettings.LoadingTitle
	LoadingFrame.Frame.Frame.Subtitle.Text = WindowSettings.LoadingSubtitle
	LoadingFrame.Version.Text = LoadingFrame.Frame.Frame.Title.Text == "By CyberX"

	Navigation.Player.icon.ImageLabel.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	Navigation.Player.Namez.Text = Players.LocalPlayer.DisplayName
	Navigation.Player.TextLabel.Text = Players.LocalPlayer.Name

	for i,v in pairs(Main.Controls:GetChildren()) do
		v.Visible = false
	end

	Main:GetPropertyChangedSignal("Position"):Connect(function()
		Main.Parent.ShadowHolder.Position = Main.Position
	end)
	Main:GetPropertyChangedSignal("Size"):Connect(function()
		Main.Parent.ShadowHolder.Size = Main.Size
	end)

	LoadingFrame.Visible = true

	-- pcall(function()
	-- 	if not isfolder(ConfigurationFolder) then
	-- 		makefolder(ConfigurationFolder)
	-- 	end
	-- 	if WindowSettings.ConfigSettings.RootFolder then
	-- 		if not isfolder(ConfigurationFolder .. WindowSettings.ConfigSettings.RootFolder) then
	-- 			makefolder(ConfigurationFolder .. WindowSettings.ConfigSettings.RootFolder)
	-- 			if not isfolder(ConfigurationFolder .. WindowSettings.ConfigSettings.RootFolder .. WindowSettings.ConfigSettings.ConfigFolder) then
	-- 				makefolder(ConfigurationFolder .. WindowSettings.ConfigSettings.RootFolder .. WindowSettings.ConfigSettings.ConfigFolder)
	-- 			end
	-- 		end
	-- 	else
	-- 		if not isfolder(ConfigurationFolder .. WindowSettings.ConfigSettings.ConfigFolder) then
	-- 			makefolder(ConfigurationFolder .. WindowSettings.ConfigSettings.ConfigFolder)
	-- 		end
	-- 	end

	-- 	LoadAutoLoad(WindowSettings.ConfigSettings.ConfigFolder, WindowSettings.ConfigSettings.RootFolder)
	-- end)

	NutriexLibrary.Enabled = true

	
	if WindowSettings.KeySystem then
		local KeySettings = WindowSettings.KeySettings
		
		Draggable(Dragger, Main)
		Draggable(NutriexLibrary.MobileSupport, NutriexLibrary.MobileSupport)
		if dragBar then Draggable(dragInteract, Main, true, 255) end

		if not WindowSettings.KeySettings then
			Passthrough = true
			return
		end
		
		WindowSettings.KeySettings.FileName = "key"

		if typeof(WindowSettings.KeySettings.Key) == "string" then WindowSettings.KeySettings.Key = {WindowSettings.KeySettings.Key} end

		local direc = WindowSettings.KeySettings.SaveInRoot and "Nutriex/Configurations/" .. WindowSettings.ConfigSettings.RootFolder .. "/" .. WindowSettings.ConfigSettings.ConfigFolder .. "/Key System/" or "Nutriex/Configurations/" ..  WindowSettings.ConfigSettings.ConfigFolder .. "/Key System/"

		if isfile and isfile(direc .. WindowSettings.KeySettings.FileName .. ".Nutriex") then
			for i, Key in ipairs(WindowSettings.KeySettings.Key) do
				if string.find(readfile(direc .. WindowSettings.KeySettings.FileName .. ".Nutriex"), Key) then
					Passthrough = true
					break
				end
			end
		end

		if not Passthrough then

			local Btn = KeySystem.Action.Copy
			local typesys = KeySettings.SecondAction.Type
			
			if typesys == "Discord" then
				Btn = KeySystem.Action.Discord
			end

			local AttemptsRemaining = math.random(2, 5)

			KeySystem.Visible = true
			KeySystem.Title.Text = WindowSettings.KeySettings.Title
			KeySystem.Subtitle.Text = WindowSettings.KeySettings.Subtitle
			KeySystem.textshit.Text = WindowSettings.KeySettings.Note

			if KeySettings.SecondAction.Enabled == true then
				Btn.Visible = true
			end
			
			Btn.Interact.MouseButton1Click:Connect(function()
				if typesys == "Discord" then
					setclipboard(tostring("https://discord.gg/"..KeySettings.SecondAction.Parameter)) -- Hunter if you see this I added copy also was too lazy to send u msg
					if request then
						request({
							Url = 'http://127.0.0.1:6463/rpc?v=1',
							Method = 'POST',
							Headers = {
								['Content-Type'] = 'application/json',
								Origin = 'https://discord.com'
							},
							Body = HttpService:JSONEncode({
								cmd = 'INVITE_BROWSER',
								nonce = HttpService:GenerateGUID(false),
								args = {code = KeySettings.SecondAction.Parameter}
							})
						})
					end
				else
					setclipboard(tostring(KeySettings.SecondAction.Parameter))
				end
			end)

			KeySystem.Action.Submit.Interact.MouseButton1Click:Connect(function()
				if #KeySystem.Input.InputBox.Text == 0 then return end
				local KeyFound = false
				local FoundKey = ''
				for _, Key in ipairs(WindowSettings.KeySettings.Key) do
					if KeySystem.Input.InputBox.Text == Key then
						KeyFound = true
						FoundKey = Key
						break
					end
				end
				if KeyFound then 
					for _, instance in pairs(KeySystem:GetDescendants()) do
						if instance.ClassName ~= "UICorner" and instance.ClassName ~= "UIPadding" then
							if instance.ClassName ~= "UIStroke" and instance.ClassName ~= "UIListLayout" then
								tween(instance, {BackgroundTransparency = 1}, nil,TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
							end
							if instance.ClassName == "ImageButton" then
								tween(instance, {ImageTransparency = 1}, nil,TweenInfo.new(0.5, Enum.EasingStyle.Exponential))
							end
							if instance.ClassName == "TextLabel" then
								tween(instance, {TextTransparency = 1}, nil,TweenInfo.new(0.4, Enum.EasingStyle.Exponential))
							end
							if instance.ClassName == "UIStroke" then
								tween(instance, {Transparency = 1}, nil,TweenInfo.new(0.5, Enum.EasingStyle.Exponential))
							end
						end
					end
					tween(KeySystem, {BackgroundTransparency = 1}, nil,TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
					task.wait(0.51)
					Passthrough = true
					KeySystem.Visible = false
					if WindowSettings.KeySettings.SaveKey then
						if writefile then
							writefile(direc .. WindowSettings.KeySettings.FileName .. ".Nutriex", FoundKey)
						end
						Nutriex:Notification({Title = "Key System", Content = "The key for this script has been saved successfully.", Icon = "lock_open"})
					end
				else
					if AttemptsRemaining == 0 then

						game.Players.LocalPlayer:Kick("No Attempts Remaining")
						game:Shutdown()
					end
					KeySystem.Input.InputBox.Text = "Incorrect Key"
					AttemptsRemaining = AttemptsRemaining - 1
					task.wait(0.4)
					KeySystem.Input.InputBox.Text = ""
				end
			end)

			KeySystem.Close.MouseButton1Click:Connect(function()
				
				Nutriex:Destroy()
			end)
		end
	end

	if WindowSettings.KeySystem then
		repeat task.wait() until Passthrough
	end

	if WindowSettings.LoadingEnabled then
		task.wait(0.3)
		TweenService:Create(LoadingFrame.Frame.Frame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
		TweenService:Create(LoadingFrame.Frame.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
		task.wait(0.05)
		TweenService:Create(LoadingFrame.Frame.Frame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
		TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
		task.wait(0.29)
		TweenService:Create(LoadingFrame.Frame.ImageLabel, TweenInfo.new(1.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 2, false, 0.2), {Rotation = 450}):Play()

		task.wait(3.32)

		TweenService:Create(LoadingFrame.Frame.Frame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
		TweenService:Create(LoadingFrame.Frame.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
		task.wait(0.05)
		TweenService:Create(LoadingFrame.Frame.Frame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
		TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
		wait(0.3)
		TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
	end

	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2, Size = MainSize}):Play()
	TweenService:Create(Main.Parent.ShadowHolder, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = MainSize}):Play()
	TweenService:Create(Main.Title.Title, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	TweenService:Create(Main.Title.subtitle, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	TweenService:Create(Main.Logo, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
	TweenService:Create(Navigation.Player.icon.ImageLabel, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
	TweenService:Create(Navigation.Player.icon.UIStroke, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 0}):Play()
	TweenService:Create(Main.Line, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
	wait(0.4)
	LoadingFrame.Visible = false

	Draggable(Dragger, Main)
	Draggable(NutriexLibrary.MobileSupport, NutriexLibrary.MobileSupport)
	if dragBar then Draggable(dragInteract, Main, true, 255) end

	Elements.Template.LayoutOrder = 1000000000
	Elements.Template.Visible = false
	Navigation.Tabs["InActive Template"].LayoutOrder = 1000000000
	Navigation.Tabs["InActive Template"].Visible = false

	local FirstTab = true

	function Window:CreateHomeTab(HomeTabSettings)

		HomeTabSettings = Kwargify({
			Icon = 1,
			SupportedExecutors = {"Vega X", "Delta", "Nihon", "Xeno"}, -- THESE DEFAULTS ARE PLACEHOLDERS!! I DO NOT ADVERTISE THESE, THEY ARE JUS THE FIRST THAT CAME TO MIND. I HAVE NO IDEA WHETHER THEYA RE RATS (they prob are) AND IM NOT RESPONSIBLE IF U GET VIRUSES FROM INSTALLING AFTER SEEING THIS LIST
			DiscordInvite = "noinvitelink" -- The disvord invite link. Do not include the link so for example if my invite was discord.gg/nebula I would put nebula
		}, HomeTabSettings or {})

		local HomeTab = {}

		local HomeTabButton = Navigation.Tabs.Home
		HomeTabButton.Visible = true
		if HomeTabSettings.Icon == 2 then
			HomeTabButton.ImageLabel.Image = GetIcon("dashboard", "Material")
		end

		local HomeTabPage = Elements.Home
		HomeTabPage.Visible = true

		function HomeTab:Activate()
			tween(HomeTabButton.ImageLabel, {ImageColor3 = Color3.fromRGB(255,255,255)})
			tween(HomeTabButton, {BackgroundTransparency = 0})
			tween(HomeTabButton.UIStroke, {Transparency = 0.41})

			Elements.UIPageLayout:JumpTo(HomeTabPage)

			task.wait(0.05)

			for _, OtherTabButton in ipairs(Navigation.Tabs:GetChildren()) do
				if OtherTabButton.Name ~= "InActive Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= HomeTabButton then
					tween(OtherTabButton.ImageLabel, {ImageColor3 = Color3.fromRGB(221,221,221)})
					tween(OtherTabButton, {BackgroundTransparency = 1})
					tween(OtherTabButton.UIStroke, {Transparency = 1})
				end

			end

			Window.CurrentTab = "Home"
		end

		HomeTab:Activate()
		FirstTab = false
		HomeTabButton.Interact.MouseButton1Click:Connect(function()
			HomeTab:Activate()
		end)


		HomeTabPage.icon.ImageLabel.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		HomeTabPage.player.Text.Text = "Hello, " .. Players.LocalPlayer.DisplayName
		HomeTabPage.player.user.Text = Players.LocalPlayer.Name .. " - ".. WindowSettings.Name

		HomeTabPage.detailsholder.dashboard.Client.Title.Text = (isStudio and "Debugging (Studio)" or identifyexecutor()) or "Your Executor Does Not Support identifyexecutor."
		for i,v in pairs(HomeTabSettings.SupportedExecutors) do
			if isStudio then HomeTabPage.detailsholder.dashboard.Client.Subtitle.Text = "Nutriex Interface Suite - Debugging Mode" break end
			if v == identifyexecutor() then
				HomeTabPage.detailsholder.dashboard.Client.Subtitle.Text = "Your Executor Supports This Script."
				break
			else
				HomeTabPage.detailsholder.dashboard.Client.Subtitle.Text = "Your Executor Isn't Officialy Supported By This Script."
				break
			end
		end

		-- Stolen From Sirius Stuff Begins Here

		HomeTabPage.detailsholder.dashboard.Discord.Interact.MouseButton1Click:Connect(function()
			setclipboard(tostring("https://discord.gg/"..HomeTabSettings.DiscordInvite)) -- Hunter if you see this I added copy also was too lazy to send u msg
			if request then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = HttpService:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = HttpService:GenerateGUID(false),
						args = {code = HomeTabSettings.DiscordInvite}
					})
				})
			end
		end)

		local friendsCooldown = 0
		local function getPing() return math.clamp(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue(), 10, 700) end

		local function checkFriends()
			if friendsCooldown == 0 then

				friendsCooldown = 25

				local playersFriends = {}
				local friendsInTotal = 0
				local onlineFriends = 0 
				local friendsInGame = 0 

				local list = Players:GetFriendsAsync(Player.UserId)
				while true do -- loop through all the pages
					for _, data in list:GetCurrentPage() do
						friendsInTotal +=1
						table.insert(playersFriends, Data)
					end

					if list.IsFinished then
						-- stop the loop since this is the last page
						break
					else 
						-- go to the next page
						list:AdvanceToNextPageAsync()
					end
				end
				for i, v in pairs(Player:GetFriendsOnline()) do
					onlineFriends += 1
				end

				for i,v in pairs(playersFriends) do
					if Players:FindFirstChild(v.Username) then
						friendsInGame = friendsInGame + 1
					end
				end

				HomeTabPage.detailsholder.dashboard.Friends.All.Value.Text = tostring(friendsInTotal).." friends"
				HomeTabPage.detailsholder.dashboard.Friends.Offline.Value.Text = tostring(friendsInTotal - onlineFriends).." friends"
				HomeTabPage.detailsholder.dashboard.Friends.Online.Value.Text = tostring(onlineFriends).." friends"
				HomeTabPage.detailsholder.dashboard.Friends.InGame.Value.Text = tostring(friendsInGame).." friends"

			else
				friendsCooldown -= 1
			end
		end

		local function format(Int)
			return string.format("%02i", Int)
		end

		local function convertToHMS(Seconds)
			local Minutes = (Seconds - Seconds%60)/60
			Seconds = Seconds - Minutes*60
			local Hours = (Minutes - Minutes%60)/60
			Minutes = Minutes - Hours*60
			return format(Hours)..":"..format(Minutes)..":"..format(Seconds)
		end

		coroutine.wrap(function()
			while task.wait() do


				-- Players
				HomeTabPage.detailsholder.dashboard.Server.Players.Value.Text = #Players:GetPlayers().." playing"
				HomeTabPage.detailsholder.dashboard.Server.MaxPlayers.Value.Text = Players.MaxPlayers.." players can join this server"

				-- Ping
				HomeTabPage.detailsholder.dashboard.Server.Latency.Value.Text = isStudio and tostring(math.round((Players.LocalPlayer:GetNetworkPing() * 2 ) / 0.01)) .."ms" or tostring(math.floor(getPing()) .."ms")

				-- Time
				HomeTabPage.detailsholder.dashboard.Server.Time.Value.Text = convertToHMS(time())

				-- Region
				HomeTabPage.detailsholder.dashboard.Server.Region.Value.Text = Localization:GetCountryRegionForPlayerAsync(Players.LocalPlayer)

				checkFriends()
			end
		end)()

		-- Stolen From Sirius Stuff ends here

	end

	function Window:CreateTab(TabSettings)

		local Tab = {}

		TabSettings = Kwargify({
			Name = "Tab",
			ShowTitle = true,
			Icon = "view_in_ar",
			ImageSource = "Material" 
		}, TabSettings or {})

		local TabButton = Navigation.Tabs["InActive Template"]:Clone()

		TabButton.Name = TabSettings.Name
		TabButton.TextLabel.Text = TabSettings.Name
		TabButton.Parent = Navigation.Tabs
		TabButton.ImageLabel.Image = GetIcon(TabSettings.Icon, TabSettings.ImageSource)

		TabButton.Visible = true

		local TabPage = Elements.Template:Clone()
		TabPage.Name = TabSettings.Name
		TabPage.Title.Visible = TabSettings.ShowTitle
		TabPage.Title.Text = TabSettings.Name
		TabPage.Visible = true

		Tab.Page = TabPage

		if TabSettings.ShowTitle == false then
			TabPage.UIPadding.PaddingTop = UDim.new(0,10)
		end

		TabPage.LayoutOrder = #Elements:GetChildren() - 3

		for _, TemplateElement in ipairs(TabPage:GetChildren()) do
			if TemplateElement.ClassName == "Frame" or TemplateElement.ClassName == "TextLabel" and TemplateElement.Name ~= "Title" then
				TemplateElement:Destroy()
			end
		end
		TabPage.Parent = Elements

		function Tab:Activate()
			tween(TabButton.ImageLabel, {ImageColor3 = Color3.fromRGB(255,255,255)})
			tween(TabButton, {BackgroundTransparency = 0})
			tween(TabButton.UIStroke, {Transparency = 0.41})

			Elements.UIPageLayout:JumpTo(TabPage)

			task.wait(0.05)

			for _, OtherTabButton in ipairs(Navigation.Tabs:GetChildren()) do
				if OtherTabButton.Name ~= "InActive Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton then
					tween(OtherTabButton.ImageLabel, {ImageColor3 = Color3.fromRGB(221,221,221)})
					tween(OtherTabButton, {BackgroundTransparency = 1})
					tween(OtherTabButton.UIStroke, {Transparency = 1})
				end

			end

			Window.CurrentTab = TabSettings.Name
		end

		if FirstTab then
			Tab:Activate()
		end

		task.wait(0.01)

		TabButton.Interact.MouseButton1Click:Connect(function()
			Tab:Activate()
		end)

		FirstTab = false

		-- Section
		function Tab:CreateSection(name : string)

			local Section = {}

			if name == nil then name = "Section" end

			Section.Name = name

			local Sectiont = Elements.Template.Section:Clone()
			Sectiont.Text = name
			Sectiont.Visible = true
			Sectiont.Parent = TabPage
			local TabPage = Sectiont.Frame

			Sectiont.TextTransparency = 1
			tween(Sectiont, {TextTransparency = 0})

			function Section:Set(NewSection)
				Sectiont.Text = NewSection
			end

			function Section:Destroy()
				Sectiont:Destroy()
			end

			-- Divider
			function Section:CreateDivider()
				TabPage.Position = UDim2.new(0,0,0,28)
				local b = Elements.Template.Divider:Clone()
				b.Parent = TabPage
				b.Size = UDim2.new(1,0,0,18)
				b.Line.BackgroundTransparency = 1
				tween(b.Line, {BackgroundTransparency = 0})
			end

			-- Button
			function Section:CreateButton(ButtonSettings)
				TabPage.Position = UDim2.new(0,0,0,28)

				ButtonSettings = Kwargify({
					Name = "Button",
					Description = nil,
					Callback = function()

					end,
				}, ButtonSettings or {})

				local ButtonV = {
					Hover = false,
					Settings = ButtonSettings
				}


				local Button
				if ButtonSettings.Description == nil and ButtonSettings.Description ~= "" then
					Button = Elements.Template.Button:Clone()
				else
					Button = Elements.Template.ButtonDesc:Clone()
				end
				Button.Name = ButtonSettings.Name
				Button.Title.Text = ButtonSettings.Name
				if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
					Button.Desc.Text = ButtonSettings.Description
				end
				Button.Visible = true
				Button.Parent = TabPage

				Button.UIStroke.Transparency = 1
				Button.Title.TextTransparency = 1
				if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
					Button.Desc.TextTransparency = 1
				end

				TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
				TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
				if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
					TweenService:Create(Button.Desc, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
				end

				Button.Interact["MouseButton1Click"]:Connect(function()
					local Success,Response = pcall(ButtonSettings.Callback)

					if not Success then
						TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Button.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Button.Title.Text = ButtonSettings.Name
						TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					else
						tween(Button.UIStroke, {Color = Color3.fromRGB(136, 131, 163)})
						wait(0.2)
						if ButtonV.Hover then
							tween(Button.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
						else
							tween(Button.UIStroke, {Color = Color3.fromRGB(64,61,76)})
						end
					end
				end)

				Button["MouseEnter"]:Connect(function()
					ButtonV.Hover = true
					tween(Button.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Button["MouseLeave"]:Connect(function()
					ButtonV.Hover = false
					tween(Button.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)

				function ButtonV:Set(ButtonSettings2)
					ButtonSettings2 = Kwargify({
						Name = ButtonSettings.Name,
						Description = ButtonSettings.Description,
						Callback = ButtonSettings.Callback
					}, ButtonSettings2 or {})

					ButtonSettings = ButtonSettings2
					ButtonV.Settings = ButtonSettings2

					Button.Name = ButtonSettings.Name
					Button.Title.Text = ButtonSettings.Name
					if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" and Button.Desc ~= nil then
						Button.Desc.Text = ButtonSettings.Description
					end
				end

				function ButtonV:Destroy()
					Button.Visible = false
					Button:Destroy()
				end

				return ButtonV
			end

			-- Label
			function Section:CreateLabel(LabelSettings)
				TabPage.Position = UDim2.new(0,0,0,28)

				local LabelV = {}

				LabelSettings = Kwargify({
					Text = "Label",
					Style = 1
				}, LabelSettings or {}) 

				LabelV.Settings = LabelSettings

				local Label
				if LabelSettings.Style == 1 then
					Label = Elements.Template.Label:Clone()
				elseif LabelSettings.Style == 2 then
					Label = Elements.Template.Info:Clone()
				elseif LabelSettings.Style == 3 then
					Label = Elements.Template.Warn:Clone()
				end

				Label.Text.Text = LabelSettings.Text
				Label.Visible = true
				Label.Parent = TabPage

				Label.BackgroundTransparency = 1
				Label.UIStroke.Transparency = 1
				Label.Text.TextTransparency = 1

				if LabelSettings.Style ~= 1 then
					TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.8}):Play()
				else
					TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				end
				TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Label.Text, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

				function LabelV:Set(NewLabel)
					LabelSettings.Text = NewLabel
					LabelV.Settings = LabelSettings
					Label.Text.Text = NewLabel
				end

				function LabelV:Destroy()
					Label.Visible = false
					Label:Destroy()
				end

				return LabelV
			end

			-- Paragraph
			function Section:CreateParagraph(ParagraphSettings)
				TabPage.Position = UDim2.new(0,0,0,28)

				ParagraphSettings = Kwargify({
					Title = "Paragraph",
					Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus venenatis lacus sed tempus eleifend. Mauris interdum bibendum felis, in tempor augue egestas vel. Praesent tristique consectetur ex, eu pretium sem placerat non. Vestibulum a nisi sit amet augue facilisis consectetur sit amet et nunc. Integer fermentum ornare cursus. Pellentesque sed ultricies metus, ut egestas metus. Vivamus auctor erat ac sapien vulputate, nec ultricies sem tempor. Quisque leo lorem, faucibus nec pulvinar nec, congue eu velit. Duis sodales massa efficitur imperdiet ultrices. Donec eros ipsum, ornare pharetra purus aliquam, tincidunt elementum nisi. Ut mi tortor, feugiat eget nunc vitae, facilisis interdum dui. Vivamus ullamcorper nunc dui, a dapibus nisi pretium ac. Integer eleifend placerat nibh, maximus malesuada tellus. Cras in justo in ligula scelerisque suscipit vel vitae quam."
				}, ParagraphSettings or {})

				local ParagraphV = {
					Settings = ParagraphSettings
				}

				local Paragraph = Elements.Template.Paragraph:Clone()
				Paragraph.Title.Text = ParagraphSettings.Title
				Paragraph.Text.Text = ParagraphSettings.Text
				Paragraph.Visible = true
				Paragraph.Parent = TabPage

				Paragraph.BackgroundTransparency = 1
				Paragraph.UIStroke.Transparency = 1
				Paragraph.Title.TextTransparency = 1
				Paragraph.Text.TextTransparency = 1

				TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
				TweenService:Create(Paragraph.Text, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

				function ParagraphV:Update()
					Paragraph.Text.Size = UDim2.new(Paragraph.Text.Size.X.Scale, Paragraph.Text.Size.X.Offset, 0, math.huge)
					Paragraph.Text.Size = UDim2.new(Paragraph.Text.Size.X.Scale, Paragraph.Text.Size.X.Offset, 0, Paragraph.Text.TextBounds.Y)
					tween(Paragraph, {Size = UDim2.new(Paragraph.Size.X.Scale, Paragraph.Size.X.Offset, 0, Paragraph.Text.TextBounds.Y + 40)})
				end

				function ParagraphV:Set(NewParagraphSettings)

					NewParagraphSettings = Kwargify({
						Title = ParagraphSettings.Title,
						Text = ParagraphSettings.Text
					}, NewParagraphSettings or {})

					ParagraphV.Settings = NewParagraphSettings

					Paragraph.Title.Text = NewParagraphSettings.Title
					Paragraph.Text.Text = NewParagraphSettings.Text

					ParagraphV:Update()

				end

				function ParagraphV:Destroy()
					Paragraph.Visible = false
					Paragraph:Destroy()
				end

				ParagraphV:Update()

				return ParagraphV
			end

			-- Slider
			function Section:CreateSlider(SliderSettings, Flag)
				TabPage.Position = UDim2.new(0,0,0,28)
				local SliderV = { IgnoreConfig = false, Class = "Slider", Settings = SliderSettings }

				SliderSettings = Kwargify({
					Name = "Slider",
					Range = {0, 200},
					Increment = 1,
					CurrentValue = 100,
					Callback = function(Value)

					end,
				}, SliderSettings or {})

				local SLDragging = false
				local Slider = Elements.Template.Slider:Clone()
				Slider.Name = SliderSettings.Name .. " - Slider"
				Slider.Title.Text = SliderSettings.Name
				Slider.Visible = true
				Slider.Parent = TabPage

				Slider.BackgroundTransparency = 1
				Slider.UIStroke.Transparency = 1
				Slider.Title.TextTransparency = 1

				TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
				TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

				Slider.Main.Progress.Size =	UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

				Slider.Value.Text = tostring(SliderSettings.CurrentValue)
				SliderV.CurrentValue = Slider.Value.Text

				SliderSettings.Callback(SliderSettings.CurrentValue)

				Slider["MouseEnter"]:Connect(function()
					tween(Slider.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Slider["MouseLeave"]:Connect(function()
					tween(Slider.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)

				Slider.Interact.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
						SLDragging = true 
					end 
				end)

				Slider.Interact.InputEnded:Connect(function(Input) 
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
						SLDragging = false 
					end 
				end)

				Slider.Interact.MouseButton1Down:Connect(function()
					local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
					local Start = Current
					local Location
					local Loop; Loop = RunService.Stepped:Connect(function()
						if SLDragging then
							Location = UserInputService:GetMouseLocation().X
							Current = Current + 0.025 * (Location - Start)

							if Location < Slider.Main.AbsolutePosition.X then
								Location = Slider.Main.AbsolutePosition.X
							elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
								Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
							end

							if Current < Slider.Main.AbsolutePosition.X + 5 then
								Current = Slider.Main.AbsolutePosition.X + 5
							elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
								Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
							end

							if Current <= Location and (Location - Start) < 0 then
								Start = Location
							elseif Current >= Location and (Location - Start) > 0 then
								Start = Location
							end
							Slider.Main.Progress.Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X, 1, 0)
							local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])

							NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000

							Slider.Value.Text = tostring(NewValue)

							if SliderSettings.CurrentValue ~= NewValue then
								local Success, Response = pcall(function()
									SliderSettings.Callback(NewValue)
								end)
								if not Success then
									TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
									TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
									TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
									Slider.Title.Text = "Callback Error"
									warn("Nutriex Hub | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
									wait(0.5)
									Slider.Title.Text = SliderSettings.Name
									TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
									TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
									TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
								end

								SliderSettings.CurrentValue = NewValue
								SliderV.CurrentValue = SliderSettings.CurrentValue
								-- Nutriex.Flags[SliderSettings.Flag] = SliderSettings
							end
						else
							TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()
							Loop:Disconnect()
						end
					end)
				end)

				local function Set(NewVal, bleh)

					NewVal = NewVal or SliderSettings.CurrentValue

					TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
					if not bleh then Slider.Value.Text = tostring(NewVal) end
					local Success, Response = pcall(function()
						SliderSettings.Callback(NewVal)
					end)
					if not Success then
						TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Slider.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Slider.Title.Text = SliderSettings.Name
						TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(30, 33, 40)}):Play()
						TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end

					SliderSettings.CurrentValue = NewVal
					SliderV.CurrentValue = SliderSettings.CurrentValue
					-- Nutriex.Flags[SliderSettings.Flag] = SliderSettings

				end

				function SliderV:UpdateValue(Value)
					Set(tonumber(Value))
				end 

				Slider.Value:GetPropertyChangedSignal("Text"):Connect(function()
					local text = Slider.Value.Text
					if not tonumber(text) and text ~= "." then
						Slider.Value.Text = text:match("[0-9.]*") or ""
					end
					if SliderSettings.Range[2] < (tonumber(Slider.Value.Text) or 0) then Slider.Value.Text = SliderSettings.Range[2] end
					Slider.Value.Size = UDim2.fromOffset(Slider.Value.TextBounds.X, 23)
					Set(tonumber(Slider.Value.Text), true)
				end)

				function SliderV:Set(NewSliderSettings)
					NewSliderSettings = Kwargify({
						Name = SliderSettings.Name,
						Range = SliderSettings.Range,
						Increment = SliderSettings.Increment,
						CurrentValue = SliderSettings.CurrentValue,
						Callback = SliderSettings.Callback
					}, NewSliderSettings or {})

					SliderSettings = NewSliderSettings
					SliderV.Settings = NewSliderSettings

					Slider.Name = SliderSettings.Name .. " - Slider"
					Slider.Title.Text = SliderSettings.Name

					Set()

					-- Nutriex.Flags[SliderSettings.Flag] = SliderSettings
				end

				function SliderV:Destroy()
					Slider.Visible = false
					Slider:Destroy()
				end

				if Flag then
					Nutriex.Options[Flag] = SliderV
				end

				NutriexLibrary.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
					Slider.Main.color.Color = Nutriex.ThemeGradient
					Slider.Main.UIStroke.color.Color = Nutriex.ThemeGradient
				end)

				return SliderV

			end

			-- Toggle
			function Section:CreateToggle(ToggleSettings, Flag)    
				TabPage.Position = UDim2.new(0,0,0,28)
				local ToggleV = { IgnoreConfig = false, Class = "Toggle" }

				ToggleSettings = Kwargify({
					Name = "Toggle",
					Description = nil,
					CurrentValue = false,
					Callback = function(Value)
					end,
				}, ToggleSettings or {})


				local Toggle

				if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
					Toggle = Elements.Template.ToggleDesc:Clone()
				else
					Toggle = Elements.Template.Toggle:Clone()
				end

				Toggle.Visible = true
				Toggle.Parent = TabPage

				Toggle.Name = ToggleSettings.Name .. " - Toggle"
				Toggle.Title.Text = ToggleSettings.Name
				if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
					Toggle.Desc.Text = ToggleSettings.Description
				end

				Toggle.UIStroke.Transparency = 1
				Toggle.Title.TextTransparency = 1
				if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
					Toggle.Desc.TextTransparency = 1
				end

				TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
				if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
					TweenService:Create(Toggle.Desc, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				end
				TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

				local function Set(bool)
					if bool then
						Toggle.toggle.color.Enabled = true
						tween(Toggle.toggle, {BackgroundTransparency = 0})

						Toggle.toggle.UIStroke.color.Enabled = true
						tween(Toggle.toggle.UIStroke, {Color = Color3.new(255,255,255)})

						tween(Toggle.toggle.val, {BackgroundColor3 = Color3.fromRGB(255,255,255), Position = UDim2.new(1,-23,0.5,0), BackgroundTransparency = 0.45})
					else
						Toggle.toggle.color.Enabled = false
						Toggle.toggle.UIStroke.color.Enabled = false

						Toggle.toggle.UIStroke.Color = Color3.fromRGB(97,97,97)

						tween(Toggle.toggle, {BackgroundTransparency = 1})

						tween(Toggle.toggle.val, {BackgroundColor3 = Color3.fromRGB(97,97,97), Position = UDim2.new(0,5,0.5,0), BackgroundTransparency = 0})
					end

					ToggleV.CurrentValue = bool
				end

				Toggle.Interact.MouseButton1Click:Connect(function()
					ToggleSettings.CurrentValue = not ToggleSettings.CurrentValue
					Set(ToggleSettings.CurrentValue)

					local Success, Response = pcall(function()
						ToggleSettings.Callback(ToggleSettings.CurrentValue)
					end)
					if not Success then
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Toggle.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Toggle.Title.Text = ToggleSettings.Name
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
				end)

				Toggle["MouseEnter"]:Connect(function()
					tween(Toggle.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Toggle["MouseLeave"]:Connect(function()
					tween(Toggle.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)

				if ToggleSettings.CurrentValue then
					Set(ToggleSettings.CurrentValue)
					local Success, Response = pcall(function()
						ToggleSettings.Callback(ToggleSettings.CurrentValue)
					end)
					if not Success then
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Toggle.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Toggle.Title.Text = ToggleSettings.Name
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
				end

				function ToggleV:UpdateState(State)
					ToggleSettings.CurrentValue = State
					Set(ToggleSettings.CurrentValue)
				end

				function ToggleV:Set(NewToggleSettings)

					NewToggleSettings = Kwargify({
						Name = ToggleSettings.Name,
						Description = ToggleSettings.Description,
						CurrentValue = ToggleSettings.CurrentValue,
						Callback = ToggleSettings.Callback
					}, NewToggleSettings or {})

					ToggleV.Settings = NewToggleSettings
					ToggleSettings = NewToggleSettings

					Toggle.Name = ToggleSettings.Name .. " - Toggle"
					Toggle.Title.Text = ToggleSettings.Name
					if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" and Toggle.Desc ~= nil then
						Toggle.Desc.Text = ToggleSettings.Description
					end

					Set(ToggleSettings.CurrentValue)

					ToggleV.CurrentValue = ToggleSettings.CurrentValue

					local Success, Response = pcall(function()
						ToggleSettings.Callback(ToggleSettings.CurrentValue)
					end)
					if not Success then
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
						Toggle.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Toggle.Title.Text = ToggleSettings.Name
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
				end

				function ToggleV:Destroy()
					Toggle.Visible = false
					Toggle:Destroy()
				end

				NutriexLibrary.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
					Toggle.toggle.color.Color = Nutriex.ThemeGradient
					Toggle.toggle.UIStroke.color.Color = Nutriex.ThemeGradient
				end)

				if Flag then
					Nutriex.Options[Flag] = ToggleV
				end

				return ToggleV

			end

			-- Bind
			function Section:CreateBind(BindSettings, Flag)
				TabPage.Position = UDim2.new(0,0,0,28)
				local BindV = { Class = "Keybind", IgnoreConfig = false, Settings = BindSettings, Active = false }

				BindSettings = Kwargify({
					Name = "Bind",
					Description = nil,
					CurrentBind = "Q",
					HoldToInteract = false, -- setting this makes the Bind in toggle mode
					Callback = function(Bind)
						-- The function that takes place when the Bind is pressed
						-- The variable (Bind) is a boolean for whether the Bind is being held or not (HoldToInteract needs to be true) or whether the Bind is currently active
					end,

					OnChangedCallback = function(Bind)
						-- The function that takes place when the binded key changes
						-- The variable (Bind) is a Enum.KeyCode for the new Binded Key
					end,
				}, BindSettings or {})

				local CheckingForKey = false

				local Bind
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
					Bind = Elements.Template.BindDesc:Clone()
				else
					Bind = Elements.Template.Bind:Clone()
				end

				Bind.Visible = true
				Bind.Parent = TabPage

				Bind.Name = BindSettings.Name
				Bind.Title.Text = BindSettings.Name
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
					Bind.Desc.Text = BindSettings.Description
				end

				Bind.Title.TextTransparency = 1
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
					Bind.Desc.TextTransparency = 1
				end
				Bind.BindFrame.BackgroundTransparency = 1
				Bind.BindFrame.UIStroke.Transparency = 1
				Bind.BindFrame.BindBox.TextTransparency = 1

				TweenService:Create(Bind, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
				TweenService:Create(Bind.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
					TweenService:Create(Bind.Desc, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
				end
				TweenService:Create(Bind.BindFrame, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
				TweenService:Create(Bind.BindFrame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
				TweenService:Create(Bind.BindFrame.BindBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()


				Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
				Bind.BindFrame.BindBox.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 42)

				Bind.BindFrame.BindBox.Focused:Connect(function()
					CheckingForKey = true
					Bind.BindFrame.BindBox.Text = ""
				end)

				Bind.BindFrame.BindBox.FocusLost:Connect(function()
					CheckingForKey = false
					if Bind.BindFrame.BindBox.Text == (nil or "") then
						Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
					end
				end)

				Bind["MouseEnter"]:Connect(function()
					tween(Bind.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Bind["MouseLeave"]:Connect(function()
					tween(Bind.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)
				UserInputService.InputBegan:Connect(function(input, processed)

					if CheckingForKey then
						if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Window.Bind then
							local SplitMessage = string.split(tostring(input.KeyCode), ".")
							local NewKeyNoEnum = SplitMessage[3]
							Bind.BindFrame.BindBox.Text = tostring(NewKeyNoEnum)
							BindSettings.CurrentBind = tostring(NewKeyNoEnum)
							local Success, Response = pcall(function()
								BindSettings.OnChangedCallback(BindSettings.CurrentBind)
							end)
							if not Success then
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Bind.Title.Text = "Callback Error"
								warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
								wait(0.5)
								Bind.Title.Text = BindSettings.Name
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
								TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
							end
							Bind.BindFrame.BindBox:ReleaseFocus()
						end
					elseif BindSettings.CurrentBind ~= nil and (input.KeyCode == Enum.KeyCode[BindSettings.CurrentBind] and not processed) then -- Test
						local Held = true
						local Connection
						Connection = input.Changed:Connect(function(prop)
							if prop == "UserInputState" then
								Connection:Disconnect()
								Held = false
							end
						end)

						if not BindSettings.HoldToInteract then
							BindV.Active = not BindV.Active
							local Success, Response = pcall(function()
								BindSettings.Callback(BindV.Active)
							end)
							if not Success then
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Bind.Title.Text = "Callback Error"
								warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
								wait(0.5)
								Bind.Title.Text = BindSettings.Name
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
								TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
								TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
							end
						else
							wait(0.1)
							if Held then
								local Loop; Loop = RunService.Stepped:Connect(function()
									if not Held then
										local Success, Response = pcall(function()
											BindSettings.Callback(false)
										end)
										if not Success then
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
											TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
											Bind.Title.Text = "Callback Error"
											warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
											wait(0.5)
											Bind.Title.Text = BindSettings.Name
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
											TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
										end 
										Loop:Disconnect()
									else
										local Success, Response = pcall(function()
											BindSettings.Callback(true)
										end)
										if not Success then
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
											TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
											Bind.Title.Text = "Callback Error"
											warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
											wait(0.5)
											Bind.Title.Text = BindSettings.Name
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
											TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
											TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
										end
									end
								end)	
							end
						end
					end
				end)

				Bind.BindFrame.BindBox:GetPropertyChangedSignal("Text"):Connect(function()
					TweenService:Create(Bind.BindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 30)}):Play()
				end)

				function BindV:Set(NewBindSettings)

					NewBindSettings = Kwargify({
						Name = BindSettings.Name,
						Description = BindSettings.Description,
						CurrentBind =  BindSettings.CurrentBind,
						HoldToInteract = BindSettings.HoldToInteract,
						Callback = BindSettings.Callback
					}, NewBindSettings or {})

					BindV.Settings = NewBindSettings
					BindSettings = NewBindSettings

					Bind.Name = BindSettings.Name
					Bind.Title.Text = BindSettings.Name
					if BindSettings.Description ~= nil and BindSettings.Description ~= "" and Bind.Desc ~= nil then
						Bind.Desc.Text = BindSettings.Description
					end

					Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
					Bind.BindFrame.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 42)


					BindV.CurrentBind = BindSettings.CurrentBind
				end

				function BindV:Destroy()
					Bind.Visible = false
					Bind:Destroy()
				end

				if Flag then
					Nutriex.Options[Flag] = BindV
				end

				-- Nutriex.Flags[BindSettings.Flag] = BindSettings

				return BindV

			end

			-- Dynamic Input
			function Section:CreateInput(InputSettings, Flag)
				TabPage.Position = UDim2.new(0,0,0,28)
				local InputV = { IgnoreConfig = false, Class = "Input", Settings = InputSettings }

				InputSettings = Kwargify({
					Name = "Dynamic Input",
					Description = nil,
					CurrentValue = "",
					PlaceholderText = "Input Placeholder",
					RemoveTextAfterFocusLost = false,
					Numeric = false,
					Enter = false,
					MaxCharacters = nil,
					Callback = function(Text)

					end, -- 52
				}, InputSettings or {})

				InputV.CurrentValue = InputSettings.CurrentValue

				local descriptionbool
				if InputSettings.Description ~= nil and InputSettings.Description ~= "" then
					descriptionbool = true
				end

				local Input 
				if descriptionbool then
					Input = Elements.Template.InputDesc:Clone()
				else
					Input = Elements.Template.Input:Clone()
				end

				Input.Name = InputSettings.Name
				Input.Title.Text = InputSettings.Name
				if descriptionbool then Input.Desc.Text = InputSettings.Description end
				Input.Visible = true
				Input.Parent = TabPage

				Input.BackgroundTransparency = 1
				Input.UIStroke.Transparency = 1
				Input.Title.TextTransparency = 1
				if descriptionbool then Input.Desc.TextTransparency = 1 end
				Input.InputFrame.BackgroundTransparency = 1
				Input.InputFrame.UIStroke.Transparency = 1
				Input.InputFrame.InputBox.TextTransparency = 1

				TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
				TweenService:Create(Input.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
				if descriptionbool then TweenService:Create(Input.Desc, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play() end
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
				TweenService:Create(Input.InputFrame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
				TweenService:Create(Input.InputFrame.InputBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

				Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
				Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 30)

				Input.InputFrame.InputBox.FocusLost:Connect(function(bleh)

					if InputSettings.Enter then
						if bleh then
							local Success, Response = pcall(function()
								InputSettings.Callback(Input.InputFrame.InputBox.Text)
								InputV.CurrentValue = Input.InputFrame.InputBox.Text
							end)
							if not Success then
								TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
								TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
								Input.Title.Text = "Callback Error"
								warn("Nutriex Hub | "..InputSettings.Name.." Callback Error " ..tostring(Response))
								wait(0.5)
								Input.Title.Text = InputSettings.Name
								TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
								TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
								TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
							end
						end
					end

					if InputSettings.RemoveTextAfterFocusLost then
						Input.InputFrame.InputBox.Text = ""
					end

				end)

				if InputSettings.Numeric then
					Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
						local text = Input.InputFrame.InputBox.Text
						if not tonumber(text) and text ~= "." then
							Input.InputFrame.InputBox.Text = text:match("[0-9.]*") or ""
						end
					end)
				end

				Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
					if tonumber(InputSettings.MaxCharacters) then
						if (#Input.InputFrame.InputBox.Text - 1) == InputSettings.MaxCharacters then
							Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1, InputSettings.MaxCharacters)
						end
					end
					TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 30)}):Play()
					if not InputSettings.Enter then
						local Success, Response = pcall(function()
							InputSettings.Callback(Input.InputFrame.InputBox.Text)
						end)
						if not Success then
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							Input.Title.Text = "Callback Error"
							warn("Nutriex Hub | "..InputSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Input.Title.Text = InputSettings.Name
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
							TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					end
					InputV.CurrentValue = Input.InputFrame.InputBox.Text				
				end)

				Input["MouseEnter"]:Connect(function()
					tween(Input.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Input["MouseLeave"]:Connect(function()
					tween(Input.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)


				function InputV:Set(NewInputSettings)

					NewInputSettings = Kwargify(InputSettings, NewInputSettings or {})

					InputV.Settings = NewInputSettings
					InputSettings = NewInputSettings

					Input.Name = InputSettings.Name
					Input.Title.Text = InputSettings.Name
					if InputSettings.Description ~= nil and InputSettings.Description ~= "" and Input.Desc ~= nil then
						Input.Desc.Text = InputSettings.Description
					end

					Input.InputFrame.InputBox:CaptureFocus()
					Input.InputFrame.InputBox.Text = tostring(InputSettings.CurrentValue)
					Input.InputFrame.InputBox:ReleaseFocus()
					Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 42)

					InputV.CurrentValue = InputSettings.CurrentValue
				end

				function InputV:Destroy()
					Input.Visible = false
					Input:Destroy()
				end

				if Flag then
					Nutriex.Options[Flag] = InputV
				end


				return InputV

			end

			-- Dropdown
			function Section:CreateDropdown(DropdownSettings, Flag)
				TabPage.Position = UDim2.new(0,0,0,28)
				local DropdownV = { IgnoreConfig = false, Class = "Dropdown", Settings = DropdownSettings}

				DropdownSettings = Kwargify({
					Name = "Dropdown",
					Description = nil,
					Options = {"Option 1", "Option 2"},
					CurrentOption = {"Option 1"},
					MultipleOptions = false,
					SpecialType = nil, -- currently onl player, might add more soon
					Callback = function(Options)
						-- The function that takes place when the selected option is changed
						-- The variable (Options) is a table of strings for the current selected options or a string if multioptions is false
					end,
				}, DropdownSettings or {})

				DropdownV.CurrentOption = DropdownSettings.CurrentOption

				local descriptionbool = false
				if DropdownSettings.Description ~= nil and DropdownSettings.Description ~= "" then
					descriptionbool = true
				end
				local closedsize
				local openedsize
				if descriptionbool then
					closedsize = 48
					openedsize = 170
				elseif not descriptionbool then
					closedsize = 38
					openedsize = 160
				end
				local opened = false

				local Dropdown
				if descriptionbool then Dropdown = Elements.Template.DropdownDesc:Clone() else Dropdown = Elements.Template.Dropdown:Clone() end

				Dropdown.Name = DropdownSettings.Name
				Dropdown.Title.Text = DropdownSettings.Name
				if descriptionbool then Dropdown.Desc.Text = DropdownSettings.Description end

				Dropdown.Parent = TabPage
				Dropdown.Visible = true

				local function Toggle()
					opened = not opened
					if opened then
						tween(Dropdown.icon, {Rotation = 180})
						tween(Dropdown, {Size = UDim2.new(1, -25, 0, openedsize)})
					else
						tween(Dropdown.icon, {Rotation = 0})
						tween(Dropdown, {Size = UDim2.new(1, -25, 0, closedsize)})
					end
				end

				local function SafeCallback(param, c2)
					local Success, Response = pcall(function()
						DropdownSettings.Callback(param)
					end)
					if not Success then
						TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Dropdown.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Dropdown.Title.Text = DropdownSettings.Name
						TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
					if Success and c2 then
						c2()
					end
				end

				-- fixed by justhey
				Dropdown.Selected:GetPropertyChangedSignal("Text"):Connect(function()
					local text = Dropdown.Selected.Text:lower()
					for _, Item in ipairs(Dropdown.List:GetChildren()) do
						if Item:IsA("TextLabel") and Item.Name ~= "Template" then
							Item.Visible = text == "" or string.find(Item.Name:lower(), text, 1, true) ~= nil
						end
					end
				end)


				local function Clear()
					for _, option in ipairs(Dropdown.List:GetChildren()) do
						if option.ClassName == "TextLabel" and option.Name ~= "Template" then
							option:Destroy()
						end
					end
				end

				local function ActivateColorSingle(name)
					for _, Option in pairs(Dropdown.List:GetChildren()) do
						if Option.ClassName == "TextLabel" and Option.Name ~= "Template" then
							tween(Option, {BackgroundTransparency = 0.98})
						end
					end

					Toggle()
					tween(Dropdown.List[name], {BackgroundTransparency = 0.95, TextColor3 = Color3.fromRGB(240,240,240)})
				end

				local function Refresh()
					Clear()
					for i,v in pairs(DropdownSettings.Options) do
						local Option = Dropdown.List.Template:Clone()
						local optionhover = false
						Option.Text = v
						if v == "Template" then v = "Template (Name)" end
						Option.Name = v
						Option.Interact.MouseButton1Click:Connect(function()
							local bleh
							if DropdownSettings.MultipleOptions then
								if table.find(DropdownSettings.CurrentOption, v) then
									RemoveTable(DropdownSettings.CurrentOption, v)
									DropdownV.CurrentOption = DropdownSettings.CurrentOption
									if not optionhover then
										tween(Option, {TextColor3 = Color3.fromRGB(200,200,200)})
									end
									tween(Option, {BackgroundTransparency = 0.98})
								else
									table.insert(DropdownSettings.CurrentOption, v)
									DropdownV.CurrentOption = DropdownSettings.CurrentOption
									tween(Option, {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
								end
								bleh = DropdownSettings.CurrentOption
							else
								DropdownSettings.CurrentOption = {v}
								bleh = v
								DropdownV.CurrentOption = bleh
								ActivateColorSingle(v)
							end

							SafeCallback(bleh, function()
								if DropdownSettings.MultipleOptions then
									if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
										if #DropdownSettings.CurrentOption == 1 then
											Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
										elseif #DropdownSettings.CurrentOption == 0 then
											Dropdown.Selected.PlaceholderText = "None"
										else
											Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
										end
									else
										DropdownSettings.CurrentOption = {}
										Dropdown.Selected.PlaceholderText = "None"
									end
								end
								if not DropdownSettings.MultipleOptions then
									Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
								end
								Dropdown.Selected.Text = ""
							end)
						end)
						Option.Visible = true
						Option.Parent = Dropdown.List
						Option.MouseEnter:Connect(function()
							optionhover = true
							if Option.BackgroundTransparency == 0.95 then
								return
							else
								tween(Option, {TextColor3 = Color3.fromRGB(240,240,240)})
							end
						end)
						Option.MouseLeave:Connect(function()
							optionhover = false
							if Option.BackgroundTransparency == 0.95 then
								return
							else
								tween(Option, {TextColor3 = Color3.fromRGB(200,200,200)})
							end
						end)	
					end
				end

				local function PlayerTableRefresh()
					for i,v in pairs(DropdownSettings.Options) do
						table.remove(DropdownSettings.Options, i)
					end

					for i,v in pairs(Players:GetChildren()) do
						table.insert(DropdownSettings.Options, v.Name)
					end
				end

				Dropdown.Interact.MouseButton1Click:Connect(function()
					Toggle()
				end)

				Dropdown["MouseEnter"]:Connect(function()
					tween(Dropdown.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)

				Dropdown["MouseLeave"]:Connect(function()
					tween(Dropdown.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)

				if DropdownSettings.SpecialType == "Player" then

					for i,v in pairs(DropdownSettings.Options) do
						table.remove(DropdownSettings.Options, i)
					end
					PlayerTableRefresh()
					DropdownSettings.CurrentOption = DropdownSettings.Options[1]

					Players.PlayerAdded:Connect(function() PlayerTableRefresh() end)
					Players.PlayerRemoving:Connect(function() PlayerTableRefresh() end)

				end

				Refresh()

				if DropdownSettings.CurrentOption then
					if type(DropdownSettings.CurrentOption) == "string" then
						DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
					end
					if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
						DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
					end
				else
					DropdownSettings.CurrentOption = {}
				end

				local bleh, ind = nil,0
				for i,v in pairs(DropdownSettings.CurrentOption) do
					ind = ind + 1
				end
				if ind == 1 then bleh = DropdownSettings.CurrentOption[1] else bleh = DropdownSettings.CurrentOption end
				SafeCallback(bleh)
				if type(bleh) == "string" then 
					tween(Dropdown.List[bleh], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
				else
					for i,v in pairs(bleh) do
						tween(Dropdown.List[v], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
					end
				end

				if DropdownSettings.MultipleOptions then
					if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
						if #DropdownSettings.CurrentOption == 1 then
							Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
						elseif #DropdownSettings.CurrentOption == 0 then
							Dropdown.Selected.PlaceholderText = "None"
						else
							Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
						end
					else
						DropdownSettings.CurrentOption = {}
						Dropdown.Selected.PlaceholderText = "None"
					end
					for _, name in pairs(DropdownSettings.CurrentOption) do
						tween(Dropdown.List[name], {TextColor3 = Color3.fromRGB(227,227,227), BackgroundTransparency = 0.95})
					end
				else
					Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
				end
				Dropdown.Selected.Text = ""

				function DropdownV:Set(NewDropdownSettings)
					NewDropdownSettings = Kwargify(DropdownSettings, NewDropdownSettings or {})

					DropdownV.Settings = NewDropdownSettings
					DropdownSettings = NewDropdownSettings

					Dropdown.Name = DropdownSettings.Name
					Dropdown.Title.Text = DropdownSettings.Name
					if DropdownSettings.Description ~= nil and DropdownSettings.Description ~= "" and Dropdown.Desc ~= nil then
						Dropdown.Desc.Text = DropdownSettings.Description
					end

					if DropdownSettings.SpecialType == "Player" then

						for i,v in pairs(DropdownSettings.Options) do
							table.remove(DropdownSettings.Options, i)
						end
						PlayerTableRefresh()
						DropdownSettings.CurrentOption = DropdownSettings.Options[1]                    
						Players.PlayerAdded:Connect(function() PlayerTableRefresh() end)
						Players.PlayerRemoving:Connect(function() PlayerTableRefresh() end)

					end

					Refresh()

					if DropdownSettings.CurrentOption then
						if type(DropdownSettings.CurrentOption) == "string" then
							DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
						end
						if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
							DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
						end
					else
						DropdownSettings.CurrentOption = {}
					end

					local bleh, ind = nil,0
					for i,v in pairs(DropdownSettings.CurrentOption) do
						ind = ind + 1
					end
					if ind == 1 then bleh = DropdownSettings.CurrentOption[1] else bleh = DropdownSettings.CurrentOption end
					SafeCallback(bleh)
					for _, Option in pairs(Dropdown.List:GetChildren()) do
						if Option.ClassName == "TextLabel" then
							tween(Option, {TextColor3 = Color3.fromRGB(200,200,200), BackgroundTransparency = 0.98})
						end
					end
					tween(Dropdown.List[bleh], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})

					if DropdownSettings.MultipleOptions then
						if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
							if #DropdownSettings.CurrentOption == 1 then
								Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
							elseif #DropdownSettings.CurrentOption == 0 then
								Dropdown.Selected.PlaceholderText = "None"
							else
								Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
							end
						else
							DropdownSettings.CurrentOption = {}
							Dropdown.Selected.PlaceholderText = "None"
						end
						for _, name in pairs(DropdownSettings.CurrentOption) do
							tween(Dropdown.List[name], {TextColor3 = Color3.fromRGB(227,227,227), BackgroundTransparency = 0.95})
						end
					else
						Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
					end
					Dropdown.Selected.Text = ""

					-- Nutriex.Flags[DropdownSettings.Flag] = DropdownSettings

				end

				function DropdownV:Destroy()
					Dropdown.Visible = false
					Dropdown:Destroy()
				end

				if Flag then
					Nutriex.Options[Flag] = DropdownV
				end

				-- Nutriex.Flags[DropdownSettings.Flag] = DropdownSettings

				return DropdownV

			end

			-- Color Picker
			function Section:CreateColorPicker(ColorPickerSettings, Flag) -- by Rayfield/Throit
				TabPage.Position = UDim2.new(0,0,0,28)
				local ColorPickerV = {IgnoreClass = false, Class = "Colorpicker", Settings = ColorPickerSettings}

				ColorPickerSettings = Kwargify({
					Name = "Color Picker",
					Color = Color3.fromRGB(255,255,255),
					Callback = function(Value)
						-- The function that takes place every time the color picker is moved/changed
						-- The variable (Value) is a Color3fromRGB value based on which color is selected
					end
				}, ColorPickerSettings or {})

				local function Color3ToHex(color)
					return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
				end

				ColorPickerV.Color = Color3ToHex(ColorPickerSettings.Color)

				local closedsize = UDim2.new(0, 75, 0, 22)
				local openedsize = UDim2.new(0, 219, 0, 129)

				local ColorPicker = Elements.Template.ColorPicker:Clone()
				local Background = ColorPicker.CPBackground
				local Display = Background.Display
				local Main = Background.MainCP
				local Slider = ColorPicker.ColorSlider

				ColorPicker.Name = ColorPickerSettings.Name
				ColorPicker.Title.Text = ColorPickerSettings.Name
				ColorPicker.Visible = true
				ColorPicker.Parent = TabPage
				ColorPicker.Size = UDim2.new(1.042, -25,0, 38)
				Background.Size = closedsize
				Display.BackgroundTransparency = 0

				ColorPicker["MouseEnter"]:Connect(function()
					tween(ColorPicker.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
				end)
				ColorPicker["MouseLeave"]:Connect(function()
					tween(ColorPicker.UIStroke, {Color = Color3.fromRGB(64,61,76)})
				end)

				local function SafeCallback(param, c2)
					local Success, Response = pcall(function()
						ColorPickerSettings.Callback(param)
					end)
					if not Success then
						TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						ColorPicker.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..ColorPickerSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						ColorPicker.Title.Text = ColorPickerSettings.Name
						TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
					if Success and c2 then
						c2()
					end
				end

				local opened = false

				local mouse = game.Players.LocalPlayer:GetMouse()
				Main.Image = "rbxassetid://11415645739"
				local mainDragging = false 
				local sliderDragging = false 
				ColorPicker.Interact.MouseButton1Down:Connect(function()
					if not opened then
						opened = true 
						tween(ColorPicker, {Size = UDim2.new( 1.042, -25,0, 165)}, nil, TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
						tween(Background, {Size = openedsize})
						tween(Display, {BackgroundTransparency = 1})
					else
						opened = false
						tween(ColorPicker, {Size = UDim2.new(1.042, -25,0, 38)}, nil, TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
						tween(Background, {Size = closedsize})
						tween(Display, {BackgroundTransparency = 0})
					end
				end)
				UserInputService.InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
						mainDragging = false
						sliderDragging = false
					end end)
				Main.MouseButton1Down:Connect(function()
					if opened then
						mainDragging = true 
					end
				end)
				Main.MainPoint.MouseButton1Down:Connect(function()
					if opened then
						mainDragging = true 
					end
				end)
				Slider.MouseButton1Down:Connect(function()
					sliderDragging = true 
				end)
				Slider.SliderPoint.MouseButton1Down:Connect(function()
					sliderDragging = true 
				end)
				local h,s,v = ColorPickerSettings.Color:ToHSV()
				local color = Color3.fromHSV(h,s,v) 
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
				ColorPicker.HexInput.InputBox.Text = hex
				local function setDisplay(hp,sp,vp)
					--Main
					Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(hp,sp,vp)
					Background.BackgroundColor3 = Color3.fromHSV(hp,1,1)
					Display.BackgroundColor3 = Color3.fromHSV(hp,sp,vp)
					--Slider 
					local x = hp * Slider.AbsoluteSize.X
					Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
					Slider.SliderPoint.ImageColor3 = Color3.fromHSV(hp,1,1)
					local color = Color3.fromHSV(hp,sp,vp) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RInput.InputBox.Text = tostring(r)
					ColorPicker.GInput.InputBox.Text = tostring(g)
					ColorPicker.BInput.InputBox.Text = tostring(b)
					hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					ColorPicker.HexInput.InputBox.Text = hex
				end
				setDisplay(h,s,v)
				ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
					if not pcall(function()
							local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
							local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
							h,s,v = rgbColor:ToHSV()
							hex = ColorPicker.HexInput.InputBox.Text
							setDisplay()
							ColorPickerSettings.Color = rgbColor
						end) 
					then 
						ColorPicker.HexInput.InputBox.Text = hex 
					end
					local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					SafeCallback( Color3.fromRGB(r,g,b))
				end)
				--RGB
				local function rgbBoxes(box,toChange)
					local value = tonumber(box.Text) 
					local color = Color3.fromHSV(h,s,v) 
					local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					local save 
					if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
					if value then 
						value = math.clamp(value,0,255)
						h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()
						setDisplay()
					else 
						box.Text = tostring(save)
					end
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				end
				ColorPicker.RInput.InputBox.FocusLost:connect(function()
					rgbBoxes(ColorPicker.RInput.InputBox,"R")
					SafeCallback(Color3.fromRGB(r,g,b))
				end)
				ColorPicker.GInput.InputBox.FocusLost:connect(function()
					rgbBoxes(ColorPicker.GInput.InputBox,"G")
					SafeCallback(Color3.fromRGB(r,g,b))
				end)
				ColorPicker.BInput.InputBox.FocusLost:connect(function()
					rgbBoxes(ColorPicker.BInput.InputBox,"B")
					SafeCallback(Color3.fromRGB(r,g,b))
				end)
				RunService.RenderStepped:connect(function()
					if mainDragging then 
						local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
						local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
						Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
						s = localX / Main.AbsoluteSize.X
						v = 1 - (localY / Main.AbsoluteSize.Y)
						Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
						Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
						Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
						local color = Color3.fromHSV(h,s,v) 
						local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
						ColorPicker.RInput.InputBox.Text = tostring(r)
						ColorPicker.GInput.InputBox.Text = tostring(g)
						ColorPicker.BInput.InputBox.Text = tostring(b)
						ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
						SafeCallback(Color3.fromRGB(r,g,b))
						ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
						ColorPickerV.Color = ColorPickerSettings.Color
					end
					if sliderDragging then 
						local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
						h = localX / Slider.AbsoluteSize.X
						Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
						Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
						Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
						Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
						Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
						local color = Color3.fromHSV(h,s,v) 
						local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
						ColorPicker.RInput.InputBox.Text = tostring(r)
						ColorPicker.GInput.InputBox.Text = tostring(g)
						ColorPicker.BInput.InputBox.Text = tostring(b)
						ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
						SafeCallback(Color3.fromRGB(r,g,b))
						ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
						ColorPickerV.Color = ColorPickerSettings.Color
					end
				end)

				function ColorPickerV:Set(NewColorPickerSettings)

					NewColorPickerSettings = Kwargify(ColorPickerSettings, NewColorPickerSettings or {})

					ColorPickerV.Settings = NewColorPickerSettings
					ColorPickerSettings = NewColorPickerSettings

					ColorPicker.Name = ColorPickerSettings.Name
					ColorPicker.Title.Text = ColorPickerSettings.Name
					ColorPicker.Visible = true

					local h,s,v = ColorPickerSettings.Color:ToHSV()
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					ColorPicker.HexInput.InputBox.Text = hex
					setDisplay(h,s,v)
					SafeCallback(Color3.fromRGB(r,g,b))

					ColorPickerV.Color = ColorPickerSettings.Color
				end

				function ColorPickerV:Destroy()
					ColorPicker:Destroy()
				end

				if Flag then
					Nutriex.Options[Flag] = ColorPickerV
				end

				SafeCallback(ColorPickerSettings.Color)

				return ColorPickerV
			end

			return Section

		end

		-- Divider
		function Tab:CreateDivider()
			local b = Elements.Template.Divider:Clone()
			b.Parent = TabPage
			b.Line.BackgroundTransparency = 1
			tween(b.Line, {BackgroundTransparency = 0})
		end

		-- Button
		function Tab:CreateButton(ButtonSettings)

			ButtonSettings = Kwargify({
				Name = "Button",
				Description = nil,
				Callback = function()

				end,
			}, ButtonSettings or {})

			local ButtonV = {
				Hover = false,
				Settings = ButtonSettings
			}


			local Button
			if ButtonSettings.Description == nil and ButtonSettings.Description ~= "" then
				Button = Elements.Template.Button:Clone()
			else
				Button = Elements.Template.ButtonDesc:Clone()
			end
			Button.Name = ButtonSettings.Name
			Button.Title.Text = ButtonSettings.Name
			if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
				Button.Desc.Text = ButtonSettings.Description
			end
			Button.Visible = true
			Button.Parent = TabPage

			Button.UIStroke.Transparency = 1
			Button.Title.TextTransparency = 1
			if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
				Button.Desc.TextTransparency = 1
			end

			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
			TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
			TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
			if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" then
				TweenService:Create(Button.Desc, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
			end

			Button.Interact["MouseButton1Click"]:Connect(function()
				local Success,Response = pcall(ButtonSettings.Callback)

				if not Success then
					TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					Button.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Button.Title.Text = ButtonSettings.Name
					TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				else
					tween(Button.UIStroke, {Color = Color3.fromRGB(136, 131, 163)})
					wait(0.2)
					if ButtonV.Hover then
						tween(Button.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
					else
						tween(Button.UIStroke, {Color = Color3.fromRGB(64,61,76)})
					end
				end
			end)

			Button["MouseEnter"]:Connect(function()
				ButtonV.Hover = true
				tween(Button.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Button["MouseLeave"]:Connect(function()
				ButtonV.Hover = false
				tween(Button.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)

			function ButtonV:Set(ButtonSettings2)
				ButtonSettings2 = Kwargify({
					Name = ButtonSettings.Name,
					Description = ButtonSettings.Description,
					Callback = ButtonSettings.Callback
				}, ButtonSettings2 or {})

				ButtonSettings = ButtonSettings2
				ButtonV.Settings = ButtonSettings2

				Button.Name = ButtonSettings.Name
				Button.Title.Text = ButtonSettings.Name
				if ButtonSettings.Description ~= nil and ButtonSettings.Description ~= "" and Button.Desc ~= nil then
					Button.Desc.Text = ButtonSettings.Description
				end
			end

			function ButtonV:Destroy()
				Button.Visible = false
				Button:Destroy()
			end

			return ButtonV
		end

		-- Label
		function Tab:CreateLabel(LabelSettings)

			local LabelV = {}

			LabelSettings = Kwargify({
				Text = "Label",
				Style = 1
			}, LabelSettings or {}) 

			LabelV.Settings = LabelSettings

			local Label
			if LabelSettings.Style == 1 then
				Label = Elements.Template.Label:Clone()
			elseif LabelSettings.Style == 2 then
				Label = Elements.Template.Info:Clone()
			elseif LabelSettings.Style == 3 then
				Label = Elements.Template.Warn:Clone()
			end

			Label.Text.Text = LabelSettings.Text
			Label.Visible = true
			Label.Parent = TabPage

			Label.BackgroundTransparency = 1
			Label.UIStroke.Transparency = 1
			Label.Text.TextTransparency = 1

			if LabelSettings.Style ~= 1 then
				TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.8}):Play()
			else
				TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
			end
			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
			TweenService:Create(Label.Text, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

			function LabelV:Set(NewLabel)
				LabelSettings.Text = NewLabel
				LabelV.Settings = LabelSettings
				Label.Text.Text = NewLabel
			end

			function LabelV:Destroy()
				Label.Visible = false
				Label:Destroy()
			end

			return LabelV
		end

		-- Paragraph
		function Tab:CreateParagraph(ParagraphSettings)

			ParagraphSettings = Kwargify({
				Title = "Paragraph",
				Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus venenatis lacus sed tempus eleifend. Mauris interdum bibendum felis, in tempor augue egestas vel. Praesent tristique consectetur ex, eu pretium sem placerat non. Vestibulum a nisi sit amet augue facilisis consectetur sit amet et nunc. Integer fermentum ornare cursus. Pellentesque sed ultricies metus, ut egestas metus. Vivamus auctor erat ac sapien vulputate, nec ultricies sem tempor. Quisque leo lorem, faucibus nec pulvinar nec, congue eu velit. Duis sodales massa efficitur imperdiet ultrices. Donec eros ipsum, ornare pharetra purus aliquam, tincidunt elementum nisi. Ut mi tortor, feugiat eget nunc vitae, facilisis interdum dui. Vivamus ullamcorper nunc dui, a dapibus nisi pretium ac. Integer eleifend placerat nibh, maximus malesuada tellus. Cras in justo in ligula scelerisque suscipit vel vitae quam."
			}, ParagraphSettings or {})

			local ParagraphV = {
				Settings = ParagraphSettings
			}

			local Paragraph = Elements.Template.Paragraph:Clone()
			Paragraph.Title.Text = ParagraphSettings.Title
			Paragraph.Text.Text = ParagraphSettings.Text
			Paragraph.Visible = true
			Paragraph.Parent = TabPage

			Paragraph.BackgroundTransparency = 1
			Paragraph.UIStroke.Transparency = 1
			Paragraph.Title.TextTransparency = 1
			Paragraph.Text.TextTransparency = 1

			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
			TweenService:Create(Paragraph.Text, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

			function ParagraphV:Update()
				Paragraph.Text.Size = UDim2.new(Paragraph.Text.Size.X.Scale, Paragraph.Text.Size.X.Offset, 0, math.huge)
				Paragraph.Text.Size = UDim2.new(Paragraph.Text.Size.X.Scale, Paragraph.Text.Size.X.Offset, 0, Paragraph.Text.TextBounds.Y)
				tween(Paragraph, {Size = UDim2.new(Paragraph.Size.X.Scale, Paragraph.Size.X.Offset, 0, Paragraph.Text.TextBounds.Y + 40)})
			end

			function ParagraphV:Set(NewParagraphSettings)

				NewParagraphSettings = Kwargify({
					Title = ParagraphSettings.Title,
					Text = ParagraphSettings.Text
				}, NewParagraphSettings or {})

				ParagraphV.Settings = NewParagraphSettings

				Paragraph.Title.Text = NewParagraphSettings.Title
				Paragraph.Text.Text = NewParagraphSettings.Text

				ParagraphV:Update()

			end

			function ParagraphV:Destroy()
				Paragraph.Visible = false
				Paragraph:Destroy()
			end

			ParagraphV:Update()

			return ParagraphV
		end

		-- Slider
		 function Tab:CreateSlider(SliderSettings, Flag)
    local SliderV = { IgnoreConfig = false, Class = "Slider", Settings = SliderSettings }

    SliderSettings = Kwargify({
        Name = "Slider",
        Range = {0, 200},
        Increment = 1,
        CurrentValue = 100,
        Callback = function(Value)
        end,
    }, SliderSettings or {})

    local SLDragging = false
    local Slider = Elements.Template.Slider:Clone()
    Slider.Name = SliderSettings.Name .. " - Slider"
    Slider.Title.Text = SliderSettings.Name
    Slider.Visible = true
    Slider.Parent = TabPage

    Slider.BackgroundTransparency = 1
    Slider.UIStroke.Transparency = 1
    Slider.Title.TextTransparency = 1

    -- Animação de entrada suave
    TweenService:Create(Slider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
    TweenService:Create(Slider.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    TweenService:Create(Slider.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

    local function updateVisualProgress(val, immediate)
        local min, max = SliderSettings.Range[1], SliderSettings.Range[2]
        local percent = math.clamp((val - min) / (max - min), 0, 1)
        local targetSize = UDim2.new(percent, 0, 1, 0)
        
        if immediate then
            Slider.Main.Progress.Size = targetSize
        else
            TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = targetSize}):Play()
        end
    end

    Slider.Value.Text = tostring(SliderSettings.CurrentValue)
    SliderV.CurrentValue = Slider.Value.Text
    updateVisualProgress(SliderSettings.CurrentValue, true)

    local successInit, errInit = pcall(function()
        SliderSettings.Callback(SliderSettings.CurrentValue)
    end)
    if not successInit then
        warn("Nutriex Hub | " .. SliderSettings.Name .. " Init Callback Error: " .. tostring(errInit))
    end

    Slider["MouseEnter"]:Connect(function()
        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(87, 84, 104)}):Play()
    end)

    Slider["MouseLeave"]:Connect(function()
        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(64, 61, 76)}):Play()
    end)

    Slider.Interact.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
            SLDragging = true 
        end 
    end)

    Slider.Interact.InputEnded:Connect(function(Input) 
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
            SLDragging = false 
        end 
    end)

    Slider.Interact.MouseButton1Down:Connect(function()
        local barAbsPos = Slider.Main.AbsolutePosition.X
        local barAbsSize = Slider.Main.AbsoluteSize.X

        local Loop; Loop = RunService.Stepped:Connect(function()
            if SLDragging then
                local mouseX = UserInputService:GetMouseLocation().X
                local relativeX = math.clamp(mouseX - barAbsPos, 0, barAbsSize)
                local percent = relativeX / barAbsSize

                local min, max = SliderSettings.Range[1], SliderSettings.Range[2]
                local rawValue = min + percent * (max - min)
                local inc = SliderSettings.Increment

                local NewValue = math.floor(rawValue / inc + 0.5) * inc
                NewValue = math.clamp(NewValue, min, max)

                updateVisualProgress(NewValue, false)
                Slider.Value.Text = tostring(NewValue)

                if SliderSettings.CurrentValue ~= NewValue then
                    local Success, Response = pcall(function()
                        SliderSettings.Callback(NewValue)
                    end)
                    if not Success then
                        TweenService:Create(Slider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
                        Slider.Title.Text = "Callback Error"
                        warn("Nutriex Hub | " .. SliderSettings.Name .. " Callback Error: " .. tostring(Response))
                        task.wait(0.5)
                        Slider.Title.Text = SliderSettings.Name
                        TweenService:Create(Slider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5, BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
                        TweenService:Create(Slider.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
                    end

                    SliderSettings.CurrentValue = NewValue
                    SliderV.CurrentValue = NewValue
                end
            else
                Loop:Disconnect()
            end
        end)
    end)

    local function Set(NewVal, skipCallback)
        NewVal = tonumber(NewVal) or SliderSettings.CurrentValue
        local min, max = SliderSettings.Range[1], SliderSettings.Range[2]
        NewVal = math.clamp(NewVal, min, max)

        updateVisualProgress(NewVal, false)
        if not skipCallback then 
            Slider.Value.Text = tostring(NewVal) 
        end

        local Success, Response = pcall(function()
            SliderSettings.Callback(NewVal)
        end)
        if not Success then
            warn("Nutriex Hub | " .. SliderSettings.Name .. " Set Error: " .. tostring(Response))
        end

        SliderSettings.CurrentValue = NewVal
        SliderV.CurrentValue = NewVal
    end

    function SliderV:UpdateValue(Value)
        Set(tonumber(Value))
    end 

    Slider.Value:GetPropertyChangedSignal("Text"):Connect(function()
        local text = Slider.Value.Text
        if not tonumber(text) and text ~= "." then
            Slider.Value.Text = text:match("[0-9.]*") or ""
        end
        local num = tonumber(Slider.Value.Text)
        if num then
            if SliderSettings.Range[2] < num then 
                Slider.Value.Text = tostring(SliderSettings.Range[2]) 
            end
            Slider.Value.Size = UDim2.fromOffset(Slider.Value.TextBounds.X, 23)
            Set(num, true)
        end
    end)

    function SliderV:Set(NewSliderSettings)
        SliderSettings = Kwargify({
            Name = SliderSettings.Name,
            Range = SliderSettings.Range,
            Increment = SliderSettings.Increment,
            CurrentValue = SliderSettings.CurrentValue,
            Callback = SliderSettings.Callback
        }, NewSliderSettings or {})

        SliderV.Settings = SliderSettings
        Slider.Name = SliderSettings.Name .. " - Slider"
        Slider.Title.Text = SliderSettings.Name

        Set(SliderSettings.CurrentValue)
    end

    function SliderV:Destroy()
        Slider.Visible = false
        Slider:Destroy()
    end

    if Flag then
        Nutriex.Options[Flag] = SliderV
    end

    local successTheme, themeConn = pcall(function()
        return NutriexLibrary.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
            if Slider.Main:FindFirstChild("color") then
                Slider.Main.color.Color = Nutriex.ThemeGradient
            end
            if Slider.Main:FindFirstChild("UIStroke") and Slider.Main.UIStroke:FindFirstChild("color") then
                Slider.Main.UIStroke.color.Color = Nutriex.ThemeGradient
            end
        end)
    end)

    return SliderV
end

		-- Toggle
		function Tab:CreateToggle(ToggleSettings, Flag)    
			local ToggleV = { IgnoreConfig = false, Class = "Toggle" }

			ToggleSettings = Kwargify({
				Name = "Toggle",
				Description = nil,
				CurrentValue = false,
				Callback = function(Value)
				end,
			}, ToggleSettings or {})


			local Toggle

			if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
				Toggle = Elements.Template.ToggleDesc:Clone()
			else
				Toggle = Elements.Template.Toggle:Clone()
			end

			Toggle.Visible = true
			Toggle.Parent = TabPage

			Toggle.Name = ToggleSettings.Name .. " - Toggle"
			Toggle.Title.Text = ToggleSettings.Name
			if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
				Toggle.Desc.Text = ToggleSettings.Description
			end

			Toggle.UIStroke.Transparency = 1
			Toggle.Title.TextTransparency = 1
			if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
				Toggle.Desc.TextTransparency = 1
			end

			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
			if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" then
				TweenService:Create(Toggle.Desc, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
			end
			TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
			TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	

			local function Set(bool)
				if bool then
					Toggle.toggle.color.Enabled = true
					tween(Toggle.toggle, {BackgroundTransparency = 0})

					Toggle.toggle.UIStroke.color.Enabled = true
					tween(Toggle.toggle.UIStroke, {Color = Color3.new(255,255,255)})

					tween(Toggle.toggle.val, {BackgroundColor3 = Color3.fromRGB(255,255,255), Position = UDim2.new(1,-23,0.5,0), BackgroundTransparency = 0.45})
				else
					Toggle.toggle.color.Enabled = false
					Toggle.toggle.UIStroke.color.Enabled = false

					Toggle.toggle.UIStroke.Color = Color3.fromRGB(97,97,97)

					tween(Toggle.toggle, {BackgroundTransparency = 1})

					tween(Toggle.toggle.val, {BackgroundColor3 = Color3.fromRGB(97,97,97), Position = UDim2.new(0,5,0.5,0), BackgroundTransparency = 0})
				end

				ToggleV.CurrentValue = bool
			end

			Toggle.Interact.MouseButton1Click:Connect(function()
				ToggleSettings.CurrentValue = not ToggleSettings.CurrentValue
				Set(ToggleSettings.CurrentValue)

				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end
			end)

			Toggle["MouseEnter"]:Connect(function()
				tween(Toggle.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Toggle["MouseLeave"]:Connect(function()
				tween(Toggle.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)

			if ToggleSettings.CurrentValue then
				Set(ToggleSettings.CurrentValue)
				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end
			end

			function ToggleV:UpdateState(State)
				ToggleSettings.CurrentValue = State
				Set(ToggleSettings.CurrentValue)
			end

			function ToggleV:Set(NewToggleSettings)

				NewToggleSettings = Kwargify({
					Name = ToggleSettings.Name,
					Description = ToggleSettings.Description,
					CurrentValue = ToggleSettings.CurrentValue,
					Callback = ToggleSettings.Callback
				}, NewToggleSettings or {})

				ToggleV.Settings = NewToggleSettings
				ToggleSettings = NewToggleSettings

				Toggle.Name = ToggleSettings.Name .. " - Toggle"
				Toggle.Title.Text = ToggleSettings.Name
				if ToggleSettings.Description ~= nil and ToggleSettings.Description ~= "" and Toggle.Desc ~= nil then
					Toggle.Desc.Text = ToggleSettings.Description
				end

				Set(ToggleSettings.CurrentValue)

				ToggleV.CurrentValue = ToggleSettings.CurrentValue

				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
					Toggle.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end
			end

			function ToggleV:Destroy()
				Toggle.Visible = false
				Toggle:Destroy()
			end

			NutriexLibrary.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
				Toggle.toggle.color.Color = Nutriex.ThemeGradient
				Toggle.toggle.UIStroke.color.Color = Nutriex.ThemeGradient
			end)

			if Flag then
				Nutriex.Options[Flag] = ToggleV
			end

			return ToggleV

		end

		-- Bind
		function Tab:CreateBind(BindSettings, Flag)
			local BindV = { Class = "Keybind", IgnoreConfig = false, Settings = BindSettings, Active = false }

			BindSettings = Kwargify({
				Name = "Bind",
				Description = nil,
				CurrentBind = "Q",
				HoldToInteract = false, -- setting this makes the Bind in toggle mode
				Callback = function(Bind)
					-- The function that takes place when the Bind is pressed
					-- The variable (Bind) is a boolean for whether the Bind is being held or not (HoldToInteract needs to be true) or whether the Bind is currently active
				end,

				OnChangedCallback = function(Bind)
					-- The function that takes place when the binded key changes
					-- The variable (Bind) is a Enum.KeyCode for the new Binded Key
				end,
			}, BindSettings or {})

			local CheckingForKey = false

			local Bind
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind = Elements.Template.BindDesc:Clone()
			else
				Bind = Elements.Template.Bind:Clone()
			end

			Bind.Visible = true
			Bind.Parent = TabPage

			Bind.Name = BindSettings.Name
			Bind.Title.Text = BindSettings.Name
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind.Desc.Text = BindSettings.Description
			end

			Bind.Title.TextTransparency = 1
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind.Desc.TextTransparency = 1
			end
			Bind.BindFrame.BackgroundTransparency = 1
			Bind.BindFrame.UIStroke.Transparency = 1
			Bind.BindFrame.BindBox.TextTransparency = 1

			TweenService:Create(Bind, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
			TweenService:Create(Bind.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				TweenService:Create(Bind.Desc, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
			end
			TweenService:Create(Bind.BindFrame, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
			TweenService:Create(Bind.BindFrame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
			TweenService:Create(Bind.BindFrame.BindBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()


			Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
			Bind.BindFrame.BindBox.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 42)

			Bind.BindFrame.BindBox.Focused:Connect(function()
				CheckingForKey = true
				Bind.BindFrame.BindBox.Text = ""
			end)

			Bind.BindFrame.BindBox.FocusLost:Connect(function()
				CheckingForKey = false
				if Bind.BindFrame.BindBox.Text == (nil or "") then
					Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
				end
			end)

			Bind["MouseEnter"]:Connect(function()
				tween(Bind.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Bind["MouseLeave"]:Connect(function()
				tween(Bind.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)
			UserInputService.InputBegan:Connect(function(input, processed)

				if CheckingForKey then
					if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Window.Bind then
						local SplitMessage = string.split(tostring(input.KeyCode), ".")
						local NewKeyNoEnum = SplitMessage[3]
						Bind.BindFrame.BindBox.Text = tostring(NewKeyNoEnum)
						BindSettings.CurrentBind = tostring(NewKeyNoEnum)
						local Success, Response = pcall(function()
							BindSettings.OnChangedCallback(BindSettings.CurrentBind)
						end)
						if not Success then
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							Bind.Title.Text = "Callback Error"
							warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Bind.Title.Text = BindSettings.Name
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
						Bind.BindFrame.BindBox:ReleaseFocus()
					end
				elseif BindSettings.CurrentBind ~= nil and (input.KeyCode == Enum.KeyCode[BindSettings.CurrentBind] and not processed) then -- Test
					local Held = true
					local Connection
					Connection = input.Changed:Connect(function(prop)
						if prop == "UserInputState" then
							Connection:Disconnect()
							Held = false
						end
					end)

					if not BindSettings.HoldToInteract then
						BindV.Active = not BindV.Active
						local Success, Response = pcall(function()
							BindSettings.Callback(BindV.Active)
						end)
						if not Success then
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							Bind.Title.Text = "Callback Error"
							warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Bind.Title.Text = BindSettings.Name
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					else
						wait(0.1)
						if Held then
							local Loop; Loop = RunService.Stepped:Connect(function()
								if not Held then
									local Success, Response = pcall(function()
										BindSettings.Callback(false)
									end)
									if not Success then
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Bind.Title.Text = "Callback Error"
										warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
										wait(0.5)
										Bind.Title.Text = BindSettings.Name
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
									end 
									Loop:Disconnect()
								else
									local Success, Response = pcall(function()
										BindSettings.Callback(true)
									end)
									if not Success then
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Bind.Title.Text = "Callback Error"
										warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
										wait(0.5)
										Bind.Title.Text = BindSettings.Name
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
									end
								end
							end)	
						end
					end
				end
			end)

			Bind.BindFrame.BindBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Bind.BindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 30)}):Play()
			end)

			function BindV:Set(NewBindSettings)

				NewBindSettings = Kwargify({
					Name = BindSettings.Name,
					Description = BindSettings.Description,
					CurrentBind =  BindSettings.CurrentBind,
					HoldToInteract = BindSettings.HoldToInteract,
					Callback = BindSettings.Callback
				}, NewBindSettings or {})

				BindV.Settings = NewBindSettings
				BindSettings = NewBindSettings

				Bind.Name = BindSettings.Name
				Bind.Title.Text = BindSettings.Name
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" and Bind.Desc ~= nil then
					Bind.Desc.Text = BindSettings.Description
				end

				Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
				Bind.BindFrame.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 20, 0, 42)


				BindV.CurrentBind = BindSettings.CurrentBind
			end

			function BindV:Destroy()
				Bind.Visible = false
				Bind:Destroy()
			end

			if Flag then
				Nutriex.Options[Flag] = BindV
			end

			-- Nutriex.Flags[BindSettings.Flag] = BindSettings

			return BindV

		end

		function Tab:CreateKeybind(BindSettings)

			BindSettings = Kwargify({
				Name = "Bind",
				Description = nil,
				CurrentBind = "Q",
				HoldToInteract = false, -- setting this makes the Bind in toggle mode
				Callback = function(Bind)
					-- The function that takes place when the Bind is pressed
					-- The variable (Bind) is a boolean for whether the Bind is being held or not (HoldToInteract needs to be true) or whether the Bind is currently active
				end
			}, BindSettings or {})

			local BindV = { Settings = BindSettings, Active = false }
			local CheckingForKey = false

			local Bind
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind = Elements.Template.BindDesc:Clone()
			else
				Bind = Elements.Template.Bind:Clone()
			end

			Bind.Visible = true
			Bind.Parent = TabPage

			Bind.Name = BindSettings.Name
			Bind.Title.Text = BindSettings.Name
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind.Desc.Text = BindSettings.Description
			end

			Bind.Title.TextTransparency = 1
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				Bind.Desc.TextTransparency = 1
			end
			Bind.BindFrame.BackgroundTransparency = 1
			Bind.BindFrame.UIStroke.Transparency = 1
			Bind.BindFrame.BindBox.TextTransparency = 1

			TweenService:Create(Bind, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
			TweenService:Create(Bind.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
			if BindSettings.Description ~= nil and BindSettings.Description ~= "" then
				TweenService:Create(Bind.Desc, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
			end
			TweenService:Create(Bind.BindFrame, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
			TweenService:Create(Bind.BindFrame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
			TweenService:Create(Bind.BindFrame.BindBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()


			Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
			Bind.BindFrame.BindBox.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 16, 0, 42)

			Bind.BindFrame.BindBox.Focused:Connect(function()
				CheckingForKey = true
				Bind.BindFrame.BindBox.Text = ""
			end)

			Bind.BindFrame.BindBox.FocusLost:Connect(function()
				CheckingForKey = false
				if Bind.BindFrame.BindBox.Text == (nil or "") then
					Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
				end
			end)

			Bind["MouseEnter"]:Connect(function()
				tween(Bind.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Bind["MouseLeave"]:Connect(function()
				tween(Bind.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)
			UserInputService.InputBegan:Connect(function(input, processed)

				if CheckingForKey then
					if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.K then
						local SplitMessage = string.split(tostring(input.KeyCode), ".")
						local NewKeyNoEnum = SplitMessage[3]
						Bind.BindFrame.BindBox.Text = tostring(NewKeyNoEnum)
						BindSettings.CurrentBind = tostring(NewKeyNoEnum)
						Bind.BindFrame.BindBox:ReleaseFocus()
					end
				elseif BindSettings.CurrentBind ~= nil and (input.KeyCode == Enum.KeyCode[BindSettings.CurrentBind] and not processed) then -- Test
					local Held = true
					local Connection
					Connection = input.Changed:Connect(function(prop)
						if prop == "UserInputState" then
							Connection:Disconnect()
							Held = false
						end
					end)

					if not BindSettings.HoldToInteract then
						BindV.Active = not BindV.Active
						local Success, Response = pcall(function()
							BindSettings.Callback(BindV.Active)
						end)
						if not Success then
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							Bind.Title.Text = "Callback Error"
							warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Bind.Title.Text = BindSettings.Name
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
							TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
							TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					else
						wait(0.1)
						if Held then
							local Loop; Loop = RunService.Stepped:Connect(function()
								if not Held then
									local Success, Response = pcall(function()
										BindSettings.Callback(false)
									end)
									if not Success then
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Bind.Title.Text = "Callback Error"
										warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
										wait(0.5)
										Bind.Title.Text = BindSettings.Name
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
									end 
									Loop:Disconnect()
								else
									local Success, Response = pcall(function()
										BindSettings.Callback(true)
									end)
									if not Success then
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
										Bind.Title.Text = "Callback Error"
										warn("Nutriex Hub | "..BindSettings.Name.." Callback Error " ..tostring(Response))
										wait(0.5)
										Bind.Title.Text = BindSettings.Name
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
										TweenService:Create(Bind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
										TweenService:Create(Bind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
									end
								end
							end)	
						end
					end
				end
			end)

			Bind.BindFrame.BindBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Bind.BindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 16, 0, 30)}):Play()
			end)

			function BindV:Set(NewBindSettings)

				NewBindSettings = Kwargify({
					Name = BindSettings.Name,
					Description = BindSettings.Description,
					CurrentBind =  BindSettings.CurrentBind,
					HoldToInteract = BindSettings.HoldToInteract,
					Callback = BindSettings.Callback
				}, NewBindSettings or {})

				BindV.Settings = NewBindSettings
				BindSettings = NewBindSettings

				Bind.Name = BindSettings.Name
				Bind.Title.Text = BindSettings.Name
				if BindSettings.Description ~= nil and BindSettings.Description ~= "" and Bind.Desc ~= nil then
					Bind.Desc.Text = BindSettings.Description
				end

				Bind.BindFrame.BindBox.Text = BindSettings.CurrentBind
				Bind.BindFrame.BindBox.Size = UDim2.new(0, Bind.BindFrame.BindBox.TextBounds.X + 16, 0, 42)

				-- Nutriex.Flags[BindSettings.Flag] = BindSettings

			end

			function BindV:Destroy()
				Bind.Visible = false
				Bind:Destroy()
			end

			-- Nutriex.Flags[BindSettings.Flag] = BindSettings

			return BindV

		end

		-- Dynamic Input
		function Tab:CreateInput(InputSettings, Flag)
			local InputV = { IgnoreConfig = false, Class = "Input", Settings = InputSettings }

			InputSettings = Kwargify({
				Name = "Dynamic Input",
				Description = nil,
				CurrentValue = "",
				PlaceholderText = "Input Placeholder",
				RemoveTextAfterFocusLost = false,
				Numeric = false,
				Enter = false,
				MaxCharacters = nil,
				Callback = function(Text)

				end, -- 52
			}, InputSettings or {})

			InputV.CurrentValue = InputSettings.CurrentValue

			local descriptionbool
			if InputSettings.Description ~= nil and InputSettings.Description ~= "" then
				descriptionbool = true
			end

			local Input 
			if descriptionbool then
				Input = Elements.Template.InputDesc:Clone()
			else
				Input = Elements.Template.Input:Clone()
			end

			Input.Name = InputSettings.Name
			Input.Title.Text = InputSettings.Name
			if descriptionbool then Input.Desc.Text = InputSettings.Description end
			Input.Visible = true
			Input.Parent = TabPage

			Input.BackgroundTransparency = 1
			Input.UIStroke.Transparency = 1
			Input.Title.TextTransparency = 1
			if descriptionbool then Input.Desc.TextTransparency = 1 end
			Input.InputFrame.BackgroundTransparency = 1
			Input.InputFrame.UIStroke.Transparency = 1
			Input.InputFrame.InputBox.TextTransparency = 1

			TweenService:Create(Input, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
			TweenService:Create(Input.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
			TweenService:Create(Input.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()	
			if descriptionbool then TweenService:Create(Input.Desc, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play() end
			TweenService:Create(Input.InputFrame, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
			TweenService:Create(Input.InputFrame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
			TweenService:Create(Input.InputFrame.InputBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
			Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 30)

			Input.InputFrame.InputBox.FocusLost:Connect(function(bleh)

				if InputSettings.Enter then
					if bleh then
						local Success, Response = pcall(function()
							InputSettings.Callback(Input.InputFrame.InputBox.Text)
							InputV.CurrentValue = Input.InputFrame.InputBox.Text
						end)
						if not Success then
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
							Input.Title.Text = "Callback Error"
							warn("Nutriex Hub | "..InputSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Input.Title.Text = InputSettings.Name
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
							TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
							TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
						end
					end
				end

				if InputSettings.RemoveTextAfterFocusLost then
					Input.InputFrame.InputBox.Text = ""
				end

			end)

			if InputSettings.Numeric then
				Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
					local text = Input.InputFrame.InputBox.Text
					if not tonumber(text) and text ~= "." then
						Input.InputFrame.InputBox.Text = text:match("[0-9.]*") or ""
					end
				end)
			end

			Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				if tonumber(InputSettings.MaxCharacters) then
					if (#Input.InputFrame.InputBox.Text - 1) == InputSettings.MaxCharacters then
						Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1, InputSettings.MaxCharacters)
					end
				end
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 30)}):Play()
				if not InputSettings.Enter then
					local Success, Response = pcall(function()
						InputSettings.Callback(Input.InputFrame.InputBox.Text)
					end)
					if not Success then
						TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
						TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
						Input.Title.Text = "Callback Error"
						warn("Nutriex Hub | "..InputSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Input.Title.Text = InputSettings.Name
						TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
						TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
						TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
					end
				end
				InputV.CurrentValue = Input.InputFrame.InputBox.Text				
			end)

			Input["MouseEnter"]:Connect(function()
				tween(Input.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Input["MouseLeave"]:Connect(function()
				tween(Input.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)


			function InputV:Set(NewInputSettings)

				NewInputSettings = Kwargify(InputSettings, NewInputSettings or {})

				InputV.Settings = NewInputSettings
				InputSettings = NewInputSettings

				Input.Name = InputSettings.Name
				Input.Title.Text = InputSettings.Name
				if InputSettings.Description ~= nil and InputSettings.Description ~= "" and Input.Desc ~= nil then
					Input.Desc.Text = InputSettings.Description
				end

				Input.InputFrame.InputBox:CaptureFocus()
				Input.InputFrame.InputBox.Text = tostring(InputSettings.CurrentValue)
				Input.InputFrame.InputBox:ReleaseFocus()
				Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 52, 0, 42)

				InputV.CurrentValue = InputSettings.CurrentValue
			end

			function InputV:Destroy()
				Input.Visible = false
				Input:Destroy()
			end

			if Flag then
				Nutriex.Options[Flag] = InputV
			end


			return InputV

		end

		-- Dropdown
		function Tab:CreateDropdown(DropdownSettings, Flag)
			local DropdownV = { IgnoreConfig = false, Class = "Dropdown", Settings = DropdownSettings}

			DropdownSettings = Kwargify({
				Name = "Dropdown",
				Description = nil,
				Options = {"Option 1", "Option 2"},
				CurrentOption = {"Option 1"},
				MultipleOptions = false,
				SpecialType = nil, -- currently onl player, might add more soon
				Callback = function(Options)
					-- The function that takes place when the selected option is changed
					-- The variable (Options) is a table of strings for the current selected options or a string if multioptions is false
				end,
			}, DropdownSettings or {})

			DropdownV.CurrentOption = DropdownSettings.CurrentOption

			local descriptionbool = false
			if DropdownSettings.Description ~= nil and DropdownSettings.Description ~= "" then
				descriptionbool = true
			end
			local closedsize
			local openedsize
			if descriptionbool then
				closedsize = 48
				openedsize = 170
			elseif not descriptionbool then
				closedsize = 38
				openedsize = 160
			end
			local opened = false

			local Dropdown
			if descriptionbool then Dropdown = Elements.Template.DropdownDesc:Clone() else Dropdown = Elements.Template.Dropdown:Clone() end

			Dropdown.Name = DropdownSettings.Name
			Dropdown.Title.Text = DropdownSettings.Name
			if descriptionbool then Dropdown.Desc.Text = DropdownSettings.Description end

			Dropdown.Parent = TabPage
			Dropdown.Visible = true

			local function Toggle()
				opened = not opened
				if opened then
					tween(Dropdown.icon, {Rotation = 180})
					tween(Dropdown, {Size = UDim2.new(1, -25, 0, openedsize)})
				else
					tween(Dropdown.icon, {Rotation = 0})
					tween(Dropdown, {Size = UDim2.new(1, -25, 0, closedsize)})
				end
			end

			local function SafeCallback(param, c2)
				local Success, Response = pcall(function()
					DropdownSettings.Callback(param)
				end)
				if not Success then
					TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					Dropdown.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Dropdown.Title.Text = DropdownSettings.Name
					TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end
				if Success and c2 then
					c2()
				end
			end

			-- fixed by justhey
			Dropdown.Selected:GetPropertyChangedSignal("Text"):Connect(function()
				local text = Dropdown.Selected.Text:lower()
				for _, Item in ipairs(Dropdown.List:GetChildren()) do
					if Item:IsA("TextLabel") and Item.Name ~= "Template" then
						Item.Visible = text == "" or string.find(Item.Name:lower(), text, 1, true) ~= nil
					end
				end
			end)


			local function Clear()
				for _, option in ipairs(Dropdown.List:GetChildren()) do
					if option.ClassName == "TextLabel" and option.Name ~= "Template" then
						option:Destroy()
					end
				end
			end

			local function ActivateColorSingle(name)
				for _, Option in pairs(Dropdown.List:GetChildren()) do
					if Option.ClassName == "TextLabel" and Option.Name ~= "Template" then
						tween(Option, {BackgroundTransparency = 0.98})
					end
				end

				Toggle()
				tween(Dropdown.List[name], {BackgroundTransparency = 0.95, TextColor3 = Color3.fromRGB(240,240,240)})
			end

			local function Refresh()
				Clear()
				for i,v in pairs(DropdownSettings.Options) do
					local Option = Dropdown.List.Template:Clone()
					local optionhover = false
					Option.Text = v
					if v == "Template" then v = "Template (Name)" end
					Option.Name = v
					Option.Interact.MouseButton1Click:Connect(function()
						local bleh
						if DropdownSettings.MultipleOptions then
							if table.find(DropdownSettings.CurrentOption, v) then
								RemoveTable(DropdownSettings.CurrentOption, v)
								DropdownV.CurrentOption = DropdownSettings.CurrentOption
								if not optionhover then
									tween(Option, {TextColor3 = Color3.fromRGB(200,200,200)})
								end
								tween(Option, {BackgroundTransparency = 0.98})
							else
								table.insert(DropdownSettings.CurrentOption, v)
								DropdownV.CurrentOption = DropdownSettings.CurrentOption
								tween(Option, {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
							end
							bleh = DropdownSettings.CurrentOption
						else
							DropdownSettings.CurrentOption = {v}
							bleh = v
							DropdownV.CurrentOption = bleh
							ActivateColorSingle(v)
						end

						SafeCallback(bleh, function()
							if DropdownSettings.MultipleOptions then
								if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
									if #DropdownSettings.CurrentOption == 1 then
										Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
									elseif #DropdownSettings.CurrentOption == 0 then
										Dropdown.Selected.PlaceholderText = "None"
									else
										Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
									end
								else
									DropdownSettings.CurrentOption = {}
									Dropdown.Selected.PlaceholderText = "None"
								end
							end
							if not DropdownSettings.MultipleOptions then
								Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
							end
							Dropdown.Selected.Text = ""
						end)
					end)
					Option.Visible = true
					Option.Parent = Dropdown.List
					Option.MouseEnter:Connect(function()
						optionhover = true
						if Option.BackgroundTransparency == 0.95 then
							return
						else
							tween(Option, {TextColor3 = Color3.fromRGB(240,240,240)})
						end
					end)
					Option.MouseLeave:Connect(function()
						optionhover = false
						if Option.BackgroundTransparency == 0.95 then
							return
						else
							tween(Option, {TextColor3 = Color3.fromRGB(200,200,200)})
						end
					end)	
				end
			end

			local function PlayerTableRefresh()
				for i,v in pairs(DropdownSettings.Options) do
					table.remove(DropdownSettings.Options, i)
				end

				for i,v in pairs(Players:GetChildren()) do
					table.insert(DropdownSettings.Options, v.Name)
				end
			end

			Dropdown.Interact.MouseButton1Click:Connect(function()
				Toggle()
			end)

			Dropdown["MouseEnter"]:Connect(function()
				tween(Dropdown.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)

			Dropdown["MouseLeave"]:Connect(function()
				tween(Dropdown.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)

			if DropdownSettings.SpecialType == "Player" then

				for i,v in pairs(DropdownSettings.Options) do
					table.remove(DropdownSettings.Options, i)
				end
				PlayerTableRefresh()
				DropdownSettings.CurrentOption = DropdownSettings.Options[1]

				Players.PlayerAdded:Connect(function() PlayerTableRefresh() end)
				Players.PlayerRemoving:Connect(function() PlayerTableRefresh() end)

			end

			Refresh()

			if DropdownSettings.CurrentOption then
				if type(DropdownSettings.CurrentOption) == "string" then
					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
				end
				if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
				end
			else
				DropdownSettings.CurrentOption = {}
			end

			local bleh, ind = nil,0
			for i,v in pairs(DropdownSettings.CurrentOption) do
				ind = ind + 1
			end
			if ind == 1 then bleh = DropdownSettings.CurrentOption[1] else bleh = DropdownSettings.CurrentOption end
			SafeCallback(bleh)
			if type(bleh) == "string" then 
				tween(Dropdown.List[bleh], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
			else
				for i,v in pairs(bleh) do
					tween(Dropdown.List[v], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})
				end
			end

			if DropdownSettings.MultipleOptions then
				if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
					if #DropdownSettings.CurrentOption == 1 then
						Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
					elseif #DropdownSettings.CurrentOption == 0 then
						Dropdown.Selected.PlaceholderText = "None"
					else
						Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
					end
				else
					DropdownSettings.CurrentOption = {}
					Dropdown.Selected.PlaceholderText = "None"
				end
				for _, name in pairs(DropdownSettings.CurrentOption) do
					tween(Dropdown.List[name], {TextColor3 = Color3.fromRGB(227,227,227), BackgroundTransparency = 0.95})
				end
			else
				Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
			end
			Dropdown.Selected.Text = ""

			function DropdownV:Set(NewDropdownSettings)
				NewDropdownSettings = Kwargify(DropdownSettings, NewDropdownSettings or {})

				DropdownV.Settings = NewDropdownSettings
				DropdownSettings = NewDropdownSettings

				Dropdown.Name = DropdownSettings.Name
				Dropdown.Title.Text = DropdownSettings.Name
				if DropdownSettings.Description ~= nil and DropdownSettings.Description ~= "" and Dropdown.Desc ~= nil then
					Dropdown.Desc.Text = DropdownSettings.Description
				end

				if DropdownSettings.SpecialType == "Player" then

					for i,v in pairs(DropdownSettings.Options) do
						table.remove(DropdownSettings.Options, i)
					end
					PlayerTableRefresh()
					DropdownSettings.CurrentOption = DropdownSettings.Options[1]                    
					Players.PlayerAdded:Connect(function() PlayerTableRefresh() end)
					Players.PlayerRemoving:Connect(function() PlayerTableRefresh() end)

				end

				Refresh()

				if DropdownSettings.CurrentOption then
					if type(DropdownSettings.CurrentOption) == "string" then
						DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
					end
					if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
						DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
					end
				else
					DropdownSettings.CurrentOption = {}
				end

				local bleh, ind = nil,0
				for i,v in pairs(DropdownSettings.CurrentOption) do
					ind = ind + 1
				end
				if ind == 1 then bleh = DropdownSettings.CurrentOption[1] else bleh = DropdownSettings.CurrentOption end
				SafeCallback(bleh)
				for _, Option in pairs(Dropdown.List:GetChildren()) do
					if Option.ClassName == "TextLabel" then
						tween(Option, {TextColor3 = Color3.fromRGB(200,200,200), BackgroundTransparency = 0.98})
					end
				end
				tween(Dropdown.List[bleh], {TextColor3 = Color3.fromRGB(240,240,240), BackgroundTransparency = 0.95})

				if DropdownSettings.MultipleOptions then
					if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
						if #DropdownSettings.CurrentOption == 1 then
							Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1]
						elseif #DropdownSettings.CurrentOption == 0 then
							Dropdown.Selected.PlaceholderText = "None"
						else
							Dropdown.Selected.PlaceholderText = unpackt(DropdownSettings.CurrentOption)
						end
					else
						DropdownSettings.CurrentOption = {}
						Dropdown.Selected.PlaceholderText = "None"
					end
					for _, name in pairs(DropdownSettings.CurrentOption) do
						tween(Dropdown.List[name], {TextColor3 = Color3.fromRGB(227,227,227), BackgroundTransparency = 0.95})
					end
				else
					Dropdown.Selected.PlaceholderText = DropdownSettings.CurrentOption[1] or "None"
				end
				Dropdown.Selected.Text = ""

				-- Nutriex.Flags[DropdownSettings.Flag] = DropdownSettings

			end

			function DropdownV:Destroy()
				Dropdown.Visible = false
				Dropdown:Destroy()
			end

			if Flag then
				Nutriex.Options[Flag] = DropdownV
			end

			-- Nutriex.Flags[DropdownSettings.Flag] = DropdownSettings

			return DropdownV

		end

		-- Color Picker
		function Tab:CreateColorPicker(ColorPickerSettings, Flag) -- by Rayfield/Throit
			local ColorPickerV = {IgnoreClass = false, Class = "Colorpicker", Settings = ColorPickerSettings}

			ColorPickerSettings = Kwargify({
				Name = "Color Picker",
				Color = Color3.fromRGB(255,255,255),
				Callback = function(Value)
					-- The function that takes place every time the color picker is moved/changed
					-- The variable (Value) is a Color3fromRGB value based on which color is selected
				end
			}, ColorPickerSettings or {})

			local function Color3ToHex(color)
				return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
			end

			ColorPickerV.Color = Color3ToHex(ColorPickerSettings.Color)

			local closedsize = UDim2.new(0, 75, 0, 22)
			local openedsize = UDim2.new(0, 219, 0, 129)

			local ColorPicker = Elements.Template.ColorPicker:Clone()
			local Background = ColorPicker.CPBackground
			local Display = Background.Display
			local Main = Background.MainCP
			local Slider = ColorPicker.ColorSlider

			ColorPicker.Name = ColorPickerSettings.Name
			ColorPicker.Title.Text = ColorPickerSettings.Name
			ColorPicker.Visible = true
			ColorPicker.Parent = TabPage
			ColorPicker.Size = UDim2.new(1.042, -25,0, 38)
			Background.Size = closedsize
			Display.BackgroundTransparency = 0

			ColorPicker["MouseEnter"]:Connect(function()
				tween(ColorPicker.UIStroke, {Color = Color3.fromRGB(87, 84, 104)})
			end)
			ColorPicker["MouseLeave"]:Connect(function()
				tween(ColorPicker.UIStroke, {Color = Color3.fromRGB(64,61,76)})
			end)

			local function SafeCallback(param, c2)
				local Success, Response = pcall(function()
					ColorPickerSettings.Callback(param)
				end)
				if not Success then
					TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
					TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
					ColorPicker.Title.Text = "Callback Error"
					warn("Nutriex Hub | "..ColorPickerSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					ColorPicker.Title.Text = ColorPickerSettings.Name
					TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.5}):Play()
					TweenService:Create(ColorPicker, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(32, 30, 38)}):Play()
					TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end
				if Success and c2 then
					c2()
				end
			end

			local opened = false

			local mouse = game.Players.LocalPlayer:GetMouse()
			Main.Image = "rbxassetid://11415645739"
			local mainDragging = false 
			local sliderDragging = false 
			ColorPicker.Interact.MouseButton1Down:Connect(function()
				if not opened then
					opened = true 
					tween(ColorPicker, {Size = UDim2.new( 1.042, -25,0, 165)}, nil, TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
					tween(Background, {Size = openedsize})
					tween(Display, {BackgroundTransparency = 1})
				else
					opened = false
					tween(ColorPicker, {Size = UDim2.new(1.042, -25,0, 38)}, nil, TweenInfo.new(0.6, Enum.EasingStyle.Exponential))
					tween(Background, {Size = closedsize})
					tween(Display, {BackgroundTransparency = 0})
				end
			end)
			UserInputService.InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
					mainDragging = false
					sliderDragging = false
				end end)
			Main.MouseButton1Down:Connect(function()
				if opened then
					mainDragging = true 
				end
			end)
			Main.MainPoint.MouseButton1Down:Connect(function()
				if opened then
					mainDragging = true 
				end
			end)
			Slider.MouseButton1Down:Connect(function()
				sliderDragging = true 
			end)
			Slider.SliderPoint.MouseButton1Down:Connect(function()
				sliderDragging = true 
			end)
			local h,s,v = ColorPickerSettings.Color:ToHSV()
			local color = Color3.fromHSV(h,s,v) 
			local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
			local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
			ColorPicker.HexInput.InputBox.Text = hex
			local function setDisplay(hp,sp,vp)
				--Main
				Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
				Main.MainPoint.ImageColor3 = Color3.fromHSV(hp,sp,vp)
				Background.BackgroundColor3 = Color3.fromHSV(hp,1,1)
				Display.BackgroundColor3 = Color3.fromHSV(hp,sp,vp)
				--Slider 
				local x = hp * Slider.AbsoluteSize.X
				Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
				Slider.SliderPoint.ImageColor3 = Color3.fromHSV(hp,1,1)
				local color = Color3.fromHSV(hp,sp,vp) 
				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				ColorPicker.RInput.InputBox.Text = tostring(r)
				ColorPicker.GInput.InputBox.Text = tostring(g)
				ColorPicker.BInput.InputBox.Text = tostring(b)
				hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
				ColorPicker.HexInput.InputBox.Text = hex
			end
			setDisplay(h,s,v)
			ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
				if not pcall(function()
						local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
						local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
						h,s,v = rgbColor:ToHSV()
						hex = ColorPicker.HexInput.InputBox.Text
						setDisplay()
						ColorPickerSettings.Color = rgbColor
					end) 
				then 
					ColorPicker.HexInput.InputBox.Text = hex 
				end
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				SafeCallback( Color3.fromRGB(r,g,b))
			end)
			--RGB
			local function rgbBoxes(box,toChange)
				local value = tonumber(box.Text) 
				local color = Color3.fromHSV(h,s,v) 
				local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				local save 
				if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
				if value then 
					value = math.clamp(value,0,255)
					h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()
					setDisplay()
				else 
					box.Text = tostring(save)
				end
				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
			end
			ColorPicker.RInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RInput.InputBox,"R")
				SafeCallback(Color3.fromRGB(r,g,b))
			end)
			ColorPicker.GInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.GInput.InputBox,"G")
				SafeCallback(Color3.fromRGB(r,g,b))
			end)
			ColorPicker.BInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.BInput.InputBox,"B")
				SafeCallback(Color3.fromRGB(r,g,b))
			end)
			RunService.RenderStepped:connect(function()
				if mainDragging then 
					local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
					local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
					Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
					s = localX / Main.AbsoluteSize.X
					v = 1 - (localY / Main.AbsoluteSize.Y)
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RInput.InputBox.Text = tostring(r)
					ColorPicker.GInput.InputBox.Text = tostring(g)
					ColorPicker.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					SafeCallback(Color3.fromRGB(r,g,b))
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					ColorPickerV.Color = ColorPickerSettings.Color
				end
				if sliderDragging then 
					local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
					h = localX / Slider.AbsoluteSize.X
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
					Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RInput.InputBox.Text = tostring(r)
					ColorPicker.GInput.InputBox.Text = tostring(g)
					ColorPicker.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					SafeCallback(Color3.fromRGB(r,g,b))
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					ColorPickerV.Color = ColorPickerSettings.Color
				end
			end)

			function ColorPickerV:Set(NewColorPickerSettings)

				NewColorPickerSettings = Kwargify(ColorPickerSettings, NewColorPickerSettings or {})

				ColorPickerV.Settings = NewColorPickerSettings
				ColorPickerSettings = NewColorPickerSettings

				ColorPicker.Name = ColorPickerSettings.Name
				ColorPicker.Title.Text = ColorPickerSettings.Name
				ColorPicker.Visible = true

				local h,s,v = ColorPickerSettings.Color:ToHSV()
				local color = Color3.fromHSV(h,s,v) 
				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
				ColorPicker.HexInput.InputBox.Text = hex
				setDisplay(h,s,v)
				SafeCallback(Color3.fromRGB(r,g,b))

				ColorPickerV.Color = ColorPickerSettings.Color
			end

			function ColorPickerV:Destroy()
				ColorPicker:Destroy()
			end

			if Flag then
				Nutriex.Options[Flag] = ColorPickerV
			end

			SafeCallback(ColorPickerSettings.Color)

			return ColorPickerV
		end


		function Tab:BuildConfigSection()
			if isStudio then
				Tab:CreateLabel({Text = "Config system unavailable. (Environment isStudio)", Style = 3})
				return "Config system unavailable." 
			end

			local inputPath = nil
			local selectedConfig = nil

			local Title = Elements.Template.Title:Clone()
			Title.Text = "Configurations"
			Title.Visible = true
			Title.Parent = TabPage
			Title.TextTransparency = 1
			TweenService:Create(Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

			Tab:CreateSection("Config Creator")

			Tab:CreateInput({
				Name = "Config Name",
				Description = "Insert a name for your to be created config.",
				PlaceholderText = "Name",
				CurrentValue = "",
				Numeric = false,
				MaxCharacters = nil,
				Enter = false,
				Callback = function(input)
					inputPath = input
				end,
			})

			local configSelection

			Tab:CreateButton({
				Name = "Create Config",
				Description = "Create a config with all of your current settings.",
				Callback = function()
					if not inputPath or string.gsub(inputPath, " ", "") == "" then
						Nutriex:Notification({
							Title = "Interface",
							Icon = "warning",
							ImageSource = "Material",
							Content = "Config name cannot be empty."
						})
						return
					end

					local success, returned = Nutriex:SaveConfig(inputPath)
					if not success then
						Nutriex:Notification({
							Title = "Interface",
							Icon = "error",
							ImageSource = "Material",
							Content = "Unable to save config, return error: " .. returned
						})
					end

					Nutriex:Notification({
						Title = "Interface",
						Icon = "info",
						ImageSource = "Material",
						Content = string.format("Created config %q", inputPath),
					})

					configSelection:Set({ Options = Nutriex:RefreshConfigList() })
				end
			})

			Tab:CreateSection("Config Load/Settings")


			configSelection = Tab:CreateDropdown({
				Name = "Select Config",
				Description = "Select a config to load your settings on.",
				Options = Nutriex:RefreshConfigList(),
				CurrentOption = {},
				MultipleOptions = false,
				SpecialType = nil,
				Callback = function(Value)
					selectedConfig = Value
				end,
			})

			Tab:CreateButton({
				Name = "Load Config",
				Description = "Load your saved config settings.",
				Callback = function()
					local success, returned = Nutriex:LoadConfig(selectedConfig)
					if not success then
						Nutriex:Notification({
							Title = "Interface",
							Icon = "error",
							ImageSource = "Material",
							Content = "Unable to load config, return error: " .. returned
						})
						return
					end

					Nutriex:Notification({
						Title = "Interface",
						Icon = "info",
						ImageSource = "Material",
						Content = string.format("Loaded config %q", selectedConfig),
					})
				end
			})

			Tab:CreateButton({
				Name = "Overwrite Config",
				Description = "Overwrite your current config settings.",
				Callback = function()
					local success, returned = Nutriex:SaveConfig(selectedConfig)
					if not success then
						Nutriex:Notification({
							Title = "Interface",
							Icon = "error",
							ImageSource = "Material",
							Content = "Unable to overwrite config, return error: " .. returned
						})
						return
					end

					Nutriex:Notification({
						Title = "Interface",
						Icon = "info",
						ImageSource = "Material",
						Content = string.format("Overwrote config %q", selectedConfig),
					})
				end
			})

			Tab:CreateButton({
				Name = "Refresh Config List",
				Description = "Refresh the current config list.",
				Callback = function()
					configSelection:Set({ Options = Nutriex:RefreshConfigList() })
				end,
			})

			local loadlabel
			Tab:CreateButton({
				Name = "Set as autoload",
				Description = "Set a config to auto load setting in your next session.",
				Callback = function()
					local name = selectedConfig
					writefile(Nutriex.Folder .. "/settings/autoload.txt", name)
					loadlabel:Set({ Text = "Current autoload config: " .. name })

					Nutriex:Notification({
						Title = "Interface",
						Icon = "info",
						ImageSource = "Material",
						Content = string.format("Set %q to auto load", name),
					})
				end,
			})

			loadlabel = Tab:CreateParagraph({
				Title = "Current Auto Load",
				Text = "None"
			})

			Tab:CreateButton({
				Name = "Delete Autoload",
				Description = "Delete The Autoload File",
				Callback = function()
					local name = selectedConfig
					delfile(Nutriex.Folder .. "/settings/autoload.txt")
					loadlabel:Set({ Text = "None" })

					Nutriex:Notification({
						Title = "Interface",
						Icon = "info",
						ImageSource = "Material",
						Content = "Deleted Autoload",
					})
				end,
			})

			if isfile(Nutriex.Folder .. "/settings/autoload.txt") then
				local name = readfile(Nutriex.Folder .. "/settings/autoload.txt")
				loadlabel:Set( { Text = "Current autoload config: " .. name })
			end     
		end

		local ClassParser = {
			["Toggle"] = {
				Save = function(Flag, data)
					return {
						type = "Toggle", 
						flag = Flag, 
						state = data.CurrentValue or false
					}
				end,
				Load = function(Flag, data)
					if Nutriex.Options[Flag] then
						Nutriex.Options[Flag]:Set({ CurrentValue = data.state })
					end
				end
			},
			["Slider"] = {
				Save = function(Flag, data)
					return {
						type = "Slider", 
						flag = Flag, 
						value = (data.CurrentValue and tostring(data.CurrentValue)),
					}
				end,
				Load = function(Flag, data)
					if Nutriex.Options[Flag] and data.value then
						Nutriex.Options[Flag]:Set({ CurrentValue = data.value })
					end
				end
			},
			["Input"] = {
				Save = function(Flag, data)
					return {
						type = "Input", 
						flag = Flag, 
						text = data.CurrentValue
					}
				end,
				Load = function(Flag, data)
					if Nutriex.Options[Flag] and data.text and type(data.text) == "string" then
						Nutriex.Options[Flag]:Set({ CurrentValue = data.text })
					end
				end
			},
			["Dropdown"] = {
				Save = function(Flag, data)
					return {
						type = "Dropdown", 
						flag = Flag, 
						value = data.CurrentOption
					}
				end,
				Load = function(Flag, data)
					if Nutriex.Options[Flag] and data.value then
						Nutriex.Options[Flag]:Set({ CurrentOption = data.value })
					end
				end
			},
			-- buggy as hell stil
			["Colorpicker"] = {
				Save = function(Flag, data)
					local function Color3ToHex(color)
						return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
					end

					return {
						type = "Colorpicker", 
						flag = Flag, 
						color = Color3ToHex(data.Color) or nil,
						alpha = data.Alpha
					}
				end,
				Load = function(Flag, data)
					local function HexToColor3(hex)
						local r = tonumber(hex:sub(2, 3), 16) / 255
						local g = tonumber(hex:sub(4, 5), 16) / 255
						local b = tonumber(hex:sub(6, 7), 16) / 255
						return Color3.new(r, g, b)
					end

					if Nutriex.Options[Flag] and data.color then
						Nutriex.Options[Flag]:Set({Color = HexToColor3(data.color)})
					end
				end
			}
		}


		function Tab:BuildThemeSection()

			local Title = Elements.Template.Title:Clone()
			Title.Text = "Theming"
			Title.Visible = true
			Title.Parent = TabPage
			Title.TextTransparency = 1
			TweenService:Create(Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

			Tab:CreateSection("Custom Editor")

			local c1cp = Tab:CreateColorPicker({
				Name = "Color 1",
				Color = Color3.fromRGB(117, 164, 206),
			}, "NutriexInterfaceSuitePrebuiltCPC1") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

			local c2cp = Tab:CreateColorPicker({
				Name = "Color 2",
				Color = Color3.fromRGB(123, 201, 201),
			}, "NutriexInterfaceSuitePrebuiltCPC2")

			local c3cp = Tab:CreateColorPicker({
				Name = "Color 3",
				Color = Color3.fromRGB(224, 138, 184),
			}, "NutriexInterfaceSuitePrebuiltCPC3") 

			task.wait(1)

			c1cp:Set({
				Callback = function(Value)
					if c2cp and c3cp then
						Nutriex.ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Value or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, c2cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, c3cp.Color or Color3.fromRGB(255,255,255))}
						NutriexLibrary.ThemeRemote.Value = not NutriexLibrary.ThemeRemote.Value
					end
				end
			})

			c2cp:Set({
				Callback = function(Value)
					if c1cp and c3cp then
						Nutriex.ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, c1cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, Value or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, c3cp.Color or Color3.fromRGB(255,255,255))}
						NutriexLibrary.ThemeRemote.Value = not NutriexLibrary.ThemeRemote.Value
					end
				end
			})

			c3cp:Set({
				Callback = function(Valuex)
					if c2cp and c1cp then
						Nutriex.ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, c1cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, c2cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, Valuex or Color3.fromRGB(255,255,255))}
						NutriexLibrary.ThemeRemote.Value = not NutriexLibrary.ThemeRemote.Value
					end
				end
			})

			Tab:CreateSection("Preset Gradients")

			for i,v in pairs(PresetGradients) do
				Tab:CreateButton({
					Name = tostring(i),
					Callback = function()
						c1cp:Set({ Color = v[1] })
						c2cp:Set({ Color = v[2] })
						c3cp:Set({ Color = v[3] })
					end,
				})
			end

		end


		local function BuildFolderTree()
			if isStudio then return "Config system unavailable." end
			local paths = {
				Nutriex.Folder,
				Nutriex.Folder .. "/settings"
			}

			for i = 1, #paths do
				local str = paths[i]
				if not isfolder(str) then
					makefolder(str)
				end
			end
		end

		local function SetFolder()

			if isStudio then return "Config system unavailable." end

			if WindowSettings.ConfigSettings.RootFolder ~= nil and WindowSettings.ConfigSettings.RootFolder ~= "" then
				Nutriex.Folder = WindowSettings.ConfigSettings.RootFolder .. "/" .. WindowSettings.ConfigSettings.ConfigFolder
			else
				Nutriex.Folder = WindowSettings.ConfigSettings.ConfigFolder
			end

			BuildFolderTree()
		end

		SetFolder()

		function Nutriex:SaveConfig(Path)
			if isStudio then return "Config system unavailable." end

			if (not Path) then
				return false, "Please select a config file."
			end

			local fullPath = Nutriex.Folder .. "/settings/" .. Path .. ".Nutriex"

			local data = {
				objects = {}
			}

			for flag, option in next, Nutriex.Options do
				if not ClassParser[option.Class] then continue end
				if option.IgnoreConfig then continue end

				table.insert(data.objects, ClassParser[option.Class].Save(flag, option))
			end	

			local success, encoded = pcall(HttpService.JSONEncode, HttpService, data)
			if not success then
				return false, "Unable to encode into JSON data"
			end

			writefile(fullPath, encoded)
			return true
		end

		function Nutriex:LoadConfig(Path)
			if isStudio then return "Config system unavailable." end

			if (not Path) then
				return false, "Please select a config file."
			end

			local file = Nutriex.Folder .. "/settings/" .. Path .. ".Nutriex"
			if not isfile(file) then return false, "Invalid file" end

			local success, decoded = pcall(HttpService.JSONDecode, HttpService, readfile(file))
			if not success then return false, "Unable to decode JSON data." end

			for _, option in next, decoded.objects do
				if ClassParser[option.type] then
					task.spawn(function() 
						ClassParser[option.type].Load(option.flag, option) 
					end)
				end
			end

			return true
		end

		function Nutriex:LoadAutoloadConfig()
			if isfile(Nutriex.Folder .. "/settings/autoload.txt") then

				if isStudio then return "Config system unavailable." end

				local name = readfile(Nutriex.Folder .. "/settings/autoload.txt")

				local success, err = Nutriex:LoadConfig(name)
				if not success then
					return Nutriex:Notification({
						Title = "Interface",
						Icon = "sparkle",
						ImageSource = "Material",
						Content = "Failed to load autoload config: " .. err,
					})
				end

				Nutriex:Notification({
					Title = "Interface",
					Icon = "sparkle",
					ImageSource = "Material",
					Content = string.format("Auto loaded config %q", name),
				})

			end 
		end

		function Nutriex:RefreshConfigList()
			if isStudio then return "Config system unavailable." end

			local list = listfiles(Nutriex.Folder .. "/settings")

			local out = {}
			for i = 1, #list do
				local file = list[i]
				if file:sub(-5) == ".Nutriex" then
					local pos = file:find(".Nutriex", 1, true)
					local start = pos

					local char = file:sub(pos, pos)
					while char ~= "/" and char ~= "\\" and char ~= "" do
						pos = pos - 1
						char = file:sub(pos, pos)
					end

					if char == "/" or char == "\\" then
						local name = file:sub(pos + 1, start - 1)
						if name ~= "options" then
							table.insert(out, name)
						end
					end
				end
			end

			return out
		end
		return Tab
	end


	Elements.Parent.Visible = true
	tween(Elements.Parent, {BackgroundTransparency = 0.1})
	Navigation.Visible = true
	tween(Navigation.Line, {BackgroundTransparency = 0})

	for _, TopbarButton in ipairs(Main.Controls:GetChildren()) do
		if TopbarButton.ClassName == "Frame" and TopbarButton.Name ~= "Theme" then
			TopbarButton.Visible = true
			tween(TopbarButton, {BackgroundTransparency = 0.25})
			tween(TopbarButton.UIStroke, {Transparency = 0.5})
			tween(TopbarButton.ImageLabel, {ImageTransparency = 0.25})
		end
	end

	Main.Controls.Close.ImageLabel.MouseButton1Click:Connect(function()
		Hide(Main, Window.Bind, true)
		dragBar.Visible = false
		Window.State = false
		if UserInputService.KeyboardEnabled == false then
			NutriexLibrary.MobileSupport.Visible = true
		end
	end)
	Main.Controls.Close["MouseEnter"]:Connect(function()
		tween(Main.Controls.Close.ImageLabel, {ImageColor3 = Color3.new(1,1,1)})
	end)
	Main.Controls.Close["MouseLeave"]:Connect(function()
		tween(Main.Controls.Close.ImageLabel, {ImageColor3 = Color3.fromRGB(195,195,195)})
	end)

	UserInputService.InputBegan:Connect(function(input, gpe)
		if gpe then return end
		if Window.State then return end
		if input.KeyCode == Window.Bind then
			Unhide(Main, Window.CurrentTab)
			NutriexLibrary.MobileSupport.Visible = false
			dragBar.Visible = true
			Window.State = true
		end
	end)

	Main.Logo.MouseButton1Click:Connect(function()
		if Navigation.Size.X.Offset == 205 then
			tween(Elements.Parent, {Size = UDim2.new(1, -55, Elements.Parent.Size.Y.Scale, Elements.Parent.Size.Y.Offset)})
			tween(Navigation, {Size = UDim2.new(Navigation.Size.X.Scale, 55, Navigation.Size.Y.Scale, Navigation.Size.Y.Offset)})
		else
			tween(Elements.Parent, {Size = UDim2.new(1, -205, Elements.Parent.Size.Y.Scale, Elements.Parent.Size.Y.Offset)})
			tween(Navigation, {Size = UDim2.new(Navigation.Size.X.Scale, 205, Navigation.Size.Y.Scale, Navigation.Size.Y.Offset)})
		end
	end)

	Main.Controls.ToggleSize.ImageLabel.MouseButton1Click:Connect(function()
		Window.Size = not Window.Size
		if Window.Size then
			Minimize(Main)
			dragBar.Visible = false
		else
			Maximise(Main)
			dragBar.Visible = true
		end
	end)
	Main.Controls.ToggleSize["MouseEnter"]:Connect(function()
		tween(Main.Controls.ToggleSize.ImageLabel, {ImageColor3 = Color3.new(1,1,1)})
	end)
	Main.Controls.ToggleSize["MouseLeave"]:Connect(function()
		tween(Main.Controls.ToggleSize.ImageLabel, {ImageColor3 = Color3.fromRGB(195,195,195)})
	end)

	Main.Controls.Theme.ImageLabel.MouseButton1Click:Connect(function()
		if Window.Settings then
			Window.Settings:Activate()
			Elements.Settings.CanvasPosition = Vector2.new(0,698)
		end
	end)
	Main.Controls.Theme["MouseEnter"]:Connect(function()
		tween(Main.Controls.Theme.ImageLabel, {ImageColor3 = Color3.new(1,1,1)})
	end)
	Main.Controls.Theme["MouseLeave"]:Connect(function()
		tween(Main.Controls.Theme.ImageLabel, {ImageColor3 = Color3.fromRGB(195,195,195)})
	end)	


	NutriexLibrary.MobileSupport.Interact.MouseButton1Click:Connect(function()
		Unhide(Main, Window.CurrentTab)
		dragBar.Visible = true
		Window.State = true
		NutriexLibrary.MobileSupport.Visible = false
	end)

	return Window
end

function Nutriex:Destroy()
	Main.Visible = false
	for _, Notification in ipairs(Notifications:GetChildren()) do
		if Notification.ClassName == "Frame" then
			Notification.Visible = false
			Notification:Destroy()
		end
	end
	NutriexLibrary:Destroy()
end

if isStudio then
	local Window = Nutriex:CreateWindow({
		Name = "Nebula Client - Nutriex Hub | Blade Ball",
		Subtitle = "by Nebula Softworks",
		LogoID = "123795201100198",
		LoadingEnabled = true,
		LoadingTitle = "Nebula Client (Nutriex Hub)",
		LoadingSubtitle = "Loading script for Blade Ball",
		KeySystem = true,
		KeySettings = {
			Title = "Nebula Client | Key System",
			Subtitle = "Blade Ball",
			Note = "Please Enter Your Key To Use Nebula Client",
			FileName = "Key", -- the name of the key file. this will be saved in ur RootFolder. However, if you don't have one, it'll save in ur config folder instead
			SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
			Key = {"Example Key"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
			SecondAction = {
				Enabled = true,
				Type = "Link", -- Link/Discord
				Parameter = "" -- for discord, add the invite link like home tab. for link, type the link of ur key sys
			}
		}
	})
	
	--[[local Window = Nutriex:CreateWindow({
		Name = "Nutriex Example Window",
		Subtitle = "Test",
		LogoID = "6031097225",
		LoadingEnabled = true,
		LoadingTitle = "Nutriex Interface Suite",
		LoadingSubtitle = "by Nebula Softworks",
		KeySystem = true,
		KeySettings = {
			Title = "Nutriex Example Key",
			Subtitle = "Key System",
			Note = "Please Enter Your Key To Use Example Hub",
			FileName = "Key", -- the name of the key file. this will be saved in ur RootFolder. However, if you don't have one, it'll save in ur config folder instead
			SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
			Key = {"Example Key"} -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		}
	})

	Nutriex:Notification({ 
		Title = "Welcome to Nutriex",
		Icon = "sparkle",
		ImageSource = "Material",
		Content = "Welcome to the Nutriex Interface Suite. This Is an Amazing Quality Freemium UI Library For Roblox Exploiting Made By Nebula Softworks. Nutriex was Created in hopes of improving the standard of UI Library designs by being the golden standard for it. Nutriex Has Amazing Features like a key system, notification and perfection in aesthetics and design. So, What Are You Waiting For? Start Using Nutriex Today at " .. website
	})

	local Tabs = {
		Main = Window:CreateTab({
			Name = "Tab Example 1",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true
		}),
		Main2 = Window:CreateTab({
			Name = "Tab Example 2",
			Icon = "location_searching",
			ImageSource = "Material",
			ShowTitle = false
		}),
		Premium = Window:CreateTab({
			Name = "Premium Tab",
			Icon = "sparkle",
			ImageSource = "Material",
			ShowTitle = true
		}),
		Debug = Window:CreateTab({
			Name = "Debug",
			Icon = "settings"
		})
	}


	Window:CreateHomeTab()
	local bleh =Tabs.Debug:CreateColorPicker()
	Tabs.Debug:CreateButton({
		Callback = function()
			bleh:Set({
				Color = Color3.fromRGB(0,0,0)
			})
		end,
	})

	Tabs.Main:CreateSection("Section Example")
	Tabs.Main:CreateButton({
		Name = "Button Example!",
		Description = "Every Element Except For Sliders Can Have a description like this"
	})
	Tabs.Main:CreateLabel({
		Text = "Label Example",
		Style = 1
	})
	Tabs.Main:CreateLabel({
		Text = "Information Example",
		Style = 2
	})
	Tabs.Main:CreateLabel({
		Text = "Warning Example",
		Style = 3
	})
	Tabs.Main:CreateParagraph({
		Title = "Paragraph Example ",
		Text = "This Is A Paragraph. You Can Type Very Long Strings Here And They'll Automatically Fit! This Counts As A Description Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Right? Also Did I Mention This Has Rich Text? Also Did I Mention This Has Rich Text? Also Did I Mention This Has Rich Text? Also Did I Mention This Has Rich Text? Also Did I Mention This Has Rich Text? Also Did I Mention This Has Rich Text?"
	})
	Tabs.Main:CreateSlider({
		Name = "Slider Example",
		Range = {0, 200},
		Increment = 0.1,
		CurrentValue = 100,
		Flag = "Slider",
	})
	Tabs.Main:CreateToggle({
		Name = "Toggle Example",
		Description = "This Is A Toggle. See I Was Right? Sliders Don't Have Descriptions!",
		CurrentValue = false,
	})

	Tabs.Main:CreateBind({
		Name = "Bind Example",
		Description = "Btw Using CreateKeybind is deprecated, use CreateBind For Future Binds :)",
		CurrentKeybind = "Q",
		HoldToInteract = false,
	})
	Tabs.Main:CreateInput({
		Name = "Dynamic Input Example",
		Description = "Every Element has :Set(). Sadly this one is broken;the text wont update :(",
		PlaceholderText = "Input Placeholder",
		CurrentValue = "",
		Numeric = false,
		MaxCharacters = nil,
		Enter = false
	})
	Tabs.Main:CreateDropdown({
		Name = "Dropdown Example",
		Description = "U can access a element's values using .Settings!",
		Options = {"Option 1","Option 2","Option 3","Option 4","Option 5","Option 6"},
		CurrentOption = "Option 1",
		MultipleOptions = false,
		SpecialType = nil
	})

	Tabs.Main:CreateColorPicker({
		Name = "Color Picker Example",
		Color = Color3.fromRGB(86, 171, 128),
		Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			-- The function that takes place every time the color picker is moved/changed
			-- The variable (Value) is a Color3fromRGB value based on which color is selected
		end
	})

	Tabs.Main2:CreateSection("The Elements Here Are To Show Unique Features")
	Tabs.Main2:CreateToggle({
		Name = "Toggle - Default On",
		Description = "Toggles Can be Onned By Default!",
		CurrentValue = true
	})
	Tabs.Main2:CreateBind({
		Name = "Hold To Interact - Walkspeed Example",
		Description = "Binds Can Be Made to only Callback when held",
		HoldToInteract = true,
		CurrentBind = "E",
		Callback = function(v)
			if v then 
				Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
			else
				Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			end
		end,
	})
	Tabs.Main2:CreateInput({
		Name = "Numeric And 12 Max Characters",
		Description = "You Can Limit The Max Characters or Allow Only Numbers",
		Numeric = true,
		MaxCharacters = 12
	})
	Tabs.Main2:CreateInput({
		Name = "Require Enter",
		Description = "You Can Only make the callback happen after user hits enter",
		Enter = true
	})
	Tabs.Main2:CreateLabel({
		Text = "Every Element Can be Destroyed as well!"
	})
	Tabs.Main2:CreateDropdown({
		Name = "Dropdown - Multi Options",
		Description = "Multiple Special Features can be used on the same element!",
		Options = {"Option 1","Option 2","Option 3","Option 4","Option 5","Option 6"},
		CurrentOption = {"Option 1","Option 3","Option 6"},
		MultipleOptions = true
	})
	Tabs.Main2:CreateDropdown({
		Name = "Dropdown - Players",
		Description = "Nutriex's Dropdowns Has a built in Player Dropdown!",
		Options = {"u can put anything here, it wont be shown anyway"},
		CurrentOption = {"same here, itll be the first option"},
		MultipleOptions = false,
		SpecialType = "Player"
	})

	local s = Tabs.Premium:CreateSection("You can add elements inside section too")
	s:CreateButton()
	s:CreateLabel()
	s:CreateDivider()
	s:CreateDropdown()

	Tabs.Premium:BuildConfigSection()
	Tabs.Premium:BuildThemeSection()]]
end

-- THIS IS THE DEBUG DEMO, ONLY USED WHEN TESTING NEW ELEMENTS AND CODE
--[[if isStudio then
    window = Nutriex:CreateWindow({LoadingEnabled = false})
    t1 = window:CreateTab()
    t2 = window:CreateTab({ Name = "Tab 2", Icon = "location_searching"})
    Nutriex:Notification({ 
        Title = "Welcome to Nutriex",
        Icon = "sparkle",
        ImageSource = "Material",
        Content = "Welcome to the Nutriex Interface Suite. This Is an Amazing Quality Freemium UI Library For Roblox Exploiting Made By Nebula Softworks. Nutriex was Created in hopes of improving the standard of UI Library designs by being the golden standard for it. Nutriex Has Amazing Features like a key system, notification and perfection in aesthetics and design. So, What Are You Waiting For? Start Using Nutriex Today at " .. website
    })
    t1:CreateSection()
    local btn = t1:CreateButton({Callback = "", Description = "This Is A Description"})
    local l = t1:CreateLabel({ Style = 2})
    local l2 = t1:CreateLabel({ Text = "Another Label" })
    t2:CreateButton({ Callback = function() 
        l:Destroy()
        l2:Set("New Text")
    end})
    t2:CreateLabel({Style = 3})
    t1:CreateParagraph({Text = "Single String"})
    t1:CreateParagraph({Text = "Welcome to the Nutriex Interface Suite. This Is an Amazing Quality Freemium UI Library For Roblox Exploiting Made By Nebula Softworks. Nutriex was Created in hopes of improving the standard of UI Library designs by being the golden standard for it. Nutriex Has Amazing Features like a key system, notification and perfection in aesthetics and design. So, What Are You Waiting For? Start Using Nutriex Today at " .. website})
    s = t2:CreateSlider({ Callback = function(v) print(v) end })	
    t1:CreateButton({ Callback = function()
        s:Set({Name = "new name", Callback = ""})
        wait(5)
        s:Destroy()
    end})
    t1:CreateColorPicker()
    local toggle = t1:CreateToggle({Name = "test", Description = "test", CurrentValue = true, Callback = ""}, "toggle2")
    t1:CreateToggle({Callback = function(Value) toggle:Destroy() print(Value) end})
    local bind = t2:CreateBind({Name = "test", Description = "test", CurrentBind = "E", HoldToInteract = false, Callback = ""})
    t2:CreateKeybind({HoldToInteract = true, Callback = function(v)
        if v then
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end,})
    local input = t2:CreateInput({Name = "test",ClearTextAfterFocusLost = false, Description = "Numbers only, 8 max characters and enter required.",MaxCharacters = 8 ,Numeric = true, Enter = true, Callback = ""})
    t2:CreateInput({Callback = function(text) print(text) end})
    local d = t1:CreateDropdown({Name = "test", Options = {"Apples", "Bananas", "Strawberries", "Elixir"}, Description = "MultiOptions", MultipleOptions = true, Callback = function(t) print(t) end, CurrentOption = {"Apples", "Elixir"}})
    t1:CreateDropdown({Callback = function(t) print(unpack(t)) end})
    t1:CreateDropdown({Description = "Special Type - Player", Callback = "", SpecialType = "Player"})
end]]--
return Nutriex
