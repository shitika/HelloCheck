class HelloCheck
    attr_reader :MY_ROOM, :TG_ROOM, :members, :messages


    # イニシャライズ
    # Tokenをライブラリに読み込ませる
    def initialize(token, tg_room)
        ChatWork.api_key = token
        @TG_ROOM = tg_room
    end


    # 実際に未送信者をリスト関数
    def run
        Message.put("sender_info")
        members = ChatWork::Member.get(room_id: @TG_ROOM) #ルームの全メンバーをリスト
        messages = ChatWork::Message.get(room_id: @TG_ROOM, force: true) #最新の発言者をリスト
        room_members_id = RoomCheck::Member.get_id(members: members) #メンバーのIDをリスト
        send_members_id = RoomCheck::Sender.get_id(messages: messages) #実行日に発言されたメッセージの発信者のメンバーIDをリスト
        Message.put("nosender", s_m_id: send_members_id) #発言者がいなければメッセージを送信して終了
        Message.put("unsender_info")
        comparing_id = Comparing::Id.do(r_m_id: room_members_id, s_m_id: send_members_id) #メンバーリストから発言した人を削除
        nosender_name = Comparing::Name.do(cmp_id: comparing_id) #未発言のメンバーをリスト
        Message.put("nounsender", ns_name: nosender_name) #未発言のメンバーがいなければメッセージを送信して終了
        Message.put("complete", ns_name: nosender_name) #未発言のメンバーの名前を表示
    end
end