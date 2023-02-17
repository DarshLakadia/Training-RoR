module Bank
	class Account
		attr_accessor :acc_balance
		def initialize(acc_balance)
			@acc_balance = acc_balance
		end
		#protected
		# def display_balance
		# 	puts @acc_balance
		# end
		#protected
		def deposit_money(d_money)
			@acc_balance = @acc_balance + d_money 	
		end
		#protected
		def withdraw_money(w_money)
			if @acc_balance > w_money
				@acc_balance = @acc_balance - w_money
			else
				puts "WARNING !!!!!! You don't have enough Balance"
			end
		end
	end
	
	class Atm 
		def initialize(acc_obj)
			@curr_obj = acc_obj
			#puts @curr_obj
		end
		def start
			puts "Enter Your PIN"
			@pin = gets.chomp.to_i
			
		end
		def show_options
			puts "Enter your choice..."
			puts "1. Display Balance"
			puts "2. Deposit Money"
			puts "3. Withdraw Money"
			
			choice = gets.chomp.to_i
			
			case
			when choice==1
				puts "display msg"
				p @curr_obj.acc_balance
			when choice == 2
				puts "Enter amount you want to deposit"
				@dep_money = gets.chomp.to_i
				proc2 = Proc.new {@curr_obj.deposit_money(@dep_money)}
				proc2.call 
			when choice == 3
				puts "Enter amount you want to withdraw"
				@w_money = gets.chomp.to_i
				lambda1 = -> {   @curr_obj.withdraw_money(@w_money)}
				lambda1.call
			else
				puts "/******SEE YOU AGAIN****/"
			end
		end
	end

	
	ac1 = Account.new(5000)
	# ac1.display_balance
	p ac1.acc_balance
	ac1.deposit_money(1000)
	#ac1.display_balance
	p ac1.acc_balance
	ac1.withdraw_money(1000)
	#ac1.display_balance
	p ac1.acc_balance
	atm1 = Atm.new(ac1)
	atm1.start
	atm1.show_options
	puts "your balance is : #{ac1.acc_balance}"
	# ac1.display_balance
end