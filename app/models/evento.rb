class Evento < ActiveRecord::Base
  validates :nome, presence: true
  before_save :validar


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
