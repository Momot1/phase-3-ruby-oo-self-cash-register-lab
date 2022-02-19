class CashRegister
    attr_reader :discount, :items
    attr_accessor :total, :last_transaction

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item (title, price, quantity = 1)
        self.total += price * quantity
        self.last_transaction= price * quantity
        i = 0
        while i < quantity
            items << title
            i+=1
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= self.discount.to_f / 100 * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end
