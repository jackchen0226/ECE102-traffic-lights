function [user_response, debug_mode, SPEED_MULTIPLIER] = prompt_user()
% Prompts user via command line for starting parameters
% Output:
%       user_response : A character that determines the starting signal.
%       debug_mode : Boolean, if true then runs debug mode.
    debug_check = input('Start in debug mode? (y/n): ', 's');
    if (strncmpi(debug_check, 'y', 1))
        debug_mode = true;
    elseif (strncmpi(debug_check, 'n', 1))
        debug_mode = false;
    else
        fprintf('Invalid input.')
        return
    end
    
    SPEED_MULTIPLIER = input('Enter in speed multiplier ([1] or 2 times faster): ');
    
    
    user_response = input('Enter in starting lights (N, S, E or W): ', 's');
    user_response = upper(user_response);
end