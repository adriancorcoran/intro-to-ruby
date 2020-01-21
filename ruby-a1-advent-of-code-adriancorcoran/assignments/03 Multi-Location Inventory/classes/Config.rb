class Config
  attr_reader :customers, :distribution_locations, :products

  def initialize
    # Customers
    @customers = {
      'canadian' => {
        'id' => 1,
        'name' => 'Ryan Gosling',
        'email' => 'ryan@deadpool.com',
        'address' => 'Canada'
      },
      'irish' => {
        'id' => 2,
        'name' => 'Liam Neeson',
        'email' => 'liam@taken.com',
        'address' => 'Ireland'
      },
      'german' => {
        'id' => 3,
        'name' => 'Michael Fassbender',
        'email' => 'michael@xmen.com',
        'address' => 'Germany'
      }
    }

    # Distribution Locations
    @distribution_locations = {
      'Ireland' => {
        'id' => 1,
        'ship_from' => 'Ireland',
        'fallback_to' => 'Canada',
        'rates' => {
          'Ireland' => 5,
          'Canada' => 10,
          'other' => 20,
        }
      },
      'Canada' => {
        'id' => 2,
        'ship_from' => 'Canada',
        'fallback_to' => 'Ireland',
        'rates' => {
          'Ireland' => 20,
          'Canada' => 5,
          'other' => 30,
        }
      }
    }

    # Distribution Locations
    @products = [
      {
        'id' => 1,
        'title' => 'Steam Engine',
        'variants' => [
          {
            'id' => 67,
            'title' => 'Green',
            'price' => 50,
            'inventory' => {
              'Ireland' => 1,
              'Canada' => 4
            }
          },
          {
            'id' => 90,
            'title' => 'Blue',
            'price' => 50,
            'inventory' => {
              'Ireland' => 5,
              'Canada' => 0
            }
          }
        ]
      },
      {
        'id' => 2,
        'title' => 'Coaches',
        'variants' => [
          {
            'id' => 131,
            'title' => 'Pack of 3',
            'price' => 30,
            'inventory' => {
              'Ireland' => 5,
              'Canada' => 5
            }
          },
          {
            'id' => 234,
            'title' => 'Pack of 2',
            'price' => 25,
            'inventory' => {
              'Ireland' => 2,
              'Canada' => 2
            }
          }
        ]
      },
      {
        'id' => 3,
        'title' => 'Canadian Locomotive',
        'variants' => [
          {
            'id' => 786,
            'title' => 'Limited Edition',
            'price' => 150,
            'inventory' => {
              'Ireland' => 0,
              'Canada' => 5
            }
          }
        ]
      }
    ]
  end
end
