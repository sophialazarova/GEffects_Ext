function ext_pref_sim(subjs)

corr1 = [];
corr2 = [];
corr3 = [];

incorr1 = [];
incorr2 = [];
incorr3 = [];

omi1 = [];
omi2 = [];
omi3 = [];

corr1_count = 0;
corr2_count = 0;
corr3_count = 0;

incorr1_count = 0;
incorr2_count = 0;
incorr3_count = 0;

    for index=1:length(subjs)
        current_subj = subjs(index);
        ext_1 = current_subj.pick_trials(101:133);
        ext_2 = current_subj.pick_trials(134:166);
        ext_3 = current_subj.pick_trials(167:200);
        
        corr_ext1 = ext_1.filter_trials('response','1');
        incorr_ext1 = ext_1.filter_trials('response','-1');
        omi_ext1 = ext_1.filter_trials('response','0');
        
        corr_ext2 = ext_2.filter_trials('response','1');
        incorr_ext2 = ext_2.filter_trials('response','-1');
        omi_ext2 = ext_2.filter_trials('response','0');
        
        corr_ext3 = ext_3.filter_trials('response','1');
        incorr_ext3 = ext_3.filter_trials('response','-1');
        omi_ext3 = ext_3.filter_trials('response','0');
        
        corr1 = [corr1 length(corr_ext1.trials)/33];
        corr2 = [corr2 length(corr_ext2.trials)/33];
        corr3 = [corr3 length(corr_ext3.trials)/34];
        
        corr1_count = corr1_count + length(corr_ext1.trials);
        corr2_count = corr2_count + length(corr_ext2.trials);
        corr3_count = corr3_count + length(corr_ext3.trials);
        
        incorr1_count = incorr1_count + length(incorr_ext1.trials);
        incorr2_count = incorr2_count + length(incorr_ext2.trials);
        incorr3_count = incorr3_count + length(incorr_ext3.trials);
        
        incorr1 = [incorr1 length(incorr_ext1.trials)/33];
        incorr2 = [incorr2 length(incorr_ext2.trials)/33];
        incorr3 = [incorr3 length(incorr_ext3.trials)/34];
        
        omi1 = [omi1 length(omi_ext1.trials)/33];
        omi2 = [omi2 length(omi_ext2.trials)/33];
        omi3 = [omi3 length(omi_ext3.trials)/34];
        
    end
    
    err_corr1 = std(corr1)/sqrt(length(corr1));
    err_corr2 = std(corr2)/sqrt(length(corr2));
    err_corr3 = std(corr3)/sqrt(length(corr3));
    
    err_incorr1 = std(incorr1)/sqrt(length(incorr1));
    err_incorr2 = std(incorr2)/sqrt(length(incorr2));
    err_incorr3 = std(incorr3)/sqrt(length(incorr3));
    
    err_omi1 = std(omi1)/sqrt(length(omi1));
    err_omi2 = std(omi2)/sqrt(length(omi2));
    err_omi3 = std(omi3)/sqrt(length(omi3));
    
    prop_corr1 = sum(corr1)/length(corr1);
    prop_corr2 = sum(corr2)/length(corr2);
    prop_corr3 = sum(corr3)/length(corr3);
    
    prop_incorr1 = sum(incorr1)/length(incorr1);
    prop_incorr2 = sum(incorr2)/length(incorr2);
    prop_incorr3 = sum(incorr3)/length(incorr3);
    
    prop_omi1 = sum(omi1)/length(omi1);
    prop_omi2 = sum(omi2)/length(omi2);
    prop_omi3 = sum(omi3)/length(omi3);
    
    corr_data = [prop_corr1,prop_corr2, prop_corr3];
    incorr_data = [prop_incorr1,prop_incorr2, prop_incorr3];
    omi_data = [prop_omi1,prop_omi2, prop_omi3];
    
    corr_error = [err_corr1,err_corr2, err_corr3];
    incorr_error = [err_incorr1,err_incorr2, err_incorr3];
    omi_error = [err_omi1,err_omi2, err_omi3];
    
    
    %figure
    errorbar(corr_data,corr_error);
    hold on
    errorbar(incorr_data,incorr_error);
    hold on;
    errorbar(omi_data,omi_error);
    
    
    ylim([0.0; 1.0]);
    yticks([0 0.2 0.4 0.6 0.8 1]);
    xlim([0.5;3.5]);
    xticks([1 2 3]);
    xticklabels({'Onset', 'Mid', 'End'});
    ylabel('Proportion');
    title('During Extinction (simulation)');
    legend('Proportion of learned choice', 'Proportion of alternative choice', 'Proportion of omission');
    txt = '*';
    %text(1.5,0.45,txt,'FontSize',15, 'HorizontalAlignment','center', 'Color', [0 0.4470 0.7410]);
end

