class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    sender.balance -= amount
    receiver.deposit(amount)
    self.status = "complete"
  end
  
  def reverse_transaction
    receiver.balance -= amount
    sender.deposit(amount)
    self.status = "complete"
  end
  
end
