class Post < Wrapper::Base

  attr_accessor :id, :text, :user_id, :url, :created_at, :updated_at

  def to_json
    {post: {
        id: self.id,
        text: self.text,
        user_id: self.user_id,
    }}.to_json
  end

end