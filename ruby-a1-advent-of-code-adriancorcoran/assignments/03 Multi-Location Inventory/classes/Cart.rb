class Cart

  def initialize
    @line_items = []
  end

  def AddVariant (product, variantId)
    # check if already in cart => increase quantity
    if key = InCart(product['id'], variantId)
      @line_items[key]['quantity'] += 1
      puts "Cart line item quantity increased for Variant: #{@line_items[key]['title_full']} quantity increased"
    # add new entry
    else
      found  = product['variants'].select { |item| item['id'] == variantId.to_i }
      tmpVar  = found[0]
      item = {
        'id_product' => product['id'],
        'title' => product['title'],
        'id_variant' => tmpVar['id'],
        'title_variant' => tmpVar['title'],
        'title_full' => "#{product['title']} - #{tmpVar['title']}",
        'price' => tmpVar['price'],
        'quantity' => 1,
        'inventory' => tmpVar['inventory']
      }
      @line_items.push(item)
      puts "Cart line item created for Variant: #{item['title_full']} added to cart"
    end
  end

  def InCart(productId, variantId)
    # loop through line items, if we find a match return the key
    @line_items.each_with_index do |item, index|
      if (item['id_product'] == productId) && (item['id_variant'] == variantId)
        return index
      end
    end
    # product is not already in the cart
    false
  end

  def DisplayCart
    puts 'Currently in the Cart:'
    @line_items.each { |item| puts "#{item['quantity']} x #{item['title_full']} @ €#{item['price']} each" }
  end

  def GetCart
    puts 'Getting line items from Cart...'
    @line_items
  end

end
