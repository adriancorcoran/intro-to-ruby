require 'yaml'

require_relative './steam_engine'
require_relative './diesel_engine'
require_relative './electric_engine'
require_relative './oil_truck'
require_relative './quarry_truck'
require_relative './closed_truck'
require_relative './engine_shed'
require_relative './signal_box'
require_relative './station'
require_relative './straight_track'
require_relative './curved_track'
require_relative './point_track'
require_relative './railway'

# new class
class Catalogue
  def initialize
    @catalogue = {}
  end

  attr_accessor :catalogue, :myhash

  def display_catalog
    puts '-----'
    puts 'Our Railway currently consists of:'
    @catalogue.each do |key, object_array|
      puts '-----'
      puts "Type of Item: #{key}"
      object_array.each(&:display_me)
    end
    puts '-----'
  end

  def grab_items_as_array
    items = []
    @catalogue.each do |_key, object_array|
      object_array.each do |object|
        items.push(object)
      end
    end
    items
  end

  def add_item(type, item)
    # check for key
    @catalogue[type] = [] unless @catalogue[type]
    # add item
    @catalogue[type] << item
  end

  def remove_item_type(type)
    @catalogue.delete(type)
  end

  def grab_type_quantity(type)
    if !@catalogue[type]
      0
    else
      quantities = []
      @catalogue[type].each do |object|
        quantities.push(object.quantity)
      end
      quantities.reduce(:+)
    end
  end

  def grab_type_costs(type)
    if !@catalogue[type]
      []
    else
      @catalogue[type].map { |object| "€#{object.cost}" }
    end
  end

  def find_type(type)
    grab_items_as_array.select { |object| object.class == type }
  end

  def grab_expensive_items(amount)
    expensive = grab_items_as_array.partition { |object| object.cost > amount }
    expensive[0]
  end

  def calculate_total_cost
    cost = 0
    @catalogue.each do |_key, object_array|
      object_array.each do |object|
        cost += object.calculate_total_cost
      end
    end
    cost
  end

  def display_total_cost
    puts "Total Cost: Our Railway costs €#{calculate_total_cost} so far...:)"
    puts '-----'
  end

  def create_catalog
    # get data from yaml file
    data = YAML.load_file('./lib/data.yaml')
    # loop through data in yaml file, for each key and object,
    # create an object which is added to the catalogue automatically
    data.each do |key, object_array|
      object_array.each do |obj|
        case key
        when 'SteamEngine'
          SteamEngine.new(self, obj['cost'], obj['quantity'], obj['length'], obj['wheelbase'], obj['has_tender'], obj['has_water'], obj['has_coal'])
        when 'DieselEngine'
          DieselEngine.new(self, obj['cost'], obj['quantity'], obj['length'], obj['wheelbase'], obj['has_diesel'])
        when 'ElectricEngine'
          ElectricEngine.new(self, obj['cost'], obj['quantity'], obj['length'], obj['wheelbase'], obj['is_charged'])
        when 'OilTruck'
          OilTruck.new(self, obj['cost'], obj['quantity'], obj['full'], obj['is_covered'], obj['oil_type'])
        when 'QuarryTruck'
          QuarryTruck.new(self, obj['cost'], obj['quantity'], obj['full'], obj['is_covered'], obj['stone_type'])
        when 'ClosedTruck'
          ClosedTruck.new(self, obj['cost'], obj['quantity'], obj['full'], obj['is_covered'], obj['delicate_cargo'])
        when 'EngineShed'
          EngineShed.new(self, obj['cost'], obj['quantity'], obj['engine_type'], obj['capacity'], obj['filled_slots'])
        when 'SignalBox'
          SignalBox.new(self, obj['cost'], obj['quantity'])
        when 'Station'
          Station.new(self, obj['cost'], obj['quantity'], obj['is_terminus'], obj['num_platforms'], obj['num_platforms_occupied'])
        when 'StraightTrack'
          StraightTrack.new(self, obj['cost'], obj['quantity'], obj['length'])
        when 'CurvedTrack'
          CurvedTrack.new(self, obj['cost'], obj['quantity'], obj['length'], obj['radius'])
        when 'PointTrack'
          PointTrack.new(self, obj['cost'], obj['quantity'], obj['length'], obj['num_points'])
        end
      end
    end
  end
end
