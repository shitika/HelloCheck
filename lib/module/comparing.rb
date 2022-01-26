module Comparing

    # ルームのリストと発言者のリストの差分を返す
    module Id
        def self.do(r_m_id:, s_m_id:)
            r_m_id - s_m_id
        end
    end

    # リストデータから名前のみを抜き出しリスト
    # よくわからん先生のアカウントは弾く
    module Name
        def self.do(cmp_id:)
            cmp_id.each_with_object([]) do |id, m_name|
                m_name << id[1] if id[1] != "Yosimoto Tsune"
            end
        end
    end
end