class Order < ApplicationRecord
    enum coin: {
        'ETH': 0, 'ADA': 1, 'XLM': 2
    }
    validates :amount, numericality: { greater_than: 0 }

    validate :extras

    private
  
      def extras
        unless extra1.nil? ^ extra2.nil?
          errors.add(:base, "Specify extra1 or extra2, not both")
        end
      end

end
