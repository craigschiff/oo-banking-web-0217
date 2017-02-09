class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver
  attr_reader  :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @status == "pending" && @amount < @sender.balance
      true
    else
      "Transaction rejected. Please check your account balance."
      false
    end
  end

  def execute_transaction
    if valid?
      @receiver.balance += @amount
      @sender.balance -= @amount
#      amount_transferred
      @status = "complete"
    else
      bad_transfer
    end

#    binding.pry
  end


  def bad_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end






end
