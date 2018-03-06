function run_debug(user_response, green_timing, yellow_timing, ljHandle)
% Runs the diagnostic mode, testing one thing at a time.
% Inputs:
%       user_response : Character, determines what section to test.
%       green_timing : Time in seconds of duration of green lights.
%       yellow_timing : Time in seconds of duration of yellow lights.
%       ljHandle : Handle for LabJack U3, necesary for I/O.

    ped_light_on = input('Test with crosswalk light on? (y/n)');
    if (strncmpi(ped_light_on, 'y', 1)
        if (strncmpi(user_response, 'N', 1) || strncmpi(user_response, 'S', 1))
            N_S_traffic(true, true, green_timing, yellow_timing, ljHandle);
        elseif (strncmpi(user_response, 'E', 1) || strncmpi(user_response, 'W', 1))
            E_W_traffic(true, true, green_timing, yellow_timing, ljHandle);
        end
    elseif (strncmpi(ped_light_on, 'n', 1)
        if (strncmpi(user_response, 'N', 1) || strncmpi(user_response, 'S', 1))
            N_S_traffic(false, false, green_timing, yellow_timing, ljHandle);
        elseif (strncmpi(user_response, 'E', 1) || strncmpi(user_response, 'W', 1))
            E_W_traffic(false, false, green_timing, yellow_timing, ljHandle);
        end
    end
end