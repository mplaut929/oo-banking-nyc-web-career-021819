require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, reciever, amount)
    @sender = sender
    @receiver = reciever
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

#   def execute_transaction
#     if @sender.valid? && @sender.balance > @amount && self.status == "pending"
#       @sender.balance -= amount
#       @receiver.balance += amount
#       @amount = 0
#       self.status = "complete"
#     else
#       "Transaction rejected. Please check your account balance."
#     end
#   end
# end
def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
