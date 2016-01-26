require 'rails_helper'

RSpec.describe 'noodles/new', type: :view do
  before(:each) do
    assign(:noodle, Noodle.new(
      name: 'MyString',
      email: 'MyString',
      description: 'MyText'
    ))
  end

  it 'renders new noodle form' do
    render

    assert_select 'form[action=?][method=?]', noodles_path, 'post' do

      assert_select 'input#noodle_name[name=?]', 'noodle[name]'

      assert_select 'input#noodle_email[name=?]', 'noodle[email]'

      assert_select 'textarea#noodle_description[name=?]', 'noodle[description]'
    end
  end
end
