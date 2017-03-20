#!/usr/bin/env ruby
# encoding: UTF-8

require 'bundler'
require 'bundler/setup'
ENV['ENVIRONMENT'] ||= 'development'
Bundler.require :default, ENV['ENVIRONMENT'].to_sym

Dir["./app/models/*.rb"].each {|file| require file }
Dir["./lib/*.rb"].each {|file| require file }
Dir["./config/initializers/*.rb"].each {|file| require file }

require './app.rb'
