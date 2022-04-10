class BasePresenter
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NoMethodError
  end
end
