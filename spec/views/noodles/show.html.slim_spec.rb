require 'rails_helper'

RSpec.describe 'noodles/show', type: :view do
  before(:each) do
    @noodle = assign(:noodle, Noodle.create!(
      name: 'Name',
      email: 'Email',
      description: 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
