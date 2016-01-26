require 'rails_helper'

RSpec.describe 'noodles/index', type: :view do
  before(:each) do
    assign(:noodles, [
      Noodle.create!(
        name: 'Name',
        email: 'Email',
        description: 'MyText'
      ),
      Noodle.create!(
        name: 'Name',
        email: 'Email',
        description: 'MyText'
      )
    ])
  end

  it 'renders a list of noodles' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
