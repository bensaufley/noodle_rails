require 'rails_helper'

RSpec.describe 'noodles/edit', type: :view do
  before(:each) do
    @noodle = assign(:noodle, Noodle.create!(
      name: 'MyString',
      email: 'MyString',
      description: 'MyText'
    ))
  end

  it 'renders the edit noodle form' do
    render

    assert_select 'form[action=?][method=?]', noodle_path(@noodle), 'post' do

      assert_select 'input#noodle_name[name=?]', 'noodle[name]'

      assert_select 'input#noodle_email[name=?]', 'noodle[email]'

      assert_select 'textarea#noodle_description[name=?]', 'noodle[description]'
    end
  end
end
