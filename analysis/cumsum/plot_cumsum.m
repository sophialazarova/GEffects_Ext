function plot_cumsum(subj, target_trials, sim)
% target_trials - subarray of trials that should be analyzed (indices).
% First element is the starting index and the second if the end.
%Example: [61,75] extinction in rats.
%sim - flag whether the data comes from a simulation or real rats. 1 is for
%simulation

    vals = [];
    db = [];
    if(isempty(target_trials))
        db = subj;
    else
        db = subj.pick_trials(target_trials(1):target_trials(2));
    end
    
    for index=1:length(db.trials)
        if(isempty(db.trials(index).values))
            continue;
        end
        
        if(sim)
            val = db.trials(index).values{2};
            vals = [vals str2num(val)];
            
        else
            val = db.trials(index).values{6};
            if(val == -2)
                val = 0;
            end

            vals = [vals val];
        end
    end

    csum = cumsum(vals);
    %figure
    plot(csum, '-','Color',[0, 0.4470, 0.7410], 'LineWidth', 4); % gray [0.894 0.894 0.894], blue [0, 0.4470, 0.7410]
    xlim([1;length(db.trials)]);
    ylim([min(csum);max(csum)]);
    set(gca,'XTick',1:2:length(db.trials));
    xlabel("Trial no");
    ylabel("Cumulative value");
    title("Extinction Curve");
end


