class Evento < ActiveRecord::Base
  validates :nome, presence: true
end
