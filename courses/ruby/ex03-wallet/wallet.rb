class Wallet
  attr_reader :cents, :dollars

  def initialize(*money)
    @penny = 0
    @nickel = 0
    @dime = 0
    @quarters = 0
    @doll = 0
    @cents = 0
    @dollars = 0
    unless money.empty?
      money.each do |money|
        @penny += 1 if money == :penny
        @nickel += 1 if money == :nickel
        @dime += 1 if money == :dime
        @quarters += 1 if money == :quarter
        @doll += 1 if money == :dollar
      end
    end
    @cents = @penny + @nickel * 5 + @dime * 10 + @quarters * 25
    @dollars = @cents * 0.01
  end

  def <<(money)
    @penny += 1 if money == :penny
    @nickel += 1 if money == :nickel
    @dime += 1 if money == :dime
    @quarters += 1 if money == :quarter
    @doll += 1 if money == :dollar
    @cents = @penny + @nickel * 5 + @dime * 10 + @quarters * 25 + @doll * 100
    @dollars = @cents * 0.01
  end

  def take(*money)
    money.each do |money|
      @penny -= 1 if money == :penny && @penny.positive?
      @nickel -= 1 if money == :nickel && @nickel.positive?
      @dime -= 1 if money == :dime && @dime.positive?
      @quarters -= 1 if money == :quarter && @quarters.positive?
      @doll -= 1 if money == :dollar && @doll.positive
    end
    @cents = @penny + @nickel * 5 + @dime * 10 + @quarters * 25 + @doll * 100
    @dollars = @cents * 0.01
  end
end
