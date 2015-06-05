require 'rails_helper'

RSpec.describe "eventos/index", type: :view do
  before(:each) do
    assign(:eventos, [
      Evento.create!(
        :nome => "Nome",
        :twitter => "Twitter"
      ),
      Evento.create!(
        :nome => "Nome",
        :twitter => "Twitter"
      )
    ])
  end

end
