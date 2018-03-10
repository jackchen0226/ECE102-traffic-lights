function [N_S_ped_on, E_W_ped_on] = EW_ped_red(enable, ljHandle, lj_dig_bit, lj_dac_bit, desired_timing)
% Wrapper function for LabJack code of the East-West ped. red lights.
%
% Runs high or low voltage to DAC 1 (Red ped. lights of East-West). This
% function will flash the red light every half second for desired_timing
% number of seconds. Will not return anything if desired_timing is not
% passed in. Returns if N/S and E/W pedestrian buttons were hit otherwise.
%
% Inputs:
%           enable : Boolean, if true send a high voltage, else send low.
%           ljHandle : Handle for LabJack U3, necesary for I/O.
%           lj_dac_bit : Write bit for analog DAC.
%           desired_timing : (optional) Flashes red light for given seconds
% Outputs:
%           N_S_ped_on : Boolean, if the North/South ped. light was pressed.
%           E_W_ped_on : Boolean, if the East/West ped. light was pressed.

    % If desired_timing was passed in
    N_S_ped_on = false;
    E_W_ped_on = false;
    write_voltage = 3.33; % Voltage in digital output high.
    if nargin > 3
        changes = desired_timing / 0.5; % Number of 0.5 second intervals.
        tStart = tic;
        
        for i = 1:changes
            while toc(tStart) < desired_timing
                % If the East or West pedestrian button was not pressed before,
                % set the variable so that it has been pressed.      
                if (~E_W_ped_on)
                    [Error, EWstate] = ljud_eGet(ljHandle, lj_dig_bit,0,0,0);
                    Error_Message(Error)
                    if (EWstate == 0)
                        E_W_ped_on = true;
                    end
                end

                % If the North or South pedestrian button was not pressed before,
                % set the variable so that it has been pressed.
                if (~N_S_ped_on)
                    [Error, NSstate] = ljud_eGet(ljHandle, lj_dig_bit,1,0,0);
                    Error_Message(Error)
                    if (NSstate == 0)
                        N_S_ped_on = true;
                    end
                end 
            end
        end
    end

    if enable
        Error = ljud_ePut(ljHandle, lj_dac_bit,1,write_voltage,0);
        Error_Message(Error)
    else
        Error = ljud_ePut(ljHandle, lj_dac_bit,1,write_voltage,0);
        Error_Message(Error)
    end
end