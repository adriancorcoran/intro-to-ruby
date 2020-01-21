class ShippingRates
  @distribution_locations

  def initialize(distributionData)
    @distribution_locations = distributionData
  end

  def GetRates(location)
    # check for a distribution hub in their location and get the rates
    if @distribution_locations[location]
      @distribution_locations[location]
    # no hub in their area, get the rates for the default hub
    else
      @distribution_locations.select { |key, array| array if array['fallback_to'] == 'Main' }
    end
  end

end
