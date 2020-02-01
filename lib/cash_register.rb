require 'pry'

class CashRegister
    attr_accessor :name, :total, :discount, :add_item, :item_prices, :employee_discount, :apply_discount, :items, :void_last_transaction

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @item_prices = []
    end

    def total
        @total
    end

    def add_item(title, price, count = 1)
        string = ("#{title} "  * count).split(" ")
        string.each {|item| self.items << item}

        cost = price.to_f.round(2)
        amount = count.to_f.round(2)

        self.item_prices << cost * amount
        self.total += cost * amount
    end

    def employee_discount
        @discount = 0.20
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * self.employee_discount)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            self.total
            "There is no discount to apply."
        end
    end

    def items
        @items
    end
    
    def last_item
        self.item_prices[-1]
    end
    
    def void_last_transaction
        self.total = self.total - self.last_item
        # binding.pry
    end


end