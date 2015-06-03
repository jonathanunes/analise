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

  it "renders a list of eventos" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
  end
end
