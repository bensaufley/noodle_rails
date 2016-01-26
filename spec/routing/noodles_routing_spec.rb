require 'rails_helper'

RSpec.describe NoodlesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/noodles').to route_to('noodles#index')
    end

    it 'routes to #new' do
      expect(get: '/noodles/new').to route_to('noodles#new')
    end

    it 'routes to #show' do
      expect(get: '/noodles/1').to route_to('noodles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/noodles/1/edit').to route_to('noodles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/noodles').to route_to('noodles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/noodles/1').to route_to('noodles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/noodles/1').to route_to('noodles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/noodles/1').to route_to('noodles#destroy', id: '1')
    end

  end
end
