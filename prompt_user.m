function [debug_mode, user_response] = prompt_user()
% Prompts user via command line for starting parameters
% Output:
%       user_response(1) : A boolean if true then enable debug mode
%       user_response(
    debug_check = input("Start in debug mode? (y/n)", 's');
    if (tolower(debug_check) == 'y')
        debug_mode = true;
    elseif (tolower(debug_check) == 'n')
        debug_mode = false;
    else
        fprtinf("Invalid input.")
        return
    end
    
    if (debug_mode)
        run_debug() % TODO Implement function 
    else
        user_response = input("Enter in starting lights (N, S, E or W)", 's');
    end
    
end