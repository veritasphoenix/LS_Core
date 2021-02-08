require 'pry'
require 'pry-byebug'

  # Expose endpoint for webhooks from some_service
  # post '/some_service', to: 'some_service_hooks#find_or_create_person'

  class SomeServiceHooksController < ApplicationController
    def find_or_create_person
      params[:people].each do |person|
        binding.pry
        new_person = Person.find_or_create_by(email: person[:email])

        new_person.assign_attributes(
          first_name: person[:first_name],
          last_name: person[:last_name]
        )

        binding.pry
        new_person.save
      rescue StandardError => exception
        # handle exception
      end
    end
  end