# frozen_string_literal: true

module Presenters
  class BasePresenter
    def self.call(*args)
      new(*args).call
    end

    def call
      raise NoMethodError
    end
  end
end
