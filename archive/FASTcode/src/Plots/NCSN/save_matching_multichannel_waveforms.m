close all
clear

addpath('../../Inputs/');
addpath('../../Utilities/SAC/');
addpath('../Check/');

% Save plots of event windows from all components from NCSN 7 channels, Calaveras Fault
% CCOB (3 components), CADB, CAO, CHR, CML
% 2014-06-02 Clara Yoon

%%%%%%%%%%%%%%%%%%% SEISMOGRAMS %%%%%%%%%%%%%%%%%%%

% % Get data from each station
% addpath('input_data');
% [t, x, samplingRate] = get_channel_data('NCSN_Calaveras_7ch_24hr');
% s = size(x);
% nch = s(2);
% titlestr = {'CCOB.EHE', 'CCOB.EHN', 'CCOB.EHZ', 'CADB.EHZ', 'CAO.EHZ', ...
%     'CHR.EHZ', 'CML.EHZ'};
% 
% % Get start times for events
% start_time = [555 613 787 827 1157 1266 1340 1628 1728 1784 3531 4710];
% % start_time = [4849 8219 10329 22924 51794 54038 70494 81199 85955 537 818 987];
% % start_time = [1806 4678 4885 4958 7794 11296 11650 23490 25550 51685 54599];
% % start_time = [58284 64068 26464 19790 27229 85923];
% window_duration = 20; % window duration (s)
% 
% % Plot and save
% dir = '../status_earthquake/20140602_multichannel_events/bpfilter/';
% for k=1:length(start_time)
%     plot_matching_multichannel_waveforms(t, x, samplingRate, titlestr, ...
%         start_time(k), window_duration);
%     filename = [dir 'ncsn_7channel_waveforms_' num2str(start_time(k))];
%     print('-depsc', filename);
% end

% % Get data from each station
% addpath('input_data');
% [t, x, samplingRate] = get_channel_data('NCSN_CCOB_3comp_24hr');
% s = size(x);
% nch = s(2);
% titlestr = {'CCOB.EHE', 'CCOB.EHN', 'CCOB.EHZ'};
% 
% % Get start times for events
% load('detection_out.mat');
% dt = 0.05;
% start_time = double(detection_out{1})*dt;
% window_duration = 20; % window duration (s)
% 
% % Plot and save
% dir = './waveform_output/';
% FigHandle = figure('Position',[2000 100 400 400]);
% for k=1:length(start_time)
%     plot_matching_multichannel_waveforms(t, x, samplingRate, titlestr, ...
%         start_time(k), window_duration);
%     filename = [dir 'ncsn_3comp_waveforms_' num2str(start_time(k))];
%     print('-dpng', filename);
% end

% Get data from each station
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CCOB.EHE.D.SAC.bp4to10';
[t, x(:,1), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CCOB_EHE_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CCOB.EHN.D.SAC.bp4to10';
[t, x(:,2), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CCOB_EHN_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CCOB.EHZ.D.SAC.bp4to10';
[t, x(:,3), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CCOB_EHZ_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CADB.EHZ.D.SAC.bp2to10';
[t, x(:,4), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CADB_EHZ_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CAO.EHZ.D.SAC.bp2to10';
[t, x(:,5), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CAO_EHZ_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CHR.EHZ.D.SAC.bp2to10';
[t, x(:,6), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CHR_EHZ_24hr');
timeSeriesFile = '../../../data/TimeSeries/NCSN/2011.008.00.00.00.deci5.24hr.NC.CML.EHZ.D.SAC.bp2to6';
[t, x(:,7), samplingRate] = get_channel_data(timeSeriesFile, 'NCSN_CML_EHZ_24hr');

s = size(x);
nch = s(2);
titlestr = {'CCOB.EHE', 'CCOB.EHN', 'CCOB.EHZ', 'CADB.EHZ', 'CAO.EHZ', ...
    'CHR.EHZ', 'CML.EHZ'};

% Get start times for events
% load('detections_NCSN_Calaveras_7ch_24hr.mat');
% dt = 0.05;
% load('../data/haar_coefficients/NCSN_CCOB_EHN_1wk/autocorr_detections_NCSN_CCOB_EHN_1wk.mat');
% start_time = double(detection_out{1})*dt;
% start_time = [6924 25797 25818 25839 53637 54561 66008 76903 76934 76955 ...
%     77309 77484 77530 77556 80449 82496 82519 83378 83728];
% start_time = [4712 8296 15641 15863 17808 35862 58732 69755 70046 77442 81220 85601];
start_time = [670 20566 34281 51707 80255 82180];
window_duration = 20; % window duration (s)

% Plot and save
dir = '../../../figures/NCSN/waveform_output/';
% dir = '../../../figures/NCSN/pulses_nofilter/';
FigHandle = figure('Position',[2000 100 400 1000]);
for k=1:length(start_time)
    plot_matching_multichannel_waveforms(t, x, samplingRate, titlestr, ...
        start_time(k), window_duration);
    filename = [dir 'ncsn_7ch_waveforms_' num2str(start_time(k)) '.png'];
%     print('-dpng', filename);
%     print('-depsc', filename);
end