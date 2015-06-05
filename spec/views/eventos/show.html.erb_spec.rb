require 'rails_helper'

RSpec.describe "eventos/show", type: :view do
  before(:each) do
    @evento = assign(:evento, Evento.create!(
      :nome => "Nome",
      :twitter => "Twitter"
    ))
  end

end
