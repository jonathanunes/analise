require 'rails_helper'

RSpec.describe "eventos/new", type: :view do
  before(:each) do
    assign(:evento, Evento.new(
      :nome => "MyString",
      :twitter => "MyString"
    ))
  end

  it "renders new evento form" do
    render

    assert_select "form[action=?][method=?]", eventos_path, "post" do

      assert_select "input#evento_nome[name=?]", "evento[nome]"

      assert_select "input#evento_twitter[name=?]", "evento[twitter]"
    end
  end
end
