class HomeController < ApplicationController
  def index
    @eventos = Evento.all
    @medidas = []
    @eventos.each do |evento|
      @medidas << Medida.where(evento_id: evento.id).last
    end
  end
end
