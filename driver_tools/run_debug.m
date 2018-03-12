function run_debug(user_response, green_timing, yellow_timing, ljHandle)
% Runs the diagnostic mode, testing one thing at a time.
% Inputs:
%       user_response : Character, determines what section to test.
%       green_timing : Time in seconds of duration of green lights.
%       yellow_timing : Time in seconds of duration of yellow lights.
%       ljHandle : Handle for LabJack U3, necesary for I/O.

    ljud_Constants
    
    ped_light_on = input('Test with crosswalk light on? (y/n): ', 's');
    if (strncmpi(ped_light_on, 'y', 1))
        % Run desired function first, with out without crosswalk lights,
        % and making sure to turn red lights off after some time.
        if (strncmpi(user_response, 'N', 1) || strncmpi(user_response, 'S', 1))
            N_S_traffic(true, true, green_timing, yellow_timing, ljHandle);
            
            pause(yellow_timing)
            NS_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)
            EW_ped_red(false, ljHandle, LJ_ioPUT_DAC)
        elseif (strncmpi(user_response, 'E', 1) || strncmpi(user_response, 'W', 1))
            E_W_traffic(true, true, green_timing, yellow_timing, ljHandle);
            
            pause(yellow_timing)
            EW_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)
            NS_ped_red(false, ljHandle, LJ_ioPUT_DAC)            
        end
    elseif (strncmpi(ped_light_on, 'n', 1))
        if (strncmpi(user_response, 'N', 1) || strncmpi(user_response, 'S', 1))
            N_S_traffic(false, false, green_timing, yellow_timing, ljHandle);
            
            pause(yellow_timing)
            NS_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)
            EW_ped_red(false, ljHandle, LJ_ioPUT_DAC)
        elseif (strncmpi(user_response, 'E', 1) || strncmpi(user_response, 'W', 1))
            E_W_traffic(false, false, green_timing, yellow_timing, ljHandle);
            
            pause(yellow_timing)
            EW_red(false, ljHandle, LJ_ioPUT_DIGITAL_BIT)
            NS_ped_red(false, ljHandle, LJ_ioPUT_DAC)
        end
    end
end