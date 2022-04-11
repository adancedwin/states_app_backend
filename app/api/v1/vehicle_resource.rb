# frozen_string_literal: true

class API::V1::VehicleResource < API::V1::Base
  helpers AuthenticationHelper
  before { authenticate! }

  resource :vehicles do
    desc 'GET api/v1/vehicles/:id' do
      summary 'Listing a Vehicle'
    end
    get ':id' do
      Presenters::Vehicles::GetPresenter.new.call(params)
    end

    desc 'POST api/v1/vehicles/:id/change_state' do
      summary 'Changing Vehicle state'
    end
    post ':id/change_state' do
      Commands::Vehicles::StateChanger.new.call(params)
    end
  end

  namespace :admin do
    before { admin_check }

    resource :vehicles do
      desc 'POST api/v1/admin/vehicles' do
        summary 'Creating a Vehicle'
      end
      post do
        Commands::Vehicles::Creator.new.call(params)
      end

      desc 'POST api/v1/admin/vehicles/:id' do
        summary 'Updating a Vehicle'
      end
      post ':id' do
        Commands::Vehicles::Updater.new.call(params)
      end

      desc 'GET api/v1/admin/vehicles' do
        summary 'Listing all Vehicles'
      end
      get do
        Presenters::Vehicles::IndexPresenter.new.call
      end

      desc 'POST api/v1/admin/vehicles/:id/delete' do
        summary 'Deleting a Vehicle'
      end
      post ':id/delete' do
        Commands::Vehicles::Deleter.new.call(params)
      end
    end
  end
end
