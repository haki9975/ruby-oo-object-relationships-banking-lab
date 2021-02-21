class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []
  
  def initialize(sender, receiver, amount, status='pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@all << self
  end

  def valid?
     sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
    if self.valid? == true && self.amount < sender.balance == true && self.status == 'pending' 
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'  
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
   if  self.status == 'complete' 
      self.receiver.balance -= self.amount 
      self.sender.balance += self.amount 
      self.status = "reversed"
   else
    "Transaction rejected. Please check your account balance."
   end

  end

    
    
end
