local Release = "Version 1.2.9"

local Nutriex = { 
	Folder = "Nutriex", 
	Options = {}, 
	ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(117, 164, 206)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(123, 201, 201)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(224, 138, 175))} 
}

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

local IconModule = {
	Lucide = nil,
	Material = {
		["perm-media"] = "http://www.roblox.com/asset/?id=6031215982";
		["sticky-note-2"] = "http://www.roblox.com/asset/?id=6031265972";
		["gavel"] = "http://www.roblox.com/asset/?id=6023565902";
		["table-view"] = "http://www.roblox.com/asset/?id=6031233835";
		["home"] = "http://www.roblox.com/asset/?id=6026568195";
		["list"] = "http://www.roblox.com/asset/?id=6026568229";
		["alarm-add"] = "http://www.roblox.com/asset/?id=6023426898";
		["speaker-notes"] = "http://www.roblox.com/asset/?id=6031266001";
		["check-circle-outline"] = "http://www.roblox.com/asset/?id=6023426909";
		["extension"] = "http://www.roblox.com/asset/?id=6023565892";
		["pending"] = "http://www.roblox.com/asset/?id=6031084745";
		["pageview"] = "http://www.roblox.com/asset/?id=6031216007";
		["group-work"] = "http://www.roblox.com/asset/?id=6023565910";
		["zoom-in"] = "http://www.roblox.com/asset/?id=6031075573";
		["aspect-ratio"] = "http://www.roblox.com/asset/?id=6022668895";
		["code"] = "http://www.roblox.com/asset/?id=6022668955";
		["3d-rotation"] = "http://www.roblox.com/asset/?id=6022668893";
		["translate"] = "http://www.roblox.com/asset/?id=6031225812";
		["star-rate"] = "http://www.roblox.com/asset/?id=6031265978";
		["system-update-alt"] = "http://www.roblox.com/asset/?id=6031251515";
		["open-with"] = "http://www.roblox.com/asset/?id=6026568265";
		["build-circle"] = "http://www.roblox.com/asset/?id=6023426952";
		["toc"] = "http://www.roblox.com/asset/?id=6031229341";
		["settings-phone"] = "http://www.roblox.com/asset/?id=6031289445";
		["open-in-full"] = "http://www.roblox.com/asset/?id=6026568245";
		["history"] = "http://www.roblox.com/asset/?id=6026568197";
		["accessibility-new"] = "http://www.roblox.com/asset/?id=6022668945";
		["hourglass-disabled"] = "http://www.roblox.com/asset/?id=6026568193";
		["line-style"] = "http://www.roblox.com/asset/?id=6026568276";
		["account-circle"] = "http://www.roblox.com/asset/?id=6022668898";
		["settings-cell"] = "http://www.roblox.com/asset/?id=6031280890";
		["search-off"] = "http://www.roblox.com/asset/?id=6031260783";
		["shop"] = "http://www.roblox.com/asset/?id=6031265983";
		["anchor"] = "http://www.roblox.com/asset/?id=6023426906";
		["language"] = "http://www.roblox.com/asset/?id=6026568213";
		["settings-brightness"] = "http://www.roblox.com/asset/?id=6031280902";
		["restore-page"] = "http://www.roblox.com/asset/?id=6031154877";
		["chrome-reader-mode"] = "http://www.roblox.com/asset/?id=6023426912";
		["sync-alt"] = "http://www.roblox.com/asset/?id=6031233840";
		["book"] = "http://www.roblox.com/asset/?id=6022860343";
		["smart-button"] = "http://www.roblox.com/asset/?id=6031265962";
		["request-page"] = "http://www.roblox.com/asset/?id=6031154873";
		["lock-clock"] = "http://www.roblox.com/asset/?id=6026568260";
		["android"] = "http://www.roblox.com/asset/?id=6022668966";
		["outgoing-mail"] = "http://www.roblox.com/asset/?id=6026568242";
		["dynamic-form"] = "http://www.roblox.com/asset/?id=6023426970";
		["track-changes"] = "http://www.roblox.com/asset/?id=6031225814";
		["source"] = "http://www.roblox.com/asset/?id=6031289451";
		["thumb-down"] = "http://www.roblox.com/asset/?id=6031229336";
		["integration-instructions"] = "http://www.roblox.com/asset/?id=6026568214";
		["opacity"] = "http://www.roblox.com/asset/?id=6026568295";
		["perm-identity"] = "http://www.roblox.com/asset/?id=6031215978";
		["view-module"] = "http://www.roblox.com/asset/?id=6031079152";
		["perm-data-setting"] = "http://www.roblox.com/asset/?id=6031215991";
		["assignment-turned-in"] = "http://www.roblox.com/asset/?id=6023426904";
		["change-history"] = "http://www.roblox.com/asset/?id=6023426914";
		["thumb-down-off-alt"] = "http://www.roblox.com/asset/?id=6031229354";
		["text-rotation-angledown"] = "http://www.roblox.com/asset/?id=6031251513";
		["bookmark"] = "http://www.roblox.com/asset/?id=6022852108";
		["view-stream"] = "http://www.roblox.com/asset/?id=6031079164";
		["remove-done"] = "http://www.roblox.com/asset/?id=6031086169";
		["markunread-mailbox"] = "http://www.roblox.com/asset/?id=6031082531";
		["store"] = "http://www.roblox.com/asset/?id=6031265968";
		["text-rotation-angleup"] = "http://www.roblox.com/asset/?id=6031229337";
		["eco"] = "http://www.roblox.com/asset/?id=6023426988";
		["find-in-page"] = "http://www.roblox.com/asset/?id=6023426986";
		["api"] = "http://www.roblox.com/asset/?id=6022668911";
		["launch"] = "http://www.roblox.com/asset/?id=6026568211";
		["text-rotation-down"] = "http://www.roblox.com/asset/?id=6031229334";
		["flip-to-back"] = "http://www.roblox.com/asset/?id=6023565896";
		["contact-page"] = "http://www.roblox.com/asset/?id=6022668881";
		["preview"] = "http://www.roblox.com/asset/?id=6031260793";
		["restore"] = "http://www.roblox.com/asset/?id=6031260800";
		["favorite-border"] = "http://www.roblox.com/asset/?id=6023565882";
		["assignment-late"] = "http://www.roblox.com/asset/?id=6022668880";
		["youtube-searched-for"] = "http://www.roblox.com/asset/?id=6031075934";
		["hourglass-full"] = "http://www.roblox.com/asset/?id=6026568190";
		["timeline"] = "http://www.roblox.com/asset/?id=6031229350";
		["turned-in"] = "http://www.roblox.com/asset/?id=6031225808";
		["info"] = "http://www.roblox.com/asset/?id=6026568227";
		["restore-from-trash"] = "http://www.roblox.com/asset/?id=6031154869";
		["arrow-circle-down"] = "http://www.roblox.com/asset/?id=6022668877";
		["flaky"] = "http://www.roblox.com/asset/?id=6031082523";
		["alarm-on"] = "http://www.roblox.com/asset/?id=6023426920";
		["swap-vertical-circle"] = "http://www.roblox.com/asset/?id=6031233839";
		["open-in-new"] = "http://www.roblox.com/asset/?id=6026568256";
		["watch-later"] = "http://www.roblox.com/asset/?id=6031075924";
		["alarm-off"] = "http://www.roblox.com/asset/?id=6023426901";
		["maximize"] = "http://www.roblox.com/asset/?id=6026568267";
		["lock-outline"] = "http://www.roblox.com/asset/?id=6031082533";
		["outbond"] = "http://www.roblox.com/asset/?id=6026568244";
		["view-carousel"] = "http://www.roblox.com/asset/?id=6031251507";
		["published-with-changes"] = "http://www.roblox.com/asset/?id=6031243328";
		["verified-user"] = "http://www.roblox.com/asset/?id=6031225819";
		["drag-indicator"] = "http://www.roblox.com/asset/?id=6023426962";
		["lightbulb-outline"] = "http://www.roblox.com/asset/?id=6026568254";
		["segment"] = "http://www.roblox.com/asset/?id=6031260773";
		["assignment"] = "http://www.roblox.com/asset/?id=6022668882";
		["work-outline"] = "http://www.roblox.com/asset/?id=6031075930";
		["line-weight"] = "http://www.roblox.com/asset/?id=6026568226";
		["dangerous"] = "http://www.roblox.com/asset/?id=6022668916";
		["assessment"] = "http://www.roblox.com/asset/?id=6022668897";
		["view-day"] = "http://www.roblox.com/asset/?id=6031079153";
		["help-center"] = "http://www.roblox.com/asset/?id=6026568192";
		["logout"] = "http://www.roblox.com/asset/?id=6031082522";
		["event"] = "http://www.roblox.com/asset/?id=6023426959";
		["get-app"] = "http://www.roblox.com/asset/?id=6023565889";
		["tab"] = "http://www.roblox.com/asset/?id=6031233851";
		["label"] = "http://www.roblox.com/asset/?id=6031082525";
		["g-translate"] = "http://www.roblox.com/asset/?id=6031082526";
		["view-week"] = "http://www.roblox.com/asset/?id=6031079154";
		["view-in-ar"] = "http://www.roblox.com/asset/?id=6031079158";
		["card-travel"] = "http://www.roblox.com/asset/?id=6023426925";
		["lock-open"] = "http://www.roblox.com/asset/?id=6026568220";
		["voice-over-off"] = "http://www.roblox.com/asset/?id=6031075927";
		["app-blocking"] = "http://www.roblox.com/asset/?id=6022668952";
		["settings-ethernet"] = "http://www.roblox.com/asset/?id=6031280883";
		["supervised-user-circle"] = "http://www.roblox.com/asset/?id=6031289449";
		["done-all"] = "http://www.roblox.com/asset/?id=6023426929";
		["lightbulb"] = "http://www.roblox.com/asset/?id=6026568247";
		["find-replace"] = "http://www.roblox.com/asset/?id=6023426979";
		["bookmarks"] = "http://www.roblox.com/asset/?id=6023426924";
		["today"] = "http://www.roblox.com/asset/?id=6031229352";
		["class"] = "http://www.roblox.com/asset/?id=6022668949";
		["supervisor-account"] = "http://www.roblox.com/asset/?id=6031251516";
		["support"] = "http://www.roblox.com/asset/?id=6031251532";
		["done-outline"] = "http://www.roblox.com/asset/?id=6023426936";
		["reorder"] = "http://www.roblox.com/asset/?id=6031154868";
		["fact-check"] = "http://www.roblox.com/asset/?id=6023426951";
		["thumb-up"] = "http://www.roblox.com/asset/?id=6031229347";
		["assignment-returned"] = "http://www.roblox.com/asset/?id=6023426899";
		["card-giftcard"] = "http://www.roblox.com/asset/?id=6023426978";
		["trending-down"] = "http://www.roblox.com/asset/?id=6031225811";
		["settings-backup-restore"] = "http://www.roblox.com/asset/?id=6031280886";
		["settings-voice"] = "http://www.roblox.com/asset/?id=6031265966";
		["dns"] = "http://www.roblox.com/asset/?id=6023426958";
		["perm-scan-wifi"] = "http://www.roblox.com/asset/?id=6031215985";
		["plagiarism"] = "http://www.roblox.com/asset/?id=6031243320";
		["commute"] = "http://www.roblox.com/asset/?id=6022668901";
		["gif"] = "http://www.roblox.com/asset/?id=6031082540";
		["work"] = "http://www.roblox.com/asset/?id=6031075939";
		["picture-in-picture-alt"] = "http://www.roblox.com/asset/?id=6031215979";
		["query-builder"] = "http://www.roblox.com/asset/?id=6031086183";
		["label-off"] = "http://www.roblox.com/asset/?id=6026568209";
		["all-out"] = "http://www.roblox.com/asset/?id=6022668876";
		["article"] = "http://www.roblox.com/asset/?id=6022668907";
		["shopping-basket"] = "http://www.roblox.com/asset/?id=6031265997";
		["mark-as-unread"] = "http://www.roblox.com/asset/?id=6026568223";
		["work-off"] = "http://www.roblox.com/asset/?id=6031075937";
		["delete-outline"] = "http://www.roblox.com/asset/?id=6022668962";
		["account-box"] = "http://www.roblox.com/asset/?id=6023426915";
		["home-filled"] = "rbxassetid://9080449299";
		["lock"] = "http://www.roblox.com/asset/?id=6026568224";
		["perm-device-information"] = "http://www.roblox.com/asset/?id=6031215996";
		["add-task"] = "http://www.roblox.com/asset/?id=6022668912";
		["text-rotate-up"] = "http://www.roblox.com/asset/?id=6031251526";
		["swipe"] = "http://www.roblox.com/asset/?id=6031233863";
		["eject"] = "http://www.roblox.com/asset/?id=6023426930";
		["mediation"] = "http://www.roblox.com/asset/?id=6026568249";
		["label-important-outline"] = "http://www.roblox.com/asset/?id=6026568199";
		["settings-remote"] = "http://www.roblox.com/asset/?id=6031289442";
		["history-toggle-off"] = "http://www.roblox.com/asset/?id=6026568196";
		["invert-colors"] = "http://www.roblox.com/asset/?id=6026568253";
		["visibility-off"] = "http://www.roblox.com/asset/?id=6031075929";
		["addchart"] = "http://www.roblox.com/asset/?id=6023426905";
		["cancel-schedule-send"] = "http://www.roblox.com/asset/?id=6022668963";
		["loyalty"] = "http://www.roblox.com/asset/?id=6026568237";
		["speaker-notes-off"] = "http://www.roblox.com/asset/?id=6031265965";
		["online-prediction"] = "http://www.roblox.com/asset/?id=6026568239";
		["remove-shopping-cart"] = "http://www.roblox.com/asset/?id=6031260778";
		["text-rotate-vertical"] = "http://www.roblox.com/asset/?id=6031251518";
		["visibility"] = "http://www.roblox.com/asset/?id=6031075931";
		["add-to-drive"] = "http://www.roblox.com/asset/?id=6022860335";
		["accessible"] = "http://www.roblox.com/asset/?id=6022668902";
		["bookmark-border"] = "http://www.roblox.com/asset/?id=6022860339";
		["tour"] = "http://www.roblox.com/asset/?id=6031229362";
		["compare-arrows"] = "http://www.roblox.com/asset/?id=6022668951";
		["view-sidebar"] = "http://www.roblox.com/asset/?id=6031079160";
		["face"] = "http://www.roblox.com/asset/?id=6023426944";
		["wysiwyg"] = "http://www.roblox.com/asset/?id=6031075938";
		["camera-enhance"] = "http://www.roblox.com/asset/?id=6023426935";
		["perm-camera-mic"] = "http://www.roblox.com/asset/?id=6031215983";
		["model-training"] = "http://www.roblox.com/asset/?id=6026568222";
		["arrow-circle-up"] = "http://www.roblox.com/asset/?id=6022668934";
		["euro-symbol"] = "http://www.roblox.com/asset/?id=6023426954";
		["pending-actions"] = "http://www.roblox.com/asset/?id=6031260777";
		["not-accessible"] = "http://www.roblox.com/asset/?id=6026568269";
		["explore-off"] = "http://www.roblox.com/asset/?id=6023426953";
		["build"] = "http://www.roblox.com/asset/?id=6023426938";
		["backup"] = "http://www.roblox.com/asset/?id=6023426911";
		["settings-input-antenna"] = "http://www.roblox.com/asset/?id=6031280891";
		["disabled-by-default"] = "http://www.roblox.com/asset/?id=6023426939";
		["upgrade"] = "http://www.roblox.com/asset/?id=6031225815";
		["contactless"] = "http://www.roblox.com/asset/?id=6022668886";
		["trending-flat"] = "http://www.roblox.com/asset/?id=6031225818";
		["schedule"] = "http://www.roblox.com/asset/?id=6031260808";
		["offline-pin"] = "http://www.roblox.com/asset/?id=6031084770";
		["date-range"] = "http://www.roblox.com/asset/?id=6022668894";
		["flight-land"] = "http://www.roblox.com/asset/?id=6023565897";
		["view-headline"] = "http://www.roblox.com/asset/?id=6031079151";
		["cached"] = "http://www.roblox.com/asset/?id=6023426921";
		["unpublished"] = "http://www.roblox.com/asset/?id=6031225817";
		["outlet"] = "http://www.roblox.com/asset/?id=6031084748";
		["favorite"] = "http://www.roblox.com/asset/?id=6023426974";
		["vertical-split"] = "http://www.roblox.com/asset/?id=6031225820";
		["report-problem"] = "http://www.roblox.com/asset/?id=6031086176";
		["fingerwarn"] = "http://www.roblox.com/asset/?id=6023565895";
		["important-devices"] = "http://www.roblox.com/asset/?id=6026568202";
		["outbox"] = "http://www.roblox.com/asset/?id=6026568263";
		["all-inbox"] = "http://www.roblox.com/asset/?id=6022668909";
		["label-important"] = "http://www.roblox.com/asset/?id=6026568215";
		["warn"] = "http://www.roblox.com/asset/?id=6031243324";
		["settings-bluetooth"] = "http://www.roblox.com/asset/?id=6031280905";
		["power-settings-new"] = "http://www.roblox.com/asset/?id=6031260781";
		["zoom-out"] = "http://www.roblox.com/asset/?id=6031075577";
		["stars"] = "http://www.roblox.com/asset/?id=6031265971";
		["offline-bolt"] = "http://www.roblox.com/asset/?id=6031084742";
		["feedback"] = "http://www.roblox.com/asset/?id=6023426957";
		["accessibility"] = "http://www.roblox.com/asset/?id=6022668887";
		["announcement"] = "http://www.roblox.com/asset/?id=6022668946";
		["settings-input-hdmi"] = "http://www.roblox.com/asset/?id=6031280970";
		["leaderboard"] = "http://www.roblox.com/asset/?id=6026568216";
		["view-quilt"] = "http://www.roblox.com/asset/?id=6031079155";
		["note-add"] = "http://www.roblox.com/asset/?id=6031084749";
		["theaters"] = "http://www.roblox.com/asset/?id=6031229335";
		["alarm"] = "http://www.roblox.com/asset/?id=6023426910";
		["settings-input-composite"] = "http://www.roblox.com/asset/?id=6031280896";
		["grade"] = "http://www.roblox.com/asset/?id=6026568189";
		["tab-unselected"] = "http://www.roblox.com/asset/?id=6031251505";
		["swap-vert"] = "http://www.roblox.com/asset/?id=6031233847";
		["assignment-return"] = "http://www.roblox.com/asset/?id=6023426931";
		["highlight-alt"] = "http://www.roblox.com/asset/?id=6023565913";
		["shopping-bag"] = "http://www.roblox.com/asset/?id=6031265970";
		["contact-support"] = "http://www.roblox.com/asset/?id=6022668879";
		["flip-to-front"] = "http://www.roblox.com/asset/?id=6023565894";
		["touch-app"] = "http://www.roblox.com/asset/?id=6031229361";
		["room"] = "http://www.roblox.com/asset/?id=6031154875";
		["send-and-archive"] = "http://www.roblox.com/asset/?id=6031280889";
		["view-array"] = "http://www.roblox.com/asset/?id=6031225842";
		["settings-power"] = "http://www.roblox.com/asset/?id=6031289446";
		["admin-panel-settings"] = "http://www.roblox.com/asset/?id=6022668961";
		["open-in-browser"] = "http://www.roblox.com/asset/?id=6026568266";
		["card-membership"] = "http://www.roblox.com/asset/?id=6023426942";
		["rule"] = "http://www.roblox.com/asset/?id=6031154859";
		["schedule-send"] = "http://www.roblox.com/asset/?id=6031154866";
		["calendar-today"] = "http://www.roblox.com/asset/?id=6022668917";
		["info-outline"] = "http://www.roblox.com/asset/?id=6026568210";
		["description"] = "http://www.roblox.com/asset/?id=6022668888";
		["dashboard-customize"] = "http://www.roblox.com/asset/?id=6022668899";
		["rowing"] = "http://www.roblox.com/asset/?id=6031154857";
		["swap-horizontal-circle"] = "http://www.roblox.com/asset/?id=6031233833";
		["account-balance-wallet"] = "http://www.roblox.com/asset/?id=6022668892";
		["view-agenda"] = "http://www.roblox.com/asset/?id=6031225831";
		["shop-two"] = "http://www.roblox.com/asset/?id=6031289461";
		["done"] = "http://www.roblox.com/asset/?id=6023426926";
		["circle-notifications"] = "http://www.roblox.com/asset/?id=6023426923";
		["compress"] = "http://www.roblox.com/asset/?id=6022668878";
		["calendar-view-day"] = "http://www.roblox.com/asset/?id=6023426946";
		["thumbs-up-down"] = "http://www.roblox.com/asset/?id=6031229373";
		["account-balance"] = "http://www.roblox.com/asset/?id=6022668900";
		["play-for-work"] = "http://www.roblox.com/asset/?id=6031260776";
		["pets"] = "http://www.roblox.com/asset/?id=6031260782";
		["view-column"] = "http://www.roblox.com/asset/?id=6031079172";
		["search"] = "http://www.roblox.com/asset/?id=6031154871";
		["autorenew"] = "http://www.roblox.com/asset/?id=6023565901";
		["copyright"] = "http://www.roblox.com/asset/?id=6023565898";
		["privacy-tip"] = "http://www.roblox.com/asset/?id=6031260784";
		["arrow-right-alt"] = "http://www.roblox.com/asset/?id=6022668890";
		["delete"] = "http://www.roblox.com/asset/?id=6022668885";
		["nightlight-round"] = "http://www.roblox.com/asset/?id=6031084743";
		["batch-prediction"] = "http://www.roblox.com/asset/?id=6022860334";
		["shopping-cart"] = "http://www.roblox.com/asset/?id=6031265976";
		["login"] = "http://www.roblox.com/asset/?id=6031082527";
		["settings-input-svideo"] = "http://www.roblox.com/asset/?id=6031289444";
		["payment"] = "http://www.roblox.com/asset/?id=6031084751";
		["update"] = "http://www.roblox.com/asset/?id=6031225810";
		["text-rotation-none"] = "http://www.roblox.com/asset/?id=6031229344";
		["perm-contact-calendar"] = "http://www.roblox.com/asset/?id=6031215990";
		["explore"] = "http://www.roblox.com/asset/?id=6023426941";
		["delete-forever"] = "http://www.roblox.com/asset/?id=6022668939";
		["rounded-corner"] = "http://www.roblox.com/asset/?id=6031154861";
		["book-online"] = "http://www.roblox.com/asset/?id=6022860332";
		["quickreply"] = "http://www.roblox.com/asset/?id=6031243319";
		["bug-report"] = "http://www.roblox.com/asset/?id=6022852107";
		["subtitles-off"] = "http://www.roblox.com/asset/?id=6031289466";
		["close-fullscreen"] = "http://www.roblox.com/asset/?id=6023426928";
		["horizontal-split"] = "http://www.roblox.com/asset/?id=6026568194";
		["minimize"] = "http://www.roblox.com/asset/?id=6026568240";
		["filter-list-alt"] = "http://www.roblox.com/asset/?id=6023426955";
		["add-shopping-cart"] = "http://www.roblox.com/asset/?id=6022668875";
		["next-plan"] = "http://www.roblox.com/asset/?id=6026568231";
		["view-list"] = "http://www.roblox.com/asset/?id=6031079156";
		["receipt"] = "http://www.roblox.com/asset/?id=6031086173";
		["polymer"] = "http://www.roblox.com/asset/?id=6031260785";
		["spellcheck"] = "http://www.roblox.com/asset/?id=6031289450";
		["wifi-protected-setup"] = "http://www.roblox.com/asset/?id=6031075926";
		["label-outline"] = "http://www.roblox.com/asset/?id=6026568207";
		["highlight-off"] = "http://www.roblox.com/asset/?id=6023565916";
		["turned-in-not"] = "http://www.roblox.com/asset/?id=6031225806";
		["edit-off"] = "http://www.roblox.com/asset/?id=6023426983";
		["question-answer"] = "http://www.roblox.com/asset/?id=6031086172";
		["settings-overscan"] = "http://www.roblox.com/asset/?id=6031289459";
		["trending-up"] = "http://www.roblox.com/asset/?id=6031225816";
		["verified"] = "http://www.roblox.com/asset/?id=6031225809";
		["flight-takeoff"] = "http://www.roblox.com/asset/?id=6023565891";
		["grading"] = "http://www.roblox.com/asset/?id=6026568191";
		["dashboard"] = "http://www.roblox.com/asset/?id=6022668883";
		["expand"] = "http://www.roblox.com/asset/?id=6022668891";
		["backup-table"] = "http://www.roblox.com/asset/?id=6022860338";
		["analytics"] = "http://www.roblox.com/asset/?id=6022668884";
		["picture-in-picture"] = "http://www.roblox.com/asset/?id=6031215994";
		["settings"] = "http://www.roblox.com/asset/?id=6031280882";
		["accessible-forward"] = "http://www.roblox.com/asset/?id=6022668906";
		["pan-tool"] = "http://www.roblox.com/asset/?id=6031084771";
		["https"] = "http://www.roblox.com/asset/?id=6026568200";
		["filter-alt"] = "http://www.roblox.com/asset/?id=6023426984";
		["thumb-up-off-alt"] = "http://www.roblox.com/asset/?id=6031229342";
		["record-voice-over"] = "http://www.roblox.com/asset/?id=6031243318";
		["help-outline"] = "http://www.roblox.com/asset/?id=6026568201";
		["check-circle"] = "http://www.roblox.com/asset/?id=6023426945";
		["comment-bank"] = "http://www.roblox.com/asset/?id=6023426937";
		["perm-phone-msg"] = "http://www.roblox.com/asset/?id=6031215986";
		["settings-applications"] = "http://www.roblox.com/asset/?id=6031280894";
		["exit-to-app"] = "http://www.roblox.com/asset/?id=6023426922";
		["saved-search"] = "http://www.roblox.com/asset/?id=6031154867";
		["toll"] = "http://www.roblox.com/asset/?id=6031229343";
		["not-started"] = "http://www.roblox.com/asset/?id=6026568232";
		["subject"] = "http://www.roblox.com/asset/?id=6031289452";
		["redeem"] = "http://www.roblox.com/asset/?id=6031086170";
		["input"] = "http://www.roblox.com/asset/?id=6026568225";
		["settings-input-component"] = "http://www.roblox.com/asset/?id=6031280884";
		["assignment-ind"] = "http://www.roblox.com/asset/?id=6022668935";
		["swap-horiz"] = "http://www.roblox.com/asset/?id=6031233841";
		["fullscreen"] = "http://www.roblox.com/asset/?id=6031094681";
		["cancel"] = "http://www.roblox.com/asset/?id=6031094677";
		["subdirectory-arrow-left"] = "http://www.roblox.com/asset/?id=6031104654";
		["close"] = "http://www.roblox.com/asset/?id=6031094678";
		["arrow-back-ios"] = "http://www.roblox.com/asset/?id=6031091003";
		["east"] = "http://www.roblox.com/asset/?id=6031094675";
		["unfold-more"] = "http://www.roblox.com/asset/?id=6031104644";
		["south"] = "http://www.roblox.com/asset/?id=6031104646";
		["arrow-drop-up"] = "http://www.roblox.com/asset/?id=6031090990";
		["arrow-back"] = "http://www.roblox.com/asset/?id=6031091000";
		["arrow-downward"] = "http://www.roblox.com/asset/?id=6031090991";
		["west"] = "http://www.roblox.com/asset/?id=6031104677";
		["legend-toggle"] = "http://www.roblox.com/asset/?id=6031097233";
		["fullscreen-exit"] = "http://www.roblox.com/asset/?id=6031094691";
		["last-page"] = "http://www.roblox.com/asset/?id=6031094686";
		["switch-right"] = "http://www.roblox.com/asset/?id=6031104649";
		["check"] = "http://www.roblox.com/asset/?id=6031094667";
		["home-work"] = "http://www.roblox.com/asset/?id=6031094683";
		["north-east"] = "http://www.roblox.com/asset/?id=6031097228";
		["double-arrow"] = "http://www.roblox.com/asset/?id=6031094674";
		["more-vert"] = "http://www.roblox.com/asset/?id=6031104648";
		["chevron-left"] = "http://www.roblox.com/asset/?id=6031094670";
		["more-horiz"] = "http://www.roblox.com/asset/?id=6031104650";
		["unfold-less"] = "http://www.roblox.com/asset/?id=6031104681";
		["first-page"] = "http://www.roblox.com/asset/?id=6031094682";
		["payments"] = "http://www.roblox.com/asset/?id=6031097227";
		["arrow-right"] = "http://www.roblox.com/asset/?id=6031090994";
		["offline-share"] = "http://www.roblox.com/asset/?id=6031097267";
		["south-west"] = "http://www.roblox.com/asset/?id=6031104652";
		["expand-less"] = "http://www.roblox.com/asset/?id=6031094679";
		["south-east"] = "http://www.roblox.com/asset/?id=6031104642";
		["assistant-navigation"] = "http://www.roblox.com/asset/?id=6031091006";
		["apps"] = "http://www.roblox.com/asset/?id=6031090999";
		["arrow-upward"] = "http://www.roblox.com/asset/?id=6031090997";
		["app-settings-alt"] = "http://www.roblox.com/asset/?id=6031090998";
		["subdirectory-arrow-right"] = "http://www.roblox.com/asset/?id=6031104647";
		["north-west"] = "http://www.roblox.com/asset/?id=6031104630";
		["switch-left"] = "http://www.roblox.com/asset/?id=6031104651";
		["chevron-right"] = "http://www.roblox.com/asset/?id=6031094680";
		["arrow-forward"] = "http://www.roblox.com/asset/?id=6031090995";
		["arrow-forward-ios"] = "http://www.roblox.com/asset/?id=6031091008";
		["arrow-drop-down"] = "http://www.roblox.com/asset/?id=6031091004";
		["refresh"] = "http://www.roblox.com/asset/?id=6031097226";
		["pivot-table-chart"] = "http://www.roblox.com/asset/?id=6031097234";
		["expand-more"] = "http://www.roblox.com/asset/?id=6031094687";
		["campaign"] = "http://www.roblox.com/asset/?id=6031094666";
		["arrow-left"] = "http://www.roblox.com/asset/?id=6031091002";
		["arrow-drop-down-circle"] = "http://www.roblox.com/asset/?id=6031091001";
		["menu-open"] = "http://www.roblox.com/asset/?id=6031097229";
		["waterfall-chart"] = "http://www.roblox.com/asset/?id=6031104632";
		["assistant-direction"] = "http://www.roblox.com/asset/?id=6031091005";
		["menu"] = "http://www.roblox.com/asset/?id=6031097225";
		["personal-video"] = "http://www.roblox.com/asset/?id=6034457070";
		["power-off"] = "http://www.roblox.com/asset/?id=6034457087";
		["wifi-off"] = "http://www.roblox.com/asset/?id=6034461625";
		["adb"] = "http://www.roblox.com/asset/?id=6034418515";
		["airline-seat-recline-normal"] = "http://www.roblox.com/asset/?id=6034418512";
		["sync-problem"] = "http://www.roblox.com/asset/?id=6034452653";
		["network-check"] = "http://www.roblox.com/asset/?id=6034461631";
		["event-busy"] = "http://www.roblox.com/asset/?id=6034439634";
		["airline-seat-flat"] = "http://www.roblox.com/asset/?id=6034418511";
		["disc-full"] = "http://www.roblox.com/asset/?id=6034418518";
		["sd-card"] = "http://www.roblox.com/asset/?id=6034457089";
		["time-to-leave"] = "http://www.roblox.com/asset/?id=6034452660";
		["phone-bluetooth-speaker"] = "http://www.roblox.com/asset/?id=6034457057";
		["phone-paused"] = "http://www.roblox.com/asset/?id=6034457066";
		["phone-locked"] = "http://www.roblox.com/asset/?id=6034457058";
		["more"] = "http://www.roblox.com/asset/?id=6034461627";
		["add-call"] = "http://www.roblox.com/asset/?id=6034418524";
		["account-tree"] = "http://www.roblox.com/asset/?id=6034418507";
		["do-not-disturb-on"] = "http://www.roblox.com/asset/?id=6034439649";
		["event-note"] = "http://www.roblox.com/asset/?id=6034439637";
		["sync-disabled"] = "http://www.roblox.com/asset/?id=6034452649";
		["mms"] = "http://www.roblox.com/asset/?id=6034461621";
		["airline-seat-flat-angled"] = "http://www.roblox.com/asset/?id=6034418513";
		["bluetooth-audio"] = "http://www.roblox.com/asset/?id=6034418522";
		["vibration"] = "http://www.roblox.com/asset/?id=6034452651";
		["system-update"] = "http://www.roblox.com/asset/?id=6034452663";
		["enhanced-encryption"] = "http://www.roblox.com/asset/?id=6034439652";
		["wc"] = "http://www.roblox.com/asset/?id=6034452643";
		["live-tv"] = "http://www.roblox.com/asset/?id=6034439648";
		["folder-special"] = "http://www.roblox.com/asset/?id=6034439639";
		["phone-missed"] = "http://www.roblox.com/asset/?id=6034457056";
		["airline-seat-recline-extra"] = "http://www.roblox.com/asset/?id=6034418528";
		["sms"] = "http://www.roblox.com/asset/?id=6034452645";
		["tap-and-play"] = "http://www.roblox.com/asset/?id=6034452650";
		["confirmation-number"] = "http://www.roblox.com/asset/?id=6034418519";
		["event-available"] = "http://www.roblox.com/asset/?id=6034439643";
		["sms-failed"] = "http://www.roblox.com/asset/?id=6034452676";
		["do-not-disturb-alt"] = "http://www.roblox.com/asset/?id=6034461619";
		["do-not-disturb"] = "http://www.roblox.com/asset/?id=6034439645";
		["ondemand-video"] = "http://www.roblox.com/asset/?id=6034457065";
		["no-encryption"] = "http://www.roblox.com/asset/?id=6034457059";
		["airline-seat-legroom-extra"] = "http://www.roblox.com/asset/?id=6034418508";
		["tv-off"] = "http://www.roblox.com/asset/?id=6034452646";
		["sim-card-alert"] = "http://www.roblox.com/asset/?id=6034452641";
		["airline-seat-legroom-normal"] = "http://www.roblox.com/asset/?id=6034418532";
		["wifi"] = "http://www.roblox.com/asset/?id=6034461626";
		["do-not-disturb-off"] = "http://www.roblox.com/asset/?id=6034439642";
		["imagesearch-roller"] = "http://www.roblox.com/asset/?id=6034439635";
		["power"] = "http://www.roblox.com/asset/?id=6034457105";
		["airline-seat-legroom-reduced"] = "http://www.roblox.com/asset/?id=6034418520";
		["phone-in-talk"] = "http://www.roblox.com/asset/?id=6034457067";
		["airline-seat-individual-suite"] = "http://www.roblox.com/asset/?id=6034418514";
		["priority-high"] = "http://www.roblox.com/asset/?id=6034457092";
		["phone-callback"] = "http://www.roblox.com/asset/?id=6034457104";
		["phone-forwarded"] = "http://www.roblox.com/asset/?id=6034457106";
		["sync"] = "http://www.roblox.com/asset/?id=6034452662";
		["vpn-lock"] = "http://www.roblox.com/asset/?id=6034452648";
		["support-agent"] = "http://www.roblox.com/asset/?id=6034452656";
		["network-locked"] = "http://www.roblox.com/asset/?id=6034457064";
		["directions-off"] = "http://www.roblox.com/asset/?id=6034418517";
		["drive-eta"] = "http://www.roblox.com/asset/?id=6034464371";
		["sensor-window"] = "http://www.roblox.com/asset/?id=6031067242";
		["sensor-door"] = "http://www.roblox.com/asset/?id=6031067241";
		["keyboard-return"] = "http://www.roblox.com/asset/?id=6034818370";
		["monitor"] = "http://www.roblox.com/asset/?id=6034837803";
		["device-hub"] = "http://www.roblox.com/asset/?id=6034789877";
		["keyboard"] = "http://www.roblox.com/asset/?id=6034818398";
		["keyboard-voice"] = "http://www.roblox.com/asset/?id=6034818360";
		["cast"] = "http://www.roblox.com/asset/?id=6034789876";
		["developer-board"] = "http://www.roblox.com/asset/?id=6034789883";
		["tablet"] = "http://www.roblox.com/asset/?id=6034848733";
		["keyboard-hide"] = "http://www.roblox.com/asset/?id=6034818386";
		["dock"] = "http://www.roblox.com/asset/?id=6034789888";
		["phonelink"] = "http://www.roblox.com/asset/?id=6034837801";
		["device-unknown"] = "http://www.roblox.com/asset/?id=6034789884";
		["speaker-group"] = "http://www.roblox.com/asset/?id=6034848732";
		["desktop-mac"] = "http://www.roblox.com/asset/?id=6034789898";
		["point-of-sale"] = "http://www.roblox.com/asset/?id=6034837798";
		["memory"] = "http://www.roblox.com/asset/?id=6034837807";
		["keyboard-tab"] = "http://www.roblox.com/asset/?id=6034818363";
		["router"] = "http://www.roblox.com/asset/?id=6034837806";
		["sim-card"] = "http://www.roblox.com/asset/?id=6034837800";
		["headset"] = "http://www.roblox.com/asset/?id=6034789880";
		["gamepad"] = "http://www.roblox.com/asset/?id=6034789879";
		["speaker"] = "http://www.roblox.com/asset/?id=6034848746";
		["devices-other"] = "http://www.roblox.com/asset/?id=6034789873";
		["laptop"] = "http://www.roblox.com/asset/?id=6034818367";
		["scanner"] = "http://www.roblox.com/asset/?id=6034837799";
		["tv"] = "http://www.roblox.com/asset/?id=6034848740";
		["headset-mic"] = "http://www.roblox.com/asset/?id=6034818383";
		["browser-not-supported"] = "http://www.roblox.com/asset/?id=6034789875";
		["computer"] = "http://www.roblox.com/asset/?id=6034789874";
		["connected-tv"] = "http://www.roblox.com/asset/?id=6034789870";
		["phonelink-off"] = "http://www.roblox.com/asset/?id=6034837804";
		["headset-off"] = "http://www.roblox.com/asset/?id=6034818402";
		["cast-connected"] = "http://www.roblox.com/asset/?id=6034789895";
		["watch"] = "http://www.roblox.com/asset/?id=6034848747";
		["keyboard-arrow-up"] = "http://www.roblox.com/asset/?id=6034818379";
		["keyboard-backspace"] = "http://www.roblox.com/asset/?id=6034818381";
		["laptop-chromebook"] = "http://www.roblox.com/asset/?id=6034818364";
		["phone-iphone"] = "http://www.roblox.com/asset/?id=6034837811";
		["smartphone"] = "http://www.roblox.com/asset/?id=6034848731";
		["power-input"] = "http://www.roblox.com/asset/?id=6034837794";
		["videogame-asset"] = "http://www.roblox.com/asset/?id=6034848748";
		["desktop-windows"] = "http://www.roblox.com/asset/?id=6034789893";
		["keyboard-arrow-down"] = "http://www.roblox.com/asset/?id=6034818372";
		["laptop-mac"] = "http://www.roblox.com/asset/?id=6034837808";
		["laptop-windows"] = "http://www.roblox.com/asset/?id=6034837796";
		["keyboard-arrow-right"] = "http://www.roblox.com/asset/?id=6034818365";
		["cast-for-education"] = "http://www.roblox.com/asset/?id=6034789872";
		["keyboard-capslock"] = "http://www.roblox.com/asset/?id=6034818403";
		["toys"] = "http://www.roblox.com/asset/?id=6034848752";
		["tablet-android"] = "http://www.roblox.com/asset/?id=6034848734";
		["mouse"] = "http://www.roblox.com/asset/?id=6034837797";
		["phone-android"] = "http://www.roblox.com/asset/?id=6034837793";
		["keyboard-arrow-left"] = "http://www.roblox.com/asset/?id=6034818375";
		["security"] = "http://www.roblox.com/asset/?id=6034837802";
		["dry-cleaning"] = "http://www.roblox.com/asset/?id=6034754456";
		["bakery-dining"] = "http://www.roblox.com/asset/?id=6034767610";
		["place"] = "http://www.roblox.com/asset/?id=6034503372";
		["run-circle"] = "http://www.roblox.com/asset/?id=6034503367";
		["local-post-office"] = "http://www.roblox.com/asset/?id=6034513883";
		["takeout-dining"] = "http://www.roblox.com/asset/?id=6034467808";
		["nightlife"] = "http://www.roblox.com/asset/?id=6034510003";
		["design-services"] = "http://www.roblox.com/asset/?id=6034754453";
		["celebration"] = "http://www.roblox.com/asset/?id=6034767613";
		["near-me-disabled"] = "http://www.roblox.com/asset/?id=6034509988";
		["add-location-alt"] = "http://www.roblox.com/asset/?id=6034483678";
		["directions-run"] = "http://www.roblox.com/asset/?id=6034754445";
		["local-fire-department"] = "http://www.roblox.com/asset/?id=6034684949";
		["add-road"] = "http://www.roblox.com/asset/?id=6034483677";
		["my-location"] = "http://www.roblox.com/asset/?id=6034509987";
		["dinner-dining"] = "http://www.roblox.com/asset/?id=6034754457";
		["local-airport"] = "http://www.roblox.com/asset/?id=6034687951";
		["zoom-out-map"] = "http://www.roblox.com/asset/?id=6035229856";
		["pin-drop"] = "http://www.roblox.com/asset/?id=6034470807";
		["subway"] = "http://www.roblox.com/asset/?id=6034467790";
		["electric-moped"] = "http://www.roblox.com/asset/?id=6034744027";
		["restaurant-menu"] = "http://www.roblox.com/asset/?id=6034503378";
		["local-gas-station"] = "http://www.roblox.com/asset/?id=6034684935";
		["local-cafe"] = "http://www.roblox.com/asset/?id=6034687954";
		["theater-comedy"] = "http://www.roblox.com/asset/?id=6034467796";
		["directions-bus"] = "http://www.roblox.com/asset/?id=6034754434";
		["hail"] = "http://www.roblox.com/asset/?id=6034744033";
		["satellite"] = "http://www.roblox.com/asset/?id=6034503370";
		["local-phone"] = "http://www.roblox.com/asset/?id=6034513884";
		["electric-bike"] = "http://www.roblox.com/asset/?id=6034744032";
		["local-see"] = "http://www.roblox.com/asset/?id=6034513887";
		["transit-enterexit"] = "http://www.roblox.com/asset/?id=6034467805";
		["local-convenience-store"] = "http://www.roblox.com/asset/?id=6034687956";
		["local-offer"] = "http://www.roblox.com/asset/?id=6034513891";
		["electric-car"] = "http://www.roblox.com/asset/?id=6034744029";
		["beenhere"] = "http://www.roblox.com/asset/?id=6034483675";
		["miscellaneous-services"] = "http://www.roblox.com/asset/?id=6034509993";
		["maps-ugc"] = "http://www.roblox.com/asset/?id=6034509992";
		["moped"] = "http://www.roblox.com/asset/?id=6034509999";
		["medical-services"] = "http://www.roblox.com/asset/?id=6034510001";
		["money"] = "http://www.roblox.com/asset/?id=6034509997";
		["transfer-within-a-station"] = "http://www.roblox.com/asset/?id=6034467809";
		["electrical-services"] = "http://www.roblox.com/asset/?id=6034744038";
		["museum"] = "http://www.roblox.com/asset/?id=6034510005";
		["add-location"] = "http://www.roblox.com/asset/?id=6034483672";
		["layers"] = "http://www.roblox.com/asset/?id=6034687957";
		["handyman"] = "http://www.roblox.com/asset/?id=6034744057";
		["local-pharmacy"] = "http://www.roblox.com/asset/?id=6034513903";
		["electric-rickshaw"] = "http://www.roblox.com/asset/?id=6034744043";
		["alt-route"] = "http://www.roblox.com/asset/?id=6034483670";
		["no-transfer"] = "http://www.roblox.com/asset/?id=6034503363";
		["pedal-bike"] = "http://www.roblox.com/asset/?id=6034503374";
		["directions-transit"] = "http://www.roblox.com/asset/?id=6034754436";
		["railway-alert"] = "http://www.roblox.com/asset/?id=6034470823";
		["local-police"] = "http://www.roblox.com/asset/?id=6034513895";
		["directions-car"] = "http://www.roblox.com/asset/?id=6034754441";
		["category"] = "http://www.roblox.com/asset/?id=6034767621";
		["attractions"] = "http://www.roblox.com/asset/?id=6034767620";
		["person-pin-circle"] = "http://www.roblox.com/asset/?id=6034503375";
		["cleaning-services"] = "http://www.roblox.com/asset/?id=6034767619";
		["terrain"] = "http://www.roblox.com/asset/?id=6034467794";
		["no-meals"] = "http://www.roblox.com/asset/?id=6034510024";
		["train"] = "http://www.roblox.com/asset/?id=6034467803";
		["delivery-dining"] = "http://www.roblox.com/asset/?id=6034767644";
		["pest-control"] = "http://www.roblox.com/asset/?id=6034470809";
		["directions"] = "http://www.roblox.com/asset/?id=6034754449";
		["atm"] = "http://www.roblox.com/asset/?id=6034767614";
		["rate-review"] = "http://www.roblox.com/asset/?id=6034503385";
		["local-bar"] = "http://www.roblox.com/asset/?id=6034687950";
		["local-drink"] = "http://www.roblox.com/asset/?id=6034687965";
		["directions-railway"] = "http://www.roblox.com/asset/?id=6034754433";
		["person-pin"] = "http://www.roblox.com/asset/?id=6034503364";
		["ev-station"] = "http://www.roblox.com/asset/?id=6034744037";
		["home-repair-service"] = "http://www.roblox.com/asset/?id=6034744064";
		["bus-alert"] = "http://www.roblox.com/asset/?id=6034767618";
		["agriculture"] = "http://www.roblox.com/asset/?id=6034483674";
		["volunteer-activism"] = "http://www.roblox.com/asset/?id=6034467799";
		["breakfast-dining"] = "http://www.roblox.com/asset/?id=6034483671";
		["layers-clear"] = "http://www.roblox.com/asset/?id=6034687975";
		["plumbing"] = "http://www.roblox.com/asset/?id=6034470800";
		["taxi-alert"] = "http://www.roblox.com/asset/?id=6034467792";
		["add-business"] = "http://www.roblox.com/asset/?id=6034483666";
		["badge"] = "http://www.roblox.com/asset/?id=6034767607";
		["edit-attributes"] = "http://www.roblox.com/asset/?id=6034754443";
		["directions-walk"] = "http://www.roblox.com/asset/?id=6034754448";
		["local-play"] = "http://www.roblox.com/asset/?id=6034513889";
		["bike-scooter"] = "http://www.roblox.com/asset/?id=6034483669";
		["two-wheeler"] = "http://www.roblox.com/asset/?id=6034467795";
		["local-florist"] = "http://www.roblox.com/asset/?id=6034684940";
		["local-hotel"] = "http://www.roblox.com/asset/?id=6034684939";
		["no-meals-ouline"] = "http://www.roblox.com/asset/?id=6034510025";
		["festival"] = "http://www.roblox.com/asset/?id=6034744031";
		["local-shipping"] = "http://www.roblox.com/asset/?id=6034684926";
		["directions-boat"] = "http://www.roblox.com/asset/?id=6034754442";
		["wrong-location"] = "http://www.roblox.com/asset/?id=6034467801";
		["restaurant"] = "http://www.roblox.com/asset/?id=6034503366";
		["directions-subway"] = "http://www.roblox.com/asset/?id=6034754440";
		["not-listed-location"] = "http://www.roblox.com/asset/?id=6034503380";
		["electric-scooter"] = "http://www.roblox.com/asset/?id=6034744041";
		["ramen-dining"] = "http://www.roblox.com/asset/?id=6034503377";
		["edit-road"] = "http://www.roblox.com/asset/?id=6034744035";
		["local-warnshop"] = "http://www.roblox.com/asset/?id=6034513897";
		["map"] = "http://www.roblox.com/asset/?id=6034684930";
		["car-rental"] = "http://www.roblox.com/asset/?id=6034767641";
		["multiple-stop"] = "http://www.roblox.com/asset/?id=6034510026";
		["brunch-dining"] = "http://www.roblox.com/asset/?id=6034767611";
		["local-laundry-service"] = "http://www.roblox.com/asset/?id=6034684943";
		["set-meal"] = "http://www.roblox.com/asset/?id=6034503368";
		["local-car-wash"] = "http://www.roblox.com/asset/?id=6034687976";
		["pest-control-rodent"] = "http://www.roblox.com/asset/?id=6034470803";
		["local-pizza"] = "http://www.roblox.com/asset/?id=6034513885";
		["local-grocery-store"] = "http://www.roblox.com/asset/?id=6034684933";
		["traffic"] = "http://www.roblox.com/asset/?id=6034467797";
		["departure-board"] = "http://www.roblox.com/asset/?id=6034767615";
		["icecream"] = "http://www.roblox.com/asset/?id=6034687967";
		["navigation"] = "http://www.roblox.com/asset/?id=6034509984";
		["near-me"] = "http://www.roblox.com/asset/?id=6034509996";
		["fastfood"] = "http://www.roblox.com/asset/?id=6034744034";
		["local-library"] = "http://www.roblox.com/asset/?id=6034684931";
		["local-activity"] = "http://www.roblox.com/asset/?id=6034687955";
		["local-hospital"] = "http://www.roblox.com/asset/?id=6034684956";
		["menu-book"] = "http://www.roblox.com/asset/?id=6034509994";
		["directions-bike"] = "http://www.roblox.com/asset/?id=6034754459";
		["store-mall-directory"] = "http://www.roblox.com/asset/?id=6034470811";
		["trip-origin"] = "http://www.roblox.com/asset/?id=6034467804";
		["tram"] = "http://www.roblox.com/asset/?id=6034467806";
		["edit-location"] = "http://www.roblox.com/asset/?id=6034754439";
		["streetview"] = "http://www.roblox.com/asset/?id=6034470805";
		["hvac"] = "http://www.roblox.com/asset/?id=6034687960";
		["lunch-dining"] = "http://www.roblox.com/asset/?id=6034684928";
		["car-repair"] = "http://www.roblox.com/asset/?id=6034767617";
		["compass-calibration"] = "http://www.roblox.com/asset/?id=6034767623";
		["360"] = "http://www.roblox.com/asset/?id=6034767608";
		["flight"] = "http://www.roblox.com/asset/?id=6034744030";
		["local-mall"] = "http://www.roblox.com/asset/?id=6034684934";
		["hotel"] = "http://www.roblox.com/asset/?id=6034687977";
		["local-parking"] = "http://www.roblox.com/asset/?id=6034513893";
		["hardware"] = "http://www.roblox.com/asset/?id=6034744036";
		["local-dining"] = "http://www.roblox.com/asset/?id=6034687963";
		["park"] = "http://www.roblox.com/asset/?id=6034503369";
		["location-pin"] = "http://www.roblox.com/asset/?id=6034684937";
		["local-movies"] = "http://www.roblox.com/asset/?id=6034684936";
		["local-atm"] = "http://www.roblox.com/asset/?id=6034687953";
		["local-taxi"] = "http://www.roblox.com/asset/?id=6034684927";
		["brightness-low"] = "http://www.roblox.com/asset/?id=6034989542";
		["screen-lock-landscape"] = "http://www.roblox.com/asset/?id=6034996700";
		["graphic-eq"] = "http://www.roblox.com/asset/?id=6034989551";
		["screen-lock-rotation"] = "http://www.roblox.com/asset/?id=6034996710";
		["signal-cellular-4-bar"] = "http://www.roblox.com/asset/?id=6035030076";
		["airplanemode-inactive"] = "http://www.roblox.com/asset/?id=6034983848";
		["signal-wifi-0-bar"] = "http://www.roblox.com/asset/?id=6035030067";
		["battery-full"] = "http://www.roblox.com/asset/?id=6034983854";
		["gps-fixed"] = "http://www.roblox.com/asset/?id=6034989550";
		["brightness-high"] = "http://www.roblox.com/asset/?id=6034989541";
		["ad-units"] = "http://www.roblox.com/asset/?id=6034983845";
		["signal-cellular-alt"] = "http://www.roblox.com/asset/?id=6035030079";
		["bluetooth-connected"] = "http://www.roblox.com/asset/?id=6034983855";
		["wifi-tethering"] = "http://www.roblox.com/asset/?id=6035039430";
		["dvr"] = "http://www.roblox.com/asset/?id=6034989561";
		["screen-search-desktop"] = "http://www.roblox.com/asset/?id=6034996711";
		["network-wifi"] = "http://www.roblox.com/asset/?id=6034996712";
		["access-alarms"] = "http://www.roblox.com/asset/?id=6034983853";
		["nfc"] = "http://www.roblox.com/asset/?id=6034996698";
		["location-disabled"] = "http://www.roblox.com/asset/?id=6034996694";
		["signal-wifi-4-bar"] = "http://www.roblox.com/asset/?id=6035030077";
		["access-time"] = "http://www.roblox.com/asset/?id=6034983856";
		["mobile-off"] = "http://www.roblox.com/asset/?id=6034996702";
		["battery-unknown"] = "http://www.roblox.com/asset/?id=6034983842";
		["signal-cellular-null"] = "http://www.roblox.com/asset/?id=6035030075";
		["bluetooth-disabled"] = "http://www.roblox.com/asset/?id=6034989562";
		["developer-mode"] = "http://www.roblox.com/asset/?id=6034989549";
		["network-cell"] = "http://www.roblox.com/asset/?id=6034996709";
		["sd-storage"] = "http://www.roblox.com/asset/?id=6034996719";
		["signal-cellular-no-sim"] = "http://www.roblox.com/asset/?id=6035030078";
		["devices"] = "http://www.roblox.com/asset/?id=6034989540";
		["screen-rotation"] = "http://www.roblox.com/asset/?id=6034996701";
		["device-thermostat"] = "http://www.roblox.com/asset/?id=6034989544";
		["signal-wifi-off"] = "http://www.roblox.com/asset/?id=6035030074";
		["widgets"] = "http://www.roblox.com/asset/?id=6035039429";
		["bluetooth"] = "http://www.roblox.com/asset/?id=6034983880";
		["battery-charging-full"] = "http://www.roblox.com/asset/?id=6034983849";
		["mobile-friendly"] = "http://www.roblox.com/asset/?id=6034996699";
		["signal-cellular-0-bar"] = "http://www.roblox.com/asset/?id=6035030072";
		["storage"] = "http://www.roblox.com/asset/?id=6035030083";
		["send-to-mobile"] = "http://www.roblox.com/asset/?id=6034996697";
		["location-searching"] = "http://www.roblox.com/asset/?id=6034996695";
		["brightness-auto"] = "http://www.roblox.com/asset/?id=6034989545";
		["wifi-lock"] = "http://www.roblox.com/asset/?id=6035039428";
		["gps-not-fixed"] = "http://www.roblox.com/asset/?id=6034989547";
		["access-alarm"] = "http://www.roblox.com/asset/?id=6034983844";
		["battery-alert"] = "http://www.roblox.com/asset/?id=6034983843";
		["signal-cellular-off"] = "http://www.roblox.com/asset/?id=6035030084";
		["signal-cellular-connected-no-internet-4"] = "http://www.roblox.com/asset/?id=6035229858";
		["gps-off"] = "http://www.roblox.com/asset/?id=6034989548";
		["add-alarm"] = "http://www.roblox.com/asset/?id=6034983850";
		["brightness-medium"] = "http://www.roblox.com/asset/?id=6034989543";
		["usb"] = "http://www.roblox.com/asset/?id=6035030080";
		["airplanemode-active"] = "http://www.roblox.com/asset/?id=6034983864";
		["reset-tv"] = "http://www.roblox.com/asset/?id=6034996696";
		["wallpaper"] = "http://www.roblox.com/asset/?id=6035030102";
		["settings-system-daydream"] = "http://www.roblox.com/asset/?id=6035030081";
		["bluetooth-searching"] = "http://www.roblox.com/asset/?id=6034989553";
		["add-to-home-screen"] = "http://www.roblox.com/asset/?id=6034983858";
		["screen-lock-portrait"] = "http://www.roblox.com/asset/?id=6034996706";
		["data-usage"] = "http://www.roblox.com/asset/?id=6034989568";
		["-auto-delete"] = "http://www.roblox.com/asset/?id=6031071068";
		["-error"] = "http://www.roblox.com/asset/?id=6031071057";
		["-notification-important"] = "http://www.roblox.com/asset/?id=6031071056";
		["-add-alert"] = "http://www.roblox.com/asset/?id=6031071067";
		["-warning"] = "http://www.roblox.com/asset/?id=6031071053";
		["-error-outline"] = "http://www.roblox.com/asset/?id=6031071050";
		["check-box-outline-blank"] = "http://www.roblox.com/asset/?id=6031068420";
		["toggle-off"] = "http://www.roblox.com/asset/?id=6031068429";
		["indeterminate-check-box"] = "http://www.roblox.com/asset/?id=6031068445";
		["radio-button-checked"] = "http://www.roblox.com/asset/?id=6031068426";
		["toggle-on"] = "http://www.roblox.com/asset/?id=6031068430";
		["check-box"] = "http://www.roblox.com/asset/?id=6031068421";
		["radio-button-unchecked"] = "http://www.roblox.com/asset/?id=6031068433";
		["star"] = "http://www.roblox.com/asset/?id=6031068423";
		["star-border"] = "http://www.roblox.com/asset/?id=6031068425";
		["star-half"] = "http://www.roblox.com/asset/?id=6031068427";
		["star-outline"] = "http://www.roblox.com/asset/?id=6031068428";
		["multiline-chart"] = "http://www.roblox.com/asset/?id=6034941721";
		["pie-chart"] = "http://www.roblox.com/asset/?id=6034973076";
		["format-line-spacing"] = "http://www.roblox.com/asset/?id=6034910905";
		["format-align-left"] = "http://www.roblox.com/asset/?id=6034900727";
		["linear-scale"] = "http://www.roblox.com/asset/?id=6034941707";
		["insert-photo"] = "http://www.roblox.com/asset/?id=6034941703";
		["scatter-plot"] = "http://www.roblox.com/asset/?id=6034973094";
		["post-add"] = "http://www.roblox.com/asset/?id=6034973083";
		["format-textdirection-r-to-l"] = "http://www.roblox.com/asset/?id=6034925623";
		["format-size"] = "http://www.roblox.com/asset/?id=6034910908";
		["format-color-fill"] = "http://www.roblox.com/asset/?id=6034910903";
		["format-paint"] = "http://www.roblox.com/asset/?id=6034925618";
		["format-underlined"] = "http://www.roblox.com/asset/?id=6034925627";
		["format-shapes"] = "http://www.roblox.com/asset/?id=6034910909";
		["title"] = "http://www.roblox.com/asset/?id=6034934042";
		["highlight"] = "http://www.roblox.com/asset/?id=6034925617";
		["bar-chart"] = "http://www.roblox.com/asset/?id=6034898096";
		["format-indent-increase"] = "http://www.roblox.com/asset/?id=6034900724";
		["merge-type"] = "http://www.roblox.com/asset/?id=6034941705";
		["bubble-chart"] = "http://www.roblox.com/asset/?id=6034925612";
		["publish"] = "http://www.roblox.com/asset/?id=6034973085";
		["format-indent-decrease"] = "http://www.roblox.com/asset/?id=6034900733";
		["margin"] = "http://www.roblox.com/asset/?id=6034941701";
		["table-rows"] = "http://www.roblox.com/asset/?id=6034934025";
		["stacked-line-chart"] = "http://www.roblox.com/asset/?id=6034934039";
		["border-clear"] = "http://www.roblox.com/asset/?id=6034898135";
		["border-color"] = "http://www.roblox.com/asset/?id=6034898100";
		["border-inner"] = "http://www.roblox.com/asset/?id=6034898131";
		["insert-chart"] = "http://www.roblox.com/asset/?id=6034925628";
		["border-top"] = "http://www.roblox.com/asset/?id=6034900726";
		["padding"] = "http://www.roblox.com/asset/?id=6034973078";
		["border-vertical"] = "http://www.roblox.com/asset/?id=6034900725";
		["score"] = "http://www.roblox.com/asset/?id=6034934041";
		["border-right"] = "http://www.roblox.com/asset/?id=6034898120";
		["add-chart"] = "http://www.roblox.com/asset/?id=6034898093";
		["space-bar"] = "http://www.roblox.com/asset/?id=6034934037";
		["border-outer"] = "http://www.roblox.com/asset/?id=6034898104";
		["mode-comment"] = "http://www.roblox.com/asset/?id=6034941700";
		["attach-money"] = "http://www.roblox.com/asset/?id=6034898098";
		["drag-handle"] = "http://www.roblox.com/asset/?id=6034910907";
		["format-align-right"] = "http://www.roblox.com/asset/?id=6034900723";
		["pie-chart-outlined"] = "http://www.roblox.com/asset/?id=6034973077";
		["horizontal-rule"] = "http://www.roblox.com/asset/?id=6034925610";
		["border-all"] = "http://www.roblox.com/asset/?id=6034898101";
		["border-style"] = "http://www.roblox.com/asset/?id=6034898097";
		["insert-comment"] = "http://www.roblox.com/asset/?id=6034925609";
		["vertical-align-top"] = "http://www.roblox.com/asset/?id=6034973080";
		["vertical-align-center"] = "http://www.roblox.com/asset/?id=6034934051";
		["format-color-text"] = "http://www.roblox.com/asset/?id=6034910910";
		["format-quote"] = "http://www.roblox.com/asset/?id=6034925629";
		["height"] = "http://www.roblox.com/asset/?id=6034925613";
		["add-comment"] = "http://www.roblox.com/asset/?id=6034898128";
		["format-strikethrough"] = "http://www.roblox.com/asset/?id=6034910904";
		["strikethrough-s"] = "http://www.roblox.com/asset/?id=6034934030";
		["border-left"] = "http://www.roblox.com/asset/?id=6034898099";
		["format-list-bulleted"] = "http://www.roblox.com/asset/?id=6034925620";
		["format-italic"] = "http://www.roblox.com/asset/?id=6034910912";
		["format-list-numbered"] = "http://www.roblox.com/asset/?id=6034925622";
		["attach-file"] = "http://www.roblox.com/asset/?id=6034898102";
		["wrap-text"] = "http://www.roblox.com/asset/?id=6034973118";
		["insert-invitation"] = "http://www.roblox.com/asset/?id=6034973091";
		["format-list-numbered-rtl"] = "http://www.roblox.com/asset/?id=6034910906";
		["border-horizontal"] = "http://www.roblox.com/asset/?id=6034898105";
		["format-align-center"] = "http://www.roblox.com/asset/?id=6034900718";
		["format-textdirection-l-to-r"] = "http://www.roblox.com/asset/?id=6034925619";
		["show-chart"] = "http://www.roblox.com/asset/?id=6034934032";
		["insert-chart-outlined"] = "http://www.roblox.com/asset/?id=6034925606";
		["vertical-align-bottom"] = "http://www.roblox.com/asset/?id=6034934023";
		["subscript"] = "http://www.roblox.com/asset/?id=6034934059";
		["format-align-justify"] = "http://www.roblox.com/asset/?id=6034900721";
		["format-clear"] = "http://www.roblox.com/asset/?id=6034910902";
		["notes"] = "http://www.roblox.com/asset/?id=6034973084";
		["insert-drive-file"] = "http://www.roblox.com/asset/?id=6034941697";
		["functions"] = "http://www.roblox.com/asset/?id=6034925614";
		["insert-emoticon"] = "http://www.roblox.com/asset/?id=6034973079";
		["insert-link"] = "http://www.roblox.com/asset/?id=6034973074";
		["format-color-reset"] = "http://www.roblox.com/asset/?id=6034900743";
		["monetization-on"] = "http://www.roblox.com/asset/?id=6034973115";
		["short-text"] = "http://www.roblox.com/asset/?id=6034934035";
		["mode-edit"] = "http://www.roblox.com/asset/?id=6034941708";
		["superscript"] = "http://www.roblox.com/asset/?id=6034934034";
		["table-chart"] = "http://www.roblox.com/asset/?id=6034973081";
		["format-bold"] = "http://www.roblox.com/asset/?id=6034900732";
		["money-off"] = "http://www.roblox.com/asset/?id=6034973088";
		["border-bottom"] = "http://www.roblox.com/asset/?id=6034898094";
		["text-fields"] = "http://www.roblox.com/asset/?id=6034934040";
		["note"] = "http://www.roblox.com/asset/?id=6026663734";
		["shuffle"] = "http://www.roblox.com/asset/?id=6026667003";
		["library-books"] = "http://www.roblox.com/asset/?id=6026660085";
		["library-music"] = "http://www.roblox.com/asset/?id=6026660075";
		["surround-sound"] = "http://www.roblox.com/asset/?id=6026671209";
		["forward-30"] = "http://www.roblox.com/asset/?id=6026660088";
		["music-video"] = "http://www.roblox.com/asset/?id=6026663704";
		["videocam-off"] = "http://www.roblox.com/asset/?id=6026671212";
		["control-camera"] = "http://www.roblox.com/asset/?id=6026647916";
		["explicit"] = "http://www.roblox.com/asset/?id=6026647913";
		["3k-plus"] = "http://www.roblox.com/asset/?id=6026681598";
		["fiber-pin"] = "http://www.roblox.com/asset/?id=6026660064";
		["skip-previous"] = "http://www.roblox.com/asset/?id=6026667011";
		["pause-circle-filled"] = "http://www.roblox.com/asset/?id=6026663718";
		["video-settings"] = "http://www.roblox.com/asset/?id=6026671211";
		["movie"] = "http://www.roblox.com/asset/?id=6026660081";
		["add-to-queue"] = "http://www.roblox.com/asset/?id=6026647903";
		["6k"] = "http://www.roblox.com/asset/?id=6026681579";
		["web-asset"] = "http://www.roblox.com/asset/?id=6026671239";
		["play-circle-outline"] = "http://www.roblox.com/asset/?id=6026663726";
		["volume-off"] = "http://www.roblox.com/asset/?id=6026671224";
		["mic-off"] = "http://www.roblox.com/asset/?id=6026660076";
		["featured-play-list"] = "http://www.roblox.com/asset/?id=6026647932";
		["pause-circle-outline"] = "http://www.roblox.com/asset/?id=6026663701";
		["slow-motion-video"] = "http://www.roblox.com/asset/?id=6026681583";
		["7k"] = "http://www.roblox.com/asset/?id=6026681584";
		["playlist-add"] = "http://www.roblox.com/asset/?id=6026663728";
		["fiber-smart-record"] = "http://www.roblox.com/asset/?id=6026660080";
		["8k"] = "http://www.roblox.com/asset/?id=6026643014";
		["hd"] = "http://www.roblox.com/asset/?id=6026660065";
		["repeat-one-on"] = "http://www.roblox.com/asset/?id=6026666992";
		["recent-actors"] = "http://www.roblox.com/asset/?id=6026663773";
		["fiber-new"] = "http://www.roblox.com/asset/?id=6026647930";
		["fiber-dvr"] = "http://www.roblox.com/asset/?id=6026647912";
		["hearing-disabled"] = "http://www.roblox.com/asset/?id=6026660068";
		["forward-10"] = "http://www.roblox.com/asset/?id=6026660062";
		["4k-plus"] = "http://www.roblox.com/asset/?id=6026643005";
		["repeat-one"] = "http://www.roblox.com/asset/?id=6026681590";
		["equalizer"] = "http://www.roblox.com/asset/?id=6026647906";
		["stop"] = "http://www.roblox.com/asset/?id=6026681576";
		["2k"] = "http://www.roblox.com/asset/?id=6026643032";
		["playlist-add-check"] = "http://www.roblox.com/asset/?id=6026663727";
		["not-interested"] = "http://www.roblox.com/asset/?id=6026663743";
		["videocam"] = "http://www.roblox.com/asset/?id=6026671213";
		["sort-by-alpha"] = "http://www.roblox.com/asset/?id=6026667009";
		["library-add"] = "http://www.roblox.com/asset/?id=6026660063";
		["stop-circle"] = "http://www.roblox.com/asset/?id=6026681577";
		["pause"] = "http://www.roblox.com/asset/?id=6026663719";
		["new-releases"] = "http://www.roblox.com/asset/?id=6026663730";
		["album"] = "http://www.roblox.com/asset/?id=6026647905";
		["sd"] = "http://www.roblox.com/asset/?id=6026681582";
		["volume-up"] = "http://www.roblox.com/asset/?id=6026671215";
		["replay-5"] = "http://www.roblox.com/asset/?id=6026666993";
		["high-quality"] = "http://www.roblox.com/asset/?id=6026660059";
		["shuffle-on"] = "http://www.roblox.com/asset/?id=6026666996";
		["play-arrow"] = "http://www.roblox.com/asset/?id=6026663699";
		["snooze"] = "http://www.roblox.com/asset/?id=6026667006";
		["closed-caption-disabled"] = "http://www.roblox.com/asset/?id=6026647900";
		["subscriptions"] = "http://www.roblox.com/asset/?id=6026671207";
		["skip-next"] = "http://www.roblox.com/asset/?id=6026667005";
		["branding-watermark"] = "http://www.roblox.com/asset/?id=6026647911";
		["speed"] = "http://www.roblox.com/asset/?id=6026681578";
		["art-track"] = "http://www.roblox.com/asset/?id=6026647908";
		["3k"] = "http://www.roblox.com/asset/?id=6026681574";
		["4k"] = "http://www.roblox.com/asset/?id=6026643017";
		["volume-mute"] = "http://www.roblox.com/asset/?id=6026671214";
		["playlist-play"] = "http://www.roblox.com/asset/?id=6026663723";
		["remove-from-queue"] = "http://www.roblox.com/asset/?id=6026663771";
		["fast-forward"] = "http://www.roblox.com/asset/?id=6026647902";
		["play-disabled"] = "http://www.roblox.com/asset/?id=6026663702";
		["fast-rewind"] = "http://www.roblox.com/asset/?id=6026647942";
		["5k"] = "http://www.roblox.com/asset/?id=6026681575";
		["replay-10"] = "http://www.roblox.com/asset/?id=6026667007";
		["video-library"] = "http://www.roblox.com/asset/?id=6026671208";
		["loop"] = "http://www.roblox.com/asset/?id=6026660087";
		["replay-circle-filled"] = "http://www.roblox.com/asset/?id=6026667002";
		["5g"] = "http://www.roblox.com/asset/?id=6026643007";
		["library-add-check"] = "http://www.roblox.com/asset/?id=6026660083";
		["repeat"] = "http://www.roblox.com/asset/?id=6026666998";
		["queue-play-next"] = "http://www.roblox.com/asset/?id=6026663700";
		["forward-5"] = "http://www.roblox.com/asset/?id=6026660067";
		["web"] = "http://www.roblox.com/asset/?id=6026671234";
		["mic-none"] = "http://www.roblox.com/asset/?id=6026660066";
		["queue"] = "http://www.roblox.com/asset/?id=6026663724";
		["closed-caption-off"] = "http://www.roblox.com/asset/?id=6026647943";
		["hearing"] = "http://www.roblox.com/asset/?id=6026660060";
		["queue-music"] = "http://www.roblox.com/asset/?id=6026663725";
		["airplay"] = "http://www.roblox.com/asset/?id=6026647929";
		["9k"] = "http://www.roblox.com/asset/?id=6026643013";
		["video-label"] = "http://www.roblox.com/asset/?id=6026671204";
		["8k-plus"] = "http://www.roblox.com/asset/?id=6026643003";
		["play-circle-filled"] = "http://www.roblox.com/asset/?id=6026663705";
		["1k"] = "http://www.roblox.com/asset/?id=6026643002";
		["fiber-manual-record"] = "http://www.roblox.com/asset/?id=6026647909";
		["closed-caption"] = "http://www.roblox.com/asset/?id=6026647896";
		["subtitles"] = "http://www.roblox.com/asset/?id=6026671203";
		["featured-video"] = "http://www.roblox.com/asset/?id=6026647910";
		["replay-30"] = "http://www.roblox.com/asset/?id=6026667010";
		["10k"] = "http://www.roblox.com/asset/?id=6026643035";
		["5k-plus"] = "http://www.roblox.com/asset/?id=6026643028";
		["6k-plus"] = "http://www.roblox.com/asset/?id=6026643019";
		["replay"] = "http://www.roblox.com/asset/?id=6026666999";
		["repeat-on"] = "http://www.roblox.com/asset/?id=6026666994";
		["1k-plus"] = "http://www.roblox.com/asset/?id=6026681580";
		["2k-plus"] = "http://www.roblox.com/asset/?id=6026681588";
		["games"] = "http://www.roblox.com/asset/?id=6026660074";
		["volume-down"] = "http://www.roblox.com/asset/?id=6026671206";
		["mic"] = "http://www.roblox.com/asset/?id=6026660078";
		["call-to-action"] = "http://www.roblox.com/asset/?id=6026647898";
		["7k-plus"] = "http://www.roblox.com/asset/?id=6026643012";
		["av-timer"] = "http://www.roblox.com/asset/?id=6026647934";
		["9k-plus"] = "http://www.roblox.com/asset/?id=6026681585";
		["radio"] = "http://www.roblox.com/asset/?id=6026663698";
		["10mp"] = "http://www.roblox.com/asset/?id=6031328149";
		["20mp"] = "http://www.roblox.com/asset/?id=6031488940";
		["wb-twighlight"] = "http://www.roblox.com/asset/?id=6034412760";
		["movie-creation"] = "http://www.roblox.com/asset/?id=6034323681";
		["crop-portrait"] = "http://www.roblox.com/asset/?id=6031630198";
		["filter-5"] = "http://www.roblox.com/asset/?id=6031597518";
		["broken-image"] = "http://www.roblox.com/asset/?id=6031471480";
		["flip-camera-android"] = "http://www.roblox.com/asset/?id=6034333280";
		["flip-camera-ios"] = "http://www.roblox.com/asset/?id=6034333267";
		["circle"] = "http://www.roblox.com/asset/?id=6031625146";
		["photo-camera-front"] = "http://www.roblox.com/asset/?id=6031771000";
		["assistant"] = "http://www.roblox.com/asset/?id=6031360356";
		["face-retouching-natural"] = "http://www.roblox.com/asset/?id=6034333274";
		["palette"] = "http://www.roblox.com/asset/?id=6034316009";
		["nature-people"] = "http://www.roblox.com/asset/?id=6034323711";
		["14mp"] = "http://www.roblox.com/asset/?id=6031328161";
		["gradient"] = "http://www.roblox.com/asset/?id=6034333261";
		["filter-4"] = "http://www.roblox.com/asset/?id=6031597512";
		["panorama-wide-angle-select"] = "http://www.roblox.com/asset/?id=6031770990";
		["photo"] = "http://www.roblox.com/asset/?id=6031770993";
		["grid-off"] = "http://www.roblox.com/asset/?id=6034333286";
		["leak-add"] = "http://www.roblox.com/asset/?id=6034407074";
		["landscape"] = "http://www.roblox.com/asset/?id=6034407069";
		["exposure-plus-1"] = "http://www.roblox.com/asset/?id=6034328970";
		["slideshow"] = "http://www.roblox.com/asset/?id=6031754546";
		["camera-alt"] = "http://www.roblox.com/asset/?id=6031572307";
		["audiotrack"] = "http://www.roblox.com/asset/?id=6031471489";
		["filter-none"] = "http://www.roblox.com/asset/?id=6031600815";
		["blur-off"] = "http://www.roblox.com/asset/?id=6031371055";
		["crop-16-9"] = "http://www.roblox.com/asset/?id=6031630205";
		["blur-on"] = "http://www.roblox.com/asset/?id=6031371068";
		["brightness-4"] = "http://www.roblox.com/asset/?id=6031471483";
		["details"] = "http://www.roblox.com/asset/?id=6034328968";
		["panorama-horizontal"] = "http://www.roblox.com/asset/?id=6034315966";
		["camera-rear"] = "http://www.roblox.com/asset/?id=6031572316";
		["hdr-weak"] = "http://www.roblox.com/asset/?id=6034407083";
		["collections"] = "http://www.roblox.com/asset/?id=6031625145";
		["hdr-enhanced-select"] = "http://www.roblox.com/asset/?id=6034333281";
		["adjust"] = "http://www.roblox.com/asset/?id=6031339048";
		["burst-mode"] = "http://www.roblox.com/asset/?id=6031572306";
		["nature"] = "http://www.roblox.com/asset/?id=6034323695";
		["brightness-6"] = "http://www.roblox.com/asset/?id=6031572309";
		["19mp"] = "http://www.roblox.com/asset/?id=6031339054";
		["grain"] = "http://www.roblox.com/asset/?id=6034333288";
		["receipt-long"] = "http://www.roblox.com/asset/?id=6031763428";
		["photo-filter"] = "http://www.roblox.com/asset/?id=6031770992";
		["edit"] = "http://www.roblox.com/asset/?id=6034328955";
		["healing"] = "http://www.roblox.com/asset/?id=6034407071";
		["exposure-neg-1"] = "http://www.roblox.com/asset/?id=6034328957";
		["exposure"] = "http://www.roblox.com/asset/?id=6034328962";
		["wb-shade"] = "http://www.roblox.com/asset/?id=6034315974";
		["compare"] = "http://www.roblox.com/asset/?id=6031625151";
		["cases"] = "http://www.roblox.com/asset/?id=6031572324";
		["timer-3"] = "http://www.roblox.com/asset/?id=6031754540";
		["exposure-plus-2"] = "http://www.roblox.com/asset/?id=6034328961";
		["12mp"] = "http://www.roblox.com/asset/?id=6031328140";
		["22mp"] = "http://www.roblox.com/asset/?id=6031360353";
		["timer-off"] = "http://www.roblox.com/asset/?id=6031734881";
		["auto-stories"] = "http://www.roblox.com/asset/?id=6031360360";
		["rotate-left"] = "http://www.roblox.com/asset/?id=6031763427";
		["wb-iridescent"] = "http://www.roblox.com/asset/?id=6034315972";
		["shutter-speed"] = "http://www.roblox.com/asset/?id=6031763443";
		["switch-video"] = "http://www.roblox.com/asset/?id=6031754536";
		["23mp"] = "http://www.roblox.com/asset/?id=6031339045";
		["euro"] = "http://www.roblox.com/asset/?id=6034328963";
		["15mp"] = "http://www.roblox.com/asset/?id=6031328158";
		["filter-center-focus"] = "http://www.roblox.com/asset/?id=6031600817";
		["photo-library"] = "http://www.roblox.com/asset/?id=6031770998";
		["mp"] = "http://www.roblox.com/asset/?id=6034323674";
		["looks-4"] = "http://www.roblox.com/asset/?id=6034407089";
		["filter-2"] = "http://www.roblox.com/asset/?id=6031597521";
		["crop-3-2"] = "http://www.roblox.com/asset/?id=6034328956";
		["auto-fix-normal"] = "http://www.roblox.com/asset/?id=6031371074";
		["auto-fix-off"] = "http://www.roblox.com/asset/?id=6031360381";
		["wb-auto"] = "http://www.roblox.com/asset/?id=6031734875";
		["switch-camera"] = "http://www.roblox.com/asset/?id=6031754550";
		["filter-vintage"] = "http://www.roblox.com/asset/?id=6031600811";
		["photo-size-select-small"] = "http://www.roblox.com/asset/?id=6031763457";
		["blur-linear"] = "http://www.roblox.com/asset/?id=6031488930";
		["hdr-on"] = "http://www.roblox.com/asset/?id=6034333279";
		["tag-faces"] = "http://www.roblox.com/asset/?id=6031754560";
		["21mp"] = "http://www.roblox.com/asset/?id=6031339065";
		["camera"] = "http://www.roblox.com/asset/?id=6031572312";
		["image-aspect-ratio"] = "http://www.roblox.com/asset/?id=6034407073";
		["filter-b-and-w"] = "http://www.roblox.com/asset/?id=6031600824";
		["crop-landscape"] = "http://www.roblox.com/asset/?id=6031630202";
		["13mp"] = "http://www.roblox.com/asset/?id=6031328137";
		["grid-on"] = "http://www.roblox.com/asset/?id=6034333276";
		["motion-photos-pause"] = "http://www.roblox.com/asset/?id=6034323668";
		["filter-6"] = "http://www.roblox.com/asset/?id=6031597524";
		["linked-camera"] = "http://www.roblox.com/asset/?id=6034407082";
		["panorama-fish-eye"] = "http://www.roblox.com/asset/?id=6034315969";
		["panorama"] = "http://www.roblox.com/asset/?id=6034315955";
		["color-lens"] = "http://www.roblox.com/asset/?id=6031625148";
		["lens"] = "http://www.roblox.com/asset/?id=6034407081";
		["crop-din"] = "http://www.roblox.com/asset/?id=6031630208";
		["exposure-neg-2"] = "http://www.roblox.com/asset/?id=6034328973";
		["mic-external-off"] = "http://www.roblox.com/asset/?id=6034323672";
		["crop-free"] = "http://www.roblox.com/asset/?id=6031630212";
		["crop-original"] = "http://www.roblox.com/asset/?id=6031630204";
		["panorama-photosphere-select"] = "http://www.roblox.com/asset/?id=6034315975";
		["photo-size-select-actual"] = "http://www.roblox.com/asset/?id=6031771012";
		["leak-remove"] = "http://www.roblox.com/asset/?id=6034407080";
		["collections-bookmark"] = "http://www.roblox.com/asset/?id=6034328965";
		["straighten"] = "http://www.roblox.com/asset/?id=6031754545";
		["timelapse"] = "http://www.roblox.com/asset/?id=6031754541";
		["picture-as-pdf"] = "http://www.roblox.com/asset/?id=6031763425";
		["crop-rotate"] = "http://www.roblox.com/asset/?id=6031630203";
		["control-point-duplicate"] = "http://www.roblox.com/asset/?id=6034328959";
		["photo-camera-back"] = "http://www.roblox.com/asset/?id=6031771007";
		["looks-3"] = "http://www.roblox.com/asset/?id=6034407088";
		["motion-photos-off"] = "http://www.roblox.com/asset/?id=6034323670";
		["rotate-right"] = "http://www.roblox.com/asset/?id=6031763429";
		["view-compact"] = "http://www.roblox.com/asset/?id=6031734878";
		["crop-7-5"] = "http://www.roblox.com/asset/?id=6031630197";
		["style"] = "http://www.roblox.com/asset/?id=6031754538";
		["exposure-zero"] = "http://www.roblox.com/asset/?id=6034329000";
		["camera-front"] = "http://www.roblox.com/asset/?id=6031572318";
		["hdr-strong"] = "http://www.roblox.com/asset/?id=6034333272";
		["view-comfy"] = "http://www.roblox.com/asset/?id=6031734876";
		["panorama-vertical"] = "http://www.roblox.com/asset/?id=6034315963";
		["panorama-vertical-select"] = "http://www.roblox.com/asset/?id=6034315961";
		["looks-two"] = "http://www.roblox.com/asset/?id=6034412757";
		["filter-drama"] = "http://www.roblox.com/asset/?id=6031600813";
		["center-focus-strong"] = "http://www.roblox.com/asset/?id=6031625147";
		["18mp"] = "http://www.roblox.com/asset/?id=6031339064";
		["7mp"] = "http://www.roblox.com/asset/?id=6031328139";
		["wb-sunny"] = "http://www.roblox.com/asset/?id=6034412758";
		["filter-9-plus"] = "http://www.roblox.com/asset/?id=6031600812";
		["crop"] = "http://www.roblox.com/asset/?id=6034328964";
		["vignette"] = "http://www.roblox.com/asset/?id=6031734905";
		["brightness-2"] = "http://www.roblox.com/asset/?id=6031488938";
		["crop-square"] = "http://www.roblox.com/asset/?id=6031630222";
		["looks-5"] = "http://www.roblox.com/asset/?id=6034412764";
		["flip"] = "http://www.roblox.com/asset/?id=6034333275";
		["looks-one"] = "http://www.roblox.com/asset/?id=6034412761";
		["flash-off"] = "http://www.roblox.com/asset/?id=6034333270";
		["hdr-off"] = "http://www.roblox.com/asset/?id=6034333266";
		["photo-album"] = "http://www.roblox.com/asset/?id=6031770989";
		["motion-photos-paused"] = "http://www.roblox.com/asset/?id=6034323675";
		["photo-camera"] = "http://www.roblox.com/asset/?id=6031770997";
		["2mp"] = "http://www.roblox.com/asset/?id=6031328138";
		["3mp"] = "http://www.roblox.com/asset/?id=6031328136";
		["24mp"] = "http://www.roblox.com/asset/?id=6031360352";
		["filter-9"] = "http://www.roblox.com/asset/?id=6031597534";
		["6mp"] = "http://www.roblox.com/asset/?id=6031328131";
		["remove-red-eye"] = "http://www.roblox.com/asset/?id=6031763426";
		["4mp"] = "http://www.roblox.com/asset/?id=6031328152";
		["add-a-photo"] = "http://www.roblox.com/asset/?id=6031339049";
		["filter-3"] = "http://www.roblox.com/asset/?id=6031597513";
		["crop-5-4"] = "http://www.roblox.com/asset/?id=6034328960";
		["8mp"] = "http://www.roblox.com/asset/?id=6031328133";
		["camera-roll"] = "http://www.roblox.com/asset/?id=6031572314";
		["panorama-wide-angle"] = "http://www.roblox.com/asset/?id=6031770995";
		["transform"] = "http://www.roblox.com/asset/?id=6031734873";
		["flare"] = "http://www.roblox.com/asset/?id=6031600816";
		["image-search"] = "http://www.roblox.com/asset/?id=6034407084";
		["auto-awesome"] = "http://www.roblox.com/asset/?id=6031360365";
		["motion-photos-on"] = "http://www.roblox.com/asset/?id=6034323669";
		["rotate-90-degrees-ccw"] = "http://www.roblox.com/asset/?id=6031763456";
		["filter-1"] = "http://www.roblox.com/asset/?id=6031597511";
		["filter-tilt-shift"] = "http://www.roblox.com/asset/?id=6031600814";
		["image"] = "http://www.roblox.com/asset/?id=6034407078";
		["center-focus-weak"] = "http://www.roblox.com/asset/?id=6031625144";
		["blur-circular"] = "http://www.roblox.com/asset/?id=6031488945";
		["bedtime"] = "http://www.roblox.com/asset/?id=6031371054";
		["auto-fix-high"] = "http://www.roblox.com/asset/?id=6031360355";
		["monochrome-photos"] = "http://www.roblox.com/asset/?id=6034323678";
		["flash-auto"] = "http://www.roblox.com/asset/?id=6034333287";
		["5mp"] = "http://www.roblox.com/asset/?id=6031328144";
		["photo-size-select-large"] = "http://www.roblox.com/asset/?id=6031763423";
		["assistant-photo"] = "http://www.roblox.com/asset/?id=6031339052";
		["animation"] = "http://www.roblox.com/asset/?id=6031625150";
		["looks"] = "http://www.roblox.com/asset/?id=6034407096";
		["17mp"] = "http://www.roblox.com/asset/?id=6031339055";
		["panorama-horizontal-select"] = "http://www.roblox.com/asset/?id=6034315965";
		["flash-on"] = "http://www.roblox.com/asset/?id=6034333271";
		["iso"] = "http://www.roblox.com/asset/?id=6034407106";
		["music-note"] = "http://www.roblox.com/asset/?id=6034323673";
		["music-off"] = "http://www.roblox.com/asset/?id=6034323679";
		["navigate-next"] = "http://www.roblox.com/asset/?id=6034315956";
		["timer"] = "http://www.roblox.com/asset/?id=6031754564";
		["loupe"] = "http://www.roblox.com/asset/?id=6034412770";
		["navigate-before"] = "http://www.roblox.com/asset/?id=6034323696";
		["brightness-1"] = "http://www.roblox.com/asset/?id=6031471488";
		["brightness-7"] = "http://www.roblox.com/asset/?id=6031471491";
		["tonality"] = "http://www.roblox.com/asset/?id=6031734891";
		["brush"] = "http://www.roblox.com/asset/?id=6031572320";
		["colorize"] = "http://www.roblox.com/asset/?id=6031625161";
		["filter-7"] = "http://www.roblox.com/asset/?id=6031597515";
		["16mp"] = "http://www.roblox.com/asset/?id=6031328168";
		["timer-10"] = "http://www.roblox.com/asset/?id=6031734880";
		["portrait"] = "http://www.roblox.com/asset/?id=6031763434";
		["tune"] = "http://www.roblox.com/asset/?id=6031734877";
		["image-not-supported"] = "http://www.roblox.com/asset/?id=6034407076";
		["wb-cloudy"] = "http://www.roblox.com/asset/?id=6031734907";
		["auto-awesome-motion"] = "http://www.roblox.com/asset/?id=6031360370";
		["filter-8"] = "http://www.roblox.com/asset/?id=6031597532";
		["brightness-5"] = "http://www.roblox.com/asset/?id=6031471479";
		["movie-filter"] = "http://www.roblox.com/asset/?id=6034323687";
		["add-photo-alternate"] = "http://www.roblox.com/asset/?id=6031471484";
		["add-to-photos"] = "http://www.roblox.com/asset/?id=6031371075";
		["texture"] = "http://www.roblox.com/asset/?id=6031754553";
		["11mp"] = "http://www.roblox.com/asset/?id=6031328141";
		["mic-external-on"] = "http://www.roblox.com/asset/?id=6034323671";
		["looks-6"] = "http://www.roblox.com/asset/?id=6034412759";
		["dehaze"] = "http://www.roblox.com/asset/?id=6031630200";
		["control-point"] = "http://www.roblox.com/asset/?id=6031625131";
		["panorama-photosphere"] = "http://www.roblox.com/asset/?id=6034412763";
		["filter-frames"] = "http://www.roblox.com/asset/?id=6031600833";
		["auto-awesome-mosaic"] = "http://www.roblox.com/asset/?id=6031371053";
		["9mp"] = "http://www.roblox.com/asset/?id=6031328146";
		["filter"] = "http://www.roblox.com/asset/?id=6031597514";
		["brightness-3"] = "http://www.roblox.com/asset/?id=6031572317";
		["dirty-lens"] = "http://www.roblox.com/asset/?id=6034328967";
		["wb-incandescent"] = "http://www.roblox.com/asset/?id=6034316010";
		["filter-hdr"] = "http://www.roblox.com/asset/?id=6031600819";
		["textsms"] = "http://www.roblox.com/asset/?id=6035202006";
		["comment"] = "http://www.roblox.com/asset/?id=6035181871";
		["call-end"] = "http://www.roblox.com/asset/?id=6035173845";
		["qr-code-scanner"] = "http://www.roblox.com/asset/?id=6035202022";
		["phonelink-setup"] = "http://www.roblox.com/asset/?id=6035202025";
		["call-merge"] = "http://www.roblox.com/asset/?id=6035173843";
		["phonelink-erase"] = "http://www.roblox.com/asset/?id=6035202085";
		["contact-mail"] = "http://www.roblox.com/asset/?id=6035181868";
		["contact-phone"] = "http://www.roblox.com/asset/?id=6035181861";
		["screen-share"] = "http://www.roblox.com/asset/?id=6035202008";
		["present-to-all"] = "http://www.roblox.com/asset/?id=6035202020";
		["stay-primary-portrait"] = "http://www.roblox.com/asset/?id=6035202009";
		["message"] = "http://www.roblox.com/asset/?id=6035202033";
		["sentiment-satisfied-alt"] = "http://www.roblox.com/asset/?id=6035202069";
		["stay-current-portrait"] = "http://www.roblox.com/asset/?id=6035202004";
		["voicemail"] = "http://www.roblox.com/asset/?id=6035202019";
		["business"] = "http://www.roblox.com/asset/?id=6035173853";
		["mail-outline"] = "http://www.roblox.com/asset/?id=6035190844";
		["vpn-key"] = "http://www.roblox.com/asset/?id=6035202034";
		["forward-to-inbox"] = "http://www.roblox.com/asset/?id=6035190840";
		["contacts"] = "http://www.roblox.com/asset/?id=6035181864";
		["phonelink-ring"] = "http://www.roblox.com/asset/?id=6035202066";
		["domain-disabled"] = "http://www.roblox.com/asset/?id=6035181862";
		["person-add-disabled"] = "http://www.roblox.com/asset/?id=6035202007";
		["stay-primary-landscape"] = "http://www.roblox.com/asset/?id=6035202026";
		["alternate-email"] = "http://www.roblox.com/asset/?id=6035173865";
		["phone-disabled"] = "http://www.roblox.com/asset/?id=6035202028";
		["email"] = "http://www.roblox.com/asset/?id=6035181866";
		["mobile-screen-share"] = "http://www.roblox.com/asset/?id=6035202021";
		["live-help"] = "http://www.roblox.com/asset/?id=6035190836";
		["chat-bubble"] = "http://www.roblox.com/asset/?id=6035181858";
		["stop-screen-share"] = "http://www.roblox.com/asset/?id=6035202042";
		["location-on"] = "http://www.roblox.com/asset/?id=6035190846";
		["chat-bubble-outline"] = "http://www.roblox.com/asset/?id=6035181869";
		["dialer-sip"] = "http://www.roblox.com/asset/?id=6035181865";
		["no-sim"] = "http://www.roblox.com/asset/?id=6035202030";
		["list-alt"] = "http://www.roblox.com/asset/?id=6035190838";
		["call"] = "http://www.roblox.com/asset/?id=6035173859";
		["pause-presentation"] = "http://www.roblox.com/asset/?id=6035202015";
		["invert-colors-off"] = "http://www.roblox.com/asset/?id=6035190842";
		["call-missed-outgoing"] = "http://www.roblox.com/asset/?id=6035173847";
		["stay-current-landscape"] = "http://www.roblox.com/asset/?id=6035202011";
		["import-export"] = "http://www.roblox.com/asset/?id=6035202040";
		["add-ic-call"] = "http://www.roblox.com/asset/?id=6035173839";
		["dialpad"] = "http://www.roblox.com/asset/?id=6035181892";
		["nat"] = "http://www.roblox.com/asset/?id=6035202082";
		["unsubscribe"] = "http://www.roblox.com/asset/?id=6035202044";
		["mark-chat-unread"] = "http://www.roblox.com/asset/?id=6035190841";
		["portable-wifi-off"] = "http://www.roblox.com/asset/?id=6035202091";
		["location-off"] = "http://www.roblox.com/asset/?id=6035202049";
		["person-search"] = "http://www.roblox.com/asset/?id=6035202013";
		["phonelink-lock"] = "http://www.roblox.com/asset/?id=6035202064";
		["desktop-access-disabled"] = "http://www.roblox.com/asset/?id=6035181863";
		["import-contacts"] = "http://www.roblox.com/asset/?id=6035190854";
		["rss-feed"] = "http://www.roblox.com/asset/?id=6035202016";
		["chat"] = "http://www.roblox.com/asset/?id=6035173838";
		["warn-disabled"] = "http://www.roblox.com/asset/?id=6035202041";
		["mark-email-read"] = "http://www.roblox.com/asset/?id=6035202038";
		["hourglass-top"] = "http://www.roblox.com/asset/?id=6035190886";
		["clear-all"] = "http://www.roblox.com/asset/?id=6035181870";
		["forum"] = "http://www.roblox.com/asset/?id=6035202002";
		["qr-code"] = "http://www.roblox.com/asset/?id=6035202012";
		["speaker-phone"] = "http://www.roblox.com/asset/?id=6035202018";
		["rtt"] = "http://www.roblox.com/asset/?id=6035202010";
		["domain-verification"] = "http://www.roblox.com/asset/?id=6035181867";
		["app-registration"] = "http://www.roblox.com/asset/?id=6035173870";
		["call-split"] = "http://www.roblox.com/asset/?id=6035173861";
		["cell-wifi"] = "http://www.roblox.com/asset/?id=6035173852";
		["phone-enabled"] = "http://www.roblox.com/asset/?id=6035202089";
		["call-made"] = "http://www.roblox.com/asset/?id=6035173858";
		["call-received"] = "http://www.roblox.com/asset/?id=6035173844";
		["phone"] = "http://www.roblox.com/asset/?id=6035202017";
		["ring-volume"] = "http://www.roblox.com/asset/?id=6035202032";
		["mark-email-unread"] = "http://www.roblox.com/asset/?id=6035202027";
		["hourglass-bottom"] = "http://www.roblox.com/asset/?id=6035202043";
		["read-more"] = "http://www.roblox.com/asset/?id=6035202014";
		["duo"] = "http://www.roblox.com/asset/?id=6035181860";
		["more-time"] = "http://www.roblox.com/asset/?id=6035202036";
		["wifi-calling"] = "http://www.roblox.com/asset/?id=6035202065";
		["swap-calls"] = "http://www.roblox.com/asset/?id=6035202037";
		["cancel-presentation"] = "http://www.roblox.com/asset/?id=6035173837";
		["call-missed"] = "http://www.roblox.com/asset/?id=6035173850";
		["mark-chat-read"] = "http://www.roblox.com/asset/?id=6035202031";
		["text-snippet"] = "http://www.roblox.com/asset/?id=6031302995";
		["snippet-folder"] = "http://www.roblox.com/asset/?id=6031302947";
		["workspaces-outline"] = "http://www.roblox.com/asset/?id=6031302952";
		["file-download"] = "http://www.roblox.com/asset/?id=6031302931";
		["request-quote"] = "http://www.roblox.com/asset/?id=6031302941";
		["approval"] = "http://www.roblox.com/asset/?id=6031302928";
		["drive-folder-upload"] = "http://www.roblox.com/asset/?id=6031302929";
		["rule-folder"] = "http://www.roblox.com/asset/?id=6031302940";
		["attach-email"] = "http://www.roblox.com/asset/?id=6031302935";
		["topic"] = "http://www.roblox.com/asset/?id=6031302976";
		["upload-file"] = "http://www.roblox.com/asset/?id=6031302959";
		["attachment"] = "http://www.roblox.com/asset/?id=6031302921";
		["file-download-done"] = "http://www.roblox.com/asset/?id=6031302926";
		["drive-file-move-outline"] = "http://www.roblox.com/asset/?id=6031302924";
		["cloud-upload"] = "http://www.roblox.com/asset/?id=6031302992";
		["cloud-circle"] = "http://www.roblox.com/asset/?id=6031302919";
		["folder-shared"] = "http://www.roblox.com/asset/?id=6031302945";
		["cloud-download"] = "http://www.roblox.com/asset/?id=6031302917";
		["file-upload"] = "http://www.roblox.com/asset/?id=6031302996";
		["workspaces-filled"] = "http://www.roblox.com/asset/?id=6031302961";
		["cloud-queue"] = "http://www.roblox.com/asset/?id=6031302916";
		["cloud"] = "http://www.roblox.com/asset/?id=6031302918";
		["folder-open"] = "http://www.roblox.com/asset/?id=6031302934";
		["grid-view"] = "http://www.roblox.com/asset/?id=6031302950";
		["cloud-off"] = "http://www.roblox.com/asset/?id=6031302993";
		["create-new-folder"] = "http://www.roblox.com/asset/?id=6031302933";
		["cloud-done"] = "http://www.roblox.com/asset/?id=6031302927";
		["folder"] = "http://www.roblox.com/asset/?id=6031302932";
		["drive-file-move"] = "http://www.roblox.com/asset/?id=6031302922";
		["drive-file-rename-outline"] = "http://www.roblox.com/asset/?id=6031302994";
		["notifications-active"] = "http://www.roblox.com/asset/?id=6034304908";
		["sentiment-neutral"] = "http://www.roblox.com/asset/?id=6034230636";
		["sick"] = "http://www.roblox.com/asset/?id=6034230642";
		["poll"] = "http://www.roblox.com/asset/?id=6034267991";
		["emoji-events"] = "http://www.roblox.com/asset/?id=6034275726";
		["groups"] = "http://www.roblox.com/asset/?id=6034281935";
		["sports-soccer"] = "http://www.roblox.com/asset/?id=6034227075";
		["person-add"] = "http://www.roblox.com/asset/?id=6034287514";
		["mood-bad"] = "http://www.roblox.com/asset/?id=6034295706";
		["person-remove-alt-1"] = "http://www.roblox.com/asset/?id=6034287515";
		["king-bed"] = "http://www.roblox.com/asset/?id=6034281948";
		["architecture"] = "http://www.roblox.com/asset/?id=6034275730";
		["deck"] = "http://www.roblox.com/asset/?id=6034295703";
		["group-add"] = "http://www.roblox.com/asset/?id=6034281909";
		["sports-basketball"] = "http://www.roblox.com/asset/?id=6034230649";
		["emoji-symbols"] = "http://www.roblox.com/asset/?id=6034281899";
		["switch-account"] = "http://www.roblox.com/asset/?id=6034227138";
		["remove-moderator"] = "http://www.roblox.com/asset/?id=6034267998";
		["coronavirus"] = "http://www.roblox.com/asset/?id=6034275724";
		["people"] = "http://www.roblox.com/asset/?id=6034287513";
		["person"] = "http://www.roblox.com/asset/?id=6034287594";
		["elderly"] = "http://www.roblox.com/asset/?id=6034295698";
		["clean-hands"] = "http://www.roblox.com/asset/?id=6034275729";
		["emoji-flags"] = "http://www.roblox.com/asset/?id=6034304898";
		["psychology"] = "http://www.roblox.com/asset/?id=6034287516";
		["person-add-alt"] = "http://www.roblox.com/asset/?id=6034267994";
		["sports-volleyball"] = "http://www.roblox.com/asset/?id=6034227139";
		["domain"] = "http://www.roblox.com/asset/?id=6034275722";
		["emoji-objects"] = "http://www.roblox.com/asset/?id=6034281900";
		["ios-share"] = "http://www.roblox.com/asset/?id=6034281941";
		["history-edu"] = "http://www.roblox.com/asset/?id=6034281934";
		["share"] = "http://www.roblox.com/asset/?id=6034230648";
		["military-tech"] = "http://www.roblox.com/asset/?id=6034295711";
		["sports-kabaddi"] = "http://www.roblox.com/asset/?id=6034227141";
		["cake"] = "http://www.roblox.com/asset/?id=6034295702";
		["engineering"] = "http://www.roblox.com/asset/?id=6034281908";
		["emoji-food-beverage"] = "http://www.roblox.com/asset/?id=6034304883";
		["notifications-none"] = "http://www.roblox.com/asset/?id=6034308947";
		["emoji-people"] = "http://www.roblox.com/asset/?id=6034281904";
		["thumb-down-alt"] = "http://www.roblox.com/asset/?id=6034227069";
		["sentiment-very-satisfied"] = "http://www.roblox.com/asset/?id=6034230650";
		["nights-stay"] = "http://www.roblox.com/asset/?id=6034304881";
		["reduce-capacity"] = "http://www.roblox.com/asset/?id=6034268013";
		["add-moderator"] = "http://www.roblox.com/asset/?id=6034295699";
		["science"] = "http://www.roblox.com/asset/?id=6034230640";
		["pages"] = "http://www.roblox.com/asset/?id=6034304892";
		["sentiment-satisfied"] = "http://www.roblox.com/asset/?id=6034230668";
		["plus-one"] = "http://www.roblox.com/asset/?id=6034268012";
		["party-mode"] = "http://www.roblox.com/asset/?id=6034287521";
		["person-remove"] = "http://www.roblox.com/asset/?id=6034267996";
		["single-bed"] = "http://www.roblox.com/asset/?id=6034230651";
		["mood"] = "http://www.roblox.com/asset/?id=6034295704";
		["public"] = "http://www.roblox.com/asset/?id=6034287522";
		["sports-rugby"] = "http://www.roblox.com/asset/?id=6034227073";
		["sports-handball"] = "http://www.roblox.com/asset/?id=6034227074";
		["person-add-alt-1"] = "http://www.roblox.com/asset/?id=6034287519";
		["people-alt"] = "http://www.roblox.com/asset/?id=6034287518";
		["notifications-off"] = "http://www.roblox.com/asset/?id=6034304894";
		["whatshot"] = "http://www.roblox.com/asset/?id=6034287525";
		["emoji-transportation"] = "http://www.roblox.com/asset/?id=6034281894";
		["outdoor-grill"] = "http://www.roblox.com/asset/?id=6034304900";
		["sentiment-very-dissatisfied"] = "http://www.roblox.com/asset/?id=6034230659";
		["masks"] = "http://www.roblox.com/asset/?id=6034295710";
		["luggage"] = "http://www.roblox.com/asset/?id=6034295708";
		["sports-motorsports"] = "http://www.roblox.com/asset/?id=6034227071";
		["sports-esports"] = "http://www.roblox.com/asset/?id=6034227061";
		["location-city"] = "http://www.roblox.com/asset/?id=6034304889";
		["sports-golf"] = "http://www.roblox.com/asset/?id=6034227060";
		["sentiment-dissatisfied"] = "http://www.roblox.com/asset/?id=6034230637";
		["no-luggage"] = "http://www.roblox.com/asset/?id=6034304891";
		["fireplace"] = "http://www.roblox.com/asset/?id=6034281910";
		["emoji-nature"] = "http://www.roblox.com/asset/?id=6034281896";
		["group"] = "http://www.roblox.com/asset/?id=6034281901";
		["thumb-up-alt"] = "http://www.roblox.com/asset/?id=6034227076";
		["sports-tennis"] = "http://www.roblox.com/asset/?id=6034227068";
		["facebook"] = "http://www.roblox.com/asset/?id=6034281898";
		["sports-mma"] = "http://www.roblox.com/asset/?id=6034227072";
		["person-outline"] = "http://www.roblox.com/asset/?id=6034268008";
		["sports-baseball"] = "http://www.roblox.com/asset/?id=6034230652";
		["sports-cricket"] = "http://www.roblox.com/asset/?id=6034230660";
		["people-outline"] = "http://www.roblox.com/asset/?id=6034287528";
		["notifications-paused"] = "http://www.roblox.com/asset/?id=6034304896";
		["emoji-emotions"] = "http://www.roblox.com/asset/?id=6034275731";
		["follow-the-signs"] = "http://www.roblox.com/asset/?id=6034281911";
		["sanitizer"] = "http://www.roblox.com/asset/?id=6034287586";
		["self-improvement"] = "http://www.roblox.com/asset/?id=6034230634";
		["notifications"] = "http://www.roblox.com/asset/?id=6034308946";
		["public-off"] = "http://www.roblox.com/asset/?id=6034287538";
		["recommend"] = "http://www.roblox.com/asset/?id=6034287524";
		["sports-football"] = "http://www.roblox.com/asset/?id=6034227067";
		["sports-hockey"] = "http://www.roblox.com/asset/?id=6034227064";
		["school"] = "http://www.roblox.com/asset/?id=6034230641";
		["connect-without-contact"] = "http://www.roblox.com/asset/?id=6034275800";
		["sports"] = "http://www.roblox.com/asset/?id=6034230647";
		["construction"] = "http://www.roblox.com/asset/?id=6034275725";
		["inventory"] = "http://www.roblox.com/asset/?id=6035056487";
		["add-box"] = "http://www.roblox.com/asset/?id=6035047375";
		["how-to-reg"] = "http://www.roblox.com/asset/?id=6035053288";
		["unarchive"] = "http://www.roblox.com/asset/?id=6035078921";
		["block-flipped"] = "http://www.roblox.com/asset/?id=6035047378";
		["file-copy"] = "http://www.roblox.com/asset/?id=6035053293";
		["bolt"] = "http://www.roblox.com/asset/?id=6035047381";
		["remove-circle-outline"] = "http://www.roblox.com/asset/?id=6035067843";
		["move-to-inbox"] = "http://www.roblox.com/asset/?id=6035067838";
		["save-alt"] = "http://www.roblox.com/asset/?id=6035067842";
		["weekend"] = "http://www.roblox.com/asset/?id=6035078894";
		["where-to-vote"] = "http://www.roblox.com/asset/?id=6035078913";
		["biotech"] = "http://www.roblox.com/asset/?id=6035047385";
		["report-off"] = "http://www.roblox.com/asset/?id=6035067830";
		["clear"] = "http://www.roblox.com/asset/?id=6035047409";
		["redo"] = "http://www.roblox.com/asset/?id=6035056483";
		["link"] = "http://www.roblox.com/asset/?id=6035056475";
		["drafts"] = "http://www.roblox.com/asset/?id=6035053297";
		["push-pin"] = "http://www.roblox.com/asset/?id=6035056481";
		["reply"] = "http://www.roblox.com/asset/?id=6035067844";
		["undo"] = "http://www.roblox.com/asset/?id=6035078896";
		["archive"] = "http://www.roblox.com/asset/?id=6035047379";
		["add"] = "http://www.roblox.com/asset/?id=6035047377";
		["insights"] = "http://www.roblox.com/asset/?id=6035067839";
		["flag"] = "http://www.roblox.com/asset/?id=6035053279";
		["save"] = "http://www.roblox.com/asset/?id=6035067857";
		["text-format"] = "http://www.roblox.com/asset/?id=6035078890";
		["content-cut"] = "http://www.roblox.com/asset/?id=6035053280";
		["ballot"] = "http://www.roblox.com/asset/?id=6035047386";
		["remove"] = "http://www.roblox.com/asset/?id=6035067836";
		["calculate"] = "http://www.roblox.com/asset/?id=6035047384";
		["report"] = "http://www.roblox.com/asset/?id=6035067826";
		["markunread"] = "http://www.roblox.com/asset/?id=6035056476";
		["delete-sweep"] = "http://www.roblox.com/asset/?id=6035053301";
		["gesture"] = "http://www.roblox.com/asset/?id=6035053287";
		["link-off"] = "http://www.roblox.com/asset/?id=6035056484";
		["forward"] = "http://www.roblox.com/asset/?id=6035053298";
		["reply-all"] = "http://www.roblox.com/asset/?id=6035067824";
		["how-to-vote"] = "http://www.roblox.com/asset/?id=6035053295";
		["square-foot"] = "http://www.roblox.com/asset/?id=6035078918";
		["outlined-flag"] = "http://www.roblox.com/asset/?id=6035056486";
		["add-circle"] = "http://www.roblox.com/asset/?id=6035047380";
		["stacked-bar-chart"] = "http://www.roblox.com/asset/?id=6035078892";
		["policy"] = "http://www.roblox.com/asset/?id=6035056512";
		["backspace"] = "http://www.roblox.com/asset/?id=6035047397";
		["sort"] = "http://www.roblox.com/asset/?id=6035078888";
		["content-paste"] = "http://www.roblox.com/asset/?id=6035053285";
		["low-priority"] = "http://www.roblox.com/asset/?id=6035056491";
		["font-download"] = "http://www.roblox.com/asset/?id=6035053275";
		["shield"] = "http://www.roblox.com/asset/?id=6035078889";
		["waves"] = "http://www.roblox.com/asset/?id=6035078898";
		["select-all"] = "http://www.roblox.com/asset/?id=6035067834";
		["dynamic-feed"] = "http://www.roblox.com/asset/?id=6035053289";
		["mail"] = "http://www.roblox.com/asset/?id=6035056477";
		["amp-stories"] = "http://www.roblox.com/asset/?id=6035047382";
		["filter-list"] = "http://www.roblox.com/asset/?id=6035053294";
		["send"] = "http://www.roblox.com/asset/?id=6035067832";
		["create"] = "http://www.roblox.com/asset/?id=6035053304";
		["stream"] = "http://www.roblox.com/asset/?id=6035078897";
		["next-week"] = "http://www.roblox.com/asset/?id=6035067835";
		["inbox"] = "http://www.roblox.com/asset/?id=6035067831";
		["add-link"] = "http://www.roblox.com/asset/?id=6035047374";
		["content-copy"] = "http://www.roblox.com/asset/?id=6035053278";
		["remove-circle"] = "http://www.roblox.com/asset/?id=6035067837";
		["add-circle-outline"] = "http://www.roblox.com/asset/?id=6035047391";
		["block"] = "http://www.roblox.com/asset/?id=6035047387";
		["tag"] = "http://www.roblox.com/asset/?id=6035078895";
		["beach-access"] = "http://www.roblox.com/asset/?id=6035107923";
		["stroller"] = "http://www.roblox.com/asset/?id=6035161535";
		["family-restroom"] = "http://www.roblox.com/asset/?id=6035121916";
		["corporate-fare"] = "http://www.roblox.com/asset/?id=6035121908";
		["no-meeting-room"] = "http://www.roblox.com/asset/?id=6035153649";
		["do-not-touch"] = "http://www.roblox.com/asset/?id=6035121915";
		["ac-unit"] = "http://www.roblox.com/asset/?id=6035107929";
		["business-center"] = "http://www.roblox.com/asset/?id=6035107933";
		["spa"] = "http://www.roblox.com/asset/?id=6035153639";
		["no-flash"] = "http://www.roblox.com/asset/?id=6035145424";
		["no-cell"] = "http://www.roblox.com/asset/?id=6035145376";
		["room-service"] = "http://www.roblox.com/asset/?id=6035153648";
		["tapas"] = "http://www.roblox.com/asset/?id=6035161533";
		["microwave"] = "http://www.roblox.com/asset/?id=6035145367";
		["meeting-room"] = "http://www.roblox.com/asset/?id=6035145361";
		["wash"] = "http://www.roblox.com/asset/?id=6035161540";
		["escalator"] = "http://www.roblox.com/asset/?id=6035121939";
		["house-siding"] = "http://www.roblox.com/asset/?id=6035145393";
		["food-bank"] = "http://www.roblox.com/asset/?id=6035121921";
		["foundation"] = "http://www.roblox.com/asset/?id=6035121918";
		["elevator"] = "http://www.roblox.com/asset/?id=6035121912";
		["room-preferences"] = "http://www.roblox.com/asset/?id=6035153642";
		["do-not-step"] = "http://www.roblox.com/asset/?id=6035121910";
		["free-breakfast"] = "http://www.roblox.com/asset/?id=6035145363";
		["house"] = "http://www.roblox.com/asset/?id=6035145364";
		["child-care"] = "http://www.roblox.com/asset/?id=6035107927";
		["night-shelter"] = "http://www.roblox.com/asset/?id=6035145378";
		["child-friendly"] = "http://www.roblox.com/asset/?id=6035121942";
		["checkroom"] = "http://www.roblox.com/asset/?id=6035107931";
		["hot-tub"] = "http://www.roblox.com/asset/?id=6035145382";
		["dry"] = "http://www.roblox.com/asset/?id=6035121909";
		["charging-station"] = "http://www.roblox.com/asset/?id=6035107925";
		["all-inclusive"] = "http://www.roblox.com/asset/?id=6035107920";
		["bento"] = "http://www.roblox.com/asset/?id=6035107924";
		["no-backpack"] = "http://www.roblox.com/asset/?id=6035145368";
		["storefront"] = "http://www.roblox.com/asset/?id=6035161534";
		["no-food"] = "http://www.roblox.com/asset/?id=6035145372";
		["backpack"] = "http://www.roblox.com/asset/?id=6035107928";
		["stairs"] = "http://www.roblox.com/asset/?id=6035153637";
		["carpenter"] = "http://www.roblox.com/asset/?id=6035107955";
		["no-stroller"] = "http://www.roblox.com/asset/?id=6035153661";
		["roofing"] = "http://www.roblox.com/asset/?id=6035153656";
		["umbrella"] = "http://www.roblox.com/asset/?id=6035161550";
		["sports-bar"] = "http://www.roblox.com/asset/?id=6035153638";
		["apartment"] = "http://www.roblox.com/asset/?id=6035107922";
		["smoke-free"] = "http://www.roblox.com/asset/?id=6035153647";
		["pool"] = "http://www.roblox.com/asset/?id=6035153655";
		["bathtub"] = "http://www.roblox.com/asset/?id=6035107939";
		["no-drinks"] = "http://www.roblox.com/asset/?id=6035145390";
		["escalator-warning"] = "http://www.roblox.com/asset/?id=6035121930";
		["wheelchair-pickup"] = "http://www.roblox.com/asset/?id=6035161536";
		["smoking-rooms"] = "http://www.roblox.com/asset/?id=6035153636";
		["rice-bowl"] = "http://www.roblox.com/asset/?id=6035153662";
		["tty"] = "http://www.roblox.com/asset/?id=6035161541";
		["no-photography"] = "http://www.roblox.com/asset/?id=6035153664";
		["casino"] = "http://www.roblox.com/asset/?id=6035107936";
		["fence"] = "http://www.roblox.com/asset/?id=6035121923";
		["grass"] = "http://www.roblox.com/asset/?id=6035145359";
		["countertops"] = "http://www.roblox.com/asset/?id=6035121914";
		["kitchen"] = "http://www.roblox.com/asset/?id=6035145362";
		["golf-course"] = "http://www.roblox.com/asset/?id=6035145423";
		["soap"] = "http://www.roblox.com/asset/?id=6035153645";
		["water-damage"] = "http://www.roblox.com/asset/?id=6035161563";
		["airport-shuttle"] = "http://www.roblox.com/asset/?id=6035107921";
		["fitness-center"] = "http://www.roblox.com/asset/?id=6035121907";
		["baby-changing-station"] = "http://www.roblox.com/asset/?id=6035107930";
		["fire-extinguisher"] = "http://www.roblox.com/asset/?id=6035121913";
		["sparkle"] = "http://www.roblox.com/asset/?id=4483362748"
	}
}

local request = (syn and syn.request) or (http and http.request) or http-request or nil
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

local function BlurModule(Frame)
	local RunService = game:GetService('RunService')
	local camera = workspace.CurrentCamera
	local MTREL = "Glass"
	local binds = {}
	local root = Instance.new('Folder', camera)
	root.Name = 'NutriexBlur'

	local gTokenMH = 99999999
	local gToken = math.random(1, gTokenMH)

	local DepthOfField = Instance.new('DepthOfFieldEffect', game:GetService('Lighting'))
	DepthOfField.FarIntensity = 0
	DepthOfField.FocusDistance = 51.6
	DepthOfField.InFocusRadius = 50
	DepthOfField.NearIntensity = 6
	DepthOfField.Name = "DPT-"..gToken

	local frame = Instance.new('Frame')
	frame.Parent = Frame
	frame.Size = UDim2.new(0.95, 0, 0.95, 0)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundTransparency = 1

	local GenUid; do -- Generate unique names for RenderStepped bindings
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		while not continue do
			RunService.RenderStepped:wait()
			continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		end
	end

	local DrawQuad; do

		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.22
		local function DrawTriangle(v1, v2, v3, p0, p1) -- I think Stravant wrote this function

			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif-para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top-Look = (cf0 * za).lookVector
			local Mid-Point = A + CFrame.new(A, B).lookVector * para
			local Needed-Look = CFrame.new(Mid-Point, C).lookVector
			local dot = Top-Look.x*Needed-Look.x + Top-Look.y*Needed-Look.y + Top-Look.z*Needed-Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed-Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif-para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed-Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif-para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.CastShadow = false
				p0.Material = MTREL
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif-para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	if binds[frame] then
		return binds[frame].parts
	end

	local uid = GenUid()
	local parts = {}
	local f = Instance.new('Folder', root)
	f.Name = frame.Name

	local parents = {}
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(frame)
	end

	local function UpdateOrientation(fetchProps)
		local properties = {
			Transparency = 0.98;
			BrickColor = BrickColor.new('Institutional white');
		}
		local zIndex = 1 - 0.05*frame.ZIndex

		local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
		local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
		do
			local rot = 0;
			for -, v in ipairs(parents) do
				rot = rot + v.Rotation
			end
			if rot ~= 0 and rot%180 ~= 0 then
				local mid = tl:lerp(br, 0.5)
				local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
				local vec = tl
				tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
				tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
				bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
				br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
			end
		end
		DrawQuad(
			camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
			camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
			camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
			camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
			parts
		)
		if fetchProps then
			for -, pt in pairs(parts) do
				pt.Parent = f
			end
			for propName, propValue in pairs(properties) do
				for -, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end

	end

	UpdateOrientation(true)
	RunService:BindToRenderStep(uid, 2000, UpdateOrientation)
end

local function unpackt(array : table)

	local val = ""
	local i = 0
	for -,v in pairs(array) do
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
local NutriexUI = isStudio and script.Parent:WaitForChild("Nutriex UI") or game:GetObjects("rbxassetid://86467455075715")[1]

local SizeBleh = nil

local function Hide(Window, bind, notif)
	SizeBleh = Window.Size
	bind = string.split(tostring(bind), "Enum.KeyCode.")
	bind = bind[2]
	if notif then
		Nutriex:Notification({Title = "Interface Hidden", Content = "The interface has been hidden, you may reopen the interface by Pressing the UI Bind In Settings ("..tostring(bind)..")", Icon = "visibility-off"})
	end
	tween(Window, {BackgroundTransparency = 1})
	tween(Window.Elements, {BackgroundTransparency = 1})
	tween(Window.Line, {BackgroundTransparency = 1})
	tween(Window.Title.Title, {TextTransparency = 1})
	tween(Window.Title.subtitle, {TextTransparency = 1})
	tween(Window.Logo, {ImageTransparency = 1})
	tween(Window.Navigation.Line, {BackgroundTransparency = 1})

	for -, TopbarButton in ipairs(Window.Controls:GetChildren()) do
		if TopbarButton.ClassName == "Frame" then
			tween(TopbarButton, {BackgroundTransparency = 1})
			tween(TopbarButton.UIStroke, {Transparency = 1})
			tween(TopbarButton.ImageLabel, {ImageTransparency = 1})
			TopbarButton.Visible = false
		end
	end
	for -, tabbtn in ipairs(Window.Navigation.Tabs:GetChildren()) do
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
	NutriexUI.Parent = gethui()
elseif syn and syn.protect-gui then 
	syn.protect-gui(NutriexUI)
	NutriexUI.Parent = CoreGui
elseif not isStudio and CoreGui:FindFirstChild("RobloxGui") then
	NutriexUI.Parent = CoreGui:FindFirstChild("RobloxGui")
elseif not isStudio then
	NutriexUI.Parent = CoreGui
end

if gethui then
	for -, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == NutriexUI.Name and Interface ~= NutriexUI then
			Hide(Interface.SmartWindow)
			Interface.Enabled = false
			Interface.Name = "Nutriex-Old"
		end
	end
elseif not isStudio then
	for -, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == NutriexUI.Name and Interface ~= NutriexUI then
			Hide(Interface.SmartWindow)
			Interface.Enabled = false
			Interface.Name = "Nutriex-Old"
		end
	end
end

NutriexUI.Enabled = false
NutriexUI.SmartWindow.Visible = false
NutriexUI.Notifications.Template.Visible = false
NutriexUI.DisplayOrder = 1000000000

local Main : Frame = NutriexUI.SmartWindow
local Dragger = Main.Drag
local dragBar = NutriexUI.Drag
local dragInteract = dragBar and dragBar.Interact or nil
local dragBarCosmetic = dragBar and dragBar.Drag or nil
local Elements = Main.Elements.Interactions
local LoadingFrame = Main.LoadingFrame
local Navigation = Main.Navigation
local Tabs = Navigation.Tabs
local Notifications = NutriexUI.Notifications
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
-- 			Content = "The Configuration Has Been Automatically Loaded. Thank You For Using Nutriex Library",
-- 			Icon = "file-code-2",
-- 			ImageSource = "Lucide"
-- 		})
-- 	elseif notified == false then
-- 		Nutriex:Notification({
-- 			Title = "Config Loaded",
-- 			Content = "The Configuration Has Been Loaded. Thank You For Using Nutriex Library",
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

local function Draggable(Bar, Window, enableTaptic, tapticOffset)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos

		local function connectFunctions()
			if dragBar and enableTaptic then
				dragBar.MouseEnter:Connect(function()
					if not Dragging then
						TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5, Size = UDim2.new(0, 120, 0, 4)}):Play()
					end
				end)

				dragBar.MouseLeave:Connect(function()
					if not Dragging then
						TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7, Size = UDim2.new(0, 100, 0, 4)}):Play()
					end
				end)
			end
		end

		connectFunctions()

		Bar.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				MousePos = Input.Position
				FramePos = Window.Position

				if enableTaptic then
					TweenService:Create(dragBarCosmetic, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 110, 0, 4), BackgroundTransparency = 0}):Play()
				end

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
						connectFunctions()

						if enableTaptic then
							TweenService:Create(dragBarCosmetic, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 100, 0, 4), BackgroundTransparency = 0.7}):Play()
						end
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

				local newMainPosition = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
				TweenService:Create(Window, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = newMainPosition}):Play()

				if dragBar then
					local newDragBarPosition = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y + 240)
					dragBar.Position = newDragBarPosition
				end
			end
		end)

	end)
end

function Nutriex:Notification(data) -- action e.g open messages
	task.spawn(function()
		data = Kwargify({
			Title = "Missing Title",
			Content = "Missing or Unknown Content",
			Icon = "view-in-ar",
			ImageSource = "Material"
		}, data or {})

		-- Notification Object Creation
		local newNotification = Notifications.Template:Clone()
		newNotification.Name = data.Title
		newNotification.Parent = Notifications
		newNotification.LayoutOrder = #Notifications:GetChildren()
		newNotification.Visible = false
		BlurModule(newNotification)

		-- Set Data
		newNotification.Title.Text = data.Title
		newNotification.Description.Text = data.Content 
		newNotification.Icon.Image = GetIcon(data.Icon, data.ImageSource)

		-- Set initial transparency values
		newNotification.BackgroundTransparency = 1
		newNotification.Title.TextTransparency = 1
		newNotification.Description.TextTransparency = 1
		newNotification.UIStroke.Transparency = 1
		newNotification.Shadow.ImageTransparency = 1
		newNotification.Icon.ImageTransparency = 1
		newNotification.Icon.BackgroundTransparency = 1

		task.wait()

		-- Calculate textbounds and set initial values
		newNotification.Size = UDim2.new(1, 0, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)

		newNotification.Icon.Size = UDim2.new(0, 28, 0, 28)
		newNotification.Icon.Position = UDim2.new(0, 16, 0.5, -1)

		newNotification.Visible = true

		newNotification.Description.Size = UDim2.new(1, -65, 0, math.huge)
		local bounds = newNotification.Description.TextBounds.Y + 55
		newNotification.Description.Size = UDim2.new(1,-65,0, bounds - 35)
		newNotification.Size = UDim2.new(1, 0, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)
		TweenService:Create(newNotification, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, bounds)}):Play()

		task.wait(0.15)
		TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.45}):Play()
		TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()

		task.wait(0.05)

		TweenService:Create(newNotification.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()

		task.wait(0.05)
		TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.35}):Play()
		TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 0.95}):Play()
		TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.82}):Play()

		local waitDuration = math.min(math.max((#newNotification.Description.Text * 0.1) + 2.5, 3), 10)
		task.wait(data.Duration or waitDuration)

		newNotification.Icon.Visible = false
		TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
		TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
		TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
		TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
		TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()

		TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, 0)}):Play()

		task.wait(1)

		TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)}):Play()

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

	for -, TopbarButton in ipairs(Window.Controls:GetChildren()) do
		if TopbarButton.ClassName == "Frame" and TopbarButton.Name ~= "Theme" then
			TopbarButton.Visible = true
			tween(TopbarButton, {BackgroundTransparency = 0.25})
			tween(TopbarButton.UIStroke, {Transparency = 0.5})
			tween(TopbarButton.ImageLabel, {ImageTransparency = 0.25})
		end
	end
	for -, tabbtn in ipairs(Window.Navigation.Tabs:GetChildren()) do
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
		LoadingSubtitle = "by CyberX",

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
	LoadingFrame.Version.Text = LoadingFrame.Frame.Frame.Title.Text == "Nutriex Interface Suite" and Release or "Nutriex UI"

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

	NutriexUI.Enabled = true

	BlurModule(Main)

	if WindowSettings.KeySystem then
		local KeySettings = WindowSettings.KeySettings
		
		Draggable(Dragger, Main)
		Draggable(NutriexUI.MobileSupport, NutriexUI.MobileSupport)
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
								cmd = 'INVITE-BROWSER',
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
				for -, Key in ipairs(WindowSettings.KeySettings.Key) do
					if KeySystem.Input.InputBox.Text == Key then
						KeyFound = true
						FoundKey = Key
						break
					end
				end
				if KeyFound then 
					for -, instance in pairs(KeySystem:GetDescendants()) do
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
						Nutriex:Notification({Title = "Key System", Content = "The key for this script has been saved successfully.", Icon = "lock-open"})
					end
				else
					if AttemptsRemaining == 0 then					
						Nutriex:Notification({Title = "Key System", Content = "This key is incorrect! Closeing", Icon = "lock"})
				       task.wait(2)
						Nutriex:Destroy()
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
	Draggable(NutriexUI.MobileSupport, NutriexUI.MobileSupport)
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

			for -, OtherTabButton in ipairs(Navigation.Tabs:GetChildren()) do
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
						cmd = 'INVITE-BROWSER',
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
					for -, data in list:GetCurrentPage() do
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
			Icon = "view-in-ar",
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

		for -, TemplateElement in ipairs(TabPage:GetChildren()) do
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

			for -, OtherTabButton in ipairs(Navigation.Tabs:GetChildren()) do
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
						Button.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..ButtonSettings.Name.." Error Results: " ..tostring(Response))
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
									Slider.Title.Text = "Error in execution!"
									warn("Nutriex UI Library | "..SliderSettings.Name.." Error Results: " ..tostring(Response))
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
						Slider.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..SliderSettings.Name.." Error Results: " ..tostring(Response))
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

				NutriexUI.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
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
						Toggle.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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
						Toggle.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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
						Toggle.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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

				NutriexUI.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
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
								Bind.Title.Text = "Error in execution!"
								warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
								Bind.Title.Text = "Error in execution!"
								warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
											Bind.Title.Text = "Error in execution!"
											warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
											Bind.Title.Text = "Error in execution!"
											warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
								Input.Title.Text = "Error in execution!"
								warn("Nutriex UI Library | "..InputSettings.Name.." Error Results: " ..tostring(Response))
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
							Input.Title.Text = "Error in execution!"
							warn("Nutriex UI Library | "..InputSettings.Name.." Error Results: " ..tostring(Response))
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
						Dropdown.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..DropdownSettings.Name.." Error Results: " ..tostring(Response))
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
					for -, Item in ipairs(Dropdown.List:GetChildren()) do
						if Item:IsA("TextLabel") and Item.Name ~= "Template" then
							Item.Visible = text == "" or string.find(Item.Name:lower(), text, 1, true) ~= nil
						end
					end
				end)


				local function Clear()
					for -, option in ipairs(Dropdown.List:GetChildren()) do
						if option.ClassName == "TextLabel" and option.Name ~= "Template" then
							option:Destroy()
						end
					end
				end

				local function ActivateColorSingle(name)
					for -, Option in pairs(Dropdown.List:GetChildren()) do
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
					for -, name in pairs(DropdownSettings.CurrentOption) do
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
					for -, Option in pairs(Dropdown.List:GetChildren()) do
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
						for -, name in pairs(DropdownSettings.CurrentOption) do
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
						ColorPicker.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..ColorPickerSettings.Name.." Error Results: " ..tostring(Response))
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
				Main.Image = "http://www.roblox.com/asset/?id=11415645739"
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
					Button.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..ButtonSettings.Name.." Error Results: " ..tostring(Response))
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
								Slider.Title.Text = "Error in execution!"
								warn("Nutriex UI Library | "..SliderSettings.Name.." Error Results: " ..tostring(Response))
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
					Slider.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..SliderSettings.Name.." Error Results: " ..tostring(Response))
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

			NutriexUI.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
				Slider.Main.color.Color = Nutriex.ThemeGradient
				Slider.Main.UIStroke.color.Color = Nutriex.ThemeGradient
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
					Toggle.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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
					Toggle.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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
					Toggle.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..ToggleSettings.Name.." Error Results: " ..tostring(Response))
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

			NutriexUI.ThemeRemote:GetPropertyChangedSignal("Value"):Connect(function()
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
							Bind.Title.Text = "Error in execution!"
							warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
							Bind.Title.Text = "Error in execution!"
							warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
										Bind.Title.Text = "Error in execution!"
										warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
										Bind.Title.Text = "Error in execution!"
										warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
							Bind.Title.Text = "Error in execution!"
							warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
										Bind.Title.Text = "Error in execution!"
										warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
										Bind.Title.Text = "Error in execution!"
										warn("Nutriex UI Library | "..BindSettings.Name.." Error Results: " ..tostring(Response))
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
							Input.Title.Text = "Error in execution!"
							warn("Nutriex UI Library | "..InputSettings.Name.." Error Results: " ..tostring(Response))
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
						Input.Title.Text = "Error in execution!"
						warn("Nutriex UI Library | "..InputSettings.Name.." Error Results: " ..tostring(Response))
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
					Dropdown.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..DropdownSettings.Name.." Error Results: " ..tostring(Response))
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
				for -, Item in ipairs(Dropdown.List:GetChildren()) do
					if Item:IsA("TextLabel") and Item.Name ~= "Template" then
						Item.Visible = text == "" or string.find(Item.Name:lower(), text, 1, true) ~= nil
					end
				end
			end)


			local function Clear()
				for -, option in ipairs(Dropdown.List:GetChildren()) do
					if option.ClassName == "TextLabel" and option.Name ~= "Template" then
						option:Destroy()
					end
				end
			end

			local function ActivateColorSingle(name)
				for -, Option in pairs(Dropdown.List:GetChildren()) do
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
				for -, name in pairs(DropdownSettings.CurrentOption) do
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
				for -, Option in pairs(Dropdown.List:GetChildren()) do
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
					for -, name in pairs(DropdownSettings.CurrentOption) do
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
					ColorPicker.Title.Text = "Error in execution!"
					warn("Nutriex UI Library | "..ColorPickerSettings.Name.." Error Results: " ..tostring(Response))
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
			Main.Image = "http://www.roblox.com/asset/?id=11415645739"
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
						NutriexUI.ThemeRemote.Value = not NutriexUI.ThemeRemote.Value
					end
				end
			})

			c2cp:Set({
				Callback = function(Value)
					if c1cp and c3cp then
						Nutriex.ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, c1cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, Value or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, c3cp.Color or Color3.fromRGB(255,255,255))}
						NutriexUI.ThemeRemote.Value = not NutriexUI.ThemeRemote.Value
					end
				end
			})

			c3cp:Set({
				Callback = function(Valuex)
					if c2cp and c1cp then
						Nutriex.ThemeGradient = ColorSequence.new{ColorSequenceKeypoint.new(0.00, c1cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.50, c2cp.Color or Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1.00, Valuex or Color3.fromRGB(255,255,255))}
						NutriexUI.ThemeRemote.Value = not NutriexUI.ThemeRemote.Value
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

			for -, option in next, decoded.objects do
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

	for -, TopbarButton in ipairs(Main.Controls:GetChildren()) do
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
			NutriexUI.MobileSupport.Visible = true
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
			NutriexUI.MobileSupport.Visible = false
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


	NutriexUI.MobileSupport.Interact.MouseButton1Click:Connect(function()
		Unhide(Main, Window.CurrentTab)
		dragBar.Visible = true
		Window.State = true
		NutriexUI.MobileSupport.Visible = false
	end)

	return Window
end

function Nutriex:Destroy()
	Main.Visible = false
	for -, Notification in ipairs(Notifications:GetChildren()) do
		if Notification.ClassName == "Frame" then
			Notification.Visible = false
			Notification:Destroy()
		end
	end
	NutriexUI:Destroy()
end

if (getgenv and not getgenv().ConfirmNutriex) or (not getgenv) then
	Nutriex:Notification({ 
    	Title = "Nutriex Is Deprecated",
    	Icon = "warning",
    	ImageSource = "Material",
    	Content = "If you are not the script developer, ignore this message. \n\n The Nutriex Interface Library Is Deprecated And Not Recommended to Use. A New Library Is Available at nebulasoftworks.xyz/starlight. If you insist on using Nutriex, set the getgenv().ConfirmNutriex variable to true. "
	})
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
			Icon = "view-in-ar",
			ImageSource = "Material",
			ShowTitle = true
		}),
		Main2 = Window:CreateTab({
			Name = "Tab Example 2",
			Icon = "location-searching",
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
    t2 = window:CreateTab({ Name = "Tab 2", Icon = "location-searching"})
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
    s = t2:CreateSlider({ Callback = function(v) warn(v) end })	
    t1:CreateButton({ Callback = function()
        s:Set({Name = "new name", Callback = ""})
        wait(5)
        s:Destroy()
    end})
    t1:CreateColorPicker()
    local toggle = t1:CreateToggle({Name = "test", Description = "test", CurrentValue = true, Callback = ""}, "toggle2")
    t1:CreateToggle({Callback = function(Value) toggle:Destroy() warn(Value) end})
    local bind = t2:CreateBind({Name = "test", Description = "test", CurrentBind = "E", HoldToInteract = false, Callback = ""})
    t2:CreateKeybind({HoldToInteract = true, Callback = function(v)
        if v then
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end,})
    local input = t2:CreateInput({Name = "test",ClearTextAfterFocusLost = false, Description = "Numbers only, 8 max characters and enter required.",MaxCharacters = 8 ,Numeric = true, Enter = true, Callback = ""})
    t2:CreateInput({Callback = function(text) warn(text) end})
    local d = t1:CreateDropdown({Name = "test", Options = {"Apples", "Bananas", "Strawberries", "Elixir"}, Description = "MultiOptions", MultipleOptions = true, Callback = function(t) warn(t) end, CurrentOption = {"Apples", "Elixir"}})
    t1:CreateDropdown({Callback = function(t) warn(unpack(t)) end})
    t1:CreateDropdown({Description = "Special Type - Player", Callback = "", SpecialType = "Player"})
end]]--
return Nutriex
