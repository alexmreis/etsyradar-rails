class Radar < ActiveRecord::Base

  attr_accessor :etsy_url

  belongs_to :user
  serialize :last_items
  has_many :alerts

  def poll
    self.last_items ||= []

    shop = Etsy::Shop.find(shop_id)
    listings = shop.listings(:active)
    item_names = listings.map(&:title).sort
    diff = item_names - self.last_items

    return if item_names == self.last_items || diff.empty?

    listings.select { |l| diff.include? l.title }.each do |listing|
      next unless listing.title.match(filter)
      alerts.create(:user => user,
                    :subject => "[#{shop.name}] #{listing.title}",
                    :message => "New item available on #{shop.name}: #{listing.title}. Go to #{listing.url}" )
    end
    self.last_items = item_names
    self.save!
    diff
  end

  def store_name
    shop = Etsy::Shop.find(shop_id)
    shop.name
  end

end
