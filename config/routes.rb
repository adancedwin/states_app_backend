# frozen_string_literal: true

Rails.application.routes.draw do
  mount API => '/'
  devise_for :users
end
