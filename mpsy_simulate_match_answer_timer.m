function [t_timer,M] = mpsy_simulate_match_answer_timer(M) 

% generate a timer that will act as simulated matching user answer generator
% ----------------------------------------------------------------------
% Usage: [t_timer,M] = mpsy_simulate_afc_answer_timer(M)
%
%   input:   ---------
%  output:   ---------
%
% Copyright (C) 2012 by Martin Hansen, Jade Hochschule, Oldenburg
% Author :  Martin Hansen <psylab AT jade-hs.de>
% Date   :  04 Mai 2012
% Updated:  < 8 Apr 2013 08:39, martin>

%% This file is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 2 of the License, 
%% or (at your option) any later version.
%% See the GNU General Public License for more details:
%% http://www.gnu.org/licenses/gpl


% delete any possibly non-stopped previous timer(s)
htmp = timerfindall;
delete(htmp)

t_timer = timer;

set(t_timer, 'ExecutionMode', 'fixedRate');
set(t_timer, 'Period', 1);
% only generate an answer when M.UD == -1, indicating that psylab
% is currently waiting for a user answer:
set(t_timer, 'TimerFcn', 'if isfield(M, ''UD'') & M.UD == -1, [M, simu_answer] = mpsy_simulate_match_answer(M); end');

% set/add two necessary fields of M to starting value
M.UD = [];



% End of file:  mpsy_simulate_match_answer_timer.m

% Local Variables:
% time-stamp-pattern: "40/Updated:  <%2d %3b %:y %02H:%02M, %u>"
% End:
