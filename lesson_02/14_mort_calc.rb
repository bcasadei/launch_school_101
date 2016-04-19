# 14_mort_calc.rb

# ask user for mortgage amount and store in loan variable
# ask user for APR and store in apr variable
# convert APR to MPR (monthly_int = apr/12) and store in monthly_int variable
# ask user for the loan duration in years and store in loan_yrs variable
# convert loan duration to months (num_payments = loan_yrs * 12) and store in num_payments variable

def prompt(message)
  puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def calculate(l, i, n)
  payment = l.to_f * (i.to_f / (1 - (1 + i.to_f)**-n))
  prompt("Your monthly payment will be $#{format('%02.2f', payment)}.")
end

puts "Welcome to the Loan Payment Calculator..."

loop do # main loop
  loan = ''
  loop do # loan amount loop
    prompt("Enter the amount of your loan.")
    loan = gets.chomp

    if valid_number?(loan)
      break
    else
      prompt("Please enter a valid loan amount.")
    end
  end # end loan amount loop

  monthly_int = ''
  loop do # interest rate loop
    prompt("What's the APR (annual percentage rate) of your loan?")
    apr = gets.chomp
    monthly_int = (apr.to_f / 100) / 12
    if valid_number?(apr)
      break
    else
      prompt("Please enter a valid interest rate.")
    end
  end # end interest rate loop

  num_payments = ''
  loop do # loan duration loop
    prompt("What's the duration of your loan? (in years).")
    loan_yrs = gets.chomp
    num_payments = loan_yrs.to_i * 12
    if valid_number?(loan_yrs)
      break
    else
      prompt("Please enter your loan duration in years.")
    end
  end # end loan duration loop

  calculate(loan, monthly_int, num_payments)

  prompt("Do you want to calculate the payment for another loan? (Y to calculate again).")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main loop
