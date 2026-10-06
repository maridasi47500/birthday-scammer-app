class User < ApplicationRecord
  has_secure_password
  attr_accessor :agecelebrated
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  before_validation :hey
  validates :firstname, :lastname, presence: true

  def full_name
    "#{firstname} #{lastname}"
  end
  
  def hey
    if !agecelebrated.nil? and agecelebrated.length > 0
      self.dateofbirth=(Date.today - agecelebrated.to_i.years).to_s
    end
  end
  def pic=(uploaded_io)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    write_attribute(:pic, uploaded_io.original_filename)
  rescue => e
    write_attribute(:pic, "birthdaycake.png")
  end
  def pic
    read_attribute(:pic)

  end
  after_create do
    sm=Socialmedia.find_or_create_by(name: "facebook")
    Post.create(socialmedia: sm, user: self, title: "Happy bithday, "+self.firstname+" !", content:(Date.today.year - self.dateofbirth.to_date.year).to_s+ " years old  today!", pic: self.pic)
  end
end
