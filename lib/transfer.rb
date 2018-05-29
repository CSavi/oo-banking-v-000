require 'pry'

class Transfer
  
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = 50
  end   
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end   
  end   
    
  def execute_transaction  
    if @sender.balance > @amount && @status == "pending"
       @sender.balance = sender.balance - @amount 
       @receiver.balance = receiver.balance + @amount
       @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end   
  end 
 # binding.pry 
  
  def reverse_transfer 
    if @status == "complete"
      @receiver.balance -= @amount 
      @sender.balance += @amount 
      @status = "reversed"
    end   
  end  
end
