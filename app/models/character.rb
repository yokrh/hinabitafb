class Character
  @@unknown = "???"
  @@characters = {
    marika: {name: "まり花", comment_name: "まりか", face: "(*´▽｀)"},
    ibuki: {name: "一舞", comment_name: "イブ", face: "( *｀ω´)"},
    sakiko: {name: "咲子", comment_name: "咲子", face: "(*^-^*)"},
    meu: {name: "めう", comment_name: "めう", face: "♪(°▽^ *)ノ"},
    rin: {name: "凛", comment_name: "凛", face: "(ー_ー*川"},
    kokona: {name: "心菜", comment_name: "ここな", face: "(。・ω・。）"},
    natsuhi: {name: "夏陽", comment_name: "夏陽", face: "(。･｀ω･ )"},
    hinata: {name: "日向", comment_name: "日向", face: "(日向)"}
    }.with_indifferent_access

  def self.name_from_comment(comment)
    find :name, comment
  end

  def self.comment_name_from_comment(comment)
    find :comment_name, comment
  end

  def self.face_from_comment(comment)
    find :face, comment
  end

  def self.key_from_name(name)
    @@characters.each do |k, character|
      return k if character[:name] == name
    end
  end

  def self.know(post)
    return false unless post
    post.name != @@unknown
  end

  private

  def self.find(key, comment)
    return @@unknown if comment.blank?

    @@characters.each do |k, character|
      str = comment[-5..-1]
      next unless str.include? character[:comment_name]
      return character[key]
    end
    @@unknown
  end
end
