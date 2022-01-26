module RoomCheck

    # ルームの参加を集計する
    module Member
        # ルーム参加者のidと名前をリスト
        def self.get_id(members:)
            members.each_with_object([]) do |member, room_members_id|
                room_members_id << [member.account_id, member.name]
            end
        end
    end


    # 実行日当日の発言者を集計する
    # Time関数を使い、エポック秒で月日を判定（ChatWorkAPIのsender_timeがエポック秒の為）
    # 詳細はChatWorkの公式APIサイトを参照
    module Sender
        # 実行日発言者のidと名前をリスト
        def self.get_id(messages:)
            nowday = [Time.now.month, Time.now.day]
            messages.each_with_object([]).with_index(69) do |(message, send_members_id), i|
                if is_nil?(messages[i]); return send_members_id; break; end
                sendday = [Time.at(messages[i].send_time).month,Time.at(messages[i].send_time).day]
                if nowday == sendday and messages[i].body != "[deleted]"
                    send_members_id << [messages[i].account.account_id, messages[i].account.name]
                end
            end
        end

        # nil判定のlambdaっぽいもの
        def self.is_nil?(m); m == nil; end

    end
end