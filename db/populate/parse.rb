#!/usr/bin/env ruby
require 'rexml/document'

xml = File.new 'taeiseauton.xml'
doc = REXML::Document.new xml

doc.elements.each "//section" do |section|
     
    puts section.attributes["reftoc"]
    section.elements.each('text') do |txt|
        puts txt.text
    end
    
end
