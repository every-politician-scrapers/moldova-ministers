#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.title-wrapper,.title').text.tidy
    end

    def position
      noko.css('.job-pos,.job').text.split(',').map(&:tidy)
    end
  end

  class Members
    def member_items
      super.reject { |mem| mem.name.empty? }
    end

    def member_container
      noko.css('.field-content,.team-page-row')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
