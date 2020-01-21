# require 'yaml'
# data = YAML.load_file("../lib/data.yaml")
# tried to load yaml data but couldn't - kept getting a load error

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# require "catalogue"
require 'steam_engine'
require 'diesel_engine'
require 'electric_engine'
require 'oil_truck'
require 'quarry_truck'
require 'closed_truck'
require 'engine_shed'
require 'signal_box'
require 'station'
require 'straight_track'
require 'curved_track'
require 'point_track'
require 'railway'

require 'minitest/autorun'
