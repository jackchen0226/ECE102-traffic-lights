function finished_timing = timings(desired_time)
% Waits until a certain amount of time elapses then returns true
    tStart = tic;
    
    while toc(tStart) > desired_time
        continue
    end
    finished_timing = true;
end
