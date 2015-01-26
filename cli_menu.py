import create_user

print "Welcome to Roomaraderie basic CLI access, for all your roomate matching needs!"

menu = True

while (menu):
    print ("Please enter the numbered option that you would like to do: \n"
          "1. Create a user.\n"
          "2. Set my roomate profile.\n"
          "3. Set my roomate preferences.\n"
          "4. Find a roomate!\n"
          "5. Add a house listing.\n"
          "6. Sign off.\n")
    
    number = raw_input('Enter your option: ')
    
    try:
        choice = int(number)
        
        if choice == 1:
            user_input = raw_input('What is your username?\n')   #passed from webpage
            create_user.add_user(user_input)  
        elif choice == 6:
            menu = False
            print "Thanks for using Roomaraderie! Goodbye!"
        else:
            print "\n Invalid choice or option not yet implemented!\n"

    except ValueError:
        print "That is not a number! \n"
