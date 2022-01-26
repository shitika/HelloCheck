module Message
    attr_reader :messages
    @messages = {
        "sender_info" => "送信者の情報収集中",
        "unsender_info" => "未送信者の情報収集中",
        "nosender" => "送信者はいません",
        "nounsender" => "未送信者はいません",
        "complete" => "----未送信者----"
    }
    # 引数に渡されたキーを@messagesから検索してコンソールにプリントする
    # パラメータがない場合はキーのメッセージを表示するだけ
    def self.put(message_key, ns_name: nil, s_m_id: nil)
        # No param
        if s_m_id == nil && ns_name == nil; no_param(message_key); return; end

        # @param ns_name
        # if ns_name.size isn't zero then complete!
        # if ns_name.size is zero then nounsender!
        if ns_name != nil
            if ns_name.size == 0
                puts @messages[message_key]; exit
            elsif message_key == "complete"
                puts @messages[message_key]; puts ns_name
            end
        else
            return
        end

        # @param s_m_id
        # if s_m_id.size is zero then no sender.
        # exit program.
        if s_m_id != nil && s_m_id.size == 0
            puts @messages[message_key]; exit
        else
            return
        end
    end

    # No param
    def self.no_param(message_key); puts @messages[message_key]; end
end