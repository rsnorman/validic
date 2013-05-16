# encoding: utf-8

module Validic
  module Fitness

    ##
    # Get Fitness Activities base on `access_token`
    # 
    # @return [Hashie::Mash] with list of Fitness
    def get_fitnesses(options={})
      org_id = options[:org_id]
      options = {
        start_date: options[:start_date],
        end_date: options[:end_date],
        access_token: options[:access_token]
      }

      if options[:access_token] && org_id
        response = get("/#{Validic.api_version}/organizations/#{org_id}/fitness.json", options)
      else
        response = get("/#{Validic.api_version}/fitness.json", options)
      end
      response if response
    end

    ##
    # Create Fitness base on `access_token`
    # 
    # @return success
    def create_fitness(options={})
      options = {
        fitness: {
          timestamp: options[:timestamp],
          primary_type: options[:primary_type],
          intensity: options[:intensity],
          start_time: options[:start_time],
          total_distance: options[:total_distance],
          duration: options[:duration],
          source: options[:source]
        }
      }

      response = post("/#{Validic.api_version}/fitness.json", options)
      response if response
    end

  end
end