class Evento < ActiveRecord::Base
  validates :nome, presence: true
  before_save :validar


  def validar
  	self.validarFacebook
    self.validarTwitter
  end

  def validarFacebook
  	if self.facebook.include?(".com/")
  		self.facebook = self.facebook.split(".com/")[1]
  	end
  end

  def validarTwitter
    if (self.twitter.include?("http") || self.twitter.include?(".com/"))
      self.twitter = self.twitter.split(".com/")[1]
    end
  end
end
