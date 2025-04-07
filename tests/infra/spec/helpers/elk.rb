require 'elasticsearch/model'
require 'active_support'
require 'active_support/time'

module Elk
  class Log
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "logs-#{Time.new.utc.strftime('%Y.%m.%d')}"

    def self.count
      self.__elasticsearch__.search('*').results.total
    rescue Elastic::Transport::Transport::Errors::NotFound => e
      puts e.message
      0
    end
  end
end
