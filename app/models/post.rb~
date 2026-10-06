class Post < ApplicationRecord
  belongs_to :user
  belongs_to :socialmedia
  after_create :scam
  def scam
    if content.lowercase.include?("happy birthday")
      Scam.create(post: self, person_name: post.user.full_name, dateofbirth: post.user.dateofbirth, scammerdescription: "c'est un scam de la date de naissance")
    end
  end
end
