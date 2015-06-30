class Evento < ActiveRecord::Base
  validates :nome, presence: true
  before_save :validar
  before_save :getYoutubeChannel
  before_update :getYoutubeChannel

  def getYoutubeChannel
    http = Curl.get("https://www.youtube.com/user/#{self.youtubeId}")
    self.youtubeId = http.body.split("channel_id=")[1].split('">')[0]
  end

  def validar
  	self.validarFacebook
    self.validarTwitter
    self.validarInstagram
  end

  def validarFacebook
  	if (self.facebook && self.facebook.include?(".com/"))
  		self.facebook = self.facebook.split(".com/")[1]
  	end
  end

  def validarTwitter
    if (self.twitter && self.twitter.include?(".com/"))
      self.twitter = self.twitter.split(".com/")[1]
    end
  end

  def validarInstagram
    if self.instagram && self.instagram.include?(".com/")
      self.instagram = self.instagram.split(".com/")[1]
    end
  end

end
