require 'hobbit'
require 'hobbit/contrib'
require_relative 'controllers/custom-settings'

class Server < Hobbit::Base
  include Hobbit::Mote


  get '/' do
    render 'index'
  end

end