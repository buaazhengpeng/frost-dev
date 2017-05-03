function f = calcDriftVector(obj, x, dx)
    % calculates the mass matrix Fvec(x) or Fvec(x,dx)
    %
    % Parameters:
    % x: the state variables @type colvec
    % dx: the first order derivative of state variables
    % @type colvec

    %     validateattributes(x, {'double'},...
    %         {'vector','numel',obj.numState,'real'},...
    %         'ContinuousDynamics.calcDriftVector','x');
    %     validateattributes(dx, {'double'},...
    %         {'vector','numel',obj.numState,'real'},...
    %         'ContinuousDynamics.calcDriftVector','dx');
    
    
    if strcmp(obj.Type,'FirstOrder')
        f_val = cellfun(@(f)feval(f.Name,x), obj.Fvec,'UniformOutput',false);
    else
        
        f_val = cellfun(@(f)feval(f.Name,x,dx), obj.Fvec,'UniformOutput',false);
    end

    f = sum([f_val{:}],2);
end