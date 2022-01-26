# Ruby -3.0.0

# gem install chatwork
require 'chatwork'

require_relative 'lib/hellocheck'
require_relative 'lib/module/roomcheck'
require_relative 'lib/module/comparing'
require_relative 'lib/module/message'


# 自分のChatWork環境を設定
# TOKENは自分のChatWorkのTokenに書き換え
# TG_ROOMはTargetRoomで、挨拶を集計したいルームのIDを設定
# TOKEN = String     //TOKEN = 'da35235fas'
# TG_ROOM = Integer  //TG_ROOM = 1234567890
# ------------------------------------------
TOKEN = 'Your Token'
TG_ROOM = group room id
# ------------------------------------------

hc = HelloCheck.new(TOKEN, MY_ROOM, TG_ROOM)
hc.run